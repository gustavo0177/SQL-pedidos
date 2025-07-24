CREATE DATABASE IF NOT EXISTS vendas_facil;
USE vendas_facil;

-- apaga as tabela
DROP TABLE IF EXISTS pedidos;  
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(15)
);
select * from clientes 

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    categoria VARCHAR(50)
);
select * from produtos 

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INT,
    status_pedido VARCHAR(50),
    valor_total DECIMAL(10,2),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
) ENGINE=InnoDB;
select * from pedidos

-- Agora os INSERTS

INSERT INTO clientes (nome, email, data_nascimento, telefone, endereco, cidade, estado, cep) VALUES
('Ana Silva', 'ana@email.com', '1995-04-10', '11988887777', 'Rua das Flores, 123', 'São Paulo', 'SP', '01010-000'),
('Bruno Costa', 'bruno@email.com', '1988-11-20', '21999998888', 'Av. Brasil, 456', 'Rio de Janeiro', 'RJ', '20000-000'),
('Carlos Lima', 'carlos@email.com', '1992-07-05', '31991112222', 'Rua Minas, 99', 'Belo Horizonte', 'MG', '30000-000'),
('Daniela Souza', 'dani@email.com', '2000-01-01', '41992223333', 'Av. Paraná, 50', 'Curitiba', 'PR', '80000-000'),
('Eduardo Melo', 'edu@email.com', '1985-12-12', '51993334444', 'Rua Porto, 77', 'Porto Alegre', 'RS', '90000-000');

select * from clientes

INSERT INTO produtos (nome_produto, descricao, preco, estoque, categoria) VALUES
('Camiseta Básica', 'Camiseta de algodão 100%', '49.90', '100', 'Roupas'),
('Notebook 15"', 'Notebook com 8GB RAM e SSD 256GB', 2999.99, 10, 'Eletrônicos'),
('Smartphone X', 'Tela 6.5", 128GB, Câmera 48MP', 1999.00, 20, 'Eletrônicos'),
('Tênis Esportivo', 'Ideal para corrida e academia', 249.90, 50, 'Calçados'),
('Mochila Executiva', 'Compartimento para notebook', 149.90, 30, 'Acessórios');

select * from produtos

INSERT INTO pedidos (data_pedido, id_cliente, status_pedido, valor_total, metodo_pagamento) VALUES
('2025-07-01', 1, 'Entregue', 49.90, 'Pix'),
('2025-07-01', 2, 'Em andamento', 1999.00, 'Cartão'),
('2025-07-02', 3, 'Cancelado', 249.90, 'Boleto'),
('2025-07-02', 4, 'Entregue', 149.90, 'Dinheiro'),
('2025-07-02', 5, 'Em andamento', 2999.99, 'Cartão');
select * from pedidos



-- SELECTs

SELECT * FROM clientes WHERE nome = 'Ana Silva';
SELECT * FROM pedidos WHERE id_cliente = 2;
SELECT * FROM produtos WHERE categoria = 'Eletrônicos';

-- UPDATEs
UPDATE clientes SET telefone = '31990001111' WHERE id_cliente = 3;
select * from clientes WHERE id_cliente = 3;


UPDATE produtos SET estoque = 90 WHERE id_produto = '1';
select * from produtos WHERE id_produto = '1';

UPDATE pedidos SET status_pedido = 'Entregue' WHERE id_pedido = 5;
select * from pedidos WHERE id_pedido = 5;
