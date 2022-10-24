##
### Banco de Dados Básico.
##


### 3 - Criando a Primeira Tabela.

**Comando para criar um banco de dados**.
```db
CREATE DATABASE cadastro;
```


**Comando para usar o banco de dados criado**.
```db
USE cadastro;
```

**Comando para criar uma tabela Exp 01**.
```db
CREATE TABLE pessoas(
    nome varchar(30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    nacionalidade varchar(20)
);
```

**Comando DESCRIBE mostra uma descrição da tabela criada**.
```db
DESCRIBE pessoas;
```

### 4* - Atualizando a Tabela com Id.
**Comando para apagar um banco de dados**.
```db
DROP DATABASE cadastro;
```

**Comando para criar uma tabela Exp 02**.
```db
CREATE DATABASE cadastro2
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
CREATE TABLE `pessoas`(
    `id` int not null auto_increment,
    `nome` varchar(30) not null,
    `nascimento` date,
    `sexo` enum('M', 'F'),
    `peso` decimal(5, 2),
    `altura` decimal(3, 2),
    `nacionalidade` varchar(20) default 'Brasil',
    primary key (id)
)default charset = utf8;
```

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
Comando para inserir novos registros.
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



Comando para manipulação de registro - (Update).
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


Comando para remover uma linha da tabela (Delete).
### DELETE FROM cursos
### WHERE idcursos = '8';


### DELETE FROM cursos
### WHERE ANO = '2018'
### LIMIT 3;


Comando para remover todas as linhas da tabela (Truncate).
### TRUNCATE TABLE cursos;


Comando para mostrar todos os registros da tabela
### SELECT * FROM cursos;



### 8 - Gerenciando Cópias de Segurança MySQL.

Comando show table mostra todas as tabelas do banco de dados
### SHOW TABLE;


### 9/10 - PHPMyAdmin
--

### 11 - SELECT (Parte 1)
Comando que mostra o conteudo da tabela pessoas
### SELECT * FROM pessoas;


Comando que mostra o conteudo da tabela cursos
### SELECT * FROM cursos;


Comando em ordem alfabetica(cima pra baixo)(asc ou sem nada)
### SELECT * FROM cursos
### ORDER BY nome;
ou
### ORDER BY nome ASC;

Comando que mostra em ordem alfabetica(baixo para cima)
### SELECT * FROM cursos
### ORDER BY nome DESC;


Comando que mostra o conteudo selecionado colunas(nome, carga, ano)
### SELECT nome, carga, ano FROM cursos
### ORDER BY nome;

Comando que mostra o conteudo selecionado colunas em outra ordem (ano, nome, carga)
### SELECT ano, nome, carga FROM cursos
### ORDER BY nome;


Comando que mostra o conteudo selecionado colunas ordenado por ano e por nome (ano, nome, carga)
### SELECT ano, nome, carga FROM cursos
### ORDER BY ano, nome;


Comando que seleciona linhas(mostra o conteudo em que o ano e 2016 em ordem alfabetica)
### SELECT * FROM cursos
### WHERE ano = '2016' 
### ORDER BY nome;


Comando que seleciona linhas(mostra o conteudo de nome e de carga)
### SELECT nome, carga FROM cursos
### WHERE ano = '2016' 
### ORDER BY nome;

-- selecionando linhas(mostra o conteudo de nome, descrição e carga)
### SELECT nome, descricao, carga FROM cursos
### WHERE ano = '2016' 
### ORDER BY nome;

-- selecionando linhas(mostra o conteudo de nome e carga)
### SELECT nome, descricao FROM cursos
### WHERE ano <= '2016' 
### ORDER BY nome;

-- selecionando intervalos(mostra o conteudo de nome e ano)
### SELECT nome, ano FROM cursos
### WHERE ano between 2014 and 2016; 

-- selecionando intervalos(mostra o conteudo de nome e ano(ano decrescente e nome crescente))
### SELECT nome, ano FROM cursos
### WHERE ano between 2014 and 2016
### ORDER BY ano desc, nome; 

-- selecionando intervalos(mostra o conteudo de nome e ano())
### SELECT nome, descricao, ano FROM cursos
### WHERE ano in (2014, 2016) 
### ORDER BY ano; 

-- combinando testes(Mostra os cursos que tem carga maior que 35 e totaulas seja menor que 30.())
### SELECT nome, carga, totaulas FROM cursos
### WHERE carga > 35 and totaulas < 30 
### ORDER BY ano;

-- combinando testes(Mostra os cursos que tem carga maior que 35 e totaulas seja menor que 30.())
### SELECT * FROM cursos -- todos os campos
### WHERE carga > 35 and totaulas < 30 
### ORDER BY ano;


### 12 - SELECT (Parte 2).
-- mostranto todos os cursos que começam com a letra 'p'. 
### SELECT * FROM cursos
### WHERE nome LIKE 'p%';

-- mostranto todos os cursos que começam com a letra 'a'. 
### SELECT * FROM cursos
### WHERE nome LIKE 'a%';

-- mostranto todos os cursos que terminam com a letra 'a'. 
### SELECT * FROM cursos
### WHERE nome LIKE '%a'; 

-- mostranto todos os cursos(letra 'a' em qualquer lugar). 
### SELECT * FROM cursos
### WHERE nome LIKE '%a%'; 

-- mostranto todos os cursos(letra 'a' - não tem a em lugar nenhum). no campo nome
### SELECT * FROM cursos
### WHERE nome NOT LIKE '%a%'; 

-- mudando o conteudo da tabela cursos
### WHERE cursos SET nome = 'PáOO' WHERE idcurso = '9';

-- ira buscar os cursos que começem com PH e terminem com P
### SELECT * FROM cursos
### WHERE nome LIKE 'ph%p';

-- ira buscar os cursos que começem com PH e terminem com P e mais alguma coisa
### SELECT * FROM cursos
### WHERE nome LIKE 'ph%p%';

-- ira buscar os cursos que começem com PH e terminem com P e um caractere(letra ou numero)
### SELECT * FROM cursos
### WHERE nome LIKE 'ph%p_';

-- pesquisando o nome de uma pessoa na tabela humanos. 
### SELECT * FROM humanos
### WHERE nome LIKE '%silva%';

-- pesquisando o nome de uma pessoa na tabela humanos. 
### SELECT * FROM humanos
### WHERE nome LIKE '%_silva%';

-- pesquisando o nome de uma pessoa na tabela humanos. (DANIEL)
### SELECT * FROM humanos
### WHERE nome LIKE '%daniel%';

-- mostrando todo o conteudo da tabela humanos.
### SELECT * FROM humanos;

-- para saber a nacionalidade dos humanos
### SELECT nacionalidade FROM humanos;

-- consulta da nacionalidade dos humanos, ocorrencias repetidas não iram aparacer
### SELECT distinct nacionalidade FROM humanos;

-- consulta da nacionalidade dos humanos, ocorrencias repetidas não iram aparacer
### SELECT distinct nacionalidade FROM humanos
### ORDER BY nacionalidade; 

-- mostrando as carga horarios dos cursos sem repetir horario
### SELECT distinct carga FROM cursos
### ORDER BY carga;

-- contando quantos cadastro estao armazenado
### SELECT count(*) FROM cursos;

-- mostrando os cursos que tem carga hotarioa acima de 40 horas
### SELECT * FROM cursos WHERE carga > 40;

-- conta quantos cursos tem mais de 40 hrs carga horaria( função de agregação ) 
### SELECT count(*) FROM cursos WHERE carga > 40; 

-- mostra todas as cargas dos cursos ordenando crescentemente
### SELECT * FROM cursos ORDER BY carga;

-- mostra a maior carga de todos os cursos registrados no BD 
### SELECT max(carga) FROM cursos;

-- ira mostrar os curso de 2016
### SELECT * FROM cursos WHERE ano = '2016';

-- ira mostrar o curso que teve maior numero de aulas
### SELECT max(totaulas) FROM cursos WHERE ano = '2016';

-- ira mostrar o curso que teve menor numero de aulas
### SELECT min(totaulas) FROM cursos WHERE ano = '2016';

-- ira mostrar o curso que teve menor numero de aulas
### SELECT nome, min(totaulas) FROM cursos WHERE ano = '2016';

-- ira somar todas as horas de totaualas do ano de 2016
### SELECT sum(totaulas) FROM cursos WHERE ano = '2016'; 

-- ira tirar a media todas as horas de totaualas do ano de 2016
### SELECT avg(totaulas) FROM cursos WHERE ano = '2016'; 


### -- LISTA DE EXERCICIOS AULA 12
### USE cadastro;
### SELECT * FROM humanos;


-- 1 - UMA LISTA COM O NOME DE TODAS AS HUMANOS
### SELECT nome FROM humanos WHERE sexo = 'F' ORDER BY nome;

-- 2 - UMA LISTA COM OS DADOS DE TODOS AQUELES QUE NASCERAM ENTRE 1/JAN/2000 E 31/DEZ/2015
### SELECT nascimento FROM humanos WHERE nascimento BETWEEN '2000-01-01' AND '2015-12-31';

-- 3 - UMA LISTA COM O NOME DE TODOS OS HOMENS QUE TRABALHAM COMO PROGRAMADORES
### SELECT nome, profissao FROM humanos WHERE sexo = 'M' AND profissao = 'Programador' ORDER BY nome;

-- 4 - UMA LISTAS COM OS DADOS DE TODAS AS MULHERES QUE NASCERAM NO BRASIL E QUE TEM SEU NOME INICIADO COM A LETRA J
### SELECT * FROM humanos WHERE sexo ='F' AND nacionalidade ='Brasil' AND nome LIKE 'J%' ORDER BY nome;

-- 5 - UMA LISTA COM O NOME E NACIONALIDADE DE TODOS OS HOMENS QUE TEM SILVA NO NOME, NÃO NASCERAM NO BRASIL E PESAM MENOS DE 100 KG
### SELECT nome, nacionalidade FROM humanos WHERE sexo = 'M' AND nome LIKE '%_silva%' AND nacionalidade != 'brasil' AND peso < '100' ORDER BY nome;

-- 6 - QUAL E A MAIOR ALTURA ENTRE OS HUMANOS QUE MORAM NO BRASIL
### SELECT max(altura) FROM humanos WHERE sexo='M' AND nacionalidade='Brasil' ORDER BY nome;

-- 7 - QUAL E A MEDIA DE PESO DOS HUMANOS CADASTRADOS
### SELECT avg(peso) FROM humanos;

-- 8 - QUAL E O MENOR PESO ENTRE AS Humanos MULHERES QUE NASCERAM FORA DO BRASIL E ENTRE 01/JAN/1990 E 31/DEZ/2000
### SELECT min(peso) FROM humanos WHERE sexo='F' AND nacionalidade !='Brasil' AND nascimento BETWEEN '1990-01-01' AND '2000-12-31';

-- 9 - QUANTOS HUMANOS MULHERES TEM MAIS DE 1.90M DE ALTURA
### SELECT count(altura) FROM humanos WHERE sexo='F' and altura > '1.90';



### 13 - SELECT (Parte 3)
-- para agrupar e totalizar o numero de cada grupo
### SELECT totaulas, count(*) from cursos
### GROUP BY totaulas
### ORDER BY totaulas;

-- ira mostrar a quantidade de veses que o registro com 30 hrs se repete(total 6 cursos com 30 hrs)
### SELECT * FROM cursos where totaulas = 30;

-- ira mostrar a quantidade de veses que o registro com 12 hrs se repete(total 5 cursos com 12 hrs)
### SELECT * FROM cursos where totaulas = 12;

-- ira selecionar onde o total de aulas seja maior que 30
### SELECT * FROM cursos where totaulas = 30;

-- ira selecionar 
### SELECT carga from cursos where totaulas = 30
### GROUP BY carga;

-- ira selecionar 
### SELECT carga, count(nome) from cursos where totaulas = 30
### GROUP BY carga;

### SELECT * FROM cursos where totaulas = 30;

-- ira mostrar o ano e contar quantos anos de cada se repete
### SELECT ano, count(*) from cursos
### GROUP BY ano
### ORDER BY count(*);  -- desc do maior para o menor

-- ira mostrar quem tiver o count ano maior que 5 ou igual, e contar quantos anos de cada se repete(
### SELECT ano, count(*) from cursos
### GROUP BY ano
### HAVING count(ano) >= 5
### ORDER BY count(*);  

### SELECT ano, count(*) from cursos
### WHERE totaulas > 30
### GROUP BY ano
### HAVING ano > 2013
### ORDER BY count(*) desc;  

-- ira mostra a media de horas dos cursos
### SELECT avg(carga) from cursos;

-- ira mostrar os cursos acima de 2015(agrupados por carga)
### SELECT carga, count(*) from cursos 
### WHERE ano > 2015
### GROUP BY carga;


-- ira mostrar os cursos acima de 2015(agrupados por carga) acima da media
### SELECT carga, count(*) from cursos 
### WHERE ano > 2015
### GROUP BY carga 
### HAVING carga > (select avg(carga) from cursos);

-- EXERCICIOS AULA 13
### USE cadastro;
### SELECT * FROM humanos;

-- 1 - UMA LISTA COM AS PROFISSOES DOS HUMANOS E SEUS RESPECTIVOS QUANTITATIVOS
### SELECT profissao, count(*) from humanos
### GROUP BY profissao
### ORDER BY profissao;

-- 2 - QUANTOS HUMANOS HOMENS E QUANTAS MULHERES NASCERAM AOPS 01-JAM-2005
### SELECT sexo, count(*)from humanos
### WHERE nascimento > '2005-01-01'
### GROUP BY sexo;

-- 3 -- UMA LISTA COM OS HUMANOS QUE NASCERAM FORA DO BRASIL, MOSTRANDO O PAIS DE ORIGEM E O TOTAL DE PESSOAS
-- NASCIDAS LA. SO NOS INTERESSAM OS PAISES QUE TIVEREM MAIS DE 3 HUMANOS COM ESSA NACIONALIDADE
### SELECT nacionalidade, count(*) from humanos
### WHERE nacionalidade != 'Brasil'
### GROUP BY nacionalidade
### HAVING count(nacionalidade)>'3';

-- 4 - UMA LISTA AGRUPADA PELA ALTURA DOS HUMANOS, MOSTRANDO QUANTAS PESSOAS PESAM MAIS DE 100KG E QUE ESTÃO 
-- ACIMA DA MEDIA DE ALTUA DE TODOS OS HUMANOS
### SELECT avg(altura) from humanos;

### SELECT altura, count(*) from humanos
### WHERE peso > '100'
### GROUP BY altura
### HAVING altura > (select avg(altura) from humanos);



### AULA 15 - CHAVES ESTRANGEIRAS E JOIN
-- 15 - Chaves Estrangeiras e JOIN
### USE cadastro;

-- mostra a estrutura tabela humanos
### DESCRIBE humanos;

-- adicionando campo
### ALTER TABLE humanos
### ADD COLUMN cursopreferido INT;

-- adicionando chave estrangeira e fazendo a ligação entre cursopreferido e idcurso.
### ALTER TABLE humanos
### ADD FOREIGN KEY (cursopreferido)
### REFERENCES cursos (idcurso);

-- mostrar toda a tabela em ordem alfabetica
### SELECT * FROM humanos ORDER BY nome;

-- mostrar toda a tabela em ordem alfabetica
### SELECT * FROM cursos;

-- adicionando curso preferido
### UPDATE humanos SET cursopreferido = '5' WHERE id = '62';

-- ERRO de integridade referencial (pois ja existe uma relação entre o curso 6 e humanos.
### DELETE FROM cursos WHERE idcurso = '6';


-- integridade referencial (ira apagar pos-não existe relação.
### DELETE FROM cursos WHERE idcurso = '28';

-- mostrando o nome do curso preferido
### SELECT nome, cursopreferido FROM humanos;

-- Trabalhar com junções - Juntando a tabela humanos com a tabela cursos.
### SELECT humanos.nome, cursos.nome, cursos.ano 
### FROM humanos JOIN cursos
### ON cursos.idcurso = humanos.cursopreferido;  


### SELECT * FROM humanos order by nome;
 

 -- Trabalhar com junções - Juntando a tabela humanos com a tabela cursos parte 2.
### SELECT humanos.nome, cursos.nome, cursos.ano 
### FROM humanos INNER JOIN cursos  
### ON cursos.idcurso = humanos.cursopreferido 
### ORDER BY humanos.nome; 

 -- Trabalhar com junções - Juntando a tabela humanos com a tabela cursos parte 3
 -- APELIDOS DE COLUNAS(AS).
### SELECT g.nome, c.nome, c.ano 
### FROM humanos AS g INNER JOIN cursos AS c
### ON c.idcurso = g.cursopreferido 
### ORDER BY g.nome; 

-- EXEMPLO OUTER JOIN
### SELECT g.nome, c.nome, c.ano 
### FROM humanos AS g LEFT OUTER JOIN cursos AS c
### ON c.idcurso = g.cursopreferido;

-- EXEMPLO OUTER JOIN dando preferencia para a tabela do lado direito (cursos)
### SELECT g.nome, c.nome, c.ano 
### FROM humanos AS g RIGHT OUTER JOIN cursos AS c
### ON c.idcurso = g.cursopreferido;

-- AULA 16 INNER JOIN
### USE cadastro;

-- RELACIONAMENTO MUITOS PARA MUITOS
-- criando uma nova tabela
### CREATE TABLE humano_assiste_curso (
	id int not null auto_increment,
    data date, 
    idhumano int,
    idcurso int,
    primary key(id),
    foreign key(idgahumano) references humanos(id),
    foreign key(idcurso) references cursos(idcurso)
### )default charset=utf8;

-- inserindo dados na tabela
### insert into humano_assiste_curso value
(default, '2014-03-01', '1','2');

-- mostra todo o conteudo da tabela
### SELECT * FROM humano_assiste_curso;

-- listagem nome do humanos e o nome do curso
### SELECT * FROM humanos g
### JOIN humano_assiste_curso a
### ON g.id = a.idhumano;

-- exemplo 2
### SELECT g.nome, idcurso from humanos g
### JOIN humano_assiste_curso a
### ON g.id = a.idhumano ORDER BY g.nome;

-- exemplo 3 deu erro!!!
### SELECT g.nome, c.nome from humanos g
### JOIN humano_assiste_curso a
### ON g.id = a.idhumano
### JOIN curso c 
### ON c.idcurso = a.idcurso
### ORDER BY g.nome;














-- apaga todo o banco de dadaos(CUIDADO!)
### drop database cadastro;
