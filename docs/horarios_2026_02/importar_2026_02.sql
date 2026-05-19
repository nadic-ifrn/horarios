-- Script de Importação para Horários 2026.02
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Ano Letivo
INSERT INTO ano_letivos (ano, semestre, concluido, created_at, updated_at) 
SELECT 2026, 2, 0, NOW(), NOW() WHERE NOT EXISTS (SELECT 1 FROM ano_letivos WHERE ano = 2026 AND semestre = 2);
SET @ano_id = (SELECT id FROM ano_letivos WHERE ano = 2026 AND semestre = 2);

-- 2. Cursos
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Agroindústria', 'AGRO', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Agroindústria');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Alimentos', 'ALIM', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Alimentos');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Análise e Desenvolvimento de Sistemas', 'ADS', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Análise e Desenvolvimento de Sistemas');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Apicultura', 'APIC', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Apicultura');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Especialização', 'ESP', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Especialização');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Informática', 'INF', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Informática');
INSERT INTO cursos (nome, sigla, created_at, updated_at)
SELECT 'Licenciatura em Química', 'LQ', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM cursos WHERE nome = 'Licenciatura em Química');

-- 3. Periodos
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Agroindústria';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Agroindústria';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '6', 6, id, NOW(), NOW() FROM cursos WHERE nome = 'Agroindústria';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '1', 1, id, NOW(), NOW() FROM cursos WHERE nome = 'Alimentos';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Alimentos';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '3', 3, id, NOW(), NOW() FROM cursos WHERE nome = 'Alimentos';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Alimentos';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Análise e Desenvolvimento de Sistemas';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Análise e Desenvolvimento de Sistemas';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '6', 6, id, NOW(), NOW() FROM cursos WHERE nome = 'Análise e Desenvolvimento de Sistemas';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '7', 7, id, NOW(), NOW() FROM cursos WHERE nome = 'Análise e Desenvolvimento de Sistemas';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '1', 1, id, NOW(), NOW() FROM cursos WHERE nome = 'Apicultura';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Apicultura';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '3', 3, id, NOW(), NOW() FROM cursos WHERE nome = 'Apicultura';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Apicultura';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '02', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Especialização';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '1', 1, id, NOW(), NOW() FROM cursos WHERE nome = 'Informática';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Informática';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '3', 3, id, NOW(), NOW() FROM cursos WHERE nome = 'Informática';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Informática';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '2', 2, id, NOW(), NOW() FROM cursos WHERE nome = 'Licenciatura em Química';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '4', 4, id, NOW(), NOW() FROM cursos WHERE nome = 'Licenciatura em Química';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '6', 6, id, NOW(), NOW() FROM cursos WHERE nome = 'Licenciatura em Química';
INSERT IGNORE INTO periodos (nome, ordem, curso_id, created_at, updated_at) 
SELECT '8', 8, id, NOW(), NOW() FROM cursos WHERE nome = 'Licenciatura em Química';

-- 4. Disciplinas
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Apicultura - Extensionista', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Física Aplicada à Agroindústria', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Introdução à Extensão', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Microbiologia de Alimentos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Produção Vegetal - Extensionista', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Produção vegetal - Extensionista', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química Orgânica Aplicada à Agroindústria', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Fisiologia Pós Colheita de frutas e hortaliças', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Fisiologia e Tecnologia Pós-Colheita', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Microbiologia de Alimentos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Métodos de Conservação', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Operações Unitárias', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química Analítica', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia do Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão e Controle de Qualidade', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Instalações e Equipamentos Agroindustriais', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática Básica', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Optativa', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Segurança do Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de Frutas e Hortaliças', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de Leite e Derivados', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Arte II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia - Do Indivíduo ao Ambiente', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Qualidade de Vida e Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Geral e Inorgânica', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Técnicas de Laboratório de Alimentos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Análise Sensorial', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia - Vida e Diversidade', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Filosofia II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão e Empreendedorismo', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Microbiologia de Alimentos', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Orgânica e Meio Ambiente', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Segurança do Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Geografia I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'História e Cultura', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura III', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Físico-química', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de Frutas e Hortaliças', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tópicos Específicos na Indústria de Alimentos II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'termodinâmica.', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'ópicos Específicos na Indústria de Alimentos II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Espanhol', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Física II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão Ambiental', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'História II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês II', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura IV', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Máquinas, Equipamentos, Processos e Operações Unitárias', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Produção de Texto Técnico-Científico II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Segurança do Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Seminário de Sociologia do Trabalho', 10, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de Cereais', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de Leite e Derivados', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Epistemologia da Ciência (PPC 2012)', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Filosofia, Ciência e Tecnologia', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Introdução à Extensão', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Metodologia do Trabalho Científico', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Programação Orientada a Objetos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Programação Orientada a Objetos (PPC 2012)', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sistemas Operacionais', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Web Design', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Análise e Projeto Orientado a Objetos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Banco de dados', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Desenvolvimento de Sistemas Web', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Estrutura de Dados Lineares', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Informática', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Seminário de Introdução ao Desenvolvimento de Sistemas Web', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Desenvolvimento de Sistemas Corporativos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Estrutura de Dados Não Lineares', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gerencia de Projetos', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'P. I. Sistemas Corporativos', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Paradigmas de Linguagens de Programação', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sistemas Operacionais', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Teste de Software', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Seminário de Orientação para TCC / Estágio Supervisionado', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '7';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Arte II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia - Do Indivíduo ao Ambiente', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Estatística Básica', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Geografia I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Introdução à Apicultura', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Técnicas de Laboratório', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia - Hereditariedade, Evolução e suas Tecnologias', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Filosofia II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Geografia II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Manejo em Apicultura Avançado', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Polinização', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Geral e Inorgânica', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Análise dos Produtos Apícolas', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FÍSICA: MECÂNICA ...', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão e Empreendedorismo', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'HISTÓRIA E CULTURA', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'INGLÊS II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua portuguesa e Literaura III', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'MATEMÁTICA III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Quimica: físico-química', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologia de mel, pólen e apitoxina', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Análise Sensorial', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Análise dos Produtos Apícolas', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Espanhol', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Física II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão Organizacional e Empreendedorismo', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'História II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês II', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura IV', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia do Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Ciência, Tecnologia e Sociedade', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Especialização' AND p.nome = '02';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Metodologia da Pesquisa em Educação', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Especialização' AND p.nome = '02';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Tecnologias da Informação e Comunicação no Ensino', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Especialização' AND p.nome = '02';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Arte I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Autoria Web', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Eletricidade Instrumental', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Geografia I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Introdução a Programação', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Geral e Inorgânica', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Arte III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Educação Física II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Eletrônica', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Filosofia II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Geografia II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês I', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Organização e Montagem de Computadores', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Projeto de Banco de Dados', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química: Físico-química', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Redes de Computadores', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia do individuo ao Ambiente', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Fisica: mecânica classica e termodinâmica', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Gestão e Empreendedorismo', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'História e cultura', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Infraestrutura de Redes', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Inglês II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura III', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Matemática III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Programação para internet', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Sociologia III', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Biologia II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Espanhol', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Filosofia, Ciência e Tecnologia', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Fundamentos de sistemas operacionais e Sistemas operacionais de redes', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'História II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Língua Portuguesa e Literatura IV', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Programação para Internet', 3, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Projeto de Desenvolvimento de Software', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Qualidade de Vida e Trabalho', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'Química II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'CÁLCULO DIFERENCIAL E INTEGRAL I', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FUNDAMENTOS DA EDUCAÇÃO II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'LEITURA E ESCRITA DE TEXTOS ACADÊMICOS E DIVULGAÇÃO CIENTÍFICA', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA EXPERIMENTAL II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA GERAL II', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'BIOLOGIA PARA O ENSINO DE CIÊNCIAS', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'DIDÁTICA', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FUNDAMENTOS DA PESQUISA EM EDUCAÇÃO', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL I', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA INORGÂNICA', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'SEMINÁRIO DE ORIENTAÇÃO AO DESENVOLVIMENTO DE PRÁTICAS EDUCATIVAS E FORMAÇÃO DOCENTE IV', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'EDUCAÇÃO INCLUSIVA', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FÍSICA II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL III', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'METODOLOGIA DO ENSINO DE QUÍMICA II', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA ORGÂNICA FUNDAMENTAL', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) II', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'BIOQUÍMICA', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'FORMA DE PROFESSORES E TRABALHO DOCENTE', 4, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA ANALÍTICA QUANTITATIVA', 6, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA DOS ELEMENTOS', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'QUÍMICA INORGÂNICA EXPERIMENTAL', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';
INSERT IGNORE INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) 
SELECT 'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) IV', 2, p.id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';

-- 5. Turmas
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'N', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Agroindústria' AND p.nome = '6';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '1';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '3';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Alimentos' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '7';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '1';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '3';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Apicultura' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'N', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Especialização' AND p.nome = '02';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '1';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '3';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'M', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Informática' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '2';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'N', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '4';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'T', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '6';
INSERT IGNORE INTO turmas (turno, observacao, periodo_id, ano_letivo_id, created_at, updated_at) 
SELECT 'N', NULL, p.id, @ano_id, NOW(), NOW() 
FROM periodos p JOIN cursos c ON p.curso_id = c.id 
WHERE c.nome = 'Licenciatura em Química' AND p.nome = '8';

-- 6. Professores
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Antonio Abreu da Silveira Neto', '2025925', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Adalva Lopes Machado', '1944318', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Adriana Melo Leite', '1723542', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Adriana Melo Leite', '1723542', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Airton Damasceno Silva', '1261863', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Alexsandra Fernandes de Queiroz', '2211090', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Aluisio Igor Rego Fontes', '1000209', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Aluisio Igor Rego Fontes', '1000209', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Atson Paulo Barreto Santos', '1672540', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Beatriz Soares de Souza', '3526476', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Benicio Mackson Duarte Araujo', '3328836', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Manoel do Bonfim Lins de Aquino', '1817950', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Bruno Vinicius de Menezes Barros', '1446104', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Caio Patricio de Souza Sena', '1937542', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Ciro Daniel Gurgel de Moura', '3240240', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Claudia Simone Cavalcanti', '1331568', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Antonio Cleonildo da Silva Costa', '1128344', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Daniele Bezerra dos Santos', '3058156', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Daniele Bezerra dos Santos', '3058156', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Demetrios Araujo Magalhaes Coutinho', '1936946', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Demetrios Araujo Magalhaes Coutinho', '1936946', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Dyego da Costa Santos', '2944755', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Dyego da Costa Santos', '2944755', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Eliaquim Timoteo da Cunha', '1310276', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Elisabete Pianco de Sousa Pinheiro', '2256087', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Maria Elizangela da Penha', '3300878', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Evandro Goncalves Leite', '1723840', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Raimundo Fabio da Silva', '3233380', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Raimundo Fabio da Silva', '3233380', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Gabriel Pereira de Oliveira', '2279717', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Gilson Cunha de Oliveira Neto', '3505593', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Gleison Silva Oliveira', '2986899', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Gleison Silva Oliveira', '2986899', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Grasiany Sousa de Almeida', '1407813', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Grasiany Sousa de Almeida', '1407813', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Irlan Arley Targino Moreira', '1273753', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Italo Nelson Dantas dos Santos Guimaraes', '1087983', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Ivan de Oliveira Lima Junior', '2147637', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Jeferson Queiroga Pereira', '2127817', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Jesse Medeiros Pontes', '3525712', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Joao Lucas Pinto Matias', '3240821', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Joao Rodrigues da Silva Neto', '1414566', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Kaio Henrique Fonseca Dantas', '3936971', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Joao Vitor Fonseca Feitoza', '1124075', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Kessi Jhony de Araujo Silva', '3526439', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Leonardo Emmanuel Fernandes de Carvalho', '2248319', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Leticia Damasceno do Nascimento Jacome', '3297531', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Leticia Damasceno do Nascimento Jacome', '3297531', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Lilian Cavalcante da Silva', '1255011', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Lucas Soares Chnaiderman', '2280093', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Luciano Vieira Dutra', '1935827', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Luciene Xavier de Mesquita Carvalho', '1941345', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Luis Rodrigues da Silva Filho', '2114813', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Luis Rodrigues da Silva Filho', '2114813', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Francisco Magno Silva de Araujo', '1884695', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Maikon Moises de Oliveira Maia', '2067057', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Marcos Victor Pires Rodrigues', '1459108', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Michelle de Oliveira Guimaraes Brasil', '2081549', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Monalisa Ribeiro Gama', '3342379', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Naiara Medeiros de Oliveira', '1469099', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Oberto Grangeiro da Silva', '1577244', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Professor Substituto (EF)', 'Prof.Substituto(EF)', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Professor Visitante', 'Prof.Visitante', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Professor Visitante (EF)', 'Prof.Visitante(EF)', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Petrick Oliveira da Silva', '3230873', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Quezia Emanuelly de Oliveira Souza', '3526119', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Quezia Emanuelly de Oliveira Souza', '3526119', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Rafael Luz Duarte', '3010474', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Raphael de Carvalho Muniz', '1066509', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Francisco Regivanio Nascimento Andrade', '1258229', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Francisco Rosiglei do Rego', '2114665', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Francisco Sergio de Almeida Neto', '1108661', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Taciano Pessoa', '1308371', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Thamirys (Substituto)', 'Thamirys', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Tharcio Adelino Cerqueira', '1047108', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Thiago Henrique Freire de Oliveira', '3224052', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Tharcio Adelino Cerqueira', '1047108', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Ulysses Vieira da Silva Ferreira', '1647813', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Francisco Valdenir Lima', '2247265', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Italo Nelson Dantas dos Santos Guimaraes', '1087983', 0, NOW(), NOW());
INSERT IGNORE INTO professors (nome, matricula, comissao, created_at, updated_at) 
VALUES ('Professor Substituto', 'Prof.Substituto', 0, NOW(), NOW());

-- 7. Dias (Disponibilidade padrão)
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2025925';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1944318';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1723542';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1723542';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1261863';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2211090';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1000209';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1000209';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1672540';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3526476';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3328836';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1817950';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1446104';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1937542';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3240240';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1331568';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1128344';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3055014';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3058156';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3058156';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1936946';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1936946';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2944755';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2944755';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1310276';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2256087';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3300878';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1723840';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3233380';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3233380';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2279717';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3505593';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2986899';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2986899';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1407813';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1407813';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1273753';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1087983';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2147637';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2127817';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3525712';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3240821';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1414566';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3936971';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1124075';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3526439';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2248319';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3297531';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3297531';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1255011';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2280093';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1935827';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1941345';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2114813';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2114813';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1884695';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2067057';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1459108';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2081549';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3342379';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1469099';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1577244';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Prof.Substituto(EF)';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Prof.Visitante';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Prof.Visitante(EF)';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Prof.Visitante(EF)';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3230873';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3526119';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3526119';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3010474';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1066509';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1258229';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2114665';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1108661';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1308371';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Thamirys';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Thamirys';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1047108';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '3224052';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1047108';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1647813';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '2247265';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = '1087983';
INSERT IGNORE INTO dias (seg, ter, qua, qui, sex, especial, observacao, ano_letivo_id, professor_id, created_at, updated_at) 
SELECT 1, 1, 1, 1, 1, 0, 'Importado automaticamente', @ano_id, id, NOW(), NOW() 
FROM professors WHERE matricula = 'Prof.Substituto';

-- 8. Cargas
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3230873' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3010474' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1884695' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2067057' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Educação Física I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2211090' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1124075' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Química: Geral e Inorgânica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Sociologia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3297531' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Arte I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Eletricidade Instrumental' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1273753' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Autoria Web' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1936946' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Introdução a Programação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114665' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1884695' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Visitante(EF)' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Educação Física I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2247265' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1124075' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Química: Geral e Inorgânica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Sociologia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3297531' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Arte I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Eletricidade Instrumental' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240240' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Autoria Web' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1936946' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Introdução a Programação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Educação Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114665' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1261863' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Química: Físico-química' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723840' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Inglês I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2247265' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Geografia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Filosofia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3297531' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Arte III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1817950' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Eletrônica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526476' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Redes de Computadores' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3224052' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Projeto de Banco de Dados' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Organização e Montagem de Computadores' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1331568' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2248319' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Biologia do individuo ao Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2279717' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'História e cultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1414566' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Matemática III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1087983' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Fisica: mecânica classica e termodinâmica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Sociologia III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Programação para internet' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3936971' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Infraestrutura de Redes' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Gestão e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1331568' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2248319' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Biologia do individuo ao Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2280093' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'História e cultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3230873' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Matemática III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3010474' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Matemática III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1087983' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Fisica: mecânica classica e termodinâmica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Sociologia III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Programação para internet' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3936971' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Infraestrutura de Redes' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Gestão e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2248319' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Biologia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3505593' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Espanhol' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526439' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Química II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2280093' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'História II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3936971' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Fundamentos de sistemas operacionais e Sistemas operacionais de redes' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Programação para Internet' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240240' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Projeto de Desenvolvimento de Software' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Filosofia, Ciência e Tecnologia' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Qualidade de Vida e Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1258229' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Biologia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3505593' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Espanhol' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1261863' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Química II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2279717' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'História II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3936971' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Fundamentos de sistemas operacionais e Sistemas operacionais de redes' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Programação para Internet' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1066509' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Projeto de Desenvolvimento de Software' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Filosofia, Ciência e Tecnologia' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Visitante' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Informática' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Qualidade de Vida e Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Visitante(EF)' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Educação Física I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1414566' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1258229' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Biologia - Do Indivíduo ao Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2211090' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3297531' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Arte II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Sociologia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Introdução à Apicultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114665' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Estatística Básica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2147637' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Técnicas de Laboratório' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Visitante(EF)' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Educação Física I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526119' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1258229' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Biologia - Do Indivíduo ao Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2247265' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3055014' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Arte II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Sociologia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Introdução à Apicultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114665' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Estatística Básica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2147637' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '1' AND t.turno = 'T' 
AND disc.nome = 'Técnicas de Laboratório' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1935827' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Geografia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526439' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Química: Geral e Inorgânica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Educação Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Inglês I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723840' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3230873' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3010474' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3058156' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Biologia - Hereditariedade, Evolução e suas Tecnologias' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Filosofia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Polinização' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Manejo em Apicultura Avançado' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1935827' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Geografia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526439' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Química: Geral e Inorgânica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Educação Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Inglês I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526119' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3058156' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Biologia - Hereditariedade, Evolução e suas Tecnologias' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Filosofia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Polinização' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Manejo em Apicultura Avançado' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'INGLÊS II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2280093' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'HISTÓRIA E CULTURA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526119' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'MATEMÁTICA III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3525712' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'FÍSICA: MECÂNICA ...' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1261863' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Quimica: físico-química' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1331568' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Língua portuguesa e Literaura III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Sociologia III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Gestão e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Tecnologia de mel, pólen e apitoxina' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1941345' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Análise dos Produtos Apícolas' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3505593' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Espanhol' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2280093' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'História II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3525712' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1941345' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Análise dos Produtos Apícolas' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1308371' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Análise Sensorial' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Gestão Organizacional e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Sociologia do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1128344' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3505593' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Espanhol' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2279717' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'História II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1087983' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1941345' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Análise dos Produtos Apícolas' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1308371' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Análise Sensorial' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Gestão Organizacional e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Apicultura' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Sociologia do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1124075' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Química: Geral e Inorgânica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1884695' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1331568' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526119' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Matemática I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Substituto(EF)' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Educação Física I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1258229' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Biologia - Do Indivíduo ao Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Inglês I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3055014' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Arte II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Sociologia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Técnicas de Laboratório de Alimentos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Visitante' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '1' AND t.turno = 'M' 
AND disc.nome = 'Qualidade de Vida e Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114665' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Educação Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1884695' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526439' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Química: Orgânica e Meio Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3058156' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Biologia - Vida e Diversidade' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Filosofia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2986899' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Análise Sensorial' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1944318' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Microbiologia de Alimentos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2256087' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Segurança do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'M' 
AND disc.nome = 'Gestão e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3230873' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3010474' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Matemática II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240821' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Educação Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723840' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1255011' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Química: Orgânica e Meio Ambiente' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3058156' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Biologia - Vida e Diversidade' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Filosofia II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2986899' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Análise Sensorial' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1944318' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Microbiologia de Alimentos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2256087' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Segurança do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Gestão e Empreendedorismo' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1469099' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Inglês III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1647813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Química: Físico-química' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2211090' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723840' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1047108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'termodinâmica.' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2279717' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'História e Cultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Sociologia III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2256087' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Tópicos Específicos na Indústria de Alimentos II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2944755' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'M' 
AND disc.nome = 'Tecnologia de Frutas e Hortaliças' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Inglês III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1647813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Química: Físico-química' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1935827' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Geografia I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723840' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Língua Portuguesa e Literatura III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3525712' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'termodinâmica.' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2280093' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'História e Cultura' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Sociologia III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2256087' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'ópicos Específicos na Indústria de Alimentos II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2944755' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '3' AND t.turno = 'T' 
AND disc.nome = 'Tecnologia de Frutas e Hortaliças' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Língua Portuguesa e Literatura IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1459108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Inglês II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3505593' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Espanhol' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2279717' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'História II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1047108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Física II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Tecnologia de Cereais' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Máquinas, Equipamentos, Processos e Operações Unitárias' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Tecnologia de Leite e Derivados' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1331568' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Produção de Texto Técnico-Científico II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2256087' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Segurança do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1935827' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Gestão Ambiental' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Alimentos' AND p.nome = '4' AND t.turno = 'M' 
AND disc.nome = 'Seminário de Sociologia do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1577244' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'QUÍMICA GERAL II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1577244' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'QUÍMICA EXPERIMENTAL II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1414566' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'CÁLCULO DIFERENCIAL E INTEGRAL I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'LEITURA E ESCRITA DE TEXTOS ACADÊMICOS E DIVULGAÇÃO CIENTÍFICA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1407813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'FUNDAMENTOS DA EDUCAÇÃO II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1577244' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'QUÍMICA INORGÂNICA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3058156' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'BIOLOGIA PARA O ENSINO DE CIÊNCIAS' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1937542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL I' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1937542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'FUNDAMENTOS DA PESQUISA EM EDUCAÇÃO' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3300878' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'DIDÁTICA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1407813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'SEMINÁRIO DE ORIENTAÇÃO AO DESENVOLVIMENTO DE PRÁTICAS EDUCATIVAS E FORMAÇÃO DOCENTE IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1261863' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'QUÍMICA ORGÂNICA FUNDAMENTAL' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1047108' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'FÍSICA II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1937542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'FÍSICO-QUÍMICA TEÓRICA E EXPERIMENTAL III' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1647813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'METODOLOGIA DO ENSINO DE QUÍMICA II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3300878' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'EDUCAÇÃO INCLUSIVA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3300878' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) II' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1937542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'BIOQUÍMICA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1446104' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'QUÍMICA DOS ELEMENTOS' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1255011' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'QUÍMICA ANALÍTICA QUANTITATIVA' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1577244' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'QUÍMICA INORGÂNICA EXPERIMENTAL' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1407813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'FORMA DE PROFESSORES E TRABALHO DOCENTE' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1407813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Licenciatura em Química' AND p.nome = '8' AND t.turno = 'N' 
AND disc.nome = 'SEMINÁRIO DE ORIENTAÇÃO AO ESTÁGIO SUPERVISIONADO (ESTÁGIO DOCENTE) IV' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1087983' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Física Aplicada à Agroindústria' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3342379' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Introdução à Extensão' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2986899' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Microbiologia de Alimentos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Apicultura - Extensionista' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Produção Vegetal - Extensionista' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1261863' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Química Orgânica Aplicada à Agroindústria' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2025925' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Apicultura - Extensionista' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Produção vegetal - Extensionista' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1255011' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Química Analítica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Sociologia do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Métodos de Conservação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2081549' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Fisiologia e Tecnologia Pós-Colheita' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2986899' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Microbiologia de Alimentos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Operações Unitárias' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1308371' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '4' AND t.turno = 'N' 
AND disc.nome = 'Fisiologia Pós Colheita de frutas e hortaliças' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Segurança do Trabalho' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Gestão e Controle de Qualidade' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Instalações e Equipamentos Agroindustriais' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2944755' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Tecnologia de Frutas e Hortaliças' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1723542' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Tecnologia de Leite e Derivados' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Thamirys' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Optativa' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1414566' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Agroindústria' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Matemática Básica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3328836' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Leitura e Produção de Textos Acadêmicos e de Divulgação Científica' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Filosofia, Ciência e Tecnologia' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1672540' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Filosofia, Ciência e Tecnologia' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Epistemologia da Ciência (PPC 2012)' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1817950' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Metodologia do Trabalho Científico' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Introdução à Extensão' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1817950' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Sistemas Operacionais' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3240240' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Web Design' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1936946' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Programação Orientada a Objetos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526476' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Programação Orientada a Objetos (PPC 2012)' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1066509' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Programação Orientada a Objetos (PPC 2012)' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1000209' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '2' AND t.turno = 'T' 
AND disc.nome = 'Programação Orientada a Objetos (PPC 2012)' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1273753' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Desenvolvimento de Sistemas Web' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1273753' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Seminário de Introdução ao Desenvolvimento de Sistemas Web' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1000209' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Estrutura de Dados Lineares' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526476' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Análise e Projeto Orientado a Objetos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3224052' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Banco de dados' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '4' AND t.turno = 'T' 
AND disc.nome = 'Informática' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1817950' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Sistemas Operacionais' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1000209' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Estrutura de Dados Não Lineares' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Desenvolvimento de Sistemas Corporativos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1108661' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Gerencia de Projetos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1066509' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Teste de Software' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2127817' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'P. I. Sistemas Corporativos' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3526476' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Paradigmas de Linguagens de Programação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3224052' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '6' AND t.turno = 'T' 
AND disc.nome = 'Paradigmas de Linguagens de Programação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1066509' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Análise e Desenvolvimento de Sistemas' AND p.nome = '7' AND t.turno = 'T' 
AND disc.nome = 'Seminário de Orientação para TCC / Estágio Supervisionado' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '3233380' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Especialização' AND p.nome = '02' AND t.turno = 'N' 
AND disc.nome = 'Metodologia da Pesquisa em Educação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = 'Prof.Substituto' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Especialização' AND p.nome = '02' AND t.turno = 'N' 
AND disc.nome = 'Metodologia da Pesquisa em Educação' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1407813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Especialização' AND p.nome = '02' AND t.turno = 'N' 
AND disc.nome = 'Tecnologias da Informação e Comunicação no Ensino' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '2114813' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Especialização' AND p.nome = '02' AND t.turno = 'N' 
AND disc.nome = 'Tecnologias da Informação e Comunicação no Ensino' AND t.ano_letivo_id = @ano_id;
INSERT IGNORE INTO cargas (turma_id, disciplina_id, dia_id, created_at, updated_at) 
SELECT t.id, disc.id, dia.id, NOW(), NOW() 
FROM turmas t 
JOIN periodos p ON t.periodo_id = p.id 
JOIN cursos curs ON p.curso_id = curs.id 
JOIN disciplinas disc ON disc.periodo_id = p.id 
JOIN professors prof ON prof.matricula = '1310276' 
JOIN dias dia ON dia.professor_id = prof.id AND dia.ano_letivo_id = @ano_id 
WHERE curs.nome = 'Especialização' AND p.nome = '02' AND t.turno = 'N' 
AND disc.nome = 'Ciência, Tecnologia e Sociedade' AND t.ano_letivo_id = @ano_id;

SET FOREIGN_KEY_CHECKS = 1;