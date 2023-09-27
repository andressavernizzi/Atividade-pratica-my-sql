CREATE DATABASE db_cidade_das_carnes
USE db_cidade_das_carnes

CREATE TABLE tb_categorias(
id bigint auto_increment,
tipo varchar(255) not null,
embalagem varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
valor decimal not null,
validade varchar(255) not null,
quantidade bigint not null,
primary key (id)
);

ALTER TABLE tb_produtos
ADD COLUMN produto_id bigint,
ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (produto_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (tipo, embalagem) VALUES
    ('ave', 'normal'),
    ('suino', 'vacuo'),
    ('bovino', 'vacuo'),
    ('peixe', 'normal'),
    ('ovo', 'caixa');
    
    INSERT INTO tb_produtos (nome, valor, validade, quantidade, produto_id) VALUES
    ('Picanha', 105.50, "12/2023", 1, 3),
    ('frango assado', 50.00, "11/2023", 2, 1),
    ('alcatra', 75.00, "12/2023", 5, 3),
    ('filé de frango', 25.50, "10/2023", 1, 1),
    ('ovo de codorna', 15.00, "01/2024", 2, 5),
    ('maminha', 50.00, "12/2023", 1, 3),
    ('file suino', 35.00, "10/2023", 3, 2),
    ('salmão', 80.00, "11/2023", 4, 5);
    
SELECT * FROM tb_produtos;
    
SELECT * FROM tb_produtos WHERE valor > 50.00;
    
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;
    
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
    
SELECT nome, valor, validade, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id;

SELECT nome, valor, validade, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id
WHERE tipo = 'bovino';