-- CRIAÇÃO DO BANCO DE DADOS CADASTRO
create database cadastro
default character set utf8
default collate utf8_general_ci;

-- use a o banco de dados cadastro
use cadastro;

-- criação da tabela pessoas
create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
)default charset = utf8;

-- mostra a descrição da tabela pessoas
describe pessoas;

-- adicionando uma coluna na tabela pessoas (depois do campo nome)
alter table pessoas
add column profissao varchar(10) after nome;

-- INSERINDO DADOS NA TABELA (PESSOAS)
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Ana','1975-12-22','F','52.3','1.45','EUA'),
(default, 'Pedro','2000-07-15','M','53.3','1.45','Brasil'),
(default, 'Maria','1999-05-30','F','75.9','1.70','Portugal'),
(default, 'Daniel','1985-08-13','M','65.3','1.65','Brasil'),
(default, 'Yaminy','1995-07-10','F','53.3','1.45','Japão'),
(default, 'Layna','1987-03-30','F','75.9','1.70','Italia'),
(default, 'Meverick','1978-07-13','M','65.3','1.65','EUA'),
(default, 'Sheulen','1995-07-10','F','53.3','1.45','Venezuela'),
(default, 'Amanda','1987-03-30','F','75.9','1.70','Canada');

-- para ver o conteudo da tabela pessoas
select * from pessoas;

-- modificando o nome da tabela (pessoas para gafanhotos)
alter table pessoas
rename to gafanhotos;

-- criação da tabela cursos(cria a tabela se ela não existir)
create table if not exists cursos(
nome varchar(30) not null unique,
descrição text,
carga int unsigned,
totaulas int,
ano year default '2016'
)default charset = utf8;

-- adicionando a chave primaria na tabela cursos
alter table cursos
add column idcurso int first;

alter table cursos
add primary key(idcurso);

-- Manipulando registros da tabela cursos (Dados)
insert into cursos values
('1','HTML4','Curso de HTML5', '40','37','2014'), 
('2','Algoritmos','Lógica de Programação','20','15','2014'), 
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'), 
('4','PgP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'), 
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'), 
('10','Youtuber','Gerar polêmica e ganhar inscritos','5','2','2018');

-- mostra a descrição da tabela cursos
describe cursos;

-- para ver o conteudo da tabela cursos
select * from cursos;


-- modificando linhas encorretas (conteudo da tabela cursos)
update cursos
set nome = 'HTML5'
where idcurso = '1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = '5'
limit 1;

-- removendo uma linha
delete from cursos
where idcurso='8';

delete from cursos
where ano='2018'
limit 2;

-- 11 - SELECT (Parte 1)
-- mostra o conteudo da tabela gafanhotos
select * from gafanhotos;

-- mostra o conteudo da tabela cursos
select * from cursos
order by nome; -- em ordem alfabetica(cima pra baixo)(asc ou sem nada)

-- mostra o conteudo da tabela cursos(exemplo2)
select * from cursos
order by nome desc; -- em ordem alfabetica(baixo para cima)

-- mostrando o conteudo selecionado colunas(nome, carga, ano)
select nome, carga, ano from cursos
order by nome;

-- mostrando o conteudo selecionado colunas em outra ordem (ano, nome, carga)
select ano, nome, carga from cursos
order by nome;

-- mostrando o conteudo selecionado colunas ordenado por ano e por nome (ano, nome, carga)
select ano, nome, carga from cursos
order by ano, nome;

-- selecionando linhas(mostra o conteudo em que o ano e 2016 em ordem alfabetica)
select * from cursos
where ano = '2016' 
order by nome;

-- selecionando linhas(mostra o conteudo de nome e de carga)
select nome, carga from cursos
where ano = '2016' 
order by nome;

-- selecionando linhas(mostra o conteudo de nome, descrição e carga)
select nome, descricao, carga from cursos
where ano = '2016' 
order by nome;

-- selecionando linhas(mostra o conteudo de nome e carga)
select nome, descricao from cursos
where ano <= '2016' -- ano menor ou igual a 2016
order by nome;

-- selecionando intervalos(mostra o conteudo de nome e ano)
select nome, ano from cursos
where ano between 2014 and 2016; 

-- selecionando intervalos(mostra o conteudo de nome e ano(ano decrescente e nome crescente))
select nome, ano from cursos
where ano between 2014 and 2016
order by ano desc, nome; 

-- selecionando intervalos(mostra o conteudo de nome e ano())
select nome, descricao, ano from cursos
where ano in (2014, 2016) -- onde o ano esteja entre esses valoes
order by ano; 

-- combinando testes(Mostra os cursos que tem carga maior que 35 e totaulas seja menor que 30.())
select nome, carga, totaulas from cursos
where carga > 35 and totaulas < 30 -- onde o ano esteja entre esses valoes
order by ano;

-- combinando testes(Mostra os cursos que tem carga maior que 35 e totaulas seja menor que 30.())
select * from cursos -- todos os campos
where carga > 35 and totaulas < 30 -- onde o ano esteja entre esses valoes
order by ano;

-- 12 - SELECT (Parte 2).
-- mostranto todos os cursos que começam com a letra 'p'. 
select * from cursos
where nome like 'p%';

-- mostranto todos os cursos que começam com a letra 'a'. 
select * from cursos
where nome like 'a%';

-- mostranto todos os cursos que terminam com a letra 'a'. 
select * from cursos
where nome like '%a';  -- coringa na frente da letra a

-- mostranto todos os cursos(letra 'a' em qualquer lugar). 
select * from cursos
where nome like '%a%';  -- em qualquer posição

-- mostranto todos os cursos(letra 'a' - não tem a em lugar nenhum). no campo nome
select * from cursos
where nome not like '%a%';  -- not (não tem a letra a em lugar nenhum da pesquisa)

-- mudando o conteudo da tabela cursos
update cursos set nome = 'PáOO' where idcurso = '9';

-- ira buscar os cursos que começem com PH e terminem com P
select * from cursos
where nome like 'ph%p';

-- ira buscar os cursos que começem com PH e terminem com P e mais alguma coisa
select * from cursos
where nome like 'ph%p%';

-- ira buscar os cursos que começem com PH e terminem com P e um caractere(letra ou numero)
select * from cursos
where nome like 'ph%p_';

-- pesquisando o nome de uma pessoa na tabela gafanhotos. 
select * from gafanhotos
where nome like '%silva%';

-- pesquisando o nome de uma pessoa na tabela gafanhotos. 
select * from gafanhotos
where nome like '%_silva%'; -- pessoas com o sobrenome silva

-- pesquisando o nome de uma pessoa na tabela gafanhotos. (DANIEL)
select * from gafanhotos
where nome like '%daniel%';

-- mostrando todo o conteudo da tabela gafanhotos.
select * from gafanhotos;

-- para saber a nacionalidade dos gafanhotos
select nacionalidade from gafanhotos;

-- consulta da nacionalidade dos gafanhotos, ocorrencias repetidas não iram aparacer
select distinct nacionalidade from gafanhotos;

-- consulta da nacionalidade dos gafanhotos, ocorrencias repetidas não iram aparacer
select distinct nacionalidade from gafanhotos
order by nacionalidade;  -- em ordem alfabetica

-- mostrando as carga horarios dos cursos sem repetir horario
select distinct carga from cursos
order by carga;

-- contando quantos cadastro estao armazenado
select count(*) from cursos;

-- mostrando os cursos que tem carga hotarioa acima de 40 horas
select * from cursos where carga > 40;

-- conta quantos cursos tem mais de 40 hrs carga horaria( função de agregação ) 
select count(*) from cursos where carga > 40;  -- conta

-- mostra todas as cargas dos cursos ordenando crescentemente
select * from cursos order by carga;

-- mostra a maior carga de todos os cursos registrados no BD 
select max(carga) from cursos;

-- ira mostrar os curso de 2016
select * from cursos where ano = '2016';

-- ira mostrar o curso que teve maior numero de aulas
select max(totaulas) from cursos where ano = '2016';

-- ira mostrar o curso que teve menor numero de aulas
select min(totaulas) from cursos where ano = '2016';

-- ira mostrar o curso que teve menor numero de aulas
select nome, min(totaulas) from cursos where ano = '2016';  -- para saber o nome

-- ira somar todas as horas de totaualas do ano de 2016
select sum(totaulas) from cursos where ano = '2016'; 

-- ira tirar a media todas as horas de totaualas do ano de 2016
select avg(totaulas) from cursos where ano = '2016'; 

-- LISTA DE EXERCICIOS AULA 12
use cadastro;

select * from gafanhotos;

-- 1 - UMA LISTA COM O NOME DE TODAS AS GAFANHOTAS
select nome from gafanhotos where sexo = 'F' order by nome;

-- 2 - UMA LISTA COM OS DADOS DE TODOS AQUELES QUE NASCERAM ENTRE 1/JAN/2000 E 31/DEZ/2015
select nascimento from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';

-- 3 - UMA LISTA COM O NOME DE TODOS OS HOMENS QUE TRABALHAM COMO PROGRAMADORES
select nome, profissao from gafanhotos where sexo = 'M' and profissao = 'Programador' order by nome;

-- 4 - UMA LISTAS COM OS DADOS DE TODAS AS MULHERES QUE NASCERAM NO BRASIL E QUE TEM SEU NOME INICIADO COM A LETRA J
select * from gafanhotos where sexo ='F' and nacionalidade ='Brasil' and nome like 'J%' order by nome;

-- 5 - UMA LISTA COM O NOME E NACIONALIDADE DE TODOS OS HOMENS QUE TEM SILVA NO NOME, NÃO NASCERAM NO BRASIL E PESAM MENOS DE 100 KG
select nome, nacionalidade from gafanhotos where sexo = 'M' and nome like '%_silva%' and nacionalidade != 'brasil' and peso < '100' order by nome;

-- 6 - QUAL E A MAIOR ALTURA ENTRE OS GAFANHOTOS QUE MORAM NO BRASIL
select max(altura) from gafanhotos where sexo='M' and nacionalidade='Brasil' order by nome;

-- 7 - QUAL E A MEDIA DE PESO DOS GAFANHOTOS CADASTRADOS
select avg(peso) from gafanhotos;

-- 8 - QUAL E O MENOR PESO ENTRE AS GAFANHOTOS MULHERES QUE NASCERAM FORA DO BRASIL E ENTRE 01/JAN/1990 E 31/DEZ/2000
select min(peso) from gafanhotos where sexo='F' and nacionalidade !='Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- 9 - QUANTOS GAFANHOTOS MULHERES TEM MAIS DE 1.90M DE ALTURA
select count(altura) from gafanhotos where sexo='F' and altura > '1.90';


-- 13 - SELECT (Parte 3)
-- para agrupar e totalizar o numero de cada grupo
select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

-- ira mostrar a quantidade de veses que o registro com 30 hrs se repete(total 6 cursos com 30 hrs)
select * from cursos where totaulas = 30;

-- ira mostrar a quantidade de veses que o registro com 12 hrs se repete(total 5 cursos com 12 hrs)
select * from cursos where totaulas = 12;

-- ira selecionar onde o total de aulas seja maior que 30
select * from cursos where totaulas = 30;

-- ira selecionar 
select carga from cursos where totaulas = 30
group by carga;

-- ira selecionar 
select carga, count(nome) from cursos where totaulas = 30
group by carga;

select * from cursos where totaulas = 30;

-- ira mostrar o ano e contar quantos anos de cada se repete
select ano, count(*) from cursos
group by ano
order by count(*);  -- desc do maior para o menor

-- ira mostrar quem tiver o count ano maior que 5 ou igual, e contar quantos anos de cada se repete(
select ano, count(*) from cursos
group by ano
having count(ano) >= 5
order by count(*);  

select ano, count(*) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*) desc;  

-- ira mostra a media de horas dos cursos
select avg(carga) from cursos;

-- ira mostrar os cursos acima de 2015(agrupados por carga)
select carga, count(*) from cursos 
where ano > 2015
group by carga;


-- ira mostrar os cursos acima de 2015(agrupados por carga) acima da media
select carga, count(*) from cursos 
where ano > 2015
group by carga 
having carga > (select avg(carga) from cursos); -- acima da carga

-- EXERCICIOS AULA 13
use cadastro;
select * from gafanhotos;

-- 1 - UMA LISTA COM AS PROFISSOES DOS GAFANHOTOS E SEUS RESPECTIVOS QUANTITATIVOS
select profissao, count(*) from gafanhotos
group by profissao
order by profissao;

-- 2 - QUANTOS GAFANHOTOS HOMENS E QUANTAS MULHERES NASCERAM AOPS 01-JAM-2005
select sexo, count(*)from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

-- 3 -- UMA LISTA COM OS GAFANHOTOS QUE NASCERAM FORA DO BRASIL, MOSTRANDO O PAIS DE ORIGEM E O TOTAL DE PESSOAS
-- NASCIDAS LA. SO NOS INTERESSAM OS PAISES QUE TIVEREM MAIS DE 3 GAFANHOTOS COM ESSA NACIONALIDADE
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade)>'3';

-- 4 - UMA LISTA AGRUPADA PELA ALTURA DOS GAFANHOTOS, MOSTRANDO QUANTAS PESSOAS PESAM MAIS DE 100KG E QUE ESTÃO 
-- ACIMA DA MEDIA DE ALTUA DE TODOS OS GAFANHOTOS
select avg(altura) from gafanhotos;

select altura, count(*) from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);

-- AULA 15 - CHAVES ESTRANGEIRAS E JOIN
-- 15 - Chaves Estrangeiras e JOIN
use cadastro;

-- mostra a estrutura tabela gafanhoto
describe gafanhotos;

-- adicionando campo
alter table gafanhotos
add column cursopreferido int; -- column e opcional

-- adicionando chave estrangeira e fazendo a ligação entre cursopreferido e idcurso.
alter table gafanhotos
add foreign key (cursopreferido)
references cursos (idcurso);

-- mostrar toda a tabela em ordem alfabetica
select * from gafanhotos order by nome;

-- mostrar toda a tabela em ordem alfabetica
select * from cursos;

-- adicionando curso preferido
update gafanhotos set cursopreferido = '5' where id = '62';

-- ERRO de integridade referencial (pois ja existe uma relação entre o curso 6 e gafanhotos.
delete from cursos where idcurso = '6';


-- integridade referencial (ira apagar pos-não existe relação.
delete from cursos where idcurso = '28';

-- mostrando o nome do curso preferido
select nome, cursopreferido from gafanhotos;

-- Trabalhar com junções - Juntando a tabela gafanhotos com a tabela cursos.
select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos join cursos   -- e preciso filtral (crausula on)
on cursos.idcurso = gafanhotos.cursopreferido;  -- ligação da chave primaria em id e chave estrangeira em cursopreferido

select * from gafanhotos order by nome;

 -- Trabalhar com junções - Juntando a tabela gafanhotos com a tabela cursos parte 2.
select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos inner join cursos  
on cursos.idcurso = gafanhotos.cursopreferido 
order by gafanhotos.nome; 

 -- Trabalhar com junções - Juntando a tabela gafanhotos com a tabela cursos parte 3
 -- APELIDOS DE COLUNAS(AS).
select g.nome, c.nome, c.ano 
from gafanhotos as g inner join cursos as c  -- g e gafanhotos e c e cursos  
on c.idcurso = g.cursopreferido 
order by g.nome; 

-- EXEMPLO OUTER JOIN
select g.nome, c.nome, c.ano 
from gafanhotos as g left outer join cursos as c  -- g e gafanhotos e c e cursos  
on c.idcurso = g.cursopreferido;

-- EXEMPLO OUTER JOIN dando preferencia para a tabela do lado direito (cursos)
select g.nome, c.nome, c.ano 
from gafanhotos as g right outer join cursos as c  -- g e gafanhotos e c e cursos  
on c.idcurso = g.cursopreferido;

-- AULA 16 INNER JOIN
use cadastro;

-- RELACIONAMENTO MUITOS PARA MUITOS
-- criando uma nova tabela
create table gafanhoto_assiste_curso (
	id int not null auto_increment,
    data date, 
    idgafanhoto int,
    idcurso int,
    primary key(id),
    foreign key(idgafanhoto) references gafanhotos(id),
    foreign key(idcurso) references cursos(idcurso)
)default charset=utf8;

-- inserindo dados na tabela
insert into gafanhoto_assiste_curso value
(default, '2014-03-01', '1','2');

-- mostra todo o conteudo da tabela
select * from gafanhoto_assiste_curso;

-- listagem nome do gafanhoto e o nome do curso
select * from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto;

-- exemplo 2
select g.nome, idcurso from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto order by g.nome;

-- exemplo 3 deu erro!!!
select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join curso c 
on c.idcurso = a.idcurso
order by g.nome;














-- apaga todo o banco de dadaos(CUIDADO!)
drop database cadastro;






































