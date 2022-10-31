-----QUESTÃO 23, máscara de cpf

CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	street CHARACTER varying(255),
	city CHARACTER varying(255),
	state char(2),
	credit_limit numeric
);


INSERT INTO customers (id,name,street,city,state,credit_limit)
VALUES 
(1,'Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
(2,'Cecilia OLivia Rodrigues','Rua Sizuka Usuy','Cianorte','PR',3170),
(3,'Augusto Fernando Carlos Eduardo Cardoso','Rua Baldomiro Koerich','Palhoça','SC',1067),
(4,'Nicolas Diogo Cardoso','Acesso Um','Porto Alegre','RS',475),
(5,'Sabrina Heloisa Gabriela Barros','Rua Engenheiro Tito Marques Fernandes','Porto Alegre','RS',4312),
(6,'Joaquim Diego Lorenzo Araújo','Rua Vitorino','Novo Hamburgo','RS',2314);

CREATE TABLE natural_person (
	id_customers NUMERIC REFERENCES customers(id),
	cpf char (14)
);

INSERT INTO natural_person (id_customers,cpf)
VALUES 
(1,26774287840),
(2,97918477200);

SELECT  substring(cpf, 1, 3) || '.' ||
		substring(cpf, 4, 3) || '.' || 
		substring(cpf, 7, 3) || '-' ||
		substring(cpf,10) AS cpf
		FROM natural_person;
	
DROP table natural_person;
DROP TABLE customers;