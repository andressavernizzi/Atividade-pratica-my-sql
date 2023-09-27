CREATE DATABASE db_farmacia_bem_estar
USE db_farmacia_bem_estar

CREATE TABLE tb_categorias(
id bigint auto_increment,
tarja varchar(255) not null,
categoria varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
valor decimal not null,
tipo varchar(255) not null,
quantidade bigint not null,
primary key (id)
);

ALTER TABLE tb_produtos
ADD COLUMN produto_id bigint,
ADD CONSTRAINT fk_produto_categorias
FOREIGN KEY (produto_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (tarja, categoria) VALUES
    ('preta', 'remedio'),
    ('vermelha', 'remedio'),
    ('sem tarja', 'cosmetico'),
    ('sem tarja', 'cosmetico'),
    ('vermelha', 'remedio');
    
    INSERT INTO tb_produtos (nome, valor, tipo, quantidade, produto_id) VALUES
    ('Rivotril', 100.00, "adulto", 1, 1),
    ('escova de cabelo', 40.00, "infantil", 2, 3),
    ('escova de dentes', 25.00, "infantil", 5, 3),
    ('tonico capilar', 55.50, "adulto", 1, 4),
    ('dipirona', 45.00, "adulto", 2, 2),
    ('ibuprofeno', 50.00, "adulto", 1, 5),
    ('gel de cabelo', 55.00, "infantil", 3, 4),
    ('creme de barbear', 40.00, "adulto", 4, 3);
    
SELECT * FROM tb_produtos;
    
SELECT * FROM tb_produtos WHERE valor > 50.00;
    
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 60.00;
    
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
    
SELECT nome, valor, tipo, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id;

SELECT nome, valor, tipo, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id
WHERE categoria = 'remedio';