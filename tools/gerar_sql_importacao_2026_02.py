#!/usr/bin/env python3
import csv
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
CSV_PATH = ROOT / "docs" / "horarios_2026_02" / "importacao_2026_02.csv"
SQL_OUT = ROOT / "docs" / "horarios_2026_02" / "importar_2026_02.sql"

def escape(val):
    if val is None:
        return "NULL"
    if isinstance(val, bool):
        return "1" if val else "0"
    if isinstance(val, int):
        return str(val)
    # Basic SQL escaping
    return "'" + str(val).replace("'", "''") + "'"

def main():
    if not CSV_PATH.exists():
        print(f"Erro: CSV não encontrado em {CSV_PATH}")
        return

    sql = [
        "-- Script de Importação para Horários 2026.02",
        "SET FOREIGN_KEY_CHECKS = 0;",
        "",
        "-- 1. Ano Letivo",
        "INSERT INTO ano_letivos (ano, semestre, concluido, created_at, updated_at) ",
        "SELECT 2026, 2, 0, NOW(), NOW() WHERE NOT EXISTS (SELECT 1 FROM ano_letivos WHERE ano = 2026 AND semestre = 2);",
        "SET @ano_id = (SELECT id FROM ano_letivos WHERE ano = 2026 AND semestre = 2);",
        ""
    ]

    cursos = set()
    periodos = {} # (curso, nome) -> ord
    disciplinas = {} # (curso, periodo, nome) -> ch
    turmas = set() # (curso, periodo, nome, turno)
    professores = {} # nome_pdf -> {matricula, nome_suap}
    cargas = []

    with open(CSV_PATH, encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter=";")
        for row in reader:
            if row["importavel"] != "SIM":
                continue
            
            curso = row["curso"]
            periodo_nome = row["periodo"]
            disciplina_nome = row["disciplina"]
            turma_nome = row["turma"]
            turno = row["turno"]
            ch = row["ch_semanal_2026_02"]
            prof_pdf = row["professor_no_pdf"]
            prof_suap = row["professor_oficial_suap"]
            matricula = row["matricula_suap"]

            cursos.add(curso)
            
            # Extract order from periodo name (e.g. "1" or "1º Ano")
            match = re.search(r"(\d+)", periodo_nome)
            ordem = int(match.group(1)) if match else 1
            periodos[(curso, periodo_nome)] = ordem

            disciplinas[(curso, periodo_nome, disciplina_nome)] = ch
            turmas.add((curso, periodo_nome, turma_nome, turno))
            
            if prof_pdf not in professores:
                professores[prof_pdf] = {"matricula": matricula, "nome_suap": prof_suap}
            
            cargas.append({
                "curso": curso,
                "periodo": periodo_nome,
                "disciplina": disciplina_nome,
                "turma": turma_nome,
                "turno": turno,
                "professor": prof_pdf
            })

    sql.append("-- 2. Cursos")
    for c in sorted(cursos):
        sql.append(f"INSERT IGNORE INTO cursos (nome, created_at, updated_at) VALUES ({escape(c)}, NOW(), NOW());")
    sql.append("")

    sql.append("-- 3. Periodos")
    for (c, p), ord in sorted(periodos.items()):
        sql.append(f"INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) ")
        sql.append(f"SELECT {escape(p)}, {ord}, id, NOW(), NOW() FROM cursos WHERE nome = {escape(c)};")
    sql.append("")

    sql.append("-- 4. Disciplinas")
    for (c, p, d), ch in sorted(disciplinas.items()):
        sql.append(f"INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) ")
        sql.append(f"SELECT {escape(d)}, {ch or 0}, p.id, NOW(), NOW() ")
        sql.append(f"FROM periodos p JOIN cursos c ON p.curso_id = c.id ")
        sql.append(f"WHERE c.nome = {escape(c)} AND p.nome = {escape(p)};")
    sql.append("")

    sql.append("-- 5. Turmas")
    for c, p, t, turno in sorted(turmas):
        sql.append(f"INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) ")
        sql.append(f"SELECT {escape(turno)}, NULL, p.id, @ano_id, NOW(), NOW() ")
        sql.append(f"FROM periodos p JOIN cursos c ON p.curso_id = c.id ")
        sql.append(f"WHERE c.nome = {escape(c)} AND p.nome = {escape(p)};")
    sql.append("")

    sql.append("-- 6. Professores")
    for prof_pdf, data in sorted(professores.items()):
        matricula = data["matricula"]
        nome = data["nome_suap"] or prof_pdf
        if not matricula:
            # Generate fake matricula for substitutes if missing
            # Using CRC32 or hash to keep it consistent
            import zlib
            crc = zlib.crc32(prof_pdf.encode()) & 0xffffffff
            matricula = f"SUBST{crc:08X}"
        
        sql.append(f"INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) ")
        sql.append(f"VALUES ({escape(nome)}, {escape(matricula)}, 0, NOW(), NOW());")
    sql.append("")

    sql.append("-- 7. Dias (Disponibilidade padrão)")
    for prof_pdf, data in sorted(professores.items()):
        matricula = data["matricula"]
        if not matricula:
            import zlib
            crc = zlib.crc32(prof_pdf.encode()) & 0xffffffff
            matricula = f"SUBST{crc:08X}"
            
        sql.append(f"INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) ")
        sql.append(f"SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() ")
        sql.append(f"FROM professors WHERE matricula = {escape(matricula)};")
    sql.append("")

    sql.append("-- 8. Cargas")
    for carga in cargas:
        c = carga["curso"]
        p = carga["periodo"]
        d = carga["disciplina"]
        t = carga["turma"]
        turno = carga["turno"]
        prof = carga["professor"]
        
        data = professores[prof]
        matricula = data["matricula"]
        if not matricula:
            import zlib
            crc = zlib.crc32(prof.encode()) & 0xffffffff
            matricula = f"SUBST{crc:08X}"

        sql.append(f"INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) ")
        sql.append(f"SELECT t.id, disc.id, dia.id, NOW(), NOW() ")
        sql.append(f"FROM turmas t ")
        sql.append(f"JOIN periodos p ON t.periodo_id = p.id ")
        sql.append(f"JOIN cursos curs ON p.curso_id = curs.id ")
        sql.append(f"JOIN disciplinas disc ON disc.periodo_id = p.id ")
        sql.append(f"JOIN professors prof ON prof.matricula = {escape(matricula)} ")
        sql.append(f"JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id ")
        sql.append(f"WHERE curs.nome = {escape(c)} AND p.nome = {escape(p)} AND t.turno = {escape(turno)} ")
        sql.append(f"AND disc.nome = {escape(d)} AND t.ano_letivo_id = @ano_id;")
        
    sql.append("")
    sql.append("SET FOREIGN_KEY_CHECKS = 1;")
    
    with open(SQL_OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(sql))

    print(f"SQL gerado em {SQL_OUT}")

if __name__ == "__main__":
    main()
