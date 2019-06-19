# SCRIPT PARA 2019.2

# CURSOS

INSERT INTO cursos VALUES
(1, 'Integrado Regular em Informática', 'INT.INF', current_timestamp(), current_timestamp()),
(2, 'Integrado Regular em Manutenção', 'INT.MS', current_timestamp(), current_timestamp()),
(3, 'Integrado Regular em Alimentos', 'INT.ALIM', current_timestamp(), current_timestamp()),
(4, 'Licenciatura em Química 2012', 'LIC.QUI', current_timestamp(), current_timestamp()),
(5, 'Tecnologia em Sistemas para Internet', 'TEC.INF', current_timestamp(), current_timestamp()),
(6, 'Tecnologia em Alimentos', 'TEC.ALIM', current_timestamp(), current_timestamp()),
(7, 'Licenciatura em Química 2018', 'LIC.QUI', current_timestamp(), current_timestamp());

###################
# SEMESTRES PARES #
###################

# INTEGRADO EM INFORMÁTICA

INSERT INTO periodos VALUES (2, 2, '1.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 2, current_timestamp(), current_timestamp()),
('Inglês', 3, 2, current_timestamp(), current_timestamp()),
('Arte', 2, 2, current_timestamp(), current_timestamp()),
('Educação Física', 2, 2, current_timestamp(), current_timestamp()),
('Geografia', 4, 2, current_timestamp(), current_timestamp()),
('Matemática', 4, 2, current_timestamp(), current_timestamp()),
('Física', 4, 2, current_timestamp(), current_timestamp()),
('Sociologia', 2, 2, current_timestamp(), current_timestamp()),
('Fundamentos de Lógica e Algoritmos', 3, 2, current_timestamp(), current_timestamp()),
('Eletricidade Instrumental', 3, 2, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (4, 4, '2.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 4, current_timestamp(), current_timestamp()),
('Inglês', 3, 4, current_timestamp(), current_timestamp()),
('Arte', 2, 4, current_timestamp(), current_timestamp()),
('Educação Física', 2, 4, current_timestamp(), current_timestamp()),
('Geografia', 2, 4, current_timestamp(), current_timestamp()),
('Matemática', 3, 4, current_timestamp(), current_timestamp()),
('Física', 4, 4, current_timestamp(), current_timestamp()),
('Filosofia', 2, 4, current_timestamp(), current_timestamp()),
('Programação Estruturada e Orientada a Objetos', 4, 4, current_timestamp(), current_timestamp()),
('Eletrônica Analógica e Digital', 4, 4, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (6, 6, '3.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 6, current_timestamp(), current_timestamp()),
('História', 2, 6, current_timestamp(), current_timestamp()),
('Matemática', 3, 6, current_timestamp(), current_timestamp()),
('Química', 4, 6, current_timestamp(), current_timestamp()),
('Biologia', 3, 6, current_timestamp(), current_timestamp()),
('Sociologia', 2, 6, current_timestamp(), current_timestamp()),
('Programação com Acesso a Banco de Dados', 4, 6, current_timestamp(), current_timestamp()),
('Organização e Manutenção de Computadores', 4, 6, current_timestamp(), current_timestamp()),
('Autoria Web', 2, 6, current_timestamp(), current_timestamp()),
('Arq. de Redes de Comp. e Tec. de Imp. De Redes', 3, 6, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (8, 8, '4.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 8, current_timestamp(), current_timestamp()),
('História', 4, 8, current_timestamp(), current_timestamp()),
('Química', 4, 8, current_timestamp(), current_timestamp()),
('Biologia', 4, 8, current_timestamp(), current_timestamp()),
('Espanhol', 3, 8, current_timestamp(), current_timestamp()),
('Qualidade de Vida', 2, 8, current_timestamp(), current_timestamp()),
('Projeto de Desenvolvimento de Software', 2, 8, current_timestamp(), current_timestamp()),
('Programação para Internet', 3, 8, current_timestamp(), current_timestamp()),
('Fundamentos de Sistemas Op. e Sistemas Op. Redes', 4, 8, current_timestamp(), current_timestamp()),
('Filosofia, ciência e tecnologia', 2, 8, current_timestamp(), current_timestamp());

# INTEGRADO EM MANUTENÇÃO

INSERT INTO periodos VALUES (10, 2, '1.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 10, current_timestamp(), current_timestamp()),
('Arte', 2, 10, current_timestamp(), current_timestamp()),
('Educação Física', 2, 10, current_timestamp(), current_timestamp()),
('Geografia', 4, 10, current_timestamp(), current_timestamp()),
('Matemática', 4, 10, current_timestamp(), current_timestamp()),
('Física', 4, 10, current_timestamp(), current_timestamp()),
('Química', 4, 10, current_timestamp(), current_timestamp()),
('Sociologia', 2, 10, current_timestamp(), current_timestamp()),
('Práticas de Eletricidade', 5, 10, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (12, 4, '2.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 12, current_timestamp(), current_timestamp()),
('Arte', 2, 12, current_timestamp(), current_timestamp()),
('Educação Física', 2, 12, current_timestamp(), current_timestamp()),
('Geografia', 2, 12, current_timestamp(), current_timestamp()),
('Matemática', 3, 12, current_timestamp(), current_timestamp()),
('Física', 4, 12, current_timestamp(), current_timestamp()),
('Química', 4, 12, current_timestamp(), current_timestamp()),
('Filosofia', 2, 12, current_timestamp(), current_timestamp()),
('Eletrônica Digital', 5, 12, current_timestamp(), current_timestamp()),
('Operação e Organização de Computadores', 3, 12, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (14, 6, '3.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 14, current_timestamp(), current_timestamp()),
('Inglês', 3, 14, current_timestamp(), current_timestamp()),
('História', 2, 14, current_timestamp(), current_timestamp()),
('Matemática', 3, 14, current_timestamp(), current_timestamp()),
('Biologia', 3, 14, current_timestamp(), current_timestamp()),
('Sociologia', 2, 14, current_timestamp(), current_timestamp()),
('Gestão de Serviços em Informática', 3, 14, current_timestamp(), current_timestamp()),
('Manutenção Básica de Computadores', 4, 14, current_timestamp(), current_timestamp()),
('Infraestrutura de Redes de Computadores', 3, 14, current_timestamp(), current_timestamp()),
('Manutenção de Fontes de Alimentação', 3, 14, current_timestamp(), current_timestamp()),
('Eletrônica de Potências', 2, 14, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (16, 8, '4.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 16, current_timestamp(), current_timestamp()),
('Inglês', 3, 16, current_timestamp(), current_timestamp()),
('História', 4, 16, current_timestamp(), current_timestamp()),
('Biologia', 4, 16, current_timestamp(), current_timestamp()),
('Espanhol', 3, 16, current_timestamp(), current_timestamp()),
('Sistemas Operacionais de Redes', 3, 16, current_timestamp(), current_timestamp()),
('Qualidade de Vida', 2, 16, current_timestamp(), current_timestamp()),
('Filosofia, Ciência e Tecnologia', 2, 16, current_timestamp(), current_timestamp()),
('Manutenção de Periféricos', 3, 16, current_timestamp(), current_timestamp()),
('Manutenção Avançada de Computadores', 4, 16, current_timestamp(), current_timestamp());

# INTEGRADO EM ALIMENTOS

INSERT INTO periodos VALUES (18, 2, '1.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 18, current_timestamp(), current_timestamp()),
('Arte', 2, 18, current_timestamp(), current_timestamp()),
('Educação Física', 2, 18, current_timestamp(), current_timestamp()),
('Geografia', 4, 18, current_timestamp(), current_timestamp()),
('Matemática', 4, 18, current_timestamp(), current_timestamp()),
('Química', 4, 18, current_timestamp(), current_timestamp()),
('Biologia', 3, 18, current_timestamp(), current_timestamp()),
('Sociologia', 2, 18, current_timestamp(), current_timestamp()),
('Biologia Aplicada a Alimentos', 2, 18, current_timestamp(), current_timestamp()),
('Quimica e Bioquímica dos Alimentos Comp. Principais', 2, 18, current_timestamp(), current_timestamp()),
('Técnicas de Laboratórios de Alimentos', 2, 18, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (20, 4, '2.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 20, current_timestamp(), current_timestamp()),
('Arte', 2, 20, current_timestamp(), current_timestamp()),
('Educação Física', 2, 20, current_timestamp(), current_timestamp()),
('Geografia', 2, 20, current_timestamp(), current_timestamp()),
('Matemática', 3, 20, current_timestamp(), current_timestamp()),
('Química', 4, 20, current_timestamp(), current_timestamp()),
('Biologia', 4, 20, current_timestamp(), current_timestamp()),
('Filosofia', 2, 20, current_timestamp(), current_timestamp()),
('Química e Bioquímica dos Alimentos Experimental', 2, 20, current_timestamp(), current_timestamp()),
('Microbiologia dos Alimentos', 4, 20, current_timestamp(), current_timestamp()),
('Termologia Aplicada a Tecnologia de Alimentos', 2, 20, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (22, 6, '3.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 22, current_timestamp(), current_timestamp()),
('Inglês', 3, 22, current_timestamp(), current_timestamp()),
('História', 2, 22, current_timestamp(), current_timestamp()),
('Matemática', 3, 22, current_timestamp(), current_timestamp()),
('Física', 4, 22, current_timestamp(), current_timestamp()),
('Sociologia', 2, 22, current_timestamp(), current_timestamp()),
('Higiene e Segurança Alimentar', 2, 22, current_timestamp(), current_timestamp()),
('Embalagem, Rotulagem e Logística', 2, 22, current_timestamp(), current_timestamp()),
('Produção de Texto Técnico Científico I', 2, 22, current_timestamp(), current_timestamp()),
('Tecnologia de Frutas e Hortaliças', 2, 22, current_timestamp(), current_timestamp()),
('Tecnologia de Carnes e Pescados', 3, 22, current_timestamp(), current_timestamp()),
('Análise Sensorial', 2, 22, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (24, 8, '4.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 24, current_timestamp(), current_timestamp()),
('Inglês', 3, 24, current_timestamp(), current_timestamp()),
('História', 4, 24, current_timestamp(), current_timestamp()),
('Física', 4, 24, current_timestamp(), current_timestamp()),
('Espanhol', 3, 24, current_timestamp(), current_timestamp()),
('Tecnologia de Leite e Derivados', 3, 24, current_timestamp(), current_timestamp()),
('Gestão Ambiental', 2, 24, current_timestamp(), current_timestamp()),
('Máquinas, Equipamentos, Processos e Operações', 3, 24, current_timestamp(), current_timestamp()),
('Tecnologia de Cereais', 2, 24, current_timestamp(), current_timestamp()),
('Segurança do Trabalho', 2, 24, current_timestamp(), current_timestamp()),
('Produção de Texto Técnico Científico II', 2, 24, current_timestamp(), current_timestamp());

# LICENCIATURA EM QUÍMICA 2012

INSERT INTO periodos VALUES (28, 4, '4', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Fundamentos da Pesquisa em Educação Química', 2, 28, current_timestamp(), current_timestamp()),
('Mecanismo de Reações Orgânicas', 6, 28, current_timestamp(), current_timestamp()),
('Química Inorgânica de Coordenação', 4, 28, current_timestamp(), current_timestamp()),
('Didática', 6, 28, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (30, 6, '6', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Físico-Química II', 6, 30, current_timestamp(), current_timestamp()),
('Química Analítica Qualitativa', 6, 30, current_timestamp(), current_timestamp()),
('Estatística Aplicada à Quimica', 2, 30, current_timestamp(), current_timestamp()),
('Metodologia do Ensino de Química II', 4, 30, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (32, 8, '8', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Bioquímica', 3, 32, current_timestamp(), current_timestamp()),
('Química Ambiental', 3, 32, current_timestamp(), current_timestamp()),
('LIBRAS', 2, 32, current_timestamp(), current_timestamp()),
('Eletiva II', 4, 32, current_timestamp(), current_timestamp()),
('Eletiva III', 6, 32, current_timestamp(), current_timestamp());

# TECNOLOGIA EM SI

INSERT INTO periodos VALUES (34, 2, '2', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Cálculo Diferencial e Integral', 4, 34, current_timestamp(), current_timestamp()),
('Filosofia', 2, 34, current_timestamp(), current_timestamp()),
('Programação Orientada a Objetos', 4, 34, current_timestamp(), current_timestamp()),
('Autoria Web', 4, 34, current_timestamp(), current_timestamp()),
('Arquitetura e Org. de Computadores', 4, 34, current_timestamp(), current_timestamp()),
('Estruturas de Dados', 4, 34, current_timestamp(), current_timestamp()),
('Aplicações de Redes de Computadores', 4, 34, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (36, 4, '4', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Banco de Dados II', 4, 36, current_timestamp(), current_timestamp()),
('Programação Web II', 4, 36, current_timestamp(), current_timestamp()),
('Processo de Análise e Des. de Sistemas', 4, 36, current_timestamp(), current_timestamp()),
('Sistemas Distribuídos', 4, 36, current_timestamp(), current_timestamp()),
('Engenharia de Software', 2, 36, current_timestamp(), current_timestamp()),
('Optativa I', 4, 36, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (38, 6, '6', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Comércio Eletrônico', 2, 38, current_timestamp(), current_timestamp()),
('Tecnologias de Banco de Dados', 4, 38, current_timestamp(), current_timestamp()),
('Segurança e Preservação de Dados', 4, 38, current_timestamp(), current_timestamp()),
('Programação de Tec. Móveis e Sem Fio', 2, 38, current_timestamp(), current_timestamp()),
('Optativa III', 4, 38, current_timestamp(), current_timestamp()),
('Optativa IV', 2, 38, current_timestamp(), current_timestamp());


# TECNOLOGIA EM ALIMENTOS

INSERT INTO periodos VALUES (40, 2, '2', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Metodologia Científica e Tecnológica', 2, 40, current_timestamp(), current_timestamp()),
('Cálculo - Cálculo Diferencial e Integral', 4, 40, current_timestamp(), current_timestamp()),
('Física', 4, 40, current_timestamp(), current_timestamp()),
('Química Orgânica', 6, 40, current_timestamp(), current_timestamp()),
('Desenho técnico Auxiliado por Computador', 3, 40, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 40, current_timestamp(), current_timestamp()),
('Gestão Organizacional', 3, 40, current_timestamp(), current_timestamp()),
('Microbiologia de Alimentos', 4, 40, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (42, 4, '4', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Matérias-primas Agropecuárias', 2, 42, current_timestamp(), current_timestamp()),
('Controle Estatístico da Qualidade', 4, 42, current_timestamp(), current_timestamp()),
('Gestão da Qualidade e Legislação de Alimentos', 4, 42, current_timestamp(), current_timestamp()),
('Bioquímica dos Alimentos', 4, 42, current_timestamp(), current_timestamp()),
('Análise de alimentos', 6, 42, current_timestamp(), current_timestamp()),
('Termodinâmica Aplicada e Fenômenos de transportes', 4, 42, current_timestamp(), current_timestamp()),
('Eletiva I', 2, 42, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (44, 6, '6', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Gestão Ambiental', 4, 44, current_timestamp(), current_timestamp()),
('Análise Sensorial', 2, 44, current_timestamp(), current_timestamp()),
('Tecnologia de Frutas e hortaliças', 6, 44, current_timestamp(), current_timestamp()),
('Higiene da Industria de Alimentos', 2, 44, current_timestamp(), current_timestamp()),
('Máquinas equipamentos e Instalações Industriais', 4, 44, current_timestamp(), current_timestamp()),
('Embalagens', 2, 44, current_timestamp(), current_timestamp()),
('Eletiva III', 4, 44, current_timestamp(), current_timestamp());

# LICENCIATURA EM QUÍMICA 2018

INSERT INTO periodos VALUES (46, 2, '2', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Leitura e Escrita de Textos Acadêmicos de Divulgação Científica', 2, 46, current_timestamp(), current_timestamp()),
('Fundamentos da Educação II', 4, 46, current_timestamp(), current_timestamp()),
('Química Geral II', 6, 46, current_timestamp(), current_timestamp()),
('Química Experimental II', 2, 46, current_timestamp(), current_timestamp()),
('Cálculo Diferencial e Integral I', 4, 46, current_timestamp(), current_timestamp());

# TURMAS PARA 2019.2

INSERT INTO ano_letivos (id, ano, semestre, created_at, updated_at) VALUES (1, 2019, 2, current_timestamp(), current_timestamp());
INSERT INTO turmas (turno, periodo_id, ano_letivo_id, created_at, updated_at) VALUES
# INT.INF
('T', 2, 1, current_timestamp(), current_timestamp()),
('M', 4, 1, current_timestamp(), current_timestamp()),
('T', 6, 1, current_timestamp(), current_timestamp()),
('M', 8, 1, current_timestamp(), current_timestamp()),
# INT.MSI
('M', 10, 1, current_timestamp(), current_timestamp()),
('T', 12, 1, current_timestamp(), current_timestamp()),
('M', 14, 1, current_timestamp(), current_timestamp()),
('T', 16, 1, current_timestamp(), current_timestamp()),
# INT.ALIM
('M', 18, 1, current_timestamp(), current_timestamp()),
('T', 18, 1, current_timestamp(), current_timestamp()),
('M', 20, 1, current_timestamp(), current_timestamp()),
('T', 20, 1, current_timestamp(), current_timestamp()),
('M', 22, 1, current_timestamp(), current_timestamp()),
('T', 22, 1, current_timestamp(), current_timestamp()),
('M', 24, 1, current_timestamp(), current_timestamp()),
('T', 24, 1, current_timestamp(), current_timestamp()),
# LIC.QUI 2018
('N', 46, 1, current_timestamp(), current_timestamp()),
# LIC.QUI 2012
('T', 28, 1, current_timestamp(), current_timestamp()),
('N', 30, 1, current_timestamp(), current_timestamp()),
('T', 32, 1, current_timestamp(), current_timestamp()),
# TEC.INF
('T', 34, 1, current_timestamp(), current_timestamp()),
('M', 36, 1, current_timestamp(), current_timestamp()),
('T', 38, 1, current_timestamp(), current_timestamp()),
# TEC.ALIM
('M', 40, 1, current_timestamp(), current_timestamp()),
('T', 42, 1, current_timestamp(), current_timestamp()),
('M', 44, 1, current_timestamp(), current_timestamp());

SELECT * FROM cursos;
SELECT * FROM periodos;
SELECT * FROM disciplinas;
SELECT * FROM ano_letivos;
SELECT * FROM turmas;