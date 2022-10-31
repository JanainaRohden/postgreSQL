------QUESTÃO 33, virus


CREATE TABLE virus(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO virus(id,name)
VALUES 
(1,'H1RT'),
(2,'H7H1'),
(3,'HUN8'),
(4,'XH1HX'),
(5,'XXXX');

SELECT REPLACE(NAME,'H1','X') AS NAME
FROM VIRUS

DROP TABLE VIRUS;