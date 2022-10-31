-----QUESTÃO 13, expandindo o negócio

CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar
); 


INSERT INTO customers (id,name,street,city)
VALUES 
(1,'Giovanna Gonçalves Oliveira','Rua Mato Grosso','Canoas'),
(2,'Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
(3,'Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
(4,'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Uberlândia'),
(5,'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(6,'Diogo Melo Dias','Rua Duzentos e Cinquenta','Varzea Grande');

SELECT DISTINCT city
FROM customers; 

DROP TABLE customers;
