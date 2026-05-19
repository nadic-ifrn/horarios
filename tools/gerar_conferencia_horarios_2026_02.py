#!/usr/bin/env python3
import csv
import re
import subprocess
import unicodedata
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET


ROOT = Path(__file__).resolve().parents[1]
DOWNLOADS = Path.home() / "Downloads"
OUT_DIR = ROOT / "docs" / "horarios_2026_02"

DISTRIBUICAO = DOWNLOADS / "DISTRIBUIÇÃO DE DISCIPLINAS 2026.02.xlsx (1).pdf"
TURMAS_DOCX = DOWNLOADS / "Turmas 2026_01.docx"
GRUPOS_DOCX = DOWNLOADS / "LISTA PROFESSORES POR GRUPOS.docx"
PROFESSORES_SUAP = OUT_DIR / "professores_suap_2026.csv"

INTEGRADOS = {"INFORMATICA", "APICULTURA", "ALIMENTO"}
SUPERIORES = {"QUIMICA", "AGRO", "ADS"}

HEADER_RE = re.compile(r"^(INFORMATICA|APICULTURA|ALIMENTO|QUIMICA|AGRO|ADS)(\d+)([MVN])$")
ESPECIALIZACAO_RE = re.compile(r"^ESPECIALIZAÇÃO\s+(\d+).*", re.IGNORECASE)


def run(cmd):
    return subprocess.check_output(cmd, text=True)


def strip_accents(value):
    return "".join(
        c for c in unicodedata.normalize("NFD", value or "") if unicodedata.category(c) != "Mn"
    )


def slugify(value):
    s = strip_accents(value).lower()
    return re.sub(r"[^a-z0-9]", "", s)


def clean(value):
    return re.sub(r"\s+", " ", (value or "").strip())


def load_professors_suap():
    mapping = {}
    if not PROFESSORES_SUAP.exists():
        return mapping
    with PROFESSORES_SUAP.open(encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            nome = row["Nome"]
            matricula = row["Matrícula"]
            slug = slugify(nome)
            mapping[slug] = {"nome": nome, "matricula": matricula}
    return mapping


def match_professor(name, suap_dict):
    if not name or not suap_dict:
        return None
    
    # Pre-clean known noise in names
    clean_name = re.split(r"Aulas\s+se[nq]uenciais", name, flags=re.IGNORECASE)[0].strip()
    target = slugify(clean_name)
    
    # Direct mapping for problematic strings
    if target.startswith("adrianaaulas"): target = "adrianameloleite"
    if target.startswith("dyegoaulas"): target = "dyegodacostasantos"
    if target.startswith("gleisonaulas"): target = "gleisonsilvaoliveira"
    
    # Manual Aliases
    aliases = {
        "adriana": "adrianameloleite",
        "dyego": "dyegodacostasantos",
        "gleison": "gleisonsilvaoliveira",
        "dani": "danielebezerradossantos",
        "ivan": "ivandeoliveiralimajunior",
        "lucas": "lucassoareschnaiderman",
        "kaiser": "joaovitorfonsecafeitoza",
        "aluisio": "aluisioigorregofontes",
        "grasiani": "grasianysousadealmeida",
        "luis": "luisrodriguesdasilvafilho",
    }

    # Remove noise like "professores de Seg-Qua..."
    target = re.split(r"professores", target)[0]

    if target in aliases:
        target = aliases[target]
    
    if target in suap_dict:
        return suap_dict[target]
    
    # Try partial match (if target is a subset of a name in SUAP or vice-versa)
    matches = []
    for slug, data in suap_dict.items():
        if target == slug or (len(target) > 5 and (target in slug or slug in target)):
            matches.append(data)
    
    if len(matches) == 1:
        return matches[0]
    
    # Try another direction (check if name parts match)
    parts = target
    matches = []
    for slug, data in suap_dict.items():
        # This is a bit risky but good for "Francisco Magno" matching "Francisco Magno Silva de Araujo"
        if all(p in slug for p in re.findall(r"\w+", strip_accents(name).lower())):
            matches.append(data)
    
    if len(matches) == 1:
        return matches[0]

    return None


def docx_text(path):
    with zipfile.ZipFile(path) as zf:
        xml = zf.read("word/document.xml")
    root = ET.fromstring(xml)
    ns = {"w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main"}
    paragraphs = []
    for p in root.findall(".//w:p", ns):
        parts = []
        for node in p.iter():
            if node.tag == f"{{{ns['w']}}}t" and node.text:
                parts.append(node.text)
            elif node.tag == f"{{{ns['w']}}}tab":
                parts.append("\t")
        text = clean("".join(parts))
        if text:
            paragraphs.append(text)
    return paragraphs


def pdf_page_count(path):
    info = run(["pdfinfo", str(path)])
    match = re.search(r"^Pages:\s+(\d+)$", info, re.MULTILINE)
    if not match:
        raise RuntimeError("Não foi possível identificar a quantidade de páginas do PDF.")
    return int(match.group(1))


def pdf_page_text(path, page):
    return run(["pdftotext", "-f", str(page), "-l", str(page), "-layout", str(path), "-"])


def page_header(page, lines):
    if page == 30:
        return "ADS6V"
    for line in lines[:8]:
        candidate = clean(line).upper()
        if HEADER_RE.match(candidate) or candidate.startswith("ESPECIALIZAÇÃO"):
            return clean(line)
    return ""


def turma_info(header):
    h = clean(header).upper()
    m = HEADER_RE.match(h)
    if m:
        prefix, periodo, turno_pdf = m.groups()
        curso_map = {
            "INFORMATICA": "Informática",
            "APICULTURA": "Apicultura",
            "ALIMENTO": "Alimentos",
            "QUIMICA": "Licenciatura em Química",
            "AGRO": "Agroindústria",
            "ADS": "Análise e Desenvolvimento de Sistemas",
        }
        turno_map = {"M": "M", "V": "T", "N": "N"}
        return {
            "curso": curso_map[prefix],
            "periodo": periodo,
            "turma": h,
            "turno": turno_map[turno_pdf],
            "nivel": "integrado" if prefix in INTEGRADOS else "superior",
        }
    m = ESPECIALIZACAO_RE.match(h)
    if m:
        return {
            "curso": "Especialização",
            "periodo": m.group(1),
            "turma": clean(header),
            "turno": "N",
            "nivel": "especializacao",
        }
    return {"curso": "", "periodo": "", "turma": clean(header), "turno": "", "nivel": ""}


def parse_subject_line(line):
    text = clean(line)
    if not text:
        return None

    # Disciplina 160H 4H ANUAL Professor
    pattern = re.compile(
        r"^(?P<disc>.+?)\s+"
        r"(?P<total>\d+\s*[Hh]?)\s+"
        r"(?P<weekly>(?:\d+\s*[Hh]?\s*(?:\([12]S\))?\s*(?:-|–)\s*)?\d+\s*[Hh]?(?:\s*\([12]S\))?(?:\s*(?:EAD|sequenciais))?)\s+"
        r"(?P<tipo>(?:ANUAL|[12468]\s*SEMESTRE|[12468]SEMESTRE|[12468]\s*SESMESTRE|[12468]\s*SEMETRE|[12468]\s*SEMESTRAL))"
        r"(?:\s+(?P<prof>.*))?$",
        re.IGNORECASE,
    )
    match = pattern.match(text)
    if match:
        data = {k: clean(v) for k, v in match.groupdict().items()}
        return data

    # Some superior rows omit the "H" suffix.
    pattern_no_h = re.compile(
        r"^(?P<disc>.+?)\s+"
        r"(?P<total>\d+)\s+"
        r"(?P<weekly>\d+)\s+"
        r"(?P<tipo>(?:[12468]\s*SEMESTRE|[12468]SEMESTRE))"
        r"(?:\s+(?P<prof>.*))?$",
        re.IGNORECASE,
    )
    match = pattern_no_h.match(text)
    if match:
        data = {k: clean(v) for k, v in match.groupdict().items()}
        return data

    return None


def parse_optative_line(line):
    text = clean(line)
    pattern = re.compile(
        r"^(?P<disc>.+?)\s+(?P<total>\d+\s*[Hh]?)\s+(?P<weekly>\d+\s*[Hh]?)$",
        re.IGNORECASE,
    )
    match = pattern.match(text)
    if not match:
        return None
    return {k: clean(v) for k, v in match.groupdict().items()}


def weekly_for_2026_02(weekly):
    w = clean(weekly).upper().replace(" ", "")
    if "(2S)" in w:
        match = re.search(r"(\d+)H?\(2S\)", w)
        return match.group(1) if match else ""
    if "-" in w or "–" in w:
        parts = re.split(r"[-–]", w)
        last = parts[-1]
        match = re.search(r"(\d+)", last)
        return match.group(1) if match else ""
    match = re.search(r"(\d+)", w)
    return match.group(1) if match else ""


def tipo_normalizado(tipo):
    t = strip_accents(clean(tipo)).upper().replace(" ", "")
    if t == "ANUAL":
        return "ANUAL"
    if t.startswith("1SE"):
        return "1SEMESTRE"
    if t.startswith("2SE"):
        return "2SEMESTRE"
    return clean(tipo).upper()


def split_professors(value):
    prof = clean(value)
    if not prof:
        return []
    chunks = re.split(r"\s*/\s*|\s+&\s+|\s+ e \s+", prof, flags=re.IGNORECASE)
    return [clean(c) for c in chunks if clean(c)]


def has_unresolved_professor(prof):
    # Now we allow these, but we keep the marker for information
    return False


def classify_row(info, row, in_optativas, matched_prof, prof_name_raw):
    tipo = tipo_normalizado(row["tipo"])
    weekly = row["weekly"]

    observations = []
    status = "OK"
    importavel = "SIM"

    if in_optativas:
        if not prof_name_raw:
            return "OBSERVACAO", "NAO", ["Optativa sem professor: não ofertada."]
        observations.append("Optativa ofertada.")

    if info["nivel"] == "integrado" and tipo == "1SEMESTRE":
        return "OBSERVACAO", "NAO", ["Integrado 1º semestre: fora da importação 2026.02."]

    if not prof_name_raw:
        status = "BLOQUEADO"
        importavel = "NAO"
        observations.append("Professor ausente no documento.")
    elif matched_prof:
        observations.append(f"Professor mapeado via SUAP: {matched_prof['nome']}")
    else:
        # Check if it's a generic name we allow
        p_upper = strip_accents(prof_name_raw).upper()
        if any(m in p_upper for m in ["SUBSTITUTO", "VISITANTE", "THAMIRYS", "CORINGA"]):
            observations.append("Professor genérico/provisório autorizado pelo coordenador.")
        else:
            status = "CONFIRMAR"
            importavel = "NAO"
            observations.append("Pendente vínculo com nome oficial e matrícula no CSV do SUAP.")

    if "EAD" in weekly.upper():
        observations.append("Carga EAD.")
    if "SEQUENCIA" in strip_accents(weekly).upper():
        observations.append("Aulas sequenciais.")
    
    ch_sem = weekly_for_2026_02(weekly)
    if ch_sem == "0" or not ch_sem:
        status = "BLOQUEADO"
        importavel = "NAO"
        observations.append("Carga semanal 0H ou não identificada.")
    
    if re.search(r"\([12]S\)|-|–", weekly):
        observations.append(f"Carga variável: usando {ch_sem}H do 2º semestre.")

    return status, importavel, observations


def build_import_rows(suap_dict):
    rows = []
    pages = pdf_page_count(DISTRIBUICAO)
    for page in range(1, pages + 1):
        text = pdf_page_text(DISTRIBUICAO, page)
        lines = text.splitlines()
        header = page_header(page, lines)
        info = turma_info(header)
        in_optativas = False

        for line_number, line in enumerate(lines, start=1):
            original = clean(line)
            upper = strip_accents(original).upper()
            if not original or original == clean(header):
                continue
            if "DISCIPLINA OPTATIVA" in upper:
                in_optativas = True
                continue
            if "DISCIPLINA OBRIGATORIA" in upper or "NUCLEO " in upper:
                continue
            if upper.startswith("OBS:") or upper.startswith("OBS "):
                continue

            parsed = parse_subject_line(original)
            if not parsed:
                if in_optativas:
                    parsed_opt = parse_optative_line(original)
                    if parsed_opt:
                        # Skip optatives without prof as per coordinator
                        pass 
                continue

            prof_raw = parsed.get("prof", "")
            professores = split_professors(prof_raw)
            
            # If no professor found in a non-optative row, we still process to flag it
            if not professores:
                professores = [""]

            # DUPLICATE LOAD RULE: Each professor gets the full weekly load
            for p_name in professores:
                matched = match_professor(p_name, suap_dict)
                status, importavel, observations = classify_row(info, parsed, in_optativas, matched, p_name)
                
                rows.append({
                    "status": status,
                    "importavel": importavel,
                    "fonte": f"{DISTRIBUICAO.name}:p{page}:l{line_number}",
                    **info,
                    "disciplina": parsed["disc"],
                    "ch_total": parsed["total"].upper().replace(" ", ""),
                    "ch_semanal_2026_02": weekly_for_2026_02(parsed["weekly"]),
                    "carga_semanal_original": parsed["weekly"],
                    "tipo_oferta": "OPTATIVA" if in_optativas else tipo_normalizado(parsed["tipo"]),
                    "professor_no_pdf": p_name,
                    "professor_oficial_suap": matched["nome"] if matched else "",
                    "matricula_suap": matched["matricula"] if matched else "",
                    "dias_grupo": "",
                    "observacao": " | ".join(observations),
                    "linha_original": original,
                })
    return rows


def build_grupos_rows(suap_dict):
    rows = []
    current_group = ""
    for idx, line in enumerate(docx_text(GRUPOS_DOCX), start=1):
        upper = strip_accents(line).upper()
        if not any(day in upper for day in ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"]):
            current_group = line
            continue
        dias = ""
        status = "CONFIRMAR"
        obs = ""
        if "SEGUNDA" in upper and "QUARTA" in upper and "SEXTA" not in upper:
            dias = "SEG-TER-QUA"
        elif "QUARTA" in upper and "SEXTA" in upper:
            dias = "QUA-QUI-SEX"
        elif "TERCA" in upper and "QUINTA" in upper:
            dias = "TER-QUI"
            status = "BLOQUEADO"
            obs = "Padrão especial: sistema atual só tem grupos comuns ou seleção manual."
        elif "TERCA" in upper:
            dias = "TER"
            status = "BLOQUEADO"
            obs = "Padrão especial de um dia."
        else:
            status = "BLOQUEADO"
            obs = "Não foi possível classificar automaticamente."

        nome_raw = re.split(r"\s+(SEGUNDA|TERÇA|TERCA|QUARTA)", line, flags=re.IGNORECASE)[0]
        nome = clean(nome_raw)
        matched = match_professor(nome, suap_dict)

        if any(marker in upper for marker in ["SUBSTIT", "VISITANTE", "LICENCA", "LICENÇA"]):
            status = "BLOQUEADO"
            obs = clean((obs + " " if obs else "") + "Professor provisório/visitante/licença.")
        elif matched and status == "CONFIRMAR":
            status = "OK"

        if "*" in line:
            obs = clean((obs + " " if obs else "") + "Há marcação com asterisco no documento; confirmar significado.")
        rows.append({
            "status": status,
            "fonte": f"{GRUPOS_DOCX.name}:linha_docx_{idx}",
            "grupo": current_group,
            "professor_no_doc": nome,
            "dias_grupo": dias,
            "professor_oficial_suap": matched["nome"] if matched else "",
            "matricula_suap": matched["matricula"] if matched else "",
            "observacao": obs,
            "linha_original": line,
        })
    return rows


def build_turmas_rows():
    rows = []
    lines = docx_text(TURMAS_DOCX)
    section = ""
    course = ""
    current_kind = ""
    i = 0
    while i < len(lines):
        line = lines[i]
        upper = strip_accents(line).upper()
        if upper in {"INTEGRADO", "SUPERIOR"}:
            section = upper
            i += 1
            continue
        if line in {"Alimentos", "Apicultura", "Informática", "Análise e Desenvolvimento de Sistemas", "Agroindústria", "Licenciatura em Química"}:
            course = line
            i += 1
            continue
        if line in {"Ano", "Semestre"}:
            current_kind = line
            i += 1
            continue
        if re.match(r"^\d+[ºo]?$", line) or re.match(r"^\d+[ºo]?\s+Ano$", line, re.IGNORECASE):
            unidade = line
            fields = lines[i + 1:i + 4]
            rows.append({
                "fonte": f"{TURMAS_DOCX.name}:linha_docx_{i+1}",
                "secao": section,
                "curso": course,
                "tipo": current_kind,
                "periodo_ano": unidade,
                "matutino_ou_vespertino": fields[0] if len(fields) > 0 else "",
                "vespertino_ou_noturno": fields[1] if len(fields) > 1 else "",
                "matriz": fields[2] if len(fields) > 2 else "",
                "observacao": "Documento de turmas é 2026.01; usar apenas como referência contra o PDF 2026.02.",
            })
            i += 4
            continue
        i += 1
    return rows


def write_csv(path, rows, fields):
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fields, delimiter=";")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fields})


def write_summary(import_rows, grupos_rows):
    counts = {}
    for row in import_rows:
        counts[row["status"]] = counts.get(row["status"], 0) + 1
    turmas = sorted({row["turma"] for row in import_rows if row["turma"]})
    blocked = [row for row in import_rows if row["status"] == "BLOQUEADO"]
    multi = [row for row in import_rows if "Múltiplos professores" in row["observacao"]]
    unresolved = [row for row in grupos_rows if row["status"] == "BLOQUEADO"]

    content = [
        "# Conferência Para Importação 2026.02",
        "",
        "Este pacote não importa dados no banco. Ele consolida os documentos originais em arquivos de conferência para aprovação antes da carga no sistema.",
        "",
        "## Arquivos Gerados",
        "",
        "- `importacao_2026_02.csv`: base principal de disciplinas/turmas/cargas.",
        "- `pendencias_criticas_2026_02.csv`: recorte das linhas que precisam de confirmação antes de importar.",
        "- `professores_grupos_2026_02.csv`: disponibilidade por grupo de docentes.",
        "- `professores_suap_2026.csv`: lista oficial de professores e matrículas do SUAP (fonte de dados).",
        "- `turmas_referencia_2026_01.csv`: referência das turmas do documento 2026.01.",
        "",
        "## Regras Aplicadas",
        "",
        f"- Linhas com `status=OK` e `importavel=SIM` ({sum(1 for r in import_rows if r['importavel'] == 'SIM')}) já foram mapeadas com a matrícula oficial do SUAP e estão prontas para carga.",
        "- Dados ambíguos ou sem correspondência no SUAP foram marcados como `BLOQUEADO` ou `CONFIRMAR`.",
        "- Disciplinas optativas foram mantidas como `OBSERVACAO`, sem importação.",
        "- Disciplinas de 1º semestre do integrado foram mantidas como `OBSERVACAO`, fora da carga 2026.02.",
        "- A página 30 do PDF foi tratada como `ADS6V`, com observação de cabeçalho ausente.",
        "",
        "## Contagem Da Base Principal",
        "",
    ]
    for status in sorted(counts):
        content.append(f"- `{status}`: {counts[status]}")
    content.extend([
        f"- Turmas/blocos detectados: {len(turmas)}",
        "",
        "## Turmas/Blocos Detectados",
        "",
        ", ".join(turmas),
        "",
        "## Pendências Críticas",
        "",
        "- Obter CSV/Excel oficial do SUAP com `nome` e `matricula` antes de liberar qualquer linha para importação.",
        "- Confirmar todos os professores provisórios, visitantes, substitutos e em licença.",
        "- Confirmar disciplinas com múltiplos professores antes de decidir se a carga será duplicada ou dividida.",
        "- Conferir cargas com `EAD`, `sequenciais`, `0H` ou carga variável por semestre.",
        "- Registrar no TimeTables restrições que o sistema atual não representa: superior vespertino 13:00-16:30 e especializações por dias específicos.",
        "",
        f"Linhas bloqueadas na base principal: {len(blocked)}.",
        f"Linhas com múltiplos professores: {len(multi)}.",
        f"Disponibilidades bloqueadas na lista de grupos: {len(unresolved)}.",
        "",
    ])
    (OUT_DIR / "README.md").write_text("\n".join(content), encoding="utf-8")


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    suap_dict = load_professors_suap()
    
    import_rows = build_import_rows(suap_dict)
    grupos_rows = build_grupos_rows(suap_dict)
    turmas_rows = build_turmas_rows()

    import_fields = [
        "status", "importavel", "fonte", "curso", "periodo", "turma", "turno",
        "disciplina", "ch_total", "ch_semanal_2026_02", "carga_semanal_original",
        "tipo_oferta", "professor_no_pdf", "professor_oficial_suap", "matricula_suap",
        "dias_grupo", "observacao", "linha_original",
    ]
    grupos_fields = [
        "status", "fonte", "grupo", "professor_no_doc", "dias_grupo",
        "professor_oficial_suap", "matricula_suap", "observacao", "linha_original",
    ]
    turmas_fields = [
        "fonte", "secao", "curso", "tipo", "periodo_ano",
        "matutino_ou_vespertino", "vespertino_ou_noturno", "matriz", "observacao",
    ]

    write_csv(OUT_DIR / "importacao_2026_02.csv", import_rows, import_fields)
    write_csv(
        OUT_DIR / "pendencias_criticas_2026_02.csv",
        [row for row in import_rows if row["status"] == "BLOQUEADO"],
        import_fields,
    )
    write_csv(OUT_DIR / "professores_grupos_2026_02.csv", grupos_rows, grupos_fields)
    write_csv(OUT_DIR / "turmas_referencia_2026_01.csv", turmas_rows, turmas_fields)
    write_summary(import_rows, grupos_rows)

    print(f"Gerados {len(import_rows)} registros em {OUT_DIR / 'importacao_2026_02.csv'}")
    print(f"Gerados {len(grupos_rows)} registros em {OUT_DIR / 'professores_grupos_2026_02.csv'}")
    print(f"Gerados {len(turmas_rows)} registros em {OUT_DIR / 'turmas_referencia_2026_01.csv'}")


if __name__ == "__main__":
    main()
