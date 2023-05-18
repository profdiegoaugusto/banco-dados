-- Cria Esquema do Banco de Dados
CREATE SCHEMA bd_estacionamento;
USE bd_estacionamento;

------------------------
-- CRIAÇÃO DE TABELAS --
------------------------

-- Tabela 1: Estacionamento (EXEMPLO)
CREATE TABLE Estacionamento (

    id_estacionamento INT NOT NULL AUTO_INCREMENT, 
    nome_estacionamento VARCHAR(50) NOT NULL, 
    vagas_max SMALLINT UNSIGNED DEFAULT 0,
    telefone VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (id_estacionamento)

);

-- Tabela 2: Cor
CREATE TABLE Cor (

    id_cor INT NOT NULL AUTO_INCREMENT,
    nome_cor VARCHAR(75) NOT NULL,
    PRIMARY KEY (id_cor)

);

-- Tabela 3: Marca
CREATE TABLE Marca (

    id_marca INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(45) NOT NULL,
    website VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY(id_marca)

);

-- Tabela 4: Tipo Veiculo
CREATE TABLE Tipo_Veiculo (

    id_tipo_veiculo CHAR(1) NOT NULL,
    tipo VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_tipo_veiculo)

);

-- Tabela 5: Tipo Usuario
CREATE TABLE Tipo_Usuario (

    id_tipo_usuario CHAR(1) NOT NULL,
    papel VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_tipo_usuario)

);

-- Tabela 6: Tipo Sexo
CREATE TABLE Sexo (

    id_sexo CHAR(1) NOT NULL, 
    tipo_sexo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_sexo)

);

-- Tabela 7: Categoria
CREATE TABLE Categoria_Modelo (

    id_categoria INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_categoria)

);

-- Tabela 8: Combustivel
CREATE TABLE Combustivel (

    id_combustivel TINYINT NOT NULL AUTO_INCREMENT,
    tipo_combustivel VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_combustivel)

); 

-- Tabela 9: Tracao
CREATE TABLE Tracao (

    id_tracao CHAR(1) NOT NULL,
    tipo_tracao VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_tracao)

);

-- Tabela 10: Transmissão
CREATE TABLE Transmissao (

    id_transmissao CHAR(1) NOT NULL,
    tipo_transmissao VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_transmissao)

);

-- Mostrar o exemplo de chave estrangeira

-- Tabela 11: Usuário (EXEMPLO)
CREATE TABLE Usuario (

    id_usuario INT NOT NULL AUTO_INCREMENT,
    id_tipo_usuario CHAR(1) NOT NULL,
    id_sexo CHAR(1) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    cpf CHAR(11) NOT NULL,
    cnh CHAR(11) NULL DEFAULT NULL,
    telefone VARCHAR(20) NOT NULL,
    celular VARCHAR(20) NULL DEFAULT NULL,
    email VARCHAR(254) NULL DEFAULT NULL,
    nascimento DATE NULL DEFAULT NULL,
    PRIMARY KEY (id_usuario),
    CONSTRAINT cpf_unique UNIQUE(cpf),
    CONSTRAINT cnh_unique UNIQUE(cnh),
    CONSTRAINT fk_Usuario_TipoUsuario FOREIGN KEY (id_tipo_usuario)
        REFERENCES Tipo_Usuario (id_tipo_usuario),
    CONSTRAINT fk_Usuario_Sexo FOREIGN KEY (id_sexo)
        REFERENCES Sexo(id_sexo)

);


-- Tabela 12: Modelo
CREATE TABLE Modelo (
    
    id_modelo INT NOT NULL AUTO_INCREMENT,
    id_marca INT NOT NULL,
    id_transmissao CHAR(1) NOT NULL,
    id_tracao CHAR(1) NOT NULL,
    id_categoria INT NOT NULL,
    nome_modelo VARCHAR(75) NOT NULL,
    lugares VARCHAR(2) NOT NULL,
    portas CHAR(1) NOT NULL,
    ano_modelo YEAR NULL DEFAULT NULL,
    PRIMARY KEY (id_modelo),
    CONSTRAINT fk_Modelo_Transmissao FOREIGN KEY (id_transmissao)
        REFERENCES Transmissao(id_transmissao),
    CONSTRAINT fk_Modelo_Marca FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca),
    CONSTRAINT fk_Modelo_Tracao FOREIGN KEY (id_tracao)
        REFERENCES Tracao(id_tracao),
    CONSTRAINT fk_Modelo_Categoria FOREIGN KEY (id_categoria)
        REFERENCES Categoria_Modelo(id_categoria)

);


-- Tabela 13: Veículo
CREATE TABLE Veiculo (
    
    renavam CHAR(11) NOT NULL,
    id_marca INT NOT NULL,
    id_modelo INT NOT NULL,
    id_tipo_veiculo CHAR(1) NOT NULL,
    id_cor INT NOT NULL,
    placa VARCHAR(8) NOT NULL,
    chassi VARCHAR(20) NULL DEFAULT NULL,
    ano_fabricacao YEAR NOT NULL,
    PRIMARY KEY (renavam),
    CONSTRAINT fk_Veiculo_Marca FOREIGN KEY (id_marca)
        REFERENCES Marca(id_marca),
    CONSTRAINT fk_Veiculo_Modelo FOREIGN KEY (id_modelo)
        REFERENCES Modelo(id_modelo),
    CONSTRAINT fk_Veiculo_TipoVeiculo FOREIGN KEY (id_tipo_veiculo)
        REFERENCES Tipo_Veiculo(id_tipo_veiculo),
    CONSTRAINT fk_Veiculo_Cor FOREIGN KEY (id_cor)
        REFERENCES Cor(id_cor)

);


-- Mostrar o exemplo de chave primária composta (entidade fraca)

-- Tabela 14: CartaoEstacionamento (EXEMPLO)
CREATE TABLE Cartao_Estacionamento (
    via SMALLINT NOT NULL,
    id_usuario INT NOT NULL,
    emissao DATE NOT NULL,
    codigo_barras CHAR(13) NOT NULL,
    esta_ativo TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (via, id_usuario),
    CONSTRAINT fk_Cartao_Estacionamento_Usuario FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)
);


-- Tabela 15: HistoricoEstacionamento (EXEMPLO)
CREATE TABLE Historico_Estacionamento (
    
    id_estacionamento INT NOT NULL,
    renavam CHAR(11) NOT NULL,
    data_hora_entrada TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_hora_saida DATETIME NULL DEFAULT NULL,
    permanencia TIME GENERATED ALWAYS AS (TIMEDIFF(data_hora_saida, data_hora_entrada)) STORED,
    PRIMARY KEY (id_estacionamento, renavam, data_hora_entrada),
    CONSTRAINT fk_Historico_Estacionamento_Estacionamento FOREIGN KEY (id_estacionamento)
        REFERENCES Estacionamento(id_estacionamento),
    CONSTRAINT fk_Historico_Estacionamento_Veiculo FOREIGN KEY (renavam)
        REFERENCES Veiculo(renavam)

);


-- Tabela 16: Propriedade
CREATE TABLE Propriedade (
    
    renavam CHAR(11) NOT NULL,
    id_usuario INT NOT NULL,
    data_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fim DATETIME NULL DEFAULT NULL,
    PRIMARY KEY (renavam, id_usuario, data_inicio),
    CONSTRAINT fk_Propriedade_Veiculo FOREIGN KEY (renavam)
        REFERENCES Veiculo(renavam),
    CONSTRAINT fk_Propriedade_Proprietario FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)

);


-- Tabela 17: TipoCombustivel
CREATE TABLE Tipo_Combustivel (
    
    id_modelo INT NOT NULL,
    id_combustivel TINYINT NOT NULL,
    PRIMARY KEY (id_modelo, id_combustivel),
    CONSTRAINT fk_Tipo_Combustivel_Modelo FOREIGN KEY (id_modelo)
        REFERENCES Modelo(id_modelo),
    CONSTRAINT fk_Tipo_Combustivel_Combustivel FOREIGN KEY (id_combustivel)
        REFERENCES Combustivel(id_combustivel)
    
);