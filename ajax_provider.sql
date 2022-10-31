-----QUESTÃO 15, fornecedor ajax sa


CREATE TABLE providers (
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	street CHARACTER varying(255),
	city CHARACTER varying(255),
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Ajax SA','Presidente Castelo Branco','Porto Alegre','RS'),
(2,'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(3,'South Chairs','Av Moinho','Santa Maria','RS'),
(4,'Elon Electro','Apolo','São Paulo','SP'),
(5,'Mike Electro','Pedro da Cunha','Curitiba','PR');

CREATE TABLE PRODUCTS (
	ID NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	amount NUMERIC,
	price NUMERIC,
	id_providers NUMERIC REFERENCES providers(id)
);

INSERT INTO products (id,name,amount,price,id_providers)
VALUES 
(1,'Blue Chair',30,300.00,5),
(2,'Red Chair',50,2150.00,1),
(3,'Disney Wardrobe',400,829.50,4),
(4,'Blue Toaster',20,9.90,3),
(5,'Solar Panel',30,3000.25,4);


SELECT p.name,pr.name
FROM products p 
INNER JOIN providers pr 
ON p.id_providers = pr.id 
WHERE pr.name like 'Ajax SA';


DROP TABLE products;
DROP TABLE providers; 