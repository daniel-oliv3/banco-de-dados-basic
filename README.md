Comando para criar um banco de dados.
### CREATE DATABASE cadastro;

Comando para usar o banco de dados criado
### USE cadastro;




Comando para criar uma tabela Exp 01.
### CREATE TABLE `pessoas`(
    nome varchar(30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    nacionalidade varchar(20)
);


Comando para criar uma tabela Exp 02.
### CREATE TABLE `pessoas`(
    `id` int not null auto_increment,
    `nome` varchar(30) not null,
    `nascimento` date,
    `sexo` enum('M', 'F'),
    `peso` decimal(5, 2),
    `altura` decimal(3, 2),
    `nacionalidade` varchar(20) default 'Brasil',
    primary key (id)
)default charset = utf8;

