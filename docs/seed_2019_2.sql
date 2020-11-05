# SCRIPT PARA 2019.2

# CURSOS

INSERT INTO cursos VALUES
(1, 'Integrado Regular em Informática', 'INT.INF', current_timestamp(), current_timestamp()),
(2, 'Integrado Regular em Manutenção', 'INT.MS', current_timestamp(), current_timestamp()),
(3, 'Integrado Regular em Alimentos', 'INT.ALIM', current_timestamp(), current_timestamp()),
(4, 'Licenciatura em Química 2012', 'LIC.QUI', current_timestamp(), current_timestamp()),
(5, 'Tecnologia em Sistemas para Internet 2012', 'TEC.INF', current_timestamp(), current_timestamp()),
(6, 'Tecnologia em Alimentos 2012', 'TEC.ALIM', current_timestamp(), current_timestamp()),
(7, 'Licenciatura em Química 2018', 'LIC.QUI', current_timestamp(), current_timestamp()),
(8, 'Tecnologia em Sistemas para Internet 2019', 'TEC.INF', current_timestamp(), current_timestamp()),
(9, 'Tecnologia em Alimentos 2019', 'TEC.ALIM', current_timestamp(), current_timestamp());

###################
# SEMESTRES PARES #
###################

# INTEGRADO EM INFORMÁTICA

INSERT INTO periodos VALUES (1, 1, '1.1', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 1, current_timestamp(), current_timestamp()),
('Inglês', 3, 1, current_timestamp(), current_timestamp()),
('Educação Física', 2, 1, current_timestamp(), current_timestamp()),
('Geografia', 4, 1, current_timestamp(), current_timestamp()),
('Filosofia', 2, 1, current_timestamp(), current_timestamp()),
('Matemática', 4, 1, current_timestamp(), current_timestamp()),
('Física', 4, 1, current_timestamp(), current_timestamp()),
('Informática', 3, 1, current_timestamp(), current_timestamp()),
('Fundamentos de Lógica e Algoritmos', 2, 1, current_timestamp(), current_timestamp()),
('Eletricidade Instrumental', 3, 1, current_timestamp(), current_timestamp());
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
INSERT INTO periodos VALUES (3, 3, '2.1', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 3, current_timestamp(), current_timestamp()),
('Inglês', 3, 3, current_timestamp(), current_timestamp()),
('Arte', 2, 3, current_timestamp(), current_timestamp()),
('Educação Física', 2, 3, current_timestamp(), current_timestamp()),
('Geografia', 2, 3, current_timestamp(), current_timestamp()),
('Sociologia', 2, 3, current_timestamp(), current_timestamp()),
('Matemática', 3, 3, current_timestamp(), current_timestamp()),
('Física', 4, 3, current_timestamp(), current_timestamp()),
('Eletrônica Analógica e Digital', 4, 3, current_timestamp(), current_timestamp()),
('Programação Estruturada e Orientada a Objetos', 4, 3, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa', 1, 3, current_timestamp(), current_timestamp());
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
('Eletrônica Analógica e Digital', 4, 4, current_timestamp(), current_timestamp()),
('Programação Estruturada e Orientada a Objetos', 4, 4, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa', 1, 4, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (5, 5, '3.1', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 5, current_timestamp(), current_timestamp()),
('História', 2, 5, current_timestamp(), current_timestamp()),
('Filosofia', 2, 5, current_timestamp(), current_timestamp()),
('Matemática', 3, 5, current_timestamp(), current_timestamp()),
('Química', 4, 5, current_timestamp(), current_timestamp()),
('Biologia', 3, 5, current_timestamp(), current_timestamp()),
('Organização e Manutenção de Computadores', 4, 5, current_timestamp(), current_timestamp()),
('Programação com Acesso a Banco de Dados', 3, 5, current_timestamp(), current_timestamp()),
('Autoria Web', 2, 5, current_timestamp(), current_timestamp()),
('Arq. de Redes de Comp. e Tec. de Imp. De Redes', 4, 5, current_timestamp(), current_timestamp()),
('Projeto Integrador', 4, 5, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 5, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (6, 6, '3.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 6, current_timestamp(), current_timestamp()),
('História', 2, 6, current_timestamp(), current_timestamp()),
('Sociologia', 2, 6, current_timestamp(), current_timestamp()),
('Matemática', 3, 6, current_timestamp(), current_timestamp()),
('Química', 4, 6, current_timestamp(), current_timestamp()),
('Biologia', 3, 6, current_timestamp(), current_timestamp()),
('Programação com Acesso a Banco de Dados', 4, 6, current_timestamp(), current_timestamp()),
('Organização e Manutenção de Computadores', 4, 6, current_timestamp(), current_timestamp()),
('Autoria Web', 2, 6, current_timestamp(), current_timestamp()),
('Arq. de Redes de Comp. e Tec. de Imp. De Redes', 3, 6, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 6, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (7, 7, '4.1', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 7, current_timestamp(), current_timestamp()),
('Espanhol', 3, 7, current_timestamp(), current_timestamp()),
('História', 4, 7, current_timestamp(), current_timestamp()),
('Química', 4, 7, current_timestamp(), current_timestamp()),
('Biologia', 4, 7, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 7, current_timestamp(), current_timestamp()),
('Gestão Organizacional', 2, 7, current_timestamp(), current_timestamp()),
('Projeto de Desenvolvimento de Software', 2, 7, current_timestamp(), current_timestamp()),
('Programação para Internet', 3, 7, current_timestamp(), current_timestamp()),
('Fundamentos de Sistemas Op. e Sistemas Op. Redes', 4, 7, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (8, 8, '4.2', 1, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 8, current_timestamp(), current_timestamp()),
('Espanhol', 3, 8, current_timestamp(), current_timestamp()),
('História', 4, 8, current_timestamp(), current_timestamp()),
('Química', 4, 8, current_timestamp(), current_timestamp()),
('Biologia', 4, 8, current_timestamp(), current_timestamp()),
('Filosofia, Ciência e Tecnologia', 2, 8, current_timestamp(), current_timestamp()),
('Qualidade de Vida e Trabalho', 2, 8, current_timestamp(), current_timestamp()),
('Projeto de Desenvolvimento de Software', 2, 8, current_timestamp(), current_timestamp()),
('Programação para Internet', 3, 8, current_timestamp(), current_timestamp()),
('Fundamentos de Sistemas Op. e Sistemas Op. Redes', 4, 8, current_timestamp(), current_timestamp());

# INTEGRADO EM MANUTENÇÃO

INSERT INTO periodos VALUES (9, 1, '1.1', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 9, current_timestamp(), current_timestamp()),
('Educação Física', 2, 9, current_timestamp(), current_timestamp()),
('Geografia', 4, 9, current_timestamp(), current_timestamp()),
('Filosofia', 4, 9, current_timestamp(), current_timestamp()),
('Matemática', 4, 9, current_timestamp(), current_timestamp()),
('Física', 4, 9, current_timestamp(), current_timestamp()),
('Química', 4, 9, current_timestamp(), current_timestamp()),
('Informática', 3, 9, current_timestamp(), current_timestamp()),
('Instalação e Montagem de Computadores', 4, 9, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (10, 2, '1.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 10, current_timestamp(), current_timestamp()),
('Arte', 2, 10, current_timestamp(), current_timestamp()),
('Educação Física', 2, 10, current_timestamp(), current_timestamp()),
('Geografia', 4, 10, current_timestamp(), current_timestamp()),
('Sociologia', 2, 10, current_timestamp(), current_timestamp()),
('Matemática', 4, 10, current_timestamp(), current_timestamp()),
('Física', 4, 10, current_timestamp(), current_timestamp()),
('Química', 4, 10, current_timestamp(), current_timestamp()),
('Práticas de Eletricidade', 5, 10, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (11, 3, '2.1', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 11, current_timestamp(), current_timestamp()),
('Arte', 2, 11, current_timestamp(), current_timestamp()),
('Educação Física', 2, 11, current_timestamp(), current_timestamp()),
('Geografia', 2, 11, current_timestamp(), current_timestamp()),
('Sociologia', 2, 11, current_timestamp(), current_timestamp()),
('Matemática', 3, 11, current_timestamp(), current_timestamp()),
('Física', 4, 11, current_timestamp(), current_timestamp()),
('Química', 4, 11, current_timestamp(), current_timestamp()),
('Operação e Organização de Computadores', 3, 11, current_timestamp(), current_timestamp()),
('Eletrônica Analógica', 5, 11, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa', 1, 11, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (12, 4, '2.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 12, current_timestamp(), current_timestamp()),
('Arte', 2, 12, current_timestamp(), current_timestamp()),
('Educação Física', 2, 12, current_timestamp(), current_timestamp()),
('Geografia', 2, 12, current_timestamp(), current_timestamp()),
('Filosofia', 2, 12, current_timestamp(), current_timestamp()),
('Matemática', 3, 12, current_timestamp(), current_timestamp()),
('Física', 4, 12, current_timestamp(), current_timestamp()),
('Química', 4, 12, current_timestamp(), current_timestamp()),
('Operação e Organização de Computadores', 3, 12, current_timestamp(), current_timestamp()),
('Eletrônica Digital', 5, 12, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa', 1, 12, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (13, 5, '3.1', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 13, current_timestamp(), current_timestamp()),
('Inglês', 3, 13, current_timestamp(), current_timestamp()),
('História', 2, 13, current_timestamp(), current_timestamp()),
('Filosofia', 2, 13, current_timestamp(), current_timestamp()),
('Matemática', 3, 13, current_timestamp(), current_timestamp()),
('Biologia', 3, 13, current_timestamp(), current_timestamp()),
('Eletrônica de Potência', 2, 13, current_timestamp(), current_timestamp()),
('Manutenção Básica de Computadores', 4, 13, current_timestamp(), current_timestamp()),
('Manutenção de Fontes de Alimentação', 3, 13, current_timestamp(), current_timestamp()),
('Infraestrutura de Redes de Computadores', 3, 13, current_timestamp(), current_timestamp()),
('Projeto Integrador', 2, 13, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 13, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (14, 6, '3.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 14, current_timestamp(), current_timestamp()),
('Inglês', 3, 14, current_timestamp(), current_timestamp()),
('História', 2, 14, current_timestamp(), current_timestamp()),
('Sociologia', 2, 14, current_timestamp(), current_timestamp()),
('Matemática', 3, 14, current_timestamp(), current_timestamp()),
('Biologia', 3, 14, current_timestamp(), current_timestamp()),
('Eletrônica de Potência', 2, 14, current_timestamp(), current_timestamp()),
('Manutenção Básica de Computadores', 4, 14, current_timestamp(), current_timestamp()),
('Manutenção de Fontes de Alimentação', 3, 14, current_timestamp(), current_timestamp()),
('Infraestrutura de Redes de Computadores', 3, 14, current_timestamp(), current_timestamp()),
('Gestão de Serviços em Informática', 3, 14, current_timestamp(), current_timestamp()),
('Projeto Integrador', 2, 14, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 14, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (15, 7, '4.1', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 15, current_timestamp(), current_timestamp()),
('Inglês', 3, 15, current_timestamp(), current_timestamp()),
('Espanhol', 3, 15, current_timestamp(), current_timestamp()),
('História', 4, 15, current_timestamp(), current_timestamp()),
('Biologia', 4, 15, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 15, current_timestamp(), current_timestamp()),
('Gestão e Empreendedorismo', 3, 15, current_timestamp(), current_timestamp()),
('Manutenção de Periféricos', 3, 15, current_timestamp(), current_timestamp()),
('Manutenção Avançada de Computadores', 4, 15, current_timestamp(), current_timestamp()),
('Sistemas Operacionais de Redes de Computadores', 3, 15, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (16, 8, '4.2', 2, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 16, current_timestamp(), current_timestamp()),
('Inglês', 3, 16, current_timestamp(), current_timestamp()),
('Espanhol', 3, 16, current_timestamp(), current_timestamp()),
('História', 4, 16, current_timestamp(), current_timestamp()),
('Biologia', 4, 16, current_timestamp(), current_timestamp()),
('Qualidade de Vida', 2, 16, current_timestamp(), current_timestamp()),
('Filosofia, Ciência e Tecnologia', 2, 16, current_timestamp(), current_timestamp()),
('Manutenção de Periféricos', 3, 16, current_timestamp(), current_timestamp()),
('Manutenção Avançada de Computadores de Computadores', 4, 16, current_timestamp(), current_timestamp()),
('Sistemas Operacionais de Redes', 3, 16, current_timestamp(), current_timestamp());

# INTEGRADO EM ALIMENTOS

INSERT INTO periodos VALUES (17, 1, '1.1', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 17, current_timestamp(), current_timestamp()),
('Educação Física', 2, 17, current_timestamp(), current_timestamp()),
('Geografia', 4, 17, current_timestamp(), current_timestamp()),
('Filosofia', 2, 17, current_timestamp(), current_timestamp()),
('Matemática', 4, 17, current_timestamp(), current_timestamp()),
('Química', 4, 17, current_timestamp(), current_timestamp()),
('Biologia', 3, 17, current_timestamp(), current_timestamp()),
('Informática', 3, 17, current_timestamp(), current_timestamp()),
('Introdução a Química de Alimentos', 3, 17, current_timestamp(), current_timestamp()),
('Introdução a Tecnologia de Alimentos', 2, 17, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (18, 2, '1.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 18, current_timestamp(), current_timestamp()),
('Arte', 2, 18, current_timestamp(), current_timestamp()),
('Educação Física', 2, 18, current_timestamp(), current_timestamp()),
('Geografia', 4, 18, current_timestamp(), current_timestamp()),
('Sociologia', 2, 18, current_timestamp(), current_timestamp()),
('Matemática', 4, 18, current_timestamp(), current_timestamp()),
('Química', 4, 18, current_timestamp(), current_timestamp()),
('Biologia', 3, 18, current_timestamp(), current_timestamp()),
('Biologia Aplicada a Alimentos', 2, 18, current_timestamp(), current_timestamp()),
('Quimica e Bioquímica dos Alimentos Comp. Principais', 2, 18, current_timestamp(), current_timestamp()),
('Técnicas de Laboratórios de Alimentos', 2, 18, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (19, 3, '2.1', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 19, current_timestamp(), current_timestamp()),
('Arte', 2, 19, current_timestamp(), current_timestamp()),
('Educação Física', 2, 19, current_timestamp(), current_timestamp()),
('Geografia', 2, 19, current_timestamp(), current_timestamp()),
('Sociologia', 2, 19, current_timestamp(), current_timestamp()),
('Matemática', 3, 19, current_timestamp(), current_timestamp()),
('Química', 4, 19, current_timestamp(), current_timestamp()),
('Biologia', 4, 19, current_timestamp(), current_timestamp()),
('Química e Bioquímica dos Alimentos: componentes secundários e transformações', 4, 19, current_timestamp(), current_timestamp()),
('Microbiologia dos Alimentos', 4, 19, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa', 2, 19, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (20, 4, '2.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 20, current_timestamp(), current_timestamp()),
('Arte', 2, 20, current_timestamp(), current_timestamp()),
('Educação Física', 2, 20, current_timestamp(), current_timestamp()),
('Geografia', 2, 20, current_timestamp(), current_timestamp()),
('Filosofia', 2, 20, current_timestamp(), current_timestamp()),
('Matemática', 3, 20, current_timestamp(), current_timestamp()),
('Química', 4, 20, current_timestamp(), current_timestamp()),
('Biologia', 4, 20, current_timestamp(), current_timestamp()),
('Termologia Aplicada a Tecnologia de Alimentos', 2, 20, current_timestamp(), current_timestamp()),
('Química e Bioquímica dos Alimentos Experimental', 2, 20, current_timestamp(), current_timestamp()),
('Microbiologia dos Alimentos', 4, 20, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (21, 5, '3.1', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 21, current_timestamp(), current_timestamp()),
('Inglês', 3, 21, current_timestamp(), current_timestamp()),
('História', 2, 21, current_timestamp(), current_timestamp()),
('Filosofia', 2, 21, current_timestamp(), current_timestamp()),
('Matemática', 3, 21, current_timestamp(), current_timestamp()),
('Física', 4, 21, current_timestamp(), current_timestamp()),
('Biotecnologia Aplicada aos Alimentos', 2, 21, current_timestamp(), current_timestamp()),
('Controle Estatístico de Qualidade', 3, 21, current_timestamp(), current_timestamp()),
('Tecnologia de Frutas e Hortaliças', 2, 21, current_timestamp(), current_timestamp()),
('Higiene e Segurança Alimentar', 2, 21, current_timestamp(), current_timestamp()),
('Tecnologia de Carnes e Pescados', 2, 21, current_timestamp(), current_timestamp()),
('Embalagem, Rotulagem e Logística', 2, 21, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 21, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (22, 6, '3.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 3, 22, current_timestamp(), current_timestamp()),
('Inglês', 3, 22, current_timestamp(), current_timestamp()),
('História', 2, 22, current_timestamp(), current_timestamp()),
('Sociologia', 2, 22, current_timestamp(), current_timestamp()),
('Matemática', 3, 22, current_timestamp(), current_timestamp()),
('Física', 4, 22, current_timestamp(), current_timestamp()),
('Produção de Texto Técnico Científico I', 2, 22, current_timestamp(), current_timestamp()),
('Tecnologia de Frutas e Hortaliças', 2, 22, current_timestamp(), current_timestamp()),
('Higiene e Segurança Alimentar', 2, 22, current_timestamp(), current_timestamp()),
('Tecnologia de Carnes e Pescados', 3, 22, current_timestamp(), current_timestamp()),
('Embalagem, Rotulagem e Logística', 2, 22, current_timestamp(), current_timestamp()),
('Análise Sensorial', 2, 22, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 1, 22, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (23, 7, '4.1', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 23, current_timestamp(), current_timestamp()),
('Inglês', 3, 23, current_timestamp(), current_timestamp()),
('Espanhol', 3, 23, current_timestamp(), current_timestamp()),
('História', 4, 23, current_timestamp(), current_timestamp()),
('Física', 4, 23, current_timestamp(), current_timestamp()),
('Gestão Organizacional e Empreendedorismo', 3, 23, current_timestamp(), current_timestamp()),
('Tecnologia de Cereais', 2, 23, current_timestamp(), current_timestamp()),
('Tecnologia de Mel', 2, 23, current_timestamp(), current_timestamp()),
('Análise dos Alimentos', 5, 23, current_timestamp(), current_timestamp()),
('Tecnologia de Leite e Derivados', 2, 23, current_timestamp(), current_timestamp()),
('Projeto Integrador', 4, 23, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (24, 8, '4.2', 3, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 2, 24, current_timestamp(), current_timestamp()),
('Inglês', 3, 24, current_timestamp(), current_timestamp()),
('Espanhol', 3, 24, current_timestamp(), current_timestamp()),
('História', 4, 24, current_timestamp(), current_timestamp()),
('Física', 4, 24, current_timestamp(), current_timestamp()),
('Produção de Texto Técnico Científico II', 2, 24, current_timestamp(), current_timestamp()),
('Segurança do Trabalho', 2, 24, current_timestamp(), current_timestamp()),
('Gestão Ambiental', 2, 24, current_timestamp(), current_timestamp()),
('Tecnologia de Cereais', 2, 24, current_timestamp(), current_timestamp()),
('Máquinas, Equipamentos, Processos e Operações', 3, 24, current_timestamp(), current_timestamp()),
('Tecnologia de Leite e Derivados', 3, 24, current_timestamp(), current_timestamp());

# LICENCIATURA EM QUÍMICA 2012

INSERT INTO periodos VALUES (25, 1, '1', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 4, 25, current_timestamp(), current_timestamp()),
('Informática', 2, 25, current_timestamp(), current_timestamp()),
('Matemática Básica', 4, 25, current_timestamp(), current_timestamp()),
('Fundamentos Históricos e Filosóficos da Educação', 4, 25, current_timestamp(), current_timestamp()),
('Química Geral I', 6, 25, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (26, 2, '2', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Leitura e Produção de Textos Acadêmicos', 2, 26, current_timestamp(), current_timestamp()),
('Fundamentos Sociopolíticos e Econômicos da Educação', 4, 26, current_timestamp(), current_timestamp()),
('Epistemologia da Ciência', 2, 26, current_timestamp(), current_timestamp()),
('Química Geral II', 6, 26, current_timestamp(), current_timestamp()),
('Química Experimental', 2, 26, current_timestamp(), current_timestamp()),
('Cálculo Diferencial e Integral I', 4, 26, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (27, 3, '3', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Psicologia da Educação', 4, 27, current_timestamp(), current_timestamp()),
('Metodologia do Trabalho Científico', 2, 27, current_timestamp(), current_timestamp()),
('Química Inorgânica Descritiva', 6, 27, current_timestamp(), current_timestamp()),
('Química Orgânica Fundamental', 4, 27, current_timestamp(), current_timestamp()),
('Cálculo Diferencial e Integral II', 4, 27, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (28, 4, '4', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Didática', 6, 28, current_timestamp(), current_timestamp()),
('Química Inorgânica de Coordenação', 4, 28, current_timestamp(), current_timestamp()),
('Mecanismo de Reações Orgânicas', 6, 28, current_timestamp(), current_timestamp()),
('Fundamentos da Pesquisa em Educação Química', 2, 28, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Projeto Integrador', 2, 28, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (29, 5, '5', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Organização e Gestão da Educação Brasileira', 4, 29, current_timestamp(), current_timestamp()),
('Mídias Educacionais', 4, 29, current_timestamp(), current_timestamp()),
('Metodologia do Ensino de Química I', 4, 29, current_timestamp(), current_timestamp()),
('Física I', 4, 29, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Projeto Integrador', 2, 29, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Estágio Docente', 2, 29, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (30, 6, '6', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Metodologia do Ensino de Química II', 4, 30, current_timestamp(), current_timestamp()),
('Química Analítica Qualitativa', 6, 30, current_timestamp(), current_timestamp()),
('Físico-Química I', 6, 30, current_timestamp(), current_timestamp()),
('Estatística Aplicada à Quimica', 2, 30, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Estágio Docente', 2, 30, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (31, 7, '7', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Educação Inclusiva', 2, 31, current_timestamp(), current_timestamp()),
('Química Analítica Quantitativa', 6, 31, current_timestamp(), current_timestamp()),
('Físico-Química II', 6, 31, current_timestamp(), current_timestamp()),
('Física II', 2, 31, current_timestamp(), current_timestamp()),
('Eletiva I', 2, 31, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Pesquisa', 1, 31, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Estágio Docente', 1, 31, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (32, 8, '8', 4, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('LIBRAS', 2, 32, current_timestamp(), current_timestamp()),
('Bioquímica', 3, 32, current_timestamp(), current_timestamp()),
('Química Ambiental', 3, 32, current_timestamp(), current_timestamp()),
('Eletiva II', 4, 32, current_timestamp(), current_timestamp()),
('Eletiva III', 6, 32, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Pesquisa', 1, 32, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Estágio Docente', 1, 32, current_timestamp(), current_timestamp());

# TECNOLOGIA EM SI 2012

INSERT INTO periodos VALUES (33, 1, '1', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 4, 33, current_timestamp(), current_timestamp()),
('Matemática', 4, 33, current_timestamp(), current_timestamp()),
('Língua Inglesa', 4, 33, current_timestamp(), current_timestamp()),
('Introdução à Informática', 2, 33, current_timestamp(), current_timestamp()),
('Algoritmos e Técnicas de Programação', 6, 33, current_timestamp(), current_timestamp()),
('Eletrônica Digital', 4, 33, current_timestamp(), current_timestamp()),
('Redes de Computadores', 4, 33, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (34, 2, '2', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Cálculo Diferencial e Integral', 4, 34, current_timestamp(), current_timestamp()),
('Filosofia', 2, 34, current_timestamp(), current_timestamp()),
('Programação Orientada a Objetos', 4, 34, current_timestamp(), current_timestamp()),
('Autoria Web', 4, 34, current_timestamp(), current_timestamp()),
('Arquitetura e Org. de Computadores', 4, 34, current_timestamp(), current_timestamp()),
('Estruturas de Dados', 4, 34, current_timestamp(), current_timestamp()),
('Aplicações de Redes de Computadores', 4, 34, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (35, 3, '3', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Metodologia do Trabalho Científico', 2, 35, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 35, current_timestamp(), current_timestamp()),
('Banco de Dados I', 4, 35, current_timestamp(), current_timestamp()),
('Análise e Projeto Orientado a Objetos', 4, 35, current_timestamp(), current_timestamp()),
('Programação Web I', 4, 35, current_timestamp(), current_timestamp()),
('Sistemas Operacionais', 4, 35, current_timestamp(), current_timestamp()),
('Programação em Ambiente de Redes', 4, 35, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (36, 4, '4', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Banco de Dados II', 4, 36, current_timestamp(), current_timestamp()),
('Programação Web II', 4, 36, current_timestamp(), current_timestamp()),
('Processo de Análise e Des. de Sistemas', 4, 36, current_timestamp(), current_timestamp()),
('Sistemas Distribuídos', 4, 36, current_timestamp(), current_timestamp()),
('Engenharia de Software', 2, 36, current_timestamp(), current_timestamp()),
('Optativa I', 4, 36, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa e Extensão', 2, 36, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (37, 5, '5', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Gestão e Empreendedorismo', 4, 37, current_timestamp(), current_timestamp()),
('Desenvolvimento com Ferramentas RAD', 4, 37, current_timestamp(), current_timestamp()),
('Desenvolvimento de Sistemas Corporativos', 4, 37, current_timestamp(), current_timestamp()),
('Redes Sem Fio', 4, 37, current_timestamp(), current_timestamp()),
('Gerência e Conf. de Serviços para a Internet', 4, 37, current_timestamp(), current_timestamp()),
('Optativa II', 4, 37, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Projeto Integrador', 2, 37, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (38, 6, '6', 5, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Comércio Eletrônico', 2, 38, current_timestamp(), current_timestamp()),
('Tecnologias de Banco de Dados', 4, 38, current_timestamp(), current_timestamp()),
('Segurança e Preservação de Dados', 4, 38, current_timestamp(), current_timestamp()),
('Programação de Tec. Móveis e Sem Fio', 4, 38, current_timestamp(), current_timestamp()),
('Optativa III', 4, 38, current_timestamp(), current_timestamp()),
('Optativa IV', 2, 38, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional', 2, 38, current_timestamp(), current_timestamp());

# TECNOLOGIA EM ALIMENTOS 2012

INSERT INTO periodos VALUES (39, 1, '1', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 4, 39, current_timestamp(), current_timestamp()),
('Informática', 2, 39, current_timestamp(), current_timestamp()),
('Matemática', 4, 39, current_timestamp(), current_timestamp()),
('Língua Inglesa', 4, 39, current_timestamp(), current_timestamp()),
('Biologia', 4, 39, current_timestamp(), current_timestamp()),
('Química Geral', 6, 39, current_timestamp(), current_timestamp()),
('Ética e Cidadania', 2, 39, current_timestamp(), current_timestamp()),
('Introdução à Tecnologia de Alimentos', 2, 39, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (40, 2, '2', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Metodologia Científica e Tecnológica', 2, 40, current_timestamp(), current_timestamp()),
('Cálculo - Cálculo Diferencial e Integral', 4, 40, current_timestamp(), current_timestamp()),
('Física', 4, 40, current_timestamp(), current_timestamp()),
('Química Orgânica', 6, 40, current_timestamp(), current_timestamp()),
('Desenho técnico Auxiliado por Computador', 3, 40, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 40, current_timestamp(), current_timestamp()),
('Gestão Organizacional', 3, 40, current_timestamp(), current_timestamp()),
('Microbiologia de Alimentos', 4, 40, current_timestamp(), current_timestamp()),
('Seminário de Iniciação à Pesquisa e à Extensão', 2, 40, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (41, 3, '3', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Físico-Química', 6, 41, current_timestamp(), current_timestamp()),
('Química Analítica', 6, 41, current_timestamp(), current_timestamp()),
('Estatística', 4, 41, current_timestamp(), current_timestamp()),
('Segurança do Trabalho', 2, 41, current_timestamp(), current_timestamp()),
('Princípios da conservação de Alimentos', 2, 41, current_timestamp(), current_timestamp()),
('Química dos Alimentos', 4, 41, current_timestamp(), current_timestamp()),
('Análise microbiológica de Alimentos', 4, 41, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (42, 4, '4', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Matérias-primas Agropecuárias', 2, 42, current_timestamp(), current_timestamp()),
('Controle Estatístico da Qualidade', 4, 42, current_timestamp(), current_timestamp()),
('Gestão da Qualidade e Legislação de Alimentos', 4, 42, current_timestamp(), current_timestamp()),
('Bioquímica dos Alimentos', 4, 42, current_timestamp(), current_timestamp()),
('Análise de alimentos', 6, 42, current_timestamp(), current_timestamp()),
('Termodinâmica Aplicada e Fenômenos de transportes', 4, 42, current_timestamp(), current_timestamp()),
('Eletiva I', 2, 42, current_timestamp(), current_timestamp()),
('Seminário de Projeto Integrador', 2, 42, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (43, 5, '5', 6, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Tecnologia de Laticínios', 6, 43, current_timestamp(), current_timestamp()),
('Biotecnologia de Alimentos', 4, 43, current_timestamp(), current_timestamp()),
('Segurança Alimentar', 2, 43, current_timestamp(), current_timestamp()),
('Tecnologia de Carnes e Pescados', 4, 43, current_timestamp(), current_timestamp()),
('Armazenamento e Logística', 4, 43, current_timestamp(), current_timestamp()),
('Operações Unitárias Aplicadas à Alimentos', 6, 43, current_timestamp(), current_timestamp()),
('Eletiva II', 2, 43, current_timestamp(), current_timestamp()),
('Seminário de Orientação para a Prática Profissional/de Estágio Supervisionado (Estágio Técnico)', 2, 43, current_timestamp(), current_timestamp());
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

INSERT INTO periodos VALUES (45, 1, '1', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 4, 45, current_timestamp(), current_timestamp()),
('Matemática Básica', 2, 45, current_timestamp(), current_timestamp()),
('Fundamentos da Educação I', 4, 45, current_timestamp(), current_timestamp()),
('Química Geral I', 6, 45, current_timestamp(), current_timestamp()),
('Química Experimental I', 2, 45, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Práticas Educativas e Formação Docente I', 2, 45, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (46, 2, '2', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Leitura e Escrita de Textos Acadêmicos de Divulgação Científica', 2, 46, current_timestamp(), current_timestamp()),
('Fundamentos da Educação II', 4, 46, current_timestamp(), current_timestamp()),
('Química Geral II', 6, 46, current_timestamp(), current_timestamp()),
('Química Experimental II', 2, 46, current_timestamp(), current_timestamp()),
('Cálculo Diferencial e Integral I', 4, 46, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Práticas Educativas e Formação Docente II', 2, 46, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (47, 3, '3', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Informática', 2, 47, current_timestamp(), current_timestamp()),
('Psicologia da Aprendizagem', 4, 47, current_timestamp(), current_timestamp()),
('Mídias Educacionais', 2, 47, current_timestamp(), current_timestamp()),
('Epistemologia da Ciência', 2, 47, current_timestamp(), current_timestamp()),
('Metodologia do Trabalho Científico', 2, 47, current_timestamp(), current_timestamp()),
('Cálculo Diferencial e Integral II', 4, 47, current_timestamp(), current_timestamp()),
('Química Ambiental', 2, 47, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Práticas Educativas e Formação Docente III', 2, 47, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (48, 4, '4', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Didática', 4, 48, current_timestamp(), current_timestamp()),
('Química Inorgânica', 4, 48, current_timestamp(), current_timestamp()),
('Físico-Química Teórica e Experimental I', 6, 48, current_timestamp(), current_timestamp()),
('Fundamentos da Pesquisa em Educação Química', 2, 48, current_timestamp(), current_timestamp()),
('Biologia para o Ensino de Ciências', 2, 48, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Práticas Educativas e Formação Docente IV', 2, 48, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (49, 5, '5', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Organização e Gestão da Educação Brasileira', 4, 49, current_timestamp(), current_timestamp()),
('Metodologia do Ensino de Química I', 4, 49, current_timestamp(), current_timestamp()),
('Química Inorgânica de Coordenação', 4, 49, current_timestamp(), current_timestamp()),
('Físico-Química Teórica e Experimental II', 4, 49, current_timestamp(), current_timestamp()),
('Física I', 2, 49, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Estágio Supervisionado (Estágio Docente) I', 2, 49, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (50, 6, '6', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Educação Inclusiva', 4, 50, current_timestamp(), current_timestamp()),
('Metodologia do Ensino de Química II', 4, 50, current_timestamp(), current_timestamp()),
('Físico-Química Teórica e Experimental III', 4, 50, current_timestamp(), current_timestamp()),
('Química Orgânica Fundamental', 4, 50, current_timestamp(), current_timestamp()),
('Física II', 2, 50, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Estágio Supervisionado (Estágio Docente) II', 2, 50, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (51, 7, '7', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('LIBRAS', 2, 51, current_timestamp(), current_timestamp()),
('Mecanismos de Reações Orgânicas', 4, 51, current_timestamp(), current_timestamp()),
('Química Analítica Qualitativa', 6, 51, current_timestamp(), current_timestamp()),
('Química Orgânica Experimental', 2, 51, current_timestamp(), current_timestamp()),
('Estatística Aplicada à Química', 2, 51, current_timestamp(), current_timestamp()),
('Optativa I', 2, 51, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Pesquisa Acadêmico-Científica I', 1, 51, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Estágio Supervisionado (Estágio Docente) III', 1, 51, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (52, 8, '8', 7, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Química Analítica Quantitativa', 6, 52, current_timestamp(), current_timestamp()),
('Química dos Elementos', 2, 52, current_timestamp(), current_timestamp()),
('Química Inorgânica Experimental', 2, 52, current_timestamp(), current_timestamp()),
('Bioquímica', 2, 52, current_timestamp(), current_timestamp()),
('Optativa II', 4, 52, current_timestamp(), current_timestamp()),
('Optativa III', 2, 52, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Desenvolvimento de Pesquisa Acadêmico-Científica II', 1, 52, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Estágio Supervisionado (Estágio Docente) IV', 1, 52, current_timestamp(), current_timestamp());

# TECNOLOGIA EM SI 2019

INSERT INTO periodos VALUES (53, 1, '1', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Leitura e Produção de Textos Acadêmicos e de Divulgação Científica', 4, 53, current_timestamp(), current_timestamp()),
('Matemática', 4, 53, current_timestamp(), current_timestamp()),
('Língua Inglesa', 4, 53, current_timestamp(), current_timestamp()),
('Introdução à Lógica e Programação', 6, 53, current_timestamp(), current_timestamp()),
('Fundamentos de Sistemas Operacionais', 2, 53, current_timestamp(), current_timestamp()),
('Padrões Web', 2, 53, current_timestamp(), current_timestamp()),
('Seminário de Integração Acadêmica', 2, 53, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (54, 2, '2', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Metodologia do Trabalho Científico', 2, 54, current_timestamp(), current_timestamp()),
('Gestão Organizacional', 2, 54, current_timestamp(), current_timestamp()),
('Filosofia, Ciência e Tecnologia', 2, 54, current_timestamp(), current_timestamp()),
('Sistemas Operacionais Abertos', 4, 54, current_timestamp(), current_timestamp()),
('Bancos de Dados', 4, 54, current_timestamp(), current_timestamp()),
('Programação Orientada a Objetos', 4, 54, current_timestamp(), current_timestamp()),
('Desenvolvimento Web Front-end', 4, 54, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (55, 3, '3', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Sociologia e Tecnologia', 2, 55, current_timestamp(), current_timestamp()),
('Redes de Computadores', 4, 55, current_timestamp(), current_timestamp()),
('Estruturas de Dados', 4, 55, current_timestamp(), current_timestamp()),
('Programação em Banco de Dados', 4, 55, current_timestamp(), current_timestamp()),
('Análise e Projeto de Sistema Web', 4, 55, current_timestamp(), current_timestamp()),
('Desenvolvimento Web Back-end', 4, 55, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (56, 4, '4', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Sistemas Digitais', 4, 56, current_timestamp(), current_timestamp()),
('Desenvolvimento de Sistemas Corporativos', 4, 56, current_timestamp(), current_timestamp()),
('Processo de Desenvolvimento e Implantação de Sistemas Web', 4, 56, current_timestamp(), current_timestamp()),
('Sistemas Distribuídos', 2, 56, current_timestamp(), current_timestamp()),
('Aplicações de Redes de Computadores', 2, 56, current_timestamp(), current_timestamp()),
('Optativa I', 4, 56, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Projeto Integrador I', 2, 56, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (57, 5, '5', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Empreendedorismo', 2, 57, current_timestamp(), current_timestamp()),
('Teste de Software', 4, 57, current_timestamp(), current_timestamp()),
('Programação para Internet das Coisas', 4, 57, current_timestamp(), current_timestamp()),
('Gerência e Conf. de Serviços para a Internet', 4, 57, current_timestamp(), current_timestamp()),
('Desenvolvimento para Dispositivos Móveis', 4, 57, current_timestamp(), current_timestamp()),
('Optativa II', 4, 57, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Projeto Integrador II', 2, 57, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (58, 6, '6', 8, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Técnicas de Análise de Dados', 4, 58, current_timestamp(), current_timestamp()),
('Segurança e Preservação de Dados', 4, 58, current_timestamp(), current_timestamp()),
('Desenvolvimento Web para a Nuvem', 4, 58, current_timestamp(), current_timestamp()),
('Optativa III', 4, 58, current_timestamp(), current_timestamp()),
('Optativa IV', 2, 58, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Trabalho de Conclusão de Curso', 2, 58, current_timestamp(), current_timestamp());

# TECNOLOGIA EM ALIMENTOS

INSERT INTO periodos VALUES (59, 1, '1', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Língua Portuguesa', 4, 59, current_timestamp(), current_timestamp()),
('Matemática', 4, 59, current_timestamp(), current_timestamp()),
('Língua Inglesa', 2, 59, current_timestamp(), current_timestamp()),
('Informática Básica', 2, 59, current_timestamp(), current_timestamp()),
('Ética e Cidadania', 2, 59, current_timestamp(), current_timestamp()),
('Biologia', 4, 59, current_timestamp(), current_timestamp()),
('Química Geral', 6, 59, current_timestamp(), current_timestamp()),
('Biologia', 4, 59, current_timestamp(), current_timestamp()),
('Introdução à Tecnologia de Alimentos', 2, 59, current_timestamp(), current_timestamp()),
('Seminário de Integração Acadêmica', 2, 59, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (60, 2, '2', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Cálculo Diferencial e Integral', 4, 60, current_timestamp(), current_timestamp()),
('Metodologia do Trabalho Científico', 2, 60, current_timestamp(), current_timestamp()),
('Sociologia do Trabalho', 2, 60, current_timestamp(), current_timestamp()),
('Física', 4, 60, current_timestamp(), current_timestamp()),
('Química Orgânica', 6, 60, current_timestamp(), current_timestamp()),
('Desenho Técnico Auxiliado por Computador', 4, 60, current_timestamp(), current_timestamp()),
('Gestão Organizacional', 2, 60, current_timestamp(), current_timestamp()),
('Microbiologia de Alimentos I', 4, 60, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (61, 3, '3', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Estatística', 4, 61, current_timestamp(), current_timestamp()),
('Físico-Química', 6, 61, current_timestamp(), current_timestamp()),
('Química Analítica', 6, 61, current_timestamp(), current_timestamp()),
('Segurança do Trabalho', 2, 61, current_timestamp(), current_timestamp()),
('Microbiologia de Alimentos II', 4, 61, current_timestamp(), current_timestamp()),
('Princípios da Conservação de Alimentos', 2, 61, current_timestamp(), current_timestamp()),
('Química dos Alimentos', 4, 61, current_timestamp(), current_timestamp()),
('Princípios da Conservação de Alimentos', 2, 61, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (62, 4, '4', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Matérias-Primas Agropecuárias', 2, 62, current_timestamp(), current_timestamp()),
('Controle Estatístico da Qualidade', 4, 62, current_timestamp(), current_timestamp()),
('Gestão da Qualidade e Legislação de Alimentos', 4, 62, current_timestamp(), current_timestamp()),
('Bioquímica dos Alimentos', 4, 62, current_timestamp(), current_timestamp()),
('Análise de Alimentos', 6, 62, current_timestamp(), current_timestamp()),
('Termodinâmica Aplicada e Fenômenos de Transportes', 4, 62, current_timestamp(), current_timestamp()),
('Optativa I', 2, 62, current_timestamp(), current_timestamp()),
('Seminário de Orientação de Projeto Integrador', 2, 62, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (63, 5, '5', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Tecnologia de Laticínios', 6, 63, current_timestamp(), current_timestamp()),
('Biotecnologia de Alimentos', 4, 63, current_timestamp(), current_timestamp()),
('Tecnologia de Carnes', 4, 63, current_timestamp(), current_timestamp()),
('Armazenamento e Logística', 4, 63, current_timestamp(), current_timestamp()),
('Operações Unitárias Aplicadas à Alimentos', 6, 63, current_timestamp(), current_timestamp()),
('Optativa II', 2, 63, current_timestamp(), current_timestamp());
INSERT INTO periodos VALUES (64, 6, '6', 9, current_timestamp(), current_timestamp());
INSERT INTO disciplinas (nome, ch_semanal, periodo_id, created_at, updated_at) VALUES
('Gestão Ambiental', 4, 64, current_timestamp(), current_timestamp()),
('Tecnologia de Pescado', 2, 64, current_timestamp(), current_timestamp()),
('Análise Sensorial', 2, 64, current_timestamp(), current_timestamp()),
('Tecnologia de Frutas e Hortaliças', 6, 64, current_timestamp(), current_timestamp()),
('Higiene da Indústria de Alimentos', 2, 64, current_timestamp(), current_timestamp()),
('Instrumentação e Instalações Industriais', 4, 64, current_timestamp(), current_timestamp()),
('Embalagens', 2, 64, current_timestamp(), current_timestamp()),
('Optativa III', 4, 64, current_timestamp(), current_timestamp()),
('Seminário de Orientação ao Trabalho de Conclusão de Curso', 2, 64, current_timestamp(), current_timestamp());

SELECT * FROM cursos;
SELECT * FROM periodos;
SELECT * FROM disciplinas;
SELECT * FROM ano_letivos;
SELECT * FROM turmas;