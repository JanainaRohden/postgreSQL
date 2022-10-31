----QUESTÃO 14, nenhuma locação

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
(4,'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Apucarana'),
(5,'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(6,'Diogo Melo Dias','Rua Duzentos e Cinquenta','Varzea Grande');

CREATE TABLE locations (
	id NUMERIC PRIMARY KEY,
	locations_date date,
	id_customers NUMERIC REFERENCES customers (id)
);

INSERT INTO locations (id,locations_date,id_customers)
VALUES 
(1,'2016-10-09',3),
(2,'2016-09-02',1),
(3,'2016-08-02',4),
(4,'2016-09-02',2),
(5,'2016-03-02',6),
(6,'2016-04-04',4);

SELECT 
	c.id,c.name
FROM 
	customers c  
WHERE 
	c.id NOT IN (SELECT l.id_customers FROM locations l)
ORDER BY id;


SELECT 
	c.id,c.name
FROM 
	customers c LEFT JOIN locations l 
	ON c.id = l.id_customers
WHERE 
	l.id_customers IS NULL 
ORDER BY id;

DROP TABLE customers;
DROP TABLE locations;
