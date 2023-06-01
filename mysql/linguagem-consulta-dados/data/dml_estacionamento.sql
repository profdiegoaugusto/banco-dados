USE bd_estacionamento;

-- ---------------
-- Estacionamento
-- ---------------
INSERT INTO Estacionamento (nome_estacionamento, vagas_max, telefone)
VALUES ('Estacionamento A', 100, '3132123456');

INSERT INTO Estacionamento (nome_estacionamento, vagas_max, telefone)
VALUES ('Estacionamento B', 80, '3198765432');

INSERT INTO Estacionamento (nome_estacionamento, vagas_max, telefone)
VALUES ('Estacionamento C', 120, '3145612378');

INSERT INTO Estacionamento (nome_estacionamento, vagas_max, telefone)
VALUES ('Estacionamento D', 150, '3178912345');

INSERT INTO Estacionamento (nome_estacionamento, vagas_max, telefone)
VALUES ('Estacionamento E', 200, '3121654987');

SELECT * FROM Estacionamento;


-- ---------------
-- Cor
-- ---------------
INSERT INTO Cor (nome_cor) VALUES ('Vermelho');
INSERT INTO Cor (nome_cor) VALUES ('Azul');
INSERT INTO Cor (nome_cor) VALUES ('Amarelo');
INSERT INTO Cor (nome_cor) VALUES ('Verde');
INSERT INTO Cor (nome_cor) VALUES ('Branco');
INSERT INTO Cor (nome_cor) VALUES ('Preto');

SELECT * FROM Cor;


-- ---------------
-- Marca
-- ---------------
INSERT INTO Marca (nome_marca, website) 
VALUES ('Volkswagen', 'https://www.vw.com.br');

INSERT INTO Marca (nome_marca, website) 
VALUES ('Chevrolet', 'https://www.chevrolet.com.br');

INSERT INTO Marca (nome_marca, website) 
VALUES ('Fiat', 'https://www.fiat.com.br');

INSERT INTO Marca (nome_marca, website) 
VALUES ('Ford', 'https://www.ford.com.br');

INSERT INTO Marca (nome_marca, website) 
VALUES ('Toyota', 'https://www.toyota.com.br');

INSERT INTO Marca (nome_marca, website) 
VALUES ('Honda', 'https://www.honda.com.br');

SELECT * FROM Marca;


-- ---------------
-- Tipo Veículo
-- ---------------
INSERT INTO Tipo_Veiculo (id_tipo_veiculo, tipo) 
VALUES ('A', 'Automóvel');

INSERT INTO Tipo_Veiculo (id_tipo_veiculo, tipo)
VALUES ('C', 'Caminhão');

INSERT INTO Tipo_Veiculo (id_tipo_veiculo, tipo) 
VALUES ('M', 'Motocicleta');

INSERT INTO Tipo_Veiculo (id_tipo_veiculo, tipo) 
VALUES ('V', 'Van');

INSERT INTO Tipo_Veiculo (id_tipo_veiculo, tipo) 
VALUES ('O', 'Ônibus');

SELECT * FROM Tipo_Veiculo;


-- ---------------
-- Tipo Usuário
-- ---------------
INSERT INTO Tipo_Usuario (id_tipo_usuario, papel) 
VALUES ('A', 'Aluno');

INSERT INTO Tipo_Usuario (id_tipo_usuario, papel)
VALUES ('P', 'Professor');

INSERT INTO Tipo_Usuario (id_tipo_usuario, papel) 
VALUES ('F', 'Funcionário');

INSERT INTO Tipo_Usuario (id_tipo_usuario, papel) 
VALUES ('V', 'Visitante');

SELECT * FROM Tipo_Usuario;


-- ---------------
-- Sexo
-- ---------------
INSERT INTO Sexo (id_sexo, tipo_sexo) 
VALUES ('F', 'Feminino');

INSERT INTO Sexo (id_sexo, tipo_sexo)
VALUES ('M', 'Masculino');

INSERT INTO Sexo (id_sexo, tipo_sexo) 
VALUES ('O', 'Outros');

SELECT * FROM Sexo;


-- -----------------
-- Categoria Modelo
-- -----------------
INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (1, 'Sedã');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (2, 'Hatchback');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (3, 'Picape');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (4, 'SUV');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (5, 'Van');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (6, 'Esportivo');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (7, 'Conversível');

INSERT INTO Categoria_Modelo (id_categoria, categoria) 
VALUES (8, 'Compacto');

SELECT * FROM Categoria_Modelo;


-- -----------------
-- Combustível
-- -----------------
INSERT INTO Combustivel (id_combustivel, tipo_combustivel) 
VALUES (1, 'Gasolina');

INSERT INTO Combustivel (id_combustivel, tipo_combustivel) 
VALUES (2, 'Diesel');

INSERT INTO Combustivel (id_combustivel, tipo_combustivel) 
VALUES (3, 'Gás Natural');

INSERT INTO Combustivel (id_combustivel, tipo_combustivel) 
VALUES (4, 'Etanol');

INSERT INTO Combustivel (id_combustivel, tipo_combustivel) 
VALUES (5, 'Eletricidade');

SELECT * FROM Combustivel;


-- -----------------
-- Tração
-- -----------------
INSERT INTO Tracao (id_tracao, tipo_tracao) VALUES ('D', 'Dianteira');
INSERT INTO Tracao (id_tracao, tipo_tracao) VALUES ('T', 'Traseira');
INSERT INTO Tracao (id_tracao, tipo_tracao) VALUES ('Q', 'Quatro Rodas');
INSERT INTO Tracao (id_tracao, tipo_tracao) VALUES ('I', 'Integral');

SELECT * FROM Tracao;


-- -----------------
-- Transmissão
-- -----------------
INSERT INTO Transmissao (id_transmissao, tipo_transmissao) 
VALUES ('A', 'Automática');

INSERT INTO Transmissao (id_transmissao, tipo_transmissao) 
VALUES ('M', 'Manual');

SELECT * FROM Transmissao;

SELECT * FROM Tracao;


-- -----------------
-- Usuário
-- -----------------
-- Usuários do tipo F (Funcionário)
INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (1, 'F', 'F', 'Ana', 'Souza', '65432198701', '65432198701', '3176543210', '31765432109', 'ana.souza@email.com', '1985-07-20');

INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (2, 'F', 'M', 'Lucas', 'Fernandes', '78901234501', '78901234501', '3198765432', '31987654321', 'lucas.fernandes@email.com', '1988-12-10');

-- Usuários do tipo A (Aluno)
INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (3, 'A', 'M', 'Pedro', 'Oliveira', '54321098701', '54321098701', '3187654321', '31876543210', 'pedro.oliveira@email.com', '1994-06-25');

INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (4, 'A', 'M', 'João', 'Silva', '12345678901', '12345678901', '3198765432', '31987654321', 'joao.silva@email.com', '1990-01-01');

INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (5, 'A', 'F', 'Maria', 'Santos', '98765432101', '98765432101', '3187654321', '31876543210', 'maria.santos@email.com', '1992-03-15');

-- Usuários do tipo P (Professor)
INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (6, 'P', 'M', 'José', 'Ferreira', '56789012345', '56789012345', '3198765432', '31987654321', 'jose.ferreira@example.com', '1976-03-15');

INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (7, 'P', 'F', 'Sandra', 'Almeida', '67890123456', '67890123456', '3187654321', '31876543210', 'sandra.almeida@example.com', '1988-09-30');

-- Usuário do tipo V (Visitante)
INSERT INTO Usuario (id_usuario, id_tipo_usuario, id_sexo, nome, sobrenome, cpf, cnh, telefone, celular, email, nascimento)
VALUES (8, 'V', 'M', 'Visitante', 'Anônimo', '00000000000', '00000000000', '0000000000', '00000000000', 'visitante@example.com', '1990-01-01');

SELECT * FROM Usuario;


-- -----------------
-- Modelo
-- -----------------
INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (6, 'A', 'D', 4, 'New HR-V EX Honda SENSING', '5', '4', '2023');

INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (6, 'A', 'D', 2, 'New City Hatchback', '5', '4', '2023');  

INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (6, 'A', 'D', 1, 'Civic Híbrido', '5', '4', '2023');  


INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (1, 'M', 'T', 8, 'VW Fusca 1600', '5', '2', '1993');  

INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (3, 'M', 'D', 8, 'Fiat Uno Mille Way', '5', '2', '2008');  


INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (2, 'M', 'D', 8, 'Celta', '5', '4', '2015'); 

INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (5, 'A', 'D', 1, 'Toyota Corolla GLI 1.8 Flex 16v.', '5', '4', '2012'); 

INSERT INTO Modelo (id_marca, id_transmissao, id_tracao, id_categoria, nome_modelo, lugares, portas, ano_modelo)
VALUES (2, 'A', 'D', 6, 'Chevrolet Camaro SS 6.2 v8 16v', '5', '4', '2010'); 

SELECT * FROM Modelo;


-- -----------------
-- Tipo_Combustivel
-- -----------------
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (1, 1), (1, 4);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (2, 1), (2, 4);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (3, 1), (3, 5);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (4, 1);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (5, 1), (5, 4);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (6, 1), (6, 4);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (7, 1), (7, 4);
INSERT INTO Tipo_Combustivel (id_modelo, id_combustivel) VALUES (8, 1);

SELECT * FROM Tipo_Combustivel;

-- -----------------
-- Veículo
-- -----------------
INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('12345678901', 6, 1, 'A', 6, 'ABC1234', '1HGCM82607A123456', 2023);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('23456789012', 6, 2, 'A', 6, 'XYZ9876', '5YJSA1E25GF123456', 2023);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('34567890123', 6, 3, 'A', 5, 'DEF5678', 'WBAYE8C52ED123456', 2023);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('45678901234', 1, 4, 'A', 4, 'GHI4321', 'JM1BL1L76C1234567', 1993);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('56789012345', 3, 5, 'A', 1, 'JKL8765', 'KLATF08Y4VB123456', 2008);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('67890123456', 3, 5, 'A', 5, 'MNO3456', 'WDDZF4JB7HA123456', 2007);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('78901234567', 2, 6, 'A', 1, 'PQR7890', '1G1JC1249VM123456', 2015);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('89012345678', 5, 7, 'A', 6, 'STU0987', 'JF1VA1A64F1234567', 2012);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('90123456789', 2, 8, 'A', 3, 'VWX6543', '3FA6P0K98GR123456', 2010);

INSERT INTO Veiculo (renavam, id_marca, id_modelo, id_tipo_veiculo, id_cor, placa, chassi, ano_fabricacao) 
VALUES ('01234567890', 2, 6, 'A', 5, 'BCD8765', 'SAJWA6AT5G1234567', 2015);

SELECT renavam, nome_modelo FROM Veiculo
natural join modelo;

-- -------------------------
-- Cartão de Estacionamento
-- -------------------------
-- Cartão para o usuário de id_usuario 1 (Ana Souza)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 1, '2022-01-01', '1234567890123', 1);

-- Cartão para o usuário de id_usuario 2 (Lucas Fernandes)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 2, '2022-02-01', '2345678901234', 1);

-- Cartão para o usuário de id_usuario 3 (Pedro Oliveira)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 3, '2022-03-01', '3456789012345', 1);

-- Cartão para o usuário de id_usuario 4 (João Silva)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 4, '2022-04-01', '4567890123456', 1);

-- Cartão para o usuário de id_usuario 5 (Maria Santos)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 5, '2022-05-01', '5678901234567', 1);

-- Cartão para o usuário de id_usuario 6 (José Ferreira)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 6, '2022-06-01', '6789012345678', 1);

-- Cartão para o usuário de id_usuario 7 (Sandra Almeida)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 7, '2022-07-01', '7890123456789', 1);

-- Cartão para o usuário de id_usuario 8 (Visitante Anônimo)
INSERT INTO Cartao_Estacionamento (via, id_usuario, emissao, codigo_barras, esta_ativo)
VALUES (1, 8, '2022-08-01', '8901234567890', 1);

SELECT * FROM Cartao_Estacionamento;


-- -------------------------
-- Propriedade
-- -------------------------
INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('89012345678', 1, '2022-01-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('56789012345', 2, '2022-02-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('67890123456', 3, '2022-03-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('01234567890', 4, '2022-04-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('78901234567', 5, '2022-05-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('12345678901', 6, '2022-06-01 00:00:00');

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('90123456789', 7, '2022-07-01 00:00:00');

SELECT * FROM Propriedade;

UPDATE Propriedade
SET data_fim = '2023-07-01 00:00:00'
WHERE id_usuario = 7;

INSERT INTO Propriedade (renavam, id_usuario, data_inicio)
VALUES ('45678901234', 7, '2023-07-01 00:00:00');

SELECT * FROM Propriedade;


-- ----------------------------
-- Histórico de Estacionamento
-- ----------------------------
INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (3, '89012345678', '2023-02-21 05:50:00');

SELECT * FROM Historico_Estacionamento;

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (1, '67890123456', '2023-02-21 07:40:00');

SELECT * FROM Historico_Estacionamento;

UPDATE Historico_Estacionamento
SET data_hora_saida = '2023-02-21 11:20:00'
WHERE renavam = '67890123456';

SELECT * FROM Historico_Estacionamento;

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (3, '56789012345', '2023-02-21 14:40:00');

SELECT * FROM Historico_Estacionamento;

UPDATE Historico_Estacionamento
SET data_hora_saida = '2023-02-21 15:10:00'
WHERE renavam = '89012345678';

SELECT * FROM Historico_Estacionamento;

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (4, '12345678901', '2023-02-21 18:10:00');

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (4, '90123456789', '2023-02-21 18:30:00');

SELECT * FROM Historico_Estacionamento;

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (2, '01234567890', '2023-02-21 18:35:00');

INSERT INTO Historico_Estacionamento (id_estacionamento, renavam, data_hora_entrada)
VALUES (2, '78901234567', '2023-02-21 18:55:00');

SELECT * FROM Historico_Estacionamento;

UPDATE Historico_Estacionamento
SET data_hora_saida = '2023-02-21 21:50:00'
WHERE renavam = '01234567890';

UPDATE Historico_Estacionamento
SET data_hora_saida = '2023-02-21 22:00:00'
WHERE renavam = '78901234567';

SELECT * FROM Historico_Estacionamento;