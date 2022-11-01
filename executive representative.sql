------QUESTÃO 4, representantes executivos


CREATE TABLE providers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar,
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Henrique','Av Brasil','Rio de Janeiro','RJ'),
(2,'Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
(3,'Caroline Silva','Av São Paulo','Salvador','BA'),
(4,'Guilerme Staff','Rua Central','Porto Alegre','RS'),
(5,'Isabela Morais','Av Juiz Grande','Curitiba','PR'),
(6,'Franscisco Accer','Av Paulista','São Paulo','SP');

CREATE TABLE categories (
	id NUMERIC PRIMARY KEY,
	name varchar
);

INSERT INTO categories (id,name)
VALUES 
(1,'old stock'),
(2,'new stock'),
(3,'modern'),
(4,'commercial'),
(5,'recyclable'),
(6,'executive'),
(7,'superior'),
(8,'wood'),
(9,'super luxury'),
(10,'vintage');

CREATE TABLE products (
	id NUMERIC PRIMARY KEY,
	name varchar, 
	amount NUMERIC,
	price NUMERIC, 
	id_providers NUMERIC REFERENCES providers (id),
	id_categories NUMERIC REFERENCES categories (id)
);

INSERT INTO products (id,name,amount,price,id_providers,id_categories)
VALUES 
(1,'Two-doors wardrobe',100,800,6,8),
(2,'Dining Table',1000,560,1,9),
(3,'Towel holder',10000,25.50,5,1),
(4,'Computer desk',350,320.50,4,6),
(5,'Chair',3000,210.64,3,6),
(6,'Single bed',750,460,1,2);

SELECT products.name,providers.name
FROM providers
INNER JOIN products
ON providers.id = products.id_providers 
INNER JOIN categories
ON products.id_categories = categories.id 
WHERE id_categories = 6;

DROP TABLE providers;
DROP TABLE categories;
DROP TABLE products;