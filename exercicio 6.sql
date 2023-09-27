CREATE DATABASE db_curso_da_minha_vida
USE db_curso_da_minha_vida

CREATE TABLE tb_categorias(
id bigint auto_increment,
categoria varchar(255) not null,
dias varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_cursos(
id bigint auto_increment,
nome varchar(255) not null,
valor decimal not null,
turma bigint not null,
quantidade_alunos bigint not null,
primary key (id)
);

ALTER TABLE tb_cursos
ADD COLUMN curso_id bigint,
ADD CONSTRAINT fk_cursos_categorias
FOREIGN KEY (curso_id) REFERENCES tb_categorias(id);

INSERT INTO tb_categorias (categoria, dias) VALUES
    ('medicina', 'seg-sex'),
    ('veterinaria', 'seg-sex'),
    ('programação', 'seg-qui'),
    ('propaganda', 'ter-qui'),
    ('Professor', 'qua-sex');
    
    INSERT INTO tb_cursos (nome, valor, turma, quantidade_alunos, curso_id) VALUES
    ('Java', 700.00, 67, 40, 3),
    ('Professor de Portugues', 450.00, 45, 14, 5),
    ('Python', 600.00, 34, 54, 3),
    ('PHP', 320.00, 2, 5, 3),
    ('Propaganda', 120.00, 23, 10, 4),
    ('Cachorros', 750.00, 48, 56, 2),
    ('Cavalos', 960.00, 76, 78, 2),
    ('Pediatria', 1000.00, 104, 150, 1);
    
SELECT * FROM tb_cursos;
    
SELECT * FROM tb_cursos WHERE valor > 500.00;
    
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
    
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';
    
SELECT nome, valor, turma, quantidade_alunos FROM tb_cursos
INNER JOIN tb_categorias ON tb_categorias.id = tb_cursos.curso_id;

SELECT nome, valor, turma, quantidade_alunos FROM tb_cursos
INNER JOIN tb_categorias ON tb_categorias.id = tb_cursos.curso_id
WHERE categoria = 'programação';