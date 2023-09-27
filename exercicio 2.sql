CREATE DATABASE db_pizzaria_legal
USE db_pizzaria_legal

CREATE TABLE tb_categorias(
id bigint auto_increment,
tipo varchar(255) not null,
tamanho varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_pizzas(
id bigint auto_increment,
nome varchar(255) not null,
valor decimal not null,
borda varchar(255) not null,
quantidade bigint not null,
primary key (id)
);

ALTER TABLE tb_pizzas
ADD COLUMN pizza_id bigint,
ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (pizza_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (tipo, tamanho) VALUES
    ('doce', 'grande'),
    ('salgada', 'media'),
    ('salgada', 'broto'),
    ('doce', 'media'),
    ('doce', 'broto');
    
    INSERT INTO tb_pizzas (nome, valor, borda, quantidade, pizza_id) VALUES
    ('Banana', 45.50, "Chocolate", 1, 4),
    ('Bacon', 40.00, "Catupiry", 2, 2),
    ('Portuguesa', 55.00, "Sem borda", 5, 3),
    ('Mussarela', 35.50, "Sem borda", 1, 3),
    ('Vegetariana', 45.00, "Cream cheese", 2, 3),
    ('Peperoni', 50.00, "Sem borda", 1, 2),
    ('Prestigio', 55.00, "Cocada", 3, 1),
    ('Chocolate', 40.00, "Chocolate", 4, 1);
    
SELECT * FROM tb_pizzas;
    
SELECT * FROM tb_pizzas WHERE valor > 45.00;
    
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
    
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';
    
SELECT nome, valor, borda, quantidade FROM tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.pizza_id;

SELECT nome, valor, borda, quantidade FROM tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.pizza_id
WHERE tipo = 'Doce';