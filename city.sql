-------QUESTÃO 6, cidades em ordem alfabética


CREATE TABLE providers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar,
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Henrique','Av Brasil','Rio de Janeiro','RJ'),
(2,'Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
(3,'Caroline Silva','Av São Paulo','Salvador','BA'),
(4,'Guilerme Staff','Rua Central','Porto Alegre','RS'),
(5,'Isabela Morais','Av Juiz Grande','Curitiba','PR'),
(6,'Franscisco Accer','Av Paulista','São Paulo','SP');

SELECT city 
FROM providers
ORDER BY city;

DROP TABLE providers;