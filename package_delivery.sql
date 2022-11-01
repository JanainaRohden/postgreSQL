-----QUESTÃO 43, entrega de pacotes


CREATE TABLE users(
	id NUMERIC PRIMARY KEY,
	name varchar(50),
	TYPE char,
	adress varchar(50)
);

INSERT INTO users(id,name,TYPE,adress)
VALUES 
(1,'Edgar Codd',NULL,'England'),
(2,'Peter Chen',NULL,'Taiwan'),
(3,'Jim Gray',NULL,'United States'),
(4,'Elizabeth O Nell',NULL,'United States');

CREATE TABLE packages(
	id_package NUMERIC PRIMARY KEY,
	id_user_sender integer REFERENCES users(id),
	id_user_receiver integer REFERENCES users(id),
	color varchar(50),
	YEAR integer
);

INSERT INTO packages (id_package,id_user_sender,id_user_receiver,color,year)
VALUES 
(1,1,2,'blue',2015),
(2,1,3,'blue',2019),
(3,2,4,'red',2019),
(4,2,1,'green',2018),
(5,3,4,'red',2015),
(6,4,3,'blue',2019);


SELECT
	p.YEAR,
	u.name AS sender,
	u2.name AS receiver
FROM
	users u
	JOIN packages p 
	ON u.id = p.id_user_sender
	JOIN users u2
	ON u2.id = p.id_user_receiver
wheRE 
	(p.color = 'blue' OR p.YEAR = 2015)
	and (u.adress != 'Taiwan' and u2.adress != 'Taiwan')
ORDER BY YEAR desc;


DROP TABLE packages;
DROP TABLE users;