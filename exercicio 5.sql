CREATE DATABASE db_construindo_vidas
USE db_construindo_vidas

CREATE TABLE tb_categorias(
id bigint auto_increment,
categoria varchar(255) not null,
venda varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
valor decimal not null,
montador varchar(255) not null,
quantidade bigint not null,
primary key (id)
);

ALTER TABLE tb_produtos
ADD COLUMN produto_id bigint,
ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (produto_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (categoria, venda) VALUES
    ('hidraulica', 'atacado'),
    ('construção', 'atacado'),
    ('mobilia', 'avulso'),
    ('portas', 'avulso'),
    ('chuveiros', 'avulso');
    
    INSERT INTO tb_produtos (nome, valor, montador, quantidade, produto_id) VALUES
    ('Cano de banheiro', 75.50, "Montagem não inclusa", 1, 1),
    ('Cano de esgoto', 40.00, "Montagem não inclusa", 2, 1),
    ('Sofá', 150.00, "Montagem inclusa", 5, 3),
    ('Mesa', 80.50, "Montagem inclusa", 1, 3),
    ('Porta de madeira', 45.00, "Montagem inclusa", 2, 4),
    ('Lorenzetti', 82.00, "Montagem inclusa", 1, 5),
    ('Cimento', 55.00, "Montagem não inclusa", 3, 2),
    ('Torneira', 20.00, "Montagem não inclusa", 4,1);
    
SELECT * FROM tb_produtos;
    
SELECT * FROM tb_produtos WHERE valor > 100.00;
    
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
    
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
    
SELECT nome, valor, montador, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id;

SELECT nome, valor, montador, quantidade FROM tb_produtos
INNER JOIN tb_categorias ON tb_categorias.id = tb_produtos.produto_id
WHERE categoria = 'hidraulica';