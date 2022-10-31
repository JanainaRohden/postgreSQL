-----QUESTÃO 31, senhas


CREATE TABLE account(
	id integer PRIMARY KEY,
	name varchar,
	login varchar,
	PASSWORD varchar
);

INSERT INTO account (id,name,login,password)
VALUES 
(1,'Joyce P. Parry','Promeraw','noh10ozei'),
(2,'Michael T. Gonzalez','Phers1942','Iath3see9bi'),
(3,'Heather W. Lawless','Hankicht','diShono4'),
(4,'Otis C. Hitt','Conalothe','zooFohH7w'),
(5,'Roger N. Brownfield','Worseente','fah7ohNg');


SELECT id,PASSWORD,md5(password) 
FROM account 


DROP TABLE account;
