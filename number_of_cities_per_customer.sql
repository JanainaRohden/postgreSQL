-----QUESTÃO 22, quantidades de cidades por clientes
 

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

SELECT count(DISTINCT(city)) 
FROM customers; 


DROP TABLE customers;