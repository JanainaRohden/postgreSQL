------QUESTÃO 25, concurso

CREATE TABLE candidate(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO candidate (id,name)
VALUES 
(1,'Michael P Cannon'),
(2,'Barbra J Cable'),
(3,'Ronald D Jones'),
(4,'Timothy K Fitzsimmons'),
(5,'Ivory B Morrison'),
(6,'Sheila R Denis'),
(7,'Edward C Durgan'),
(8,'Willian K Spencer'),
(9,'Donna D Pursley'),
(10,'Ann C Davis');

CREATE TABLE score(
	candidate_id integer REFERENCES candidate(id),
	math NUMERIC,
	SPECIFIC NUMERIC,
	project_plan numeric
);

INSERT INTO score (candidate_id,math,SPECIFIC,project_plan)
VALUES 
(1,76,58,21),
(2,4,5,22),
(3,15,59,12),
(4,41,42,99),
(5,22,90,9),
(6,82,77,15),
(7,82,99,56),
(8,11,4,22),
(9,16,29,94),
(10,1,7,59);

SELECT c.name,trunc(((math*2)+(SPECIFIC*3)+(project_plan*5))/10,2) AS Avg
FROM candidate c
INNER JOIN score s 
ON c.id = s.candidate_id
ORDER BY avg DESC;


DROP TABLE score;
DROP TABLE candidate; 
