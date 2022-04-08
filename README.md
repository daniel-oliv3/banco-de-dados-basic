### 3* ----- Criando a Primeira Tabela.
Comando para criar um banco de dados.
### CREATE DATABASE cadastro;


Comando para usar o banco de dados criado.
### USE cadastro;


Comando para criar uma tabela Exp 01.
### CREATE TABLE pessoas(
    nome varchar(30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    nacionalidade varchar(20)
### );


Comando DESCRIBE mostra uma descrição da tabela criada.
### DESCRIBE pessoas;


### 4* ----- Atualizando a Tabela com Id.
Comando para apagar um banco de dados.
### DROP DATABASE cadastro;


Comando para criar uma tabela Exp 02.
### CREATE DATABASE cadastro2
### DEFAULT CHARACTER SET utf8
### DEFAULT COLLATE utf8_general_ci;
### CREATE TABLE `pessoas`(
    `id` int not null auto_increment,
    `nome` varchar(30) not null,
    `nascimento` date,
    `sexo` enum('M', 'F'),
    `peso` decimal(5, 2),
    `altura` decimal(3, 2),
    `nacionalidade` varchar(20) default 'Brasil',
    primary key (id)
### )default charset = utf8;



### 5* ----- Inserindo Dados na Tabela (INSERT INTO).
Comando para inserir dados na tabela Exp 01.
### INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) VALUES
                   ('Sapup3', '1985-13-08', 'M', '78.5', '1.65', 'Brasil');


Comando para visualizar todos os campos da tabela.
### SELECT * FROM pessoas;


Comando para inserir dados na tabela Exp 02.
### INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade) VALUES
                   (DEFAULT, 'Sapup3', '1985-13-08', 'M', '78.5', '1.65', DEFAULT);


Comando para inserir varios dados na tabela Exp 03.
### INSERT INTO pessoas  VALUES
                   (DEFAULT, 'Thiago', '1986-18-12', 'M', '80.5', '1.67', DEFAULT),
                   (DEFAULT, 'Daniel', '1985-13-08', 'M', '78.5', '1.65', 'Brasil'),
                   (DEFAULT, 'Janaína', '2004-03-07', 'F', '50.5', '1.65', 'Eua');



### 6* ----- Alterando a Estrutura de uma Tabela (ALTER TABLE).
Comando para adicionar um novo campo na tabela
### ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10);



Comando de descrição do container pessoas.
### DESC pessoas;



Comando para apagar um coluna da tabela.
### ALTER TABLE pessoas
### DROP COLUMN profissao;


Comando para escolher a posição da coluna.
### ALTER TABLE pessoas
### ADD COLUMN profissao varchar(10) AFTER nome;



Comando para escolher a primeira posição da coluna.
### ALTER TABLE pessoas
### ADD COLUMN codigo INT FIRST;



Comando para modificar definições.
### ALTER TABLE pessoas
### MODIFY COLUMN profissao varchar(20);



Comando para renomear uma coluna.
### ALTER TABLE pessoas
### CHANGE COLUMN profissao prof varchar(20);



Comando para renomear toda a tabela.
### ALTER TABLE pessoas
### RENAME TO humanos;



Comando para criar uma nova tabela e verificar se ela ja existe.
### CREATE TABLE IF NOT EXISTS cursos (
    nome varchar(30) not null unique,
    desxricao text,
    carga int unsigned,
    totaulas int unsgned,
    ano year default '2022'
### )default charset=utf8;


Comando para adicionar uma nova coluna na tabela.
### ALTER TABLE cursos
### ADD COLUMN idcursos INT FIRST;


Comando para atribuir a idcursos como sendo a chave primaria.
### ALTER TABLE cursos
### ADD PRIMARY KEY (idcursos);


Comando que mostra a descrição.
### describe cursos;
ou
### desc cursos;



Comando para apagar a tabela.
### DROP TABLE curso;



### 7 - Manipulando Linhas (UPDATE, DELETE e TRUNCATE).
Comando para inserir novos registros
### INSERT INTO cursos VALUES
('1','HTML4','Curso de HTML5', '40','37','2014'), 
('2','Algoritmos','Lógica de Programação','20','15','2014'), 
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'), 
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'), 
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'), 
('10','Youtuber','Gerar polêmica e ganhar inscritos','5','2','2018');



Comando para manipulação de registro - (Update)
### UPDATE cursos
### SET nome = 'HTML5'
### WHERE idcursos = '1';

### UPDATE cursos
### SET nome = 'PHP', ano = '2015'
### WHERE idcursos = '4';

### UPDATE cursos
### SET nome = 'Java', carga = '40', ano = '2015'
### WHERE idcursos = '5'
### LIMIT 1;



Comando para remover uma linha
### DELETE FROM cursos
### WHERE idcursos = '8';


### DELETE FROM cursos
### WHERE ANO = '2018'
### LIMIT 3;



