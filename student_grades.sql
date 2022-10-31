-----QUESTÃO 28, notas dos alunos


CREATE TABLE students (
	id integer PRIMARY KEY,
	name varchar,
	grade numeric
);

INSERT INTO students (id,name,grade)
VALUES 
(1,'Terry B. Padilha',7.3),
(2,'William S. Ray',0.6),
(3,'Barbara A. Gongora',5.2),
(4,'Julie B. Manzer',6.7),
(5,'Tereza J. Axtell',4.6),
(6,'Ben M. Dantzler',9.6);

  
 SELECT 'Approved: ' || s.name AS name,s.grade
 FROM students s
 WHERE grade >= 7
 ORDER BY grade DESC;
 
 
DROP TABLE students;
