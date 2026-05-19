<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ImportarHorarios20262Controller extends Controller
{
    public function index()
    {
        return view('admin.importar-2026-2.index');
    }

    public function executar(Request $request)
    {
        $statements = $this->buildStatements();
        $executed = 0;
        $error = null;

        try {
            DB::statement('SET FOREIGN_KEY_CHECKS=0');
            foreach ($statements as $sql) {
                DB::statement($sql);
                $executed++;
            }
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
        } catch (\Exception $e) {
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
            $error = "Erro no statement #{$executed}: " . $e->getMessage();
        }

        return view('admin.importar-2026-2.index', [
            'executed' => $executed,
            'total'    => count($statements),
            'error'    => $error,
        ]);
    }

    private function buildStatements(): array
    {
        $s = [];

        // 1. LIMPEZA
        $s[] = 'DELETE FROM cargas';
        $s[] = 'DELETE FROM dias';
        $s[] = 'DELETE FROM turmas';
        $s[] = 'DELETE FROM disciplinas';
        $s[] = 'DELETE FROM periodos';
        $s[] = 'DELETE FROM cursos';
        $s[] = 'DELETE FROM ano_letivos';
        $s[] = "DELETE FROM professors WHERE matricula != '20251094040030'";

        // 2. CURSOS
        $cursos = [
            ['Integrado em Informática',                            'INF'],
            ['Integrado em Alimentos',                              'ALI'],
            ['Integrado em Apicultura',                             'API'],
            ['Licenciatura em Química',                             'LQ'],
            ['Tecnologia em Agroindústria',                         'AGRO'],
            ['Tecnologia em Análise e Desenvolvimento de Sistemas', 'TADS'],
            ['Especialização em Educação e Contemporaneidade',      'ESP'],
        ];
        foreach ($cursos as [$nome, $sigla]) {
            $s[] = "INSERT INTO cursos (nome, sigla, created_at, updated_at) VALUES ('{$this->e($nome)}', '{$sigla}', NOW(), NOW())";
        }

        // 3. PERÍODOS  [sigla, ordem, nome]
        $periodos = [
            ['INF',  1, '1º Período'], ['INF',  2, '2º Período'], ['INF',  3, '3º Período'], ['INF',  4, '4º Período'],
            ['ALI',  1, '1º Período'], ['ALI',  2, '2º Período'], ['ALI',  3, '3º Período'], ['ALI',  4, '4º Período'],
            ['API',  1, '1º Período'], ['API',  2, '2º Período'], ['API',  3, '3º Período'], ['API',  4, '4º Período'],
            ['LQ',   2, '2º Período'], ['LQ',   4, '4º Período'], ['LQ',   6, '6º Período'], ['LQ',   8, '8º Período'],
            ['AGRO', 2, '2º Período'], ['AGRO', 4, '4º Período'], ['AGRO', 6, '6º Período'],
            ['TADS', 2, '2º Período'], ['TADS', 4, '4º Período'], ['TADS', 6, '6º Período'], ['TADS', 7, '7º Período'],
            ['ESP',  2, 'Módulo 2'],
        ];
        foreach ($periodos as [$sigla, $ordem, $nome]) {
            $cs = $this->cursoSub($sigla);
            $s[] = "INSERT INTO periodos (nome, ordem, curso_id, created_at, updated_at) VALUES ('{$this->e($nome)}', {$ordem}, {$cs}, NOW(), NOW())";
        }

        // 4. DISCIPLINAS  [sigla, ordem, nome, ch]
        $disciplinas = [
            // INF 1
            ['INF',1,'Arte I',2],['INF',1,'Autoria Web',2],['INF',1,'Educação Física I',2],
            ['INF',1,'Eletricidade Instrumental',2],['INF',1,'Geografia I',4],
            ['INF',1,'Introdução a Programação',4],['INF',1,'Língua Portuguesa e Literatura I',4],
            ['INF',1,'Matemática I',4],['INF',1,'Química: Geral e Inorgânica',4],['INF',1,'Sociologia I',2],
            // INF 2
            ['INF',2,'Arte III',2],['INF',2,'Educação Física II',2],['INF',2,'Eletrônica',2],
            ['INF',2,'Filosofia II',2],['INF',2,'Geografia II',2],['INF',2,'Inglês I',2],
            ['INF',2,'Língua Portuguesa e Literatura II',2],['INF',2,'Matemática II',4],
            ['INF',2,'Organização e Montagem de Computadores',4],['INF',2,'Projeto de Banco de Dados',4],
            ['INF',2,'Química: Físico-química',2],['INF',2,'Redes de Computadores',2],
            // INF 3
            ['INF',3,'Biologia do individuo ao Ambiente',4],['INF',3,'Fisica: mecânica classica e termodinâmica',4],
            ['INF',3,'Gestão e Empreendedorismo',2],['INF',3,'História e cultura',2],
            ['INF',3,'Infraestrutura de Redes',4],['INF',3,'Inglês II',2],
            ['INF',3,'Língua Portuguesa e Literatura III',4],['INF',3,'Matemática III',2],
            ['INF',3,'Programação para internet',4],['INF',3,'Sociologia III',2],
            // INF 4
            ['INF',4,'Biologia II',4],['INF',4,'Espanhol',3],
            ['INF',4,'Filosofia, Ciência e Tecnologia',2],
            ['INF',4,'Fundamentos de sistemas operacionais e Sistemas operacionais de redes',4],
            ['INF',4,'História II',4],['INF',4,'Língua Portuguesa e Literatura IV',2],
            ['INF',4,'Programação para Internet',3],['INF',4,'Projeto de Desenvolvimento de Software',2],
            ['INF',4,'Qualidade de Vida e Trabalho',2],['INF',4,'Química II',4],
            // ALI 1
            ['ALI',1,'Arte II',2],['ALI',1,'Biologia - Do Indivíduo ao Ambiente',4],
            ['ALI',1,'Educação Física I',2],['ALI',1,'Inglês I',2],
            ['ALI',1,'Língua Portuguesa e Literatura I',4],['ALI',1,'Matemática I',4],
            ['ALI',1,'Qualidade de Vida e Trabalho',2],['ALI',1,'Química: Geral e Inorgânica',4],
            ['ALI',1,'Sociologia I',2],['ALI',1,'Técnicas de Laboratório de Alimentos',4],
            // ALI 2
            ['ALI',2,'Análise Sensorial',4],['ALI',2,'Biologia - Vida e Diversidade',2],
            ['ALI',2,'Educação Física II',2],['ALI',2,'Filosofia II',2],
            ['ALI',2,'Gestão e Empreendedorismo',2],['ALI',2,'Inglês II',2],
            ['ALI',2,'Língua Portuguesa e Literatura II',2],['ALI',2,'Matemática II',4],
            ['ALI',2,'Microbiologia de Alimentos',6],['ALI',2,'Química: Orgânica e Meio Ambiente',2],
            ['ALI',2,'Segurança do Trabalho',2],
            // ALI 3
            ['ALI',3,'Geografia I',4],['ALI',3,'História e Cultura',2],['ALI',3,'Inglês III',2],
            ['ALI',3,'Língua Portuguesa e Literatura III',4],['ALI',3,'Química: Físico-química',2],
            ['ALI',3,'Sociologia III',2],['ALI',3,'Tecnologia de Frutas e Hortaliças',4],
            ['ALI',3,'Termodinâmica',4],['ALI',3,'Tópicos Específicos na Indústria de Alimentos II',4],
            // ALI 4
            ['ALI',4,'Espanhol',3],['ALI',4,'Física II',4],['ALI',4,'Gestão Ambiental',2],
            ['ALI',4,'História II',4],['ALI',4,'Inglês II',3],
            ['ALI',4,'Língua Portuguesa e Literatura IV',2],
            ['ALI',4,'Máquinas, Equipamentos, Processos e Operações Unitárias',3],
            ['ALI',4,'Produção de Texto Técnico-Científico II',2],['ALI',4,'Segurança do Trabalho',2],
            ['ALI',4,'Seminário de Sociologia do Trabalho',10],['ALI',4,'Tecnologia de Cereais',2],
            ['ALI',4,'Tecnologia de Leite e Derivados',3],
            // API 1
            ['API',1,'Arte II',2],['API',1,'Biologia - Do Indivíduo ao Ambiente',4],
            ['API',1,'Educação Física I',2],['API',1,'Estatística Básica',2],
            ['API',1,'Geografia I',4],['API',1,'Introdução à Apicultura',2],
            ['API',1,'Língua Portuguesa e Literatura I',4],['API',1,'Matemática I',4],
            ['API',1,'Sociologia I',2],['API',1,'Técnicas de Laboratório',4],
            // API 2
            ['API',2,'Biologia - Hereditariedade, Evolução e suas Tecnologias',4],
            ['API',2,'Educação Física II',2],['API',2,'Filosofia II',2],['API',2,'Geografia II',2],
            ['API',2,'Inglês I',2],['API',2,'Língua Portuguesa e Literatura II',2],
            ['API',2,'Manejo em Apicultura Avançado',4],['API',2,'Matemática II',4],
            ['API',2,'Polinização',4],['API',2,'Química: Geral e Inorgânica',4],
            // API 3
            ['API',3,'Análise dos Produtos Apícolas',4],['API',3,'FÍSICA: MECÂNICA ...',4],
            ['API',3,'Gestão e Empreendedorismo',4],['API',3,'HISTÓRIA E CULTURA',2],
            ['API',3,'INGLÊS II',2],['API',3,'Língua Portuguesa e Literatura III',4],
            ['API',3,'MATEMÁTICA III',2],['API',3,'Quimica: físico-química',2],
            ['API',3,'Sociologia III',2],['API',3,'Tecnologia de mel, pólen e apitoxina',4],
            // API 4
            ['API',4,'Análise Sensorial',4],['API',4,'Análise dos Produtos Apícolas',4],
            ['API',4,'Espanhol',3],['API',4,'Física II',4],
            ['API',4,'Gestão Organizacional e Empreendedorismo',3],['API',4,'História II',4],
            ['API',4,'Inglês II',3],['API',4,'Língua Portuguesa e Literatura IV',2],
            ['API',4,'Sociologia do Trabalho',2],
            // LQ 2
            ['LQ',2,'CÁLCULO DIFERENCIAL E INTEGRAL I',4],['LQ',2,'FUNDAMENTOS DA EDUCAÇÃO II',4],
            ['LQ',2,'LEITURA E ESCRITA DE TEXTOS ACADÊMICOS E DIVULGAÇÃO CIENTÍFICA',2],
            ['LQ',2,'QUÍMICA EXPERIMENTAL II',2],['LQ',2,'QUÍMICA GERAL II',6],
            // LQ 4
            ['LQ',4,'BIOLOGIA PARA O ENSINO DE CIÊNCIAS',2],['LQ',4,'DIDÁTICA',4],
            ['LQ',4,'FUNDAMENTOS DA PESQUISA EM EDUCAÇÃO',2],
            ['LQ',4,'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL I',6],['LQ',4,'QUÍMICA INORGÂNICA',4],
            ['LQ',4,'SEMINÁRIO DE ORIENTAÇÃO AO DESENVOLVIMENTO DE PRÁTICAS EDUCATIVAS E FORMAÇÃO DOCENTE IV',2],
            // LQ 6
            ['LQ',6,'EDUCAÇÃO INCLUSIVA',4],['LQ',6,'FÍSICA II',2],
            ['LQ',6,'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL III',4],
            ['LQ',6,'METODOLOGIA DO ENSINO DE QUÍMICA II',4],
            ['LQ',6,'QUÍMICA ORGÂNICA FUNDAMENTAL',4],
            ['LQ',6,'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) II',2],
            // LQ 8
            ['LQ',8,'BIOQUÍMICA',2],['LQ',8,'FORMA DE PROFESSORES E TRABALHO DOCENTE',4],
            ['LQ',8,'QUÍMICA ANALÍTICA QUANTITATIVA',6],['LQ',8,'QUÍMICA DOS ELEMENTOS',2],
            ['LQ',8,'QUÍMICA INORGÂNICA EXPERIMENTAL',2],
            ['LQ',8,'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) IV',2],
            // AGRO 2
            ['AGRO',2,'Apicultura - Extensionista',4],['AGRO',2,'Física Aplicada à Agroindústria',4],
            ['AGRO',2,'Introdução à Extensão',2],
            ['AGRO',2,'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica',2],
            ['AGRO',2,'Microbiologia de Alimentos',4],['AGRO',2,'Produção Vegetal - Extensionista',4],
            ['AGRO',2,'Química Orgânica Aplicada à Agroindústria',4],
            // AGRO 4
            ['AGRO',4,'Fisiologia Pós Colheita de frutas e hortaliças',2],
            ['AGRO',4,'Fisiologia e Tecnologia Pós-Colheita',2],
            ['AGRO',4,'Microbiologia de Alimentos',4],['AGRO',4,'Métodos de Conservação',4],
            ['AGRO',4,'Operações Unitárias',2],['AGRO',4,'Química Analítica',6],
            ['AGRO',4,'Sociologia do Trabalho',2],
            // AGRO 6
            ['AGRO',6,'Gestão e Controle de Qualidade',2],
            ['AGRO',6,'Instalações e Equipamentos Agroindustriais',2],
            ['AGRO',6,'Matemática Básica',4],['AGRO',6,'Optativa',4],
            ['AGRO',6,'Segurança do Trabalho',2],['AGRO',6,'Tecnologia de Frutas e Hortaliças',4],
            ['AGRO',6,'Tecnologia de Leite e Derivados',6],
            // TADS 2
            ['TADS',2,'Epistemologia da Ciência (PPC 2012)',2],
            ['TADS',2,'Filosofia, Ciência e Tecnologia',2],
            ['TADS',2,'Introdução à Extensão',2],
            ['TADS',2,'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica',2],
            ['TADS',2,'Metodologia do Trabalho Científico',2],
            ['TADS',2,'Programação Orientada a Objetos',4],
            ['TADS',2,'Programação Orientada a Objetos (PPC 2012)',6],
            ['TADS',2,'Sistemas Operacionais',4],['TADS',2,'Web Design',4],
            // TADS 4
            ['TADS',4,'Análise e Projeto Orientado a Objetos',4],['TADS',4,'Banco de dados',4],
            ['TADS',4,'Desenvolvimento de Sistemas Web',6],['TADS',4,'Estrutura de Dados Lineares',4],
            ['TADS',4,'Informática',2],
            ['TADS',4,'Seminário de Introdução ao Desenvolvimento de Sistemas Web',2],
            // TADS 6
            ['TADS',6,'Desenvolvimento de Sistemas Corporativos',4],
            ['TADS',6,'Estrutura de Dados Não Lineares',4],['TADS',6,'Gerencia de Projetos',4],
            ['TADS',6,'P. I. Sistemas Corporativos',2],
            ['TADS',6,'Paradigmas de Linguagens de Programação',4],
            ['TADS',6,'Sistemas Operacionais',4],['TADS',6,'Teste de Software',4],
            // TADS 7
            ['TADS',7,'Seminário de Orientação para TCC / Estágio Supervisionado',2],
            // ESP 2
            ['ESP',2,'Ciência, Tecnologia e Sociedade',2],
            ['ESP',2,'Metodologia da Pesquisa em Educação',2],
            ['ESP',2,'Tecnologias da Informação e Comunicação no Ensino',2],
        ];
        foreach ($disciplinas as [$sigla, $ordem, $nome, $ch]) {
            $ps = $this->periodoSub($sigla, $ordem);
            $s[] = "INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES ('{$this->e($nome)}', {$ch}, {$ps}, NOW(), NOW())";
        }

        // 5. ANO LETIVO
        $s[] = "INSERT INTO ano_letivos (ano, semestre, concluido, created_at, updated_at) VALUES (2026, 2, 0, NOW(), NOW())";

        // 6. PROFESSORES  [matricula, nome]
        $professores = [
            ['1944318','Adalva Lopes Machado'],['1723542','Adriana Melo Leite'],
            ['1261863','Airton Damasceno Silva'],['2211090','Alexsandra Fernandes de Queiroz'],
            ['1000209','Aluisio Igor Rego Fontes'],['2025925','Antonio Abreu da Silveira Neto'],
            ['1128344','Antonio Cleonildo da Silva Costa'],['1672540','Atson Paulo Barreto Santos'],
            ['3526476','Beatriz Soares de Souza'],['3328836','Benicio Mackson Duarte Araujo'],
            ['1446104','Bruno Vinicius de Menezes Barros'],['1937542','Caio Patricio de Souza Sena'],
            ['3240240','Ciro Daniel Gurgel de Moura'],['1331568','Claudia Simone Cavalcanti'],
            ['3058156','Daniele Bezerra dos Santos'],['1936946','Demetrios Araujo Magalhaes Coutinho'],
            ['2944755','Dyego da Costa Santos'],['1310276','Eliaquim Timoteo da Cunha'],
            ['2256087','Elisabete Pianco de Sousa Pinheiro'],['1723840','Evandro Goncalves Leite'],
            ['3055014','Emanuel Alves Leite'],
            ['1884695','Francisco Magno Silva de Araujo'],['1258229','Francisco Regivanio Nascimento Andrade'],
            ['2114665','Francisco Rosiglei do Rego'],['1108661','Francisco Sergio de Almeida Neto'],
            ['2247265','Francisco Valdenir Lima'],['2279717','Gabriel Pereira de Oliveira'],
            ['3505593','Gilson Cunha de Oliveira Neto'],['2986899','Gleison Silva Oliveira'],
            ['1407813','Grasiany Sousa de Almeida'],['1273753','Irlan Arley Targino Moreira'],
            ['1087983','Italo Nelson Dantas dos Santos Guimaraes'],['2147637','Ivan de Oliveira Lima Junior'],
            ['2127817','Jeferson Queiroga Pereira'],['3525712','Jesse Medeiros Pontes'],
            ['3240821','Joao Lucas Pinto Matias'],['1414566','Joao Rodrigues da Silva Neto'],
            ['1124075','Joao Vitor Fonseca Feitoza'],['3936971','Kaio Henrique Fonseca Dantas'],
            ['3526439','Kessi Jhony de Araujo Silva'],['2248319','Leonardo Emmanuel Fernandes de Carvalho'],
            ['3297531','Leticia Damasceno do Nascimento Jacome'],['1255011','Lilian Cavalcante da Silva'],
            ['2280093','Lucas Soares Chnaiderman'],['1935827','Luciano Vieira Dutra'],
            ['1941345','Luciene Xavier de Mesquita Carvalho'],['2114813','Luis Rodrigues da Silva Filho'],
            ['2067057','Maikon Moises de Oliveira Maia'],['1817950','Manoel do Bonfim Lins de Aquino'],
            ['1459108','Marcos Victor Pires Rodrigues'],['3300878','Maria Elizangela da Penha'],
            ['2081549','Michelle de Oliveira Guimaraes Brasil'],['3342379','Monalisa Ribeiro Gama'],
            ['1469099','Naiara Medeiros de Oliveira'],['1577244','Oberto Grangeiro da Silva'],
            ['3230873','Petrick Oliveira da Silva'],['3526119','Quezia Emanuelly de Oliveira Souza'],
            ['3010474','Rafael Luz Duarte'],['3233380','Raimundo Fabio da Silva'],
            ['1066509','Raphael de Carvalho Muniz'],['1308371','Taciano Pessoa'],
            ['1047108','Tharcio Adelino Cerqueira'],['3224052','Thiago Henrique Freire de Oliveira'],
            ['Thamirys','Thamirys'],
            ['1647813','Ulysses Vieira da Silva Ferreira'],
            ['Prof.Substituto','Professor Substituto'],
            ['Prof.Substituto.EF','Professor Substituto (EF)'],
            ['Prof.Visitante','Professor Visitante'],
            ['Prof.Visitante.EF','Professor Visitante (EF)'],
        ];
        foreach ($professores as [$mat, $nome]) {
            $s[] = "INSERT INTO professors (nome, matricula, comissao, created_at, updated_at) VALUES ('{$this->e($nome)}', '{$this->e($mat)}', 0, NOW(), NOW())";
        }

        // 7. TURMAS  [sigla, ordem, turno, obs]
        $turmas = [
            ['INF',1,'M',null],['INF',1,'T',null],
            ['INF',2,'M',null],
            ['INF',3,'M',null],['INF',3,'T',null],
            ['INF',4,'M',null],['INF',4,'T',null],
            ['ALI',1,'M',null],
            ['ALI',2,'M',null],['ALI',2,'T',null],
            ['ALI',3,'M',null],['ALI',3,'T',null],
            ['ALI',4,'M',null],
            ['API',1,'M',null],['API',1,'T',null],
            ['API',2,'M',null],['API',2,'T',null],
            ['API',3,'M',null],
            ['API',4,'M',null],['API',4,'T',null],
            ['LQ',2,'T',null],['LQ',4,'N',null],['LQ',6,'T',null],['LQ',8,'N',null],
            ['AGRO',2,'T',null],['AGRO',4,'N',null],['AGRO',6,'T',null],
            ['TADS',2,'T',null],['TADS',4,'T',null],['TADS',6,'T',null],['TADS',7,'T',null],
            ['ESP',2,'N','Especialização 02 Noturna: Educação e Contemporaneidade'],
        ];
        $ano = "(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2)";
        foreach ($turmas as [$sigla, $ordem, $turno, $obs]) {
            $ps = $this->periodoSub($sigla, $ordem);
            $obsVal = $obs ? "'{$this->e($obs)}'" : 'NULL';
            $s[] = "INSERT INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) VALUES ('{$turno}', {$obsVal}, {$ps}, {$ano}, NOW(), NOW())";
        }

        // 8. DIAS
        $s[] = "INSERT INTO dias (seg,ter,qua,qui,sex,especial,observacao,ano_letivo_id,professor_id,created_at,updated_at) SELECT 1,1,1,1,1,0,NULL,(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2),id,NOW(),NOW() FROM professors WHERE matricula='20251094040030'";
        foreach ($professores as [$mat, $nome]) {
            $ps = $this->profSub($mat);
            $s[] = "INSERT INTO dias (seg,ter,qua,qui,sex,especial,observacao,ano_letivo_id,professor_id,created_at,updated_at) VALUES (1,1,1,1,1,0,NULL,(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2),{$ps},NOW(),NOW())";
        }

        // 9. CARGAS  [sigla, ordem_periodo, turno_turma, nome_disc, matricula_prof]
        $cargas = $this->getCargas();
        foreach ($cargas as [$sigla, $ordem, $turno, $disc, $mat]) {
            $turmaId  = $this->turmaSub($sigla, $ordem, $turno);
            $discId   = $this->discSub($sigla, $ordem, $disc);
            $diaId    = $this->diaSub($mat);
            $s[] = "INSERT INTO cargas (observacao,turma_id,disciplina_id,dia_id,created_at,updated_at) VALUES (NULL,{$turmaId},{$discId},{$diaId},NOW(),NOW())";
        }

        return $s;
    }

    private function e(string $v): string
    {
        return addslashes($v);
    }

    private function cursoSub(string $sigla): string
    {
        return "(SELECT id FROM cursos WHERE sigla='{$sigla}')";
    }

    private function periodoSub(string $sigla, int $ordem): string
    {
        return "(SELECT id FROM periodos WHERE ordem={$ordem} AND curso_id={$this->cursoSub($sigla)})";
    }

    private function turmaSub(string $sigla, int $ordem, string $turno): string
    {
        $ano = "(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2)";
        return "(SELECT id FROM turmas WHERE turno='{$turno}' AND periodo_id={$this->periodoSub($sigla,$ordem)} AND ano_letivo_id={$ano})";
    }

    private function discSub(string $sigla, int $ordem, string $nome): string
    {
        return "(SELECT id FROM disciplinas WHERE nome='{$this->e($nome)}' AND periodo_id={$this->periodoSub($sigla,$ordem)})";
    }

    private function profSub(string $mat): string
    {
        return "(SELECT id FROM professors WHERE matricula='{$this->e($mat)}')";
    }

    private function diaSub(string $mat): string
    {
        $ano = "(SELECT id FROM ano_letivos WHERE ano=2026 AND semestre=2)";
        return "(SELECT id FROM dias WHERE professor_id={$this->profSub($mat)} AND ano_letivo_id={$ano})";
    }

    private function getCargas(): array
    {
        // [sigla_curso, ordem_periodo, turno_turma, nome_disciplina, matricula_professor]
        return [
            // INF 1 M
            ['INF',1,'M','Arte I','2114665'],
            ['INF',1,'M','Autoria Web','1936946'],
            ['INF',1,'M','Educação Física I','1258229'],
            ['INF',1,'M','Eletricidade Instrumental','1066509'],
            ['INF',1,'M','Geografia I','2211090'],
            ['INF',1,'M','Introdução a Programação','3240240'],
            ['INF',1,'M','Língua Portuguesa e Literatura I','1884695'],
            ['INF',1,'M','Língua Portuguesa e Literatura I','3328836'],
            ['INF',1,'M','Matemática I','3230873'],
            ['INF',1,'M','Matemática I','3010474'],
            ['INF',1,'M','Química: Geral e Inorgânica','1647813'],
            ['INF',1,'M','Sociologia I','1310276'],
            // INF 1 T
            ['INF',1,'T','Arte I','2114665'],
            ['INF',1,'T','Autoria Web','1936946'],
            ['INF',1,'T','Eletricidade Instrumental','1066509'],
            ['INF',1,'T','Geografia I','1935827'],
            ['INF',1,'T','Introdução a Programação','2127817'],
            ['INF',1,'T','Língua Portuguesa e Literatura I','1723840'],
            ['INF',1,'T','Matemática I','3230873'],
            ['INF',1,'T','Química: Geral e Inorgânica','1647813'],
            ['INF',1,'T','Sociologia I','3342379'],
            ['INF',1,'T','Educação Física I','Prof.Visitante.EF'],
            // INF 2 M
            ['INF',2,'M','Arte III','2114665'],
            ['INF',2,'M','Educação Física II','1258229'],
            ['INF',2,'M','Eletrônica','1066509'],
            ['INF',2,'M','Filosofia II','1308371'],
            ['INF',2,'M','Geografia II','2211090'],
            ['INF',2,'M','Inglês I','1469099'],
            ['INF',2,'M','Língua Portuguesa e Literatura II','1723840'],
            ['INF',2,'M','Matemática II','3230873'],
            ['INF',2,'M','Organização e Montagem de Computadores','2147637'],
            ['INF',2,'M','Projeto de Banco de Dados','3240240'],
            ['INF',2,'M','Química: Físico-química','1647813'],
            ['INF',2,'M','Redes de Computadores','2127817'],
            // INF 3 M
            ['INF',3,'M','Biologia do individuo ao Ambiente','3526439'],
            ['INF',3,'M','Fisica: mecânica classica e termodinâmica','1446104'],
            ['INF',3,'M','Gestão e Empreendedorismo','2279717'],
            ['INF',3,'M','História e cultura','2279717'],
            ['INF',3,'M','Infraestrutura de Redes','1124075'],
            ['INF',3,'M','Inglês II','1459108'],
            ['INF',3,'M','Língua Portuguesa e Literatura III','1884695'],
            ['INF',3,'M','Matemática III','3010474'],
            ['INF',3,'M','Programação para internet','3936971'],
            ['INF',3,'M','Sociologia III','1310276'],
            // INF 3 T
            ['INF',3,'T','Biologia do individuo ao Ambiente','3526439'],
            ['INF',3,'T','Fisica: mecânica classica e termodinâmica','1446104'],
            ['INF',3,'T','Gestão e Empreendedorismo','2279717'],
            ['INF',3,'T','História e cultura','2280093'],
            ['INF',3,'T','Infraestrutura de Redes','3505593'],
            ['INF',3,'T','Inglês II','1469099'],
            ['INF',3,'T','Língua Portuguesa e Literatura III','1723840'],
            ['INF',3,'T','Matemática III','3010474'],
            ['INF',3,'T','Programação para internet','3936971'],
            ['INF',3,'T','Sociologia III','3342379'],
            // INF 4 M
            ['INF',4,'M','Biologia II','3526439'],
            ['INF',4,'M','Espanhol','1941345'],
            ['INF',4,'M','Filosofia, Ciência e Tecnologia','1308371'],
            ['INF',4,'M','Fundamentos de sistemas operacionais e Sistemas operacionais de redes','1124075'],
            ['INF',4,'M','História II','2279717'],
            ['INF',4,'M','Língua Portuguesa e Literatura IV','1884695'],
            ['INF',4,'M','Programação para Internet','3936971'],
            ['INF',4,'M','Projeto de Desenvolvimento de Software','3240240'],
            ['INF',4,'M','Qualidade de Vida e Trabalho','1941345'],
            ['INF',4,'M','Química II','1647813'],
            // INF 4 T
            ['INF',4,'T','Biologia II','3526439'],
            ['INF',4,'T','Espanhol','1941345'],
            ['INF',4,'T','Filosofia, Ciência e Tecnologia','1308371'],
            ['INF',4,'T','Fundamentos de sistemas operacionais e Sistemas operacionais de redes','3505593'],
            ['INF',4,'T','História II','2280093'],
            ['INF',4,'T','Língua Portuguesa e Literatura IV','1723840'],
            ['INF',4,'T','Programação para Internet','2127817'],
            ['INF',4,'T','Projeto de Desenvolvimento de Software','2127817'],
            ['INF',4,'T','Química II','1647813'],
            ['INF',4,'T','Qualidade de Vida e Trabalho','Prof.Visitante'],
            // ALI 1 M
            ['ALI',1,'M','Arte II','2114665'],
            ['ALI',1,'M','Biologia - Do Indivíduo ao Ambiente','3526439'],
            ['ALI',1,'M','Inglês I','1459108'],
            ['ALI',1,'M','Língua Portuguesa e Literatura I','1884695'],
            ['ALI',1,'M','Matemática I','3010474'],
            ['ALI',1,'M','Química: Geral e Inorgânica','1647813'],
            ['ALI',1,'M','Sociologia I','3342379'],
            ['ALI',1,'M','Técnicas de Laboratório de Alimentos','3058156'],
            ['ALI',1,'M','Educação Física I','Prof.Substituto.EF'],
            ['ALI',1,'M','Arte II','3055014'],
            ['ALI',1,'M','Qualidade de Vida e Trabalho','Prof.Visitante'],
            // ALI 2 M
            ['ALI',2,'M','Análise Sensorial','3058156'],
            ['ALI',2,'M','Biologia - Vida e Diversidade','3526439'],
            ['ALI',2,'M','Educação Física II','1258229'],
            ['ALI',2,'M','Filosofia II','1308371'],
            ['ALI',2,'M','Gestão e Empreendedorismo','2279717'],
            ['ALI',2,'M','Inglês II','1459108'],
            ['ALI',2,'M','Língua Portuguesa e Literatura II','1884695'],
            ['ALI',2,'M','Matemática II','3010474'],
            ['ALI',2,'M','Microbiologia de Alimentos','3300878'],
            ['ALI',2,'M','Química: Orgânica e Meio Ambiente','1647813'],
            ['ALI',2,'M','Segurança do Trabalho','2256087'],
            // ALI 2 T
            ['ALI',2,'T','Análise Sensorial','3058156'],
            ['ALI',2,'T','Biologia - Vida e Diversidade','3526439'],
            ['ALI',2,'T','Educação Física II','1258229'],
            ['ALI',2,'T','Filosofia II','1308371'],
            ['ALI',2,'T','Gestão e Empreendedorismo','2279717'],
            ['ALI',2,'T','Inglês II','1469099'],
            ['ALI',2,'T','Língua Portuguesa e Literatura II','1723840'],
            ['ALI',2,'T','Matemática II','3230873'],
            ['ALI',2,'T','Microbiologia de Alimentos','3300878'],
            ['ALI',2,'T','Química: Orgânica e Meio Ambiente','1647813'],
            ['ALI',2,'T','Segurança do Trabalho','2256087'],
            // ALI 3 M
            ['ALI',3,'M','Geografia I','2211090'],
            ['ALI',3,'M','História e Cultura','2279717'],
            ['ALI',3,'M','Inglês III','1469099'],
            ['ALI',3,'M','Língua Portuguesa e Literatura III','1884695'],
            ['ALI',3,'M','Química: Físico-química','1647813'],
            ['ALI',3,'M','Sociologia III','3342379'],
            ['ALI',3,'M','Tecnologia de Frutas e Hortaliças','2944755'],
            ['ALI',3,'M','Termodinâmica','1047108'],
            ['ALI',3,'M','Tópicos Específicos na Indústria de Alimentos II','2256087'],
            // ALI 3 T
            ['ALI',3,'T','Geografia I','1935827'],
            ['ALI',3,'T','História e Cultura','2280093'],
            ['ALI',3,'T','Inglês III','1459108'],
            ['ALI',3,'T','Língua Portuguesa e Literatura III','1723840'],
            ['ALI',3,'T','Química: Físico-química','1647813'],
            ['ALI',3,'T','Sociologia III','1310276'],
            ['ALI',3,'T','Tecnologia de Frutas e Hortaliças','2944755'],
            ['ALI',3,'T','Termodinâmica','3525712'],
            ['ALI',3,'T','Tópicos Específicos na Indústria de Alimentos II','2256087'],
            // ALI 4 M
            ['ALI',4,'M','Espanhol','1941345'],
            ['ALI',4,'M','Física II','1446104'],
            ['ALI',4,'M','Gestão Ambiental','2081549'],
            ['ALI',4,'M','História II','2279717'],
            ['ALI',4,'M','Inglês II','1459108'],
            ['ALI',4,'M','Língua Portuguesa e Literatura IV','1884695'],
            ['ALI',4,'M','Produção de Texto Técnico-Científico II','1884695'],
            ['ALI',4,'M','Segurança do Trabalho','2256087'],
            ['ALI',4,'M','Seminário de Sociologia do Trabalho','3342379'],
            ['ALI',4,'M','Tecnologia de Leite e Derivados','3058156'],
            ['ALI',4,'M','Máquinas, Equipamentos, Processos e Operações Unitárias','Thamirys'],
            ['ALI',4,'M','Tecnologia de Cereais','Thamirys'],
            // API 1 M
            ['API',1,'M','Arte II','2114665'],
            ['API',1,'M','Biologia - Do Indivíduo ao Ambiente','3526439'],
            ['API',1,'M','Educação Física I','1258229'],
            ['API',1,'M','Estatística Básica','2114813'],
            ['API',1,'M','Geografia I','2211090'],
            ['API',1,'M','Introdução à Apicultura','2025925'],
            ['API',1,'M','Língua Portuguesa e Literatura I','1884695'],
            ['API',1,'M','Matemática I','3010474'],
            ['API',1,'M','Sociologia I','1310276'],
            ['API',1,'M','Técnicas de Laboratório','3058156'],
            // API 1 T
            ['API',1,'T','Arte II','3055014'],
            ['API',1,'T','Biologia - Do Indivíduo ao Ambiente','3526439'],
            ['API',1,'T','Estatística Básica','2114813'],
            ['API',1,'T','Geografia I','1935827'],
            ['API',1,'T','Introdução à Apicultura','2025925'],
            ['API',1,'T','Língua Portuguesa e Literatura I','1723840'],
            ['API',1,'T','Matemática I','3230873'],
            ['API',1,'T','Sociologia I','3342379'],
            ['API',1,'T','Técnicas de Laboratório','3058156'],
            ['API',1,'T','Educação Física I','Prof.Visitante.EF'],
            // API 2 M
            ['API',2,'M','Biologia - Hereditariedade, Evolução e suas Tecnologias','3526439'],
            ['API',2,'M','Educação Física II','1258229'],
            ['API',2,'M','Filosofia II','1308371'],
            ['API',2,'M','Geografia II','2211090'],
            ['API',2,'M','Inglês I','1469099'],
            ['API',2,'M','Língua Portuguesa e Literatura II','1884695'],
            ['API',2,'M','Manejo em Apicultura Avançado','2025925'],
            ['API',2,'M','Matemática II','3010474'],
            ['API',2,'M','Polinização','1937542'],
            ['API',2,'M','Química: Geral e Inorgânica','1647813'],
            // API 2 T
            ['API',2,'T','Biologia - Hereditariedade, Evolução e suas Tecnologias','3526439'],
            ['API',2,'T','Educação Física II','1258229'],
            ['API',2,'T','Filosofia II','1308371'],
            ['API',2,'T','Geografia II','1935827'],
            ['API',2,'T','Inglês I','1459108'],
            ['API',2,'T','Língua Portuguesa e Literatura II','1723840'],
            ['API',2,'T','Manejo em Apicultura Avançado','2025925'],
            ['API',2,'T','Matemática II','3230873'],
            ['API',2,'T','Polinização','1937542'],
            ['API',2,'T','Química: Geral e Inorgânica','1647813'],
            // API 3 M
            ['API',3,'M','Análise dos Produtos Apícolas','3240821'],
            ['API',3,'M','FÍSICA: MECÂNICA ...','1446104'],
            ['API',3,'M','Gestão e Empreendedorismo','2279717'],
            ['API',3,'M','HISTÓRIA E CULTURA','2279717'],
            ['API',3,'M','INGLÊS II','1459108'],
            ['API',3,'M','Língua Portuguesa e Literatura III','1884695'],
            ['API',3,'M','MATEMÁTICA III','3010474'],
            ['API',3,'M','Quimica: físico-química','1647813'],
            ['API',3,'M','Sociologia III','1310276'],
            ['API',3,'M','Tecnologia de mel, pólen e apitoxina','3240821'],
            // API 4 M
            ['API',4,'M','Análise Sensorial','3058156'],
            ['API',4,'M','Análise dos Produtos Apícolas','3240821'],
            ['API',4,'M','Espanhol','1941345'],
            ['API',4,'M','Física II','1446104'],
            ['API',4,'M','Gestão Organizacional e Empreendedorismo','2279717'],
            ['API',4,'M','História II','2279717'],
            ['API',4,'M','Inglês II','1469099'],
            ['API',4,'M','Língua Portuguesa e Literatura IV','1884695'],
            ['API',4,'M','Sociologia do Trabalho','3342379'],
            // API 4 T
            ['API',4,'T','Análise Sensorial','3058156'],
            ['API',4,'T','Análise dos Produtos Apícolas','3240821'],
            ['API',4,'T','Espanhol','1941345'],
            ['API',4,'T','Física II','1446104'],
            ['API',4,'T','Gestão Organizacional e Empreendedorismo','2279717'],
            ['API',4,'T','História II','2280093'],
            ['API',4,'T','Inglês II','1459108'],
            ['API',4,'T','Língua Portuguesa e Literatura IV','1723840'],
            ['API',4,'T','Sociologia do Trabalho','1310276'],
            // LQ 2 T
            ['LQ',2,'T','CÁLCULO DIFERENCIAL E INTEGRAL I','2248319'],
            ['LQ',2,'T','FUNDAMENTOS DA EDUCAÇÃO II','1255011'],
            ['LQ',2,'T','LEITURA E ESCRITA DE TEXTOS ACADÊMICOS E DIVULGAÇÃO CIENTÍFICA','1817950'],
            ['LQ',2,'T','QUÍMICA EXPERIMENTAL II','1087983'],
            ['LQ',2,'T','QUÍMICA GERAL II','1087983'],
            // LQ 4 N
            ['LQ',4,'N','BIOLOGIA PARA O ENSINO DE CIÊNCIAS','3526476'],
            ['LQ',4,'N','DIDÁTICA','1255011'],
            ['LQ',4,'N','FUNDAMENTOS DA PESQUISA EM EDUCAÇÃO','1817950'],
            ['LQ',4,'N','FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL I','1672540'],
            ['LQ',4,'N','QUÍMICA INORGÂNICA','1087983'],
            ['LQ',4,'N','SEMINÁRIO DE ORIENTAÇÃO AO DESENVOLVIMENTO DE PRÁTICAS EDUCATIVAS E FORMAÇÃO DOCENTE IV','1255011'],
            // LQ 6 T
            ['LQ',6,'T','EDUCAÇÃO INCLUSIVA','1331568'],
            ['LQ',6,'T','FÍSICA II','1446104'],
            ['LQ',6,'T','FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL III','1672540'],
            ['LQ',6,'T','METODOLOGIA DO ENSINO DE QUÍMICA II','1255011'],
            ['LQ',6,'T','QUÍMICA ORGÂNICA FUNDAMENTAL','2986899'],
            ['LQ',6,'T','SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) II','1255011'],
            // LQ 8 N
            ['LQ',8,'N','BIOQUÍMICA','3526476'],
            ['LQ',8,'N','FORMA DE PROFESSORES E TRABALHO DOCENTE','1255011'],
            ['LQ',8,'N','QUÍMICA ANALÍTICA QUANTITATIVA','1087983'],
            ['LQ',8,'N','QUÍMICA DOS ELEMENTOS','1087983'],
            ['LQ',8,'N','QUÍMICA INORGÂNICA EXPERIMENTAL','1087983'],
            ['LQ',8,'N','SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) IV','1255011'],
            // AGRO 2 T
            ['AGRO',2,'T','Apicultura - Extensionista','2025925'],
            ['AGRO',2,'T','Física Aplicada à Agroindústria','1446104'],
            ['AGRO',2,'T','Introdução à Extensão','2114813'],
            ['AGRO',2,'T','Leitura e Produção de Textos Acadêmicos e de Divulgação Científica','3328836'],
            ['AGRO',2,'T','Microbiologia de Alimentos','3300878'],
            ['AGRO',2,'T','Produção Vegetal - Extensionista','2081549'],
            ['AGRO',2,'T','Química Orgânica Aplicada à Agroindústria','2986899'],
            // AGRO 4 N
            ['AGRO',4,'N','Fisiologia Pós Colheita de frutas e hortaliças','2081549'],
            ['AGRO',4,'N','Fisiologia e Tecnologia Pós-Colheita','3058156'],
            ['AGRO',4,'N','Microbiologia de Alimentos','3300878'],
            ['AGRO',4,'N','Métodos de Conservação','3058156'],
            ['AGRO',4,'N','Química Analítica','1087983'],
            ['AGRO',4,'N','Sociologia do Trabalho','3342379'],
            ['AGRO',4,'N','Operações Unitárias','Thamirys'],
            // AGRO 6 T
            ['AGRO',6,'T','Matemática Básica','2248319'],
            ['AGRO',6,'T','Segurança do Trabalho','2256087'],
            ['AGRO',6,'T','Tecnologia de Frutas e Hortaliças','2081549'],
            ['AGRO',6,'T','Tecnologia de Leite e Derivados','3058156'],
            ['AGRO',6,'T','Gestão e Controle de Qualidade','Thamirys'],
            ['AGRO',6,'T','Instalações e Equipamentos Agroindustriais','Thamirys'],
            ['AGRO',6,'T','Optativa','Thamirys'],
            // TADS 2 T
            ['TADS',2,'T','Epistemologia da Ciência (PPC 2012)','3233380'],
            ['TADS',2,'T','Filosofia, Ciência e Tecnologia','3233380'],
            ['TADS',2,'T','Filosofia, Ciência e Tecnologia','1672540'],
            ['TADS',2,'T','Introdução à Extensão','2114813'],
            ['TADS',2,'T','Leitura e Produção de Textos Acadêmicos e de Divulgação Científica','3328836'],
            ['TADS',2,'T','Metodologia do Trabalho Científico','1817950'],
            ['TADS',2,'T','Programação Orientada a Objetos','1936946'],
            ['TADS',2,'T','Programação Orientada a Objetos (PPC 2012)','3526476'],
            ['TADS',2,'T','Programação Orientada a Objetos (PPC 2012)','1066509'],
            ['TADS',2,'T','Programação Orientada a Objetos (PPC 2012)','1000209'],
            ['TADS',2,'T','Sistemas Operacionais','1817950'],
            ['TADS',2,'T','Web Design','3240240'],
            // TADS 4 T
            ['TADS',4,'T','Análise e Projeto Orientado a Objetos','3526476'],
            ['TADS',4,'T','Banco de dados','3224052'],
            ['TADS',4,'T','Desenvolvimento de Sistemas Web','1273753'],
            ['TADS',4,'T','Estrutura de Dados Lineares','1936946'],
            ['TADS',4,'T','Informática','2114813'],
            ['TADS',4,'T','Seminário de Introdução ao Desenvolvimento de Sistemas Web','3526476'],
            // TADS 6 T
            ['TADS',6,'T','Desenvolvimento de Sistemas Corporativos','1273753'],
            ['TADS',6,'T','Estrutura de Dados Não Lineares','1936946'],
            ['TADS',6,'T','Gerencia de Projetos','2067057'],
            ['TADS',6,'T','P. I. Sistemas Corporativos','1273753'],
            ['TADS',6,'T','Paradigmas de Linguagens de Programação','3224052'],
            ['TADS',6,'T','Sistemas Operacionais','1817950'],
            ['TADS',6,'T','Sistemas Operacionais','3526439'],
            ['TADS',6,'T','Teste de Software','1936946'],
            // TADS 7 T
            ['TADS',7,'T','Seminário de Orientação para TCC / Estágio Supervisionado','3526439'],
            // ESP 2 N
            ['ESP',2,'N','Ciência, Tecnologia e Sociedade','2256087'],
            ['ESP',2,'N','Ciência, Tecnologia e Sociedade','3526119'],
            ['ESP',2,'N','Metodologia da Pesquisa em Educação','1817950'],
            ['ESP',2,'N','Metodologia da Pesquisa em Educação','2247265'],
            ['ESP',2,'N','Tecnologias da Informação e Comunicação no Ensino','2067057'],
        ];
    }
}
