------QUESTÃO 38, quanto ganha um médico?

CREATE TABLE doctors(
	id integer PRIMARY KEY,
	name varchar(50)
);

INSERT INTO doctors (id,name)
VALUES 
(1,'Arlino'),
(2,'Tiago'),
(3,'Amanda'),
(4,'Wellington');

CREATE TABLE works_shifts(
	id integer PRIMARY KEY,
	name varchar(50),
	bonus numeric
);

INSERT INTO works_shifts(id,name,bonus)
VALUES 
(1,'nocturnal',15),
(2,'afternoon',2),
(3,'day',1);

CREATE TABLE attendances(
	id integer PRIMARY KEY,
	id_doctor integer REFERENCES doctors(id),
	hours integer,
	id_work_shift integer REFERENCES works_shifts(id)
);

INSERT INTO attendances (id,id_doctor,hours,id_work_shift)
VALUES 
(1,1,5,1),
(2,3,2,1),
(3,3,3,2),
(4,2,2,3),
(5,1,5,3),
(6,4,1,3),
(7,4,2,1),
(8,3,2,2),
(9,2,4,2);

SELECT d.name, round(sum((( hours * 150 )+(( hours * 150 ) * (w.bonus/100)))),1) AS salary
FROM doctors d
JOIN attendances a
ON d.id = a.id_doctor
JOIN works_shifts w
ON w.id = a.id_work_shift
GROUP BY d.name
ORDER BY salary desc;
