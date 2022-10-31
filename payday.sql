-----QUESTÃO 26, dia de pagamento

CREATE TABLE loan (
	id integer PRIMARY KEY,
	name varchar,
	value NUMERIC,
	payday timestamp
);

INSERT INTO loan (id,name,value,payday)
VALUES 
(1,'Cristian Ghyprievy',3000.50,'2017-10-19'),
(2,'John Serial',10000,'2017-10-10'),
(3,'Michael Seven',5000.40,'2017-10-17'),
(4,'Joana Cabel',2000,'2017-10-05'),
(5,'Miguel Santos',4050,'2017-10-20');

 

SELECT l.name,CAST(EXTRACT(day FROM payday)AS integer) AS day
FROM loan l;

DROP TABLE loan;
