------QUESTÃO 30, quantidade de caracteres

CREATE TABLE people(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO people (id,name)
VALUES 
(1,'Karen'),
(2,'Manuel'),
(3,'Ygor'),
(4,'Valentine'),
(5,'Jo');

SELECT p.name,char_length(NAME) AS length
FROM people p
ORDER BY length desc;


DROP TABLE people;

