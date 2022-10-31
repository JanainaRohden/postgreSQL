----QUESTÃO 12, locações de setembro

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

CREATE TABLE rentals (
	id NUMERIC PRIMARY KEY,
	rentals_date date,
	id_customers NUMERIC REFERENCES customers (id)
);

INSERT INTO rentals (id,rentals_date,id_customers)
VALUES 
(1,'2016-09-10',3),
(2,'2016-02-09',1),
(3,'2016-02-08',4),
(4,'2016-02-09',2),
(5,'2016-02-03',6),
(6,'2016-04-04',4);

SELECT customers.name,rentals.rentals_date
FROM customers  
INNER JOIN rentals  
ON customers.id = rentals.id_customers
WHERE rentals.rentals_date BETWEEN '2016-09-01' AND '2016-09-30';

DROP TABLE customers;
DROP TABLE rentals;