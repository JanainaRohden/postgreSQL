-----QUESTÃO 24, advogados


CREATE TABLE lawyers(
	register integer PRIMARY KEY,
	name varchar,
	customers_number integer
);

INSERT INTO lawyers (register,name,customers_number)
VALUES 
(1648,'Marty M. Harrison',5),
(2427,'Jonathan J. Blevins',15),
(3365,'Chelsey D. Sanders',20),
(4153,'Dorothy W. Ford',16),
(5525,'Penny J. Cormier',6);



 
SELECT l.name,l.customers_number 
FROM lawyers l
WHERE customers_number=(
	SELECT max(customers_number) FROM lawyers l
)
UNION ALL 
SELECT l.name,l.customers_number 
FROM lawyers l
WHERE customers_number=(
	SELECT min(customers_number) FROM lawyers l
)
UNION ALL
SELECT 'Average' AS name, trunc(avg(customers_number),0) AS customers_number
FROM lawyers l;

DROP TABLE lawyers;