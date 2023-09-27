CREATE DATABASE db_generation_game_online

USE db_generation_game_online

CREATE TABLE tb_classes(
id bigint auto_increment,
nome varchar(255) not null,
tipo varchar(255) not null,
primary key (id)
);

CREATE TABLE tb_personagens(
id bigint auto_increment,
nomePersonagem varchar(255) not null,
poder_ataque bigint not null,
poder_defesa bigint not null,
nivel bigint not null,
primary key (id)
);

ALTER TABLE tb_personagens
ADD COLUMN classe_id bigint,
ADD CONSTRAINT fk_personagens_classe
FOREIGN KEY (classe_id) REFERENCES tb_classes(id);

INSERT INTO tb_classes (nome, tipo) VALUES
    ('Guerreiro', 'Melee'),
    ('Mago', 'Magia'),
    ('Arqueiro', 'Ranged'),
    ('Ladrão', 'Melee'),
    ('Sacerdote', 'Magia');
    
INSERT INTO tb_personagens (nomePersonagem, poder_ataque, poder_defesa, nivel, classe_id) VALUES
    ('Carla', 2500, 1500, 10, 1),
    ('Corine', 1800, 2200, 8, 2),
    ('Pedro', 3000, 800, 12, 3),
    ('João', 2100, 1800, 9, 4),
    ('Patricia', 2800, 1200, 11, 5),
    ('Cavalcante', 2200, 2500, 10, 1),
    ('Gustaff', 1700, 1900, 7, 2),
    ('Victor', 1900, 1600, 8, 3);
    
    SELECT * FROM tb_personagens;
    
    SELECT * FROM tb_personagens WHERE poder_ataque > 2000;
    
    SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;
    
    SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
    
    SELECT nomePersonagem, poder_ataque, poder_defesa, nivel FROM tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id;

SELECT nomePersonagem, poder_ataque, poder_defesa, nivel FROM tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id
WHERE nome = 'Guerreiro';