-----QUESTÃO 29, o multiverso de richard

CREATE TABLE dimensions(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO dimensions(id,name)
VALUES 
(1,'C774'),
(2,'C784'),
(3,'C794'),
(4,'C824'),
(5,'C875');

CREATE TABLE LIFE_REGISTRY(
	ID integer PRIMARY KEY,
	name varchar,
	omega NUMERIC,
	dimensions_id integer REFERENCES dimensions(id)
);

INSERT INTO life_registry (id,name,omega,dimensions_id)
VALUES 
(1,'Richard Postman',5.6,2),
(2,'Simple Jelly',1.4,1),
(3,'Richard Gran Master',2.5,1),
(4,'Richard Turing',6.4,4),
(5,'Richard Strall',1.0,3);

SELECT l.name,trunc(omega*1.618,3) AS Fator_N
FROM dimensions d
INNER JOIN life_registry l
ON d.id = l.dimensions_id
WHERE l.name LIKE 'Richard%' AND (d.name = 'C774' OR d.name = 'C875')
ORDER BY omega;

