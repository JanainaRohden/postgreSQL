----QUESTÃO 1, select básico

CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar,
	state char(2),
	credit_limit numeric
);
INSERT INTO customers (id,name,street,city,state,credit_limit)
VALUES 
(1,'Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',700.00),
(2,'Antonio Carlos Mamel','Av Pinheiros','Belo Horizonte','MG',3500.50),
(3,'Luiza Augusta Mhor','Rua Salto Grande','Niteroi','RJ',4000.00),
(4,'Jane Ester','Av 7 de Setembro','Erechim','RS',800.00),
(5,'Marcos Antônio dos Santos','Av Farrapos','Porto Alegre','RS',4250.25);

SELECT name
FROM customers 
WHERE state = 'RS';

DROP TABLE customers;


---------------------QUESTÃO 2, endereço dos clientes


CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar,
	state char(2),
	credit_limit numeric
);
INSERT INTO customers (id,name,street,city,state,credit_limit)
VALUES 
(1,'Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',700.00),
(2,'Antonio Carlos Mamel','Av Pinheiros','Belo Horizonte','MG',3500.50),
(3,'Luiza Augusta Mhor','Rua Salto Grande','Niteroi','RJ',4000.00),
(4,'Jane Ester','Av 7 de Setembro','Erechim','RS',800.00),
(5,'Marcos Antônio dos Santos','Av Farrapos','Porto Alegre','RS',4250.25);

SELECT name,street
FROM customers 
WHERE city = 'Porto Alegre';


DROP TABLE customers;

-----QUESTÃO 3, menores que 10 ou maiores que 100

CREATE TABLE products (
	id NUMERIC PRIMARY KEY,
	name varchar, 
	amount NUMERIC,
	price NUMERIC 
);

INSERT INTO products (id,name,amount,price)
VALUES 
(1,'Two-doors wardrobe',100,80),
(2,'Dining Table',1000,560),
(3,'Towel holder',10000,5.50),
(4,'Computer desk',350,100),
(5,'Chair',3000,210.64),
(6,'Single bed',750,99);

SELECT id,name
FROM products 
WHERE price < 10 OR  price > 100;

DROP TABLE products;

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

-----QUESTÃO 5, categorias

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
	id_categories NUMERIC REFERENCES categories (id)
);

INSERT INTO products (id,name,amount,price,id_categories)
VALUES 
(1,'Lampshade',100,800,4),
(2,'Table for painting',1000,560,9),
(3,'Notebook desk',10000,25.50,9),
(4,'Computer desk',350,320.50,6),
(5,'Chair',3000,210.64,9),
(6,'Home alarm',750,460,4);

SELECT products.id,products.name
FROM products
INNER JOIN categories
ON products.id_categories = categories.id 
WHERE categories.name like 'super%';

DROP TABLE categories;
DROP TABLE products;

-------QUESTÃO 6, cidades em ordem alfabética


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

SELECT city 
FROM providers
ORDER BY city;

DROP TABLE providers;

-----QUESTÃO 7, maior e menor preço

CREATE TABLE products (
	id NUMERIC PRIMARY KEY,
	name varchar, 
	amount NUMERIC,
	price NUMERIC
);

INSERT INTO products (id,name,amount,price)
VALUES 
(1,'Two-doors wardrobe',100,800),
(2,'Dining Table',1000,560),
(3,'Towel holder',10000,25.50),
(4,'Computer desk',350,320.50),
(5,'Chair',3000,210.64),
(6,'Single bed',750,460);

SELECT MAX(price),min(price)  
FROM products

DROP TABLE products;

------QUESTÃO 8, produtos por categoria


CREATE TABLE categories (
	id NUMERIC PRIMARY KEY,
	name varchar
);

INSERT INTO categories (id,name)
VALUES 
(1,'wood'),
(2,'luxury'),
(3,'vintage'),
(4,'modern'),
(5,'super luxury');


CREATE TABLE products (
	id NUMERIC PRIMARY KEY,
	name varchar, 
	amount NUMERIC,
	price NUMERIC, 
	id_categories NUMERIC REFERENCES categories (id)
);


INSERT INTO products (id,name,amount,price,id_categories)
VALUES 
(1,'Two-doors wardrobe',100,800,1),
(2,'Dining Table',1000,560,3),
(3,'Towel holder',10000,25.50,4),
(4,'Computer desk',350,320.50,2),
(5,'Chair',3000,210.64,4),
(6,'Single bed',750,460,1);

SELECT categories.name,sum(amount)
FROM products
INNER JOIN categories
ON categories.id = products.id_categories
GROUP BY categories.name;

DROP TABLE categories;
DROP TABLE products;


-----QUESTÃO 9, valor médio dos produtos

CREATE TABLE products (
	id NUMERIC PRIMARY KEY,
	name varchar, 
	amount NUMERIC,
	price NUMERIC
);

INSERT INTO products (id,name,amount,price)
VALUES 
(1,'Two-doors wardrobe',100,800),
(2,'Dining Table',1000,560),
(3,'Towel holder',10000,25.50),
(4,'Computer desk',350,320.50),
(5,'Chair',3000,210.64),
(6,'Single bed',750,460);

SELECT trunc(avg(price),2) FROM products;

DROP TABLE products;

-----QUESTÃO 10, filmes de ação

CREATE TABLE genres (
	id NUMERIC PRIMARY KEY,
	description varchar
);

INSERT INTO genres (id,description)
VALUES 
(1,'Animation'),
(2,'Horror'),
(3,'Action'),
(4,'Drama'),
(5,'Comedy');

CREATE TABLE movies (
	id NUMERIC PRIMARY KEY,
	name varchar,
	id_genres NUMERIC REFERENCES genres (id)
);

INSERT INTO movies (id,name,id_genres)
VALUES 
(1,'Batman',3),
(2,'The Battle of the Dark River',3),
(3,'White Duck',1),
(4,'Breaking Barriers',4),
(5,'The Two Hours',2);

SELECT movies.id,movies.name
FROM movies 
INNER JOIN genres 
ON movies.id_genres = genres.id 
WHERE genres.description like 'Action';

DROP TABLE genres;
DROP TABLE movies;

----QUESTÃO 11, filmes em promoção


CREATE TABLE prices (
	id NUMERIC PRIMARY KEY,
	categorie varchar,
	value numeric
);

INSERT INTO prices (id,categorie,value)
VALUES 
(1,'Releases',3.50),
(2,'Bronze Seal',2.00),
(3,'Silver Seal',2.50),
(4,'Gold Seal',3.00),
(5,'Promotion',1.50);

CREATE TABLE movies (
	id NUMERIC PRIMARY KEY,
	name varchar,
	id_prices NUMERIC REFERENCES prices (id)
);

INSERT INTO movies (id,name,id_prices)
VALUES 
(1,'Batman',3),
(2,'The Battle of the Dark River',3),
(3,'White Duck',5),
(4,'Breaking Barriers',4),
(5,'The Two Hours',2);


SELECT movies.id,movies.name
FROM movies 
INNER JOIN prices 
ON movies.id_prices = prices.id 
WHERE value < 2.00;

DROP TABLE prices;
DROP TABLE movies;

----QUESTÃO 12, locações de setembro

CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar
);

INSERT INTO customers (id,name,street,city)
VALUES 
(1,'Giovanna Gonçalves Oliveira','Rua Mato Grosso','Canoas'),
(2,'Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
(3,'Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
(4,'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Apucarana'),
(5,'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(6,'Diogo Melo Dias','Rua Duzentos e Cinquenta','Varzea Grande');

CREATE TABLE rentals (
	id NUMERIC PRIMARY KEY,
	rentals_date date,
	id_customers NUMERIC REFERENCES customers (id)
);

INSERT INTO rentals (id,rentals_date,id_customers)
VALUES 
(1,'2016-09-10',3),
(2,'2016-02-09',1),
(3,'2016-02-08',4),
(4,'2016-02-09',2),
(5,'2016-02-03',6),
(6,'2016-04-04',4);

SELECT customers.name,rentals.rentals_date
FROM customers  
INNER JOIN rentals  
ON customers.id = rentals.id_customers
WHERE rentals.rentals_date BETWEEN '2016-09-01' AND '2016-09-30';

DROP TABLE customers;
DROP TABLE rentals;

-----QUESTÃO 13, expandindo o negócio

CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar
); 


INSERT INTO customers (id,name,street,city)
VALUES 
(1,'Giovanna Gonçalves Oliveira','Rua Mato Grosso','Canoas'),
(2,'Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
(3,'Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
(4,'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Uberlândia'),
(5,'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(6,'Diogo Melo Dias','Rua Duzentos e Cinquenta','Varzea Grande');

SELECT DISTINCT city
FROM customers; 

DROP TABLE customers;

----QUESTÃO 14, nenhuma locação

 CREATE TABLE customers (
	id NUMERIC PRIMARY KEY,
	name varchar,
	street varchar,
	city varchar
);

INSERT INTO customers (id,name,street,city)
VALUES 
(1,'Giovanna Gonçalves Oliveira','Rua Mato Grosso','Canoas'),
(2,'Kauã Azevedo Ribeiro','Travessa Ibiá','Uberlândia'),
(3,'Rebeca Barbosa Santos','Rua Observatório Meteorológico','Salvador'),
(4,'Sarah Carvalho Correia','Rua Antônio Carlos da Silva','Apucarana'),
(5,'João Almeida Lima','Rua Rio Taiuva','Ponta Grossa'),
(6,'Diogo Melo Dias','Rua Duzentos e Cinquenta','Varzea Grande');

CREATE TABLE locations (
	id NUMERIC PRIMARY KEY,
	locations_date date,
	id_customers NUMERIC REFERENCES customers (id)
);

INSERT INTO locations (id,locations_date,id_customers)
VALUES 
(1,'2016-10-09',3),
(2,'2016-09-02',1),
(3,'2016-08-02',4),
(4,'2016-09-02',2),
(5,'2016-03-02',6),
(6,'2016-04-04',4);

SELECT 
	c.id,c.name
FROM 
	customers c  
WHERE 
	c.id NOT IN (SELECT l.id_customers FROM locations l)
ORDER BY id;


SELECT 
	c.id,c.name
FROM 
	customers c LEFT JOIN locations l 
	ON c.id = l.id_customers
WHERE 
	l.id_customers IS NULL 
ORDER BY id;

DROP TABLE customers;
DROP TABLE locations;



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

-----QUESTÃO 16, produtos importados


CREATE TABLE categories (
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255)
);

INSERT INTO categories (id,name)
VALUES 
(1,'Super Luxury'),
(2,'Imported'),
(3,'Tech'),
(4,'Vintage'),
(5,'Supreme');

CREATE TABLE providers(
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	street CHARACTER varying(255),
	city CHARACTER varying(255),
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(2,'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(3,'South Chairs','Rua do Moinho','Santa Maria','RS'),
(4,'Elon Electro','Rua Apolo','São Paulo','SP'),
(5,'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');

CREATE TABLE products (  
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	amount NUMERIC,
	price NUMERIC,
	id_providers NUMERIC REFERENCES providers(id),
	id_categories NUMERIC REFERENCES categories(id)
	);

INSERT INTO products (id,name,amount,price,id_providers,id_categories)
VALUES 
(1,'Blue Chair',30,300.00,5,5),
(2,'Red Chair',50,2150.00,2,1),
(3,'Disney Wardrobe',400,829.50,4,1),
(4,'Blue Toaster',20,9.90,3,1),
(5,'TV',30,3000.25,2,2);


SELECT products.name,providers.name,categories.name
FROM providers
INNER JOIN products
ON providers.id = products.id_providers 
INNER JOIN categories
ON products.id_categories = categories.id 
WHERE CATEGORIES.NAME LIKE 'Imported'AND providers.name LIKE 'Sansul SA';


DROP TABLE products; 
DROP TABLE categories;
DROP TABLE providers;

-----QUESTÃO 17, super luxo


CREATE TABLE categories (
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255)
);

INSERT INTO categories (id,name)
VALUES 
(1,'Super Luxury'),
(2,'Imported'),
(3,'Tech'),
(4,'Vintage'),
(5,'Supreme');

CREATE TABLE providers(
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	street CHARACTER varying(255),
	city CHARACTER varying(255),
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(2,'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(3,'South Chairs','Rua do Moinho','Santa Maria','RS'),
(4,'Elon Electro','Rua Apolo','São Paulo','SP'),
(5,'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');

CREATE TABLE products (  
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	amount NUMERIC,
	price NUMERIC,
	id_providers NUMERIC REFERENCES providers(id),
	id_categories NUMERIC REFERENCES categories(id)
	);

INSERT INTO products (id,name,amount,price,id_providers,id_categories)
VALUES 
(1,'Blue Chair',30,300.00,5,5),
(2,'Red Chair',50,2150.00,2,1),
(3,'Disney Wardrobe',400,829.50,4,1),
(4,'Blue Toaster',20,9.90,3,1),
(5,'TV',30,3000.25,2,2);

SELECT products.name,providers.name,products.price
FROM providers
INNER JOIN products
ON providers.id = products.id_providers 
INNER JOIN categories
ON products.id_categories = categories.id 
WHERE CATEGORIES.NAME LIKE 'Super Luxury'AND products.price > 1000;

DROP TABLE products; 
DROP TABLE providers;
DROP TABLE categories; 

----QUESTÃO 18, pedidos no primeiro semestre

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

CREATE TABLE ORDERS(
	ID NUMERIC PRIMARY KEY,
	orders_date date,
	id_customers NUMERIC REFERENCES customers(id)
);

INSERT INTO orders (id,orders_date,id_customers)
VALUES 
(1,'2016-05-13',3),
(2,'2016-01-12',2),
(3,'2016-04-18',5),
(4,'2016-09-07',4),
(5,'2016-02-13',6),
(6,'2016-08-05',3);

SELECT customers.name,orders.id
FROM customers 
INNER JOIN orders 
ON customers.id = orders.id_customers 
WHERE orders.orders_date BETWEEN '2016-01-01' AND '2016-06-30';


DROP TABLE orders;
DROP TABLE customers; 

-----QUESTÃO 19, quantidades entre 10 e 20

CREATE TABLE providers (
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	street CHARACTER varying(255),
	city CHARACTER varying(255),
	state char(2)
);

INSERT INTO providers (id,name,street,city,state)
VALUES 
(1,'Ajax SA','Rua Presidente Castelo Branco','Porto Alegre','RS'),
(2,'Sansul SA','Av Brasil','Rio de Janeiro','RJ'),
(3,'Pr Sheppard Chairs','Rua do Moinho','Santa Maria','RS'),
(4,'Elon Electro','Rua Apolo','São Paulo','SP'),
(5,'Mike Electro','Rua Pedro da Cunha','Curitiba','PR');

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
(2,'Red Chair',50,2150.00,2),
(3,'Disney Wardrobe',400,829.50,4),
(4,'Executive Chair',17,9.90,3),
(5,'Solar Panel',30,3000.25,4);

SELECT p.name
FROM products p
INNER JOIN providers pr
ON pr.id = p.id_providers 
WHERE p.amount BETWEEN 10 AND 20 AND pr.name LIKE 'P%';


DROP TABLE products; 
DROP TABLE providers; 

-----QUESTÃO 20, pessoas jurídicas


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


CREATE TABLE legal_person (
	id_customers NUMERIC REFERENCES customers(id),
	cnpj char (18),
	contact CHARACTER varying
);

INSERT INTO legal_person (id_customers,cnpj,contact)
VALUES 
(4,85883842000191,99767-0562),
(5,47773848000117,99100-8965);


SELECT c.name
FROM customers c
INNER JOIN legal_person lp 
ON c.id = lp.id_customers;


DROP TABLE legal_person;
DROP TABLE customers;
