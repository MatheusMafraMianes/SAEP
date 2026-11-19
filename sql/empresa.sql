DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE empresa;

-- DROP TABLES
DROP TABLE IF EXISTS movimentacao CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS `user` CASCADE;

CREATE TABLE `user` (
    id_user INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INTEGER NOT NULL DEFAULT 0,
    valor_unitario NUMERIC(10,2) NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

CREATE TABLE movimentacao (
    id_movimentacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('ENTRADA', 'SAIDA')),
    quantidade INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    datetime_movimentacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_user INTEGER NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_user) REFERENCES `user`(id_user)
) ENGINE=InnoDB;

INSERT INTO `user` (nome) VALUES
('Administrador');

INSERT INTO produto (nome, quantidade_estoque, valor_unitario) VALUES
-- Quantidades iniciais antes dos lançamentos demonstrativos abaixo.
('Amaciante de roupas', 60, 0.50),
('Detergente', 30, 18.90),
('Sabão em pó', 40, 22.50);


INSERT INTO movimentacao (tipo, quantidade, id_produto, datetime_movimentacao, id_user) VALUES
('ENTRADA', 50, 1, NOW(), 1),
('SAIDA', 10, 1, NOW(), 1),
('SAIDA', 5, 2, NOW(), 1);

select * from produto;