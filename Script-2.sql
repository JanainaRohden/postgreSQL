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

-----QUESTÃO 21, categorias com vários produtos


CREATE TABLE categories(
	id NUMERIC PRIMARY KEY,
	name CHARACTER varying(255)
);

INSERT INTO categories(id,name)
VALUES
(1,'superior'),
(2,'super luxury'),
(3,'modern'),
(4,'nerd'),
(5,'infantile'),
(6,'robust'),
(9,'wood');

CREATE TABLE products (
	ID NUMERIC PRIMARY KEY,
	name CHARACTER varying(255),
	amount NUMERIC,
	price NUMERIC,
	id_categories NUMERIC REFERENCES categories(id)
);

INSERT INTO products (id,name,amount,price,id_categories)
VALUES 
(1,'Blue Chair',30,300.00,9),
(2,'Red Chair',200,2150.00,2),
(3,'Disney Wardrobe',400,829.50,4),
(4,'Blue Toaster',20,9.90,3),
(5,'Solar Panel',30,3000.25,4);

SELECT p.name,c.name
FROM products p
INNER JOIN categories c  
ON c.id = p.id_categories
WHERE p.amount > 100 AND c.id in (1,2,3,6,9)
ORDER BY c.id;

DROP TABLE products; 
DROP TABLE categories;

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

-----QUESTÃO 24, advogados


CREATE TABLE lawyers(
	register integer PRIMARY KEY,
	name varchar,
	customers_number integer
);

INSERT INTO lawyers (register,name,customers_number)
VALUES 
(1648,'Marty M. Harrison',5),
(2427,'Jonathan J. Blevins',15),
(3365,'Chelsey D. Sanders',20),
(4153,'Dorothy W. Ford',16),
(5525,'Penny J. Cormier',6);



 
SELECT l.name,l.customers_number 
FROM lawyers l
WHERE customers_number=(
	SELECT max(customers_number) FROM lawyers l
)
UNION ALL 
SELECT l.name,l.customers_number 
FROM lawyers l
WHERE customers_number=(
	SELECT min(customers_number) FROM lawyers l
)
UNION ALL
SELECT 'Average' AS name, trunc(avg(customers_number),0) AS customers_number
FROM lawyers l;

DROP TABLE lawyers;

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


------QUESTÃO 26, dia de pagamento

CREATE TABLE loan (
	id integer PRIMARY KEY,
	name varchar,
	value NUMERIC,
	payday timestamp
);

INSERT INTO loan (id,name,value,payday)
VALUES 
(1,'Cristian Ghyprievy',3000.50,'2017-10-19'),
(2,'John Serial',10000,'2017-10-10'),
(3,'Michael Seven',5000.40,'2017-10-17'),
(4,'Joana Cabel',2000,'2017-10-05'),
(5,'Miguel Santos',4050,'2017-10-20');

 

SELECT l.name,CAST(EXTRACT(day FROM payday)AS integer) AS day
FROM loan l;

DROP TABLE loan;


------QUESTÃO 27, liga


CREATE TABLE league (
	POSITION integer PRIMARY KEY,
	team varchar
);
 INSERT INTO league (POSITION,team)
 VALUES 
 (1,'The Quacks Bats'),
 (2,'The Responsible Hornets'),
 (3,'The Bawdy Dolphins'),
 (4,'The Abstracted Sharks'),
 (5,'The Nervous Zebras'),
 (6,'The Oafish Owls'),
 (7,'The Unequaled Bison'),
 (8,'The Keen Kangaroos'),
 (9,'The Left Nightingales'),
 (10,'The Terrific Elks'),
 (11,'The Lumpy Frogs'),
 (12,'The Swift Buffalo'),
 (13,'The Big Chargers'),
 (14,'The Rough Robins'),
 (15,'The Silver Crocs');


 SELECT * FROM 
 (SELECT 'Podium: ' || l.team AS name
 FROM league l
 LIMIT 3) AS podium  
 UNION ALL  
 SELECT * FROM (SELECT 'Demoted: ' || l.team AS name
 FROM league l
 LIMIT 2 OFFSET 13) AS demoted;
 
 DROP TABLE league; 
 
 
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

-----QUESTÃO 29, o multiverso de richard

CREATE TABLE dimensions(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO dimensions(id,name)
VALUES 
(1,'C774'),
(2,'C784'),
(3,'C794'),
(4,'C824'),
(5,'C875');

CREATE TABLE LIFE_REGISTRY(
	ID integer PRIMARY KEY,
	name varchar,
	omega NUMERIC,
	dimensions_id integer REFERENCES dimensions(id)
);

INSERT INTO life_registry (id,name,omega,dimensions_id)
VALUES 
(1,'Richard Postman',5.6,2),
(2,'Simple Jelly',1.4,1),
(3,'Richard Gran Master',2.5,1),
(4,'Richard Turing',6.4,4),
(5,'Richard Strall',1.0,3);

SELECT l.name,trunc(omega*1.618,3) AS Fator_N
FROM dimensions d
INNER JOIN life_registry l
ON d.id = l.dimensions_id
WHERE l.name LIKE 'Richard%' AND (d.name = 'C774' OR d.name = 'C875')
ORDER BY omega;


------QUESTÃO 30, quantidade de caracteres

CREATE TABLE people(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO people (id,name)
VALUES 
(1,'Karen'),
(2,'Manuel'),
(3,'Ygor'),
(4,'Valentine'),
(5,'Jo');

SELECT p.name,char_length(NAME) AS length
FROM people p
ORDER BY length desc;


DROP TABLE people;


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


-----QUESTÃO 32, taxas

CREATE TABLE people (
	id integer PRIMARY KEY,
	name varchar,
	salary numeric
);

INSERT INTO people (id,name,salary)
VALUES 
(1,'James M. Tabarez',883),
(2,'Rafael T. Hendon',4281),
(3,'Linda J. Gardner',4437),
(4,'Nicholas J. Conn',8011),
(5,'Karol A. Morales',2508),
(6,'Lolita S. Graves',8709);

SELECT name,trunc((salary*0.1),2)  AS tax
FROM people 
WHERE salary > 3000;

DROP TABLE people;


------QUESTÃO 33, virus


CREATE TABLE virus(
	id integer PRIMARY KEY,
	name varchar
);

INSERT INTO virus(id,name)
VALUES 
(1,'H1RT'),
(2,'H7H1'),
(3,'HUN8'),
(4,'XH1HX'),
(5,'XXXX');

SELECT REPLACE(NAME,'H1','X') AS NAME
FROM VIRUS

DROP TABLE VIRUS;

------QUESTÃO 34, campeonato cearense


CREATE TABLE teams(
	id integer PRIMARY KEY,
	name varchar(50)
);

INSERT INTO teams (id,name)
VALUES 
(1,'CEARA'),
(2,'FORTALEZA'),
(3,'GUARANY DE SOBRAL'),
(4,'FLORESTA');

CREATE TABLE MATCHES(
	id integer PRIMARY KEY,
	team_1 integer REFERENCES teams(id),
	team_2 integer REFERENCES teams(id),
	team_1_goals integer,
	team_2_goals integer
);

INSERT INTO matches(id,team_1,team_2,team_1_goals,team_2_goals)
VALUES
(1,4,1,0,4),
(2,3,2,0,1),
(3,1,3,3,0),
(4,3,4,0,1),
(5,1,2,0,0),
(6,2,4,2,1);


SELECT t.name,count(t.name) AS matches,sum(victory) AS victories,sum(defeat) AS defeats,sum(draw) AS draws, (3 * sum(victory) + sum(draw)) AS score
FROM (SELECT t."name" ,
	(CASE 
		WHEN m.team_1_goals > m.team_2_goals THEN 1   
		ELSE 0 END) AS victory,
	(CASE 
		WHEN m.team_2_goals  > m.team_1_goals THEN  1
		ELSE 0 END ) AS defeat,
	(CASE 
	WHEN m.team_2_goals  = m.team_1_goals THEN  1
	ELSE 0 END ) AS draw
	FROM teams t 
	JOIN matches m 
	ON m.team_1 = t.id
UNION all
SELECT t."name" ,
	(CASE 
		WHEN m.team_1_goals < m.team_2_goals THEN 1   
		ELSE 0 END) AS victory,
	(CASE 
		WHEN m.team_2_goals  < m.team_1_goals THEN  1
		ELSE 0 END ) AS defeat,
	(CASE 
	WHEN m.team_2_goals  = m.team_1_goals THEN  1
	ELSE 0 END ) AS draw
	FROM teams t 
	JOIN matches m 
	ON m.team_2 = t.id) AS t
GROUP BY t.name
ORDER BY score desc;

	
	
DROP TABLE matches;
DROP TABLE teams;



-----QUESTÃO 35, departamentos e divisões


CREATE TABLE departamento(
	cod_dep integer,
	nome varchar (50),
	endereco varchar (50)
); 

INSERT INTO departamento(cod_dep,nome,endereco)
VALUES 
(1,'Contabilidade','R. X'),
(2,'TI','R. Y'),
(3,'Engenharia','R. Y');

CREATE TABLE dependente(
	matr integer,
	nome varchar (50),
endereco varchar (50)
);

INSERT INTO dependente (matr,nome,endereco)
VALUES 
(9999,'Francisco Jose','R. Z'),
(88,'Maria da Silva','R. T'),
(55,'Virgulino da Silva','R. 31');

CREATE TABLE desconto(
	cod_desc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO desconto(cod_desc,nome,tipo,valor)
VALUES 
(91,'IR','V',400),
(92,'Plano de saude','V',300),
(93,NULL,null,null);

CREATE TABLE divisao(
	cod_divisao integer,
	nome varchar(50),
	endereco varchar(50),
	cod_dep numeric
);

INSERT INTO divisao(cod_divisao,nome,endereco,cod_dep)
VALUES 
(11,'Ativo','R. X',1),
(12,'Passivo','R. X',1),
(21,'Desenvoilvimento de Projetos','R. Y',2),
(22,'Analise de Sistemas','R. Y',2),
(23,'Programacao','R. W',2),
(31,'Concreto','R. Y',3),
(32,'Calculo Estrutural','R. Y',3);

CREATE TABLE emp_desc(
	cod_desc integer,
	matr integer
);

INSERT INTO emp_desc(cod_desc,matr)
VALUES 
(91,3),
(91,27),
(91,9999),
(92,27),
(92,71),
(92,88),
(92,9999);

CREATE TABLE emp_venc(
	cod_venc integer,
	matr integer
);

INSERT INTO emp_venc(cod_venc,matr)
VALUES 
(1,27),
(1,88),
(1,135),
(1,254),
(1,431),
(2,1),
(2,5),
(2,7),
(2,13),
(2,33),
(2,9999),
(3,3),
(3,55),
(3,71),
(3,222),
(4,25),
(4,476),
(5,371),
(6,3),
(6,27),
(6,9999),
(7,5),
(7,33),
(7,55),
(7,71),
(7,88),
(7,254),
(7,476),
(8,25),
(8,91),
(9,1),
(9,27),
(9,91),
(9,135),
(9,371),
(9,9999),
(10,371),
(10,9999),
(11,91),
(12,3),
(12,27),
(12,254),
(12,9999),
(13,3),
(13,5),
(13,7),
(13,25),
(13,33),
(13,88),
(13,135);

CREATE TABLE empregado(
	matr integer,
	nome varchar(50),
	endereco varchar(50),
	data_lotacao timestamp,
	lotacao integer,
	gerencia_cod_dep integer,
	lotacao_div integer,
	gerencia_div integer
);

INSERT INTO empregado (matr,nome,endereco,data_lotacao,lotacao,gerencia_cod_dep,lotacao_div,gerencia_div)
VALUES 
(9999,'Jose Sampaio','R. Z','2006-06-06T00:00:00Z',1,1,12,null),
(33,'Jose Maria','R. 21','2006-03-01T00:00:00Z',1,NULL,11,11),
(1,'Maria Jose','R. 52','2003-03-01T00:00:00Z',1,NULL,11,null),
(7,'Yasmim','R. 13','0210-07-02T00:00:00Z',1,NULL,11,null),
(5,'Rebeca','R. 1','2011-04-01T00:00:00Z',1,NULL,12,12),
(13,'Sofia','R. 28','2010-09-09T00:00:00Z',1,NULL,12,null),
(27,'Andre','R. Z','2005-05-01T00:00:00Z',2,2,22,null),
(88,'Yami','R. T','2014-02-01T00:00:00Z',2,NULL,21,21),
(431,'Joao da Silva','R. Y','2011-07-03T00:00:00Z',2,NULL,21,null),
(135,'Ricardo Reis','R. 33','2009-08-01T00:00:00Z',2,NULL,21,null),
(254,'Barbara','R. Z','2008-01-03T00:00:00Z',2,NULL,22,22),
(371,'Ines','R. Y','2005-01-01T00:00:00Z',2,NULL,22,null),
(476,'Flor','R. Z','2015-10-28T00:00:00Z',2,NULL,23,23),
(25,'Lina','R. 67','2014-09-01T00:00:00Z',2,NULL,23,null),
(3,'Jose da Silva','R. 8','2011-01-02T00:00:00Z',3,3,31,null),
(71,'Silverio dos Reis','R. C','2009-01-05T00:00:00Z',3,NULL,31,31),
(91,'Reis da Silva','R. Z','2011-11-05T00:00:00Z',3,NULL,31,null),
(55,'Lucas','R. 31','2013-07-01T00:00:00Z',3,NULL,32,32),
(222,'Marina','R. 31','2015-01-07T00:00:00Z',3,NULL,32,null),
(725,'Angelo','R. X','2001-03-01T00:00:00Z',2,NULL,21,null);

CREATE TABLE vencimento(
	cod_venc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO vencimento (cod_venc,nome,tipo,valor)
VALUES 
(1,'Salario base Analista de Sistemas','V',5000),
(2,'Salario base Contador','V',3000),
(3,'Salario Base Engenheiro','V',4500),
(4,'Salario Base Projetista Software','V',5000),
(5,'Salario Base Programador de Sistemas','V',3000),
(6,'Gratificacao Chefia Departamento','V',3750),
(7,'Gratificacao Chefia Divisao','V',2200),
(8,'Salario Trabalhador Costrucao Civil','V',800),
(9,'Auxilio Salario Familia','V',300),
(10,'Gratificacao Tempo de servico','V',350),
(11,'Insalubridade','V',800),
(12,'Gratificacao por titulacao - Doutorado','V',2000),
(13,'Gratificacao por Titularidade - Mestrado','V',800);




SELECT de.nome AS departamento, di.nome AS divisao , round(avg(salaries.salary),2) AS media, round(max(salaries.salary),2)AS maior FROM 
departamento de
JOIN divisao di
ON de.cod_dep = di.cod_dep
JOIN empregado e2 
ON e2.lotacao_div = di.cod_divisao 
JOIN 
(SELECT v.matr, (COALESCE (sum(v.valor), 0) - COALESCE(sum(d.valor),0)) AS salary
	FROM 
	(SELECT e.matr , sum(v.valor) AS valor FROM 
		empregado e
		LEFT JOIN emp_venc ev 
		ON ev.matr = e.matr 
		LEFT JOIN vencimento v 
		ON ev.cod_venc = v.cod_venc
		GROUP BY e.matr 
	) AS v
	LEFT JOIN (SELECT ed.matr, sum(d.valor) AS valor FROM 
		emp_desc ed
		JOIN desconto d 
		ON ed.cod_desc = d.cod_desc
		GROUP BY 1) AS d 
	ON v.matr = d.matr
GROUP BY 1
ORDER BY v.matr) AS salaries
ON salaries.matr = e2.matr 
GROUP BY 1,2
ORDER BY media desc;

DROP TABLE departamento;
DROP TABLE dependente;
DROP TABLE divisao;
DROP TABLE empregado;
DROP TABLE emp_desc;
DROP TABLE emp_venc;
DROP TABLE desconto;
DROP TABLE vencimento;


-----QUESTÃO 36, cpf dos empregados
	
CREATE TABLE empregados(
	cpf varchar(15) PRIMARY KEY,
	enome varchar(60),
	salario float,
	cpf_supervisor varchar(15),
	dnumero integer
);

INSERT INTO empregados(cpf,enome,salario,cpf_supervisor,dnumero)
VALUES 
('049382234322','João Silva',2350,'2434332222',1010),
('586733922290','Mario Silveira',3500,'2434332222',1010),
('2434332222','Aline Barros',2350,NULL,1010),
('1733332162','Tulio Vidal',8350,NULL,1020),
('4244435272','Juliana Rodrigues',3310,NULL,1020),
('1014332672','Natalia Marques',2900,NULL,1010);


CREATE TABLE departamentos(
	dnumero integer PRIMARY KEY,
	dnome varchar(60),
	cpf_gerente varchar(15) REFERENCES empregados(cpf)
);

INSERT INTO departamentos(dnumero,dnome,cpf_gerente)
VALUES 
(1010,'pesquisa','049382234322'),
(1020,'ensino','2434332222');

CREATE TABLE trabalha(
	cpf_emp varchar(15) REFERENCES empregados(cpf),
	pnumero integer
);

INSERT INTO trabalha (cpf_emp,pnumero)
VALUES 
('049382234322',2010),
('586733922290',2020),
('049382234322',2020);

CREATE TABLE projetos(
	pnumero integer PRIMARY KEY,
	pnome varchar(45),
	dnumero integer REFERENCES departamentos(dnumero)
);

INSERT INTO projetos (pnumero,pnome,dnumero)
VALUES 
(2010,'Alpha',1010),
(2020,'Beta',1020);


SELECT e.cpf,e.enome,d.dnome
FROM empregados e 
left JOIN departamentos d  
ON e.dnumero = d.dnumero
left JOIN trabalha t 
ON  e.cpf = t.cpf_emp
WHERE e.cpf_supervisor IS null
ORDER BY cpf;

DROP TABLE projetos;
DROP TABLE trabalha;
DROP TABLE departamentos;
DROP TABLE empregados;


------QUESTÃO 37, mais frequente


CREATE TABLE value_table(
	amount integer
);

INSERT INTO value_table (amount)
VALUES
(4),
(6),
(7),
(1),
(1),
(2),
(3),
(2),
(3),
(1),
(5),
(6),
(1),
(7),
(8),
(9),
(10),
(11),
(12),
(4),
(5),
(5),
(3),
(6),
(2),
(2),
(1);

SELECT sub_value.amount AS most_frequent_value FROM (
	SELECT v.amount, count(1) FROM value_table v
	GROUP BY v.amount
	ORDER  BY 2 DESC 
) AS sub_value LIMIT 1;


DROP TABLE value_table;

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




------QUESTÃO 39, update sem WHERE 
		
		
CREATE TABLE products(
	id NUMERIC,
	name varchar(50),
	TYPE char,
	price numeric
);

INSERT INTO products (id,name,TYPE,price)
VALUES 
(1,'Monitor','B',0),
(2,'Headset','A',0),
(3,'PC Case','A',0),
(4,'Computer Desk','C',0),
(5,'Gaming Chair','C',0),
(6,'Mouse','A',0);


(SELECT name, 20.0 AS price FROM products WHERE TYPE = 'A' ORDER BY id desc)
UNION all
(SELECT name, 70.0 AS price FROM products WHERE TYPE = 'B' ORDER BY id desc)
UNION all
(SELECT name, 530.5  AS price FROM products WHERE TYPE = 'C' ORDER BY id DESC);


DROP TABLE products;


----QUESTÃO 40, the payback


CREATE TABLE clients(
	id integer PRIMARY KEY,
	name varchar(50),
	investment numeric
);
 INSERT INTO clients (id,name,investment)
 VALUES 
 (1,'Daniel',500),
 (2,'Oliveira',2000),
 (3,'Lucas',1000);
 
CREATE TABLE operations(
	id integer PRIMARY KEY,
	client_id integer REFERENCES clients(id),
	MONTH integer,
	profit numeric
);

INSERT INTO operations (id,client_id,MONTH,profit)
VALUES 
(1,1,1,230),
(2,2,1,1000),
(3,2,2,1000),
(4,3,1,100),
(5,3,2,300),
(6,3,3,900),
(7,3,4,400);


SELECT 
resulta.name,
resulta.investment,
resulta.retorno 
FROM 
	(SELECT 
	resul.name,
	resul.investment,
	sum(profit) AS retorno
	FROM (
		SELECT 
		o.profit,
		o.client_id,
		c.name,
		c.investment,
		max(o.month),ROW_NUMBER() over(PARTITION BY o.id ORDER BY client_id) AS j
		FROM operations o 
		JOIN clients c 
		ON c.id = o.client_id  
		GROUP BY 1,2,3,4,o.id) AS resul
	GROUP BY 1,2) AS resulta
GROUP BY 1,2,3
HAVING retorno >= resulta.investment;



-----QUESTÃO 41, divisões com maiores médias salariais



CREATE TABLE departamento(
	cod_dep integer,
	nome varchar (50),
	endereco varchar (50)
); 

INSERT INTO departamento(cod_dep,nome,endereco)
VALUES 
(1,'Contabilidade','R. X'),
(2,'TI','R. Y'),
(3,'Engenharia','R. Y');

CREATE TABLE dependente(
	matr integer,
	nome varchar (50),
endereco varchar (50)
);

INSERT INTO dependente (matr,nome,endereco)
VALUES 
(9999,'Francisco Jose','R. Z'),
(88,'Maria da Silva','R. T'),
(55,'Virgulino da Silva','R. 31');

CREATE TABLE desconto(
	cod_desc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO desconto(cod_desc,nome,tipo,valor)
values
(91,'IR','V',400),
(92,'Plano de saude','V',300),
(93,NULL,null,null);

CREATE TABLE divisao(
	cod_divisao integer,
	nome varchar(50),
	endereco varchar(50),
	cod_dep numeric
);

INSERT INTO divisao(cod_divisao,nome,endereco,cod_dep)
VALUES 
(11,'Ativo','R. X',1),
(12,'Passivo','R. X',1),
(21,'Desenvoilvimento de Projetos','R. Y',2),
(22,'Analise de Sistemas','R. Y',2),
(23,'Programacao','R. W',2),
(31,'Concreto','R. Y',3),
(32,'Calculo Estrutural','R. Y',3);

CREATE TABLE emp_desc(
	cod_desc integer,
	matr integer
);

INSERT INTO emp_desc(cod_desc,matr)
VALUES 
(91,3),
(91,27),
(91,9999),
(92,27),
(92,71),
(92,88),
(92,9999);

CREATE TABLE emp_venc(
	cod_venc integer,
	matr integer
);

INSERT INTO emp_venc(cod_venc,matr)
VALUES 
(1,27),
(1,88),
(1,135),
(1,254),
(1,431),
(2,1),
(2,5),
(2,7),
(2,13),
(2,33),
(2,9999),
(3,3),
(3,55),
(3,71),
(3,222),
(4,25),
(4,476),
(5,371),
(6,3),
(6,27),
(6,9999),
(7,5),
(7,33),
(7,55),
(7,71),
(7,88),
(7,254),
(7,476),
(8,25),
(8,91),
(9,1),
(9,27),
(9,91),
(9,135),
(9,371),
(9,9999),
(10,371),
(10,9999),
(11,91),
(12,3),
(12,27),
(12,254),
(12,9999),
(13,3),
(13,5),
(13,7),
(13,25),
(13,33),
(13,88),
(13,135);

CREATE TABLE empregado(
	matr integer,
	nome varchar(50),
	endereco varchar(50),
	data_lotacao timestamp,
	lotacao integer,
	gerencia_cod_dep integer,
	lotacao_div integer,
	gerencia_div integer
);

INSERT INTO empregado (matr,nome,endereco,data_lotacao,lotacao,gerencia_cod_dep,lotacao_div,gerencia_div)
VALUES 
(9999,'Jose Sampaio','R. Z','2006-06-06T00:00:00Z',1,1,12,null),
(33,'Jose Maria','R. 21','2006-03-01T00:00:00Z',1,NULL,11,11),
(1,'Maria Jose','R. 52','2003-03-01T00:00:00Z',1,NULL,11,null),
(7,'Yasmim','R. 13','0210-07-02T00:00:00Z',1,NULL,11,null),
(5,'Rebeca','R. 1','2011-04-01T00:00:00Z',1,NULL,12,12),
(13,'Sofia','R. 28','2010-09-09T00:00:00Z',1,NULL,12,null),
(27,'Andre','R. Z','2005-05-01T00:00:00Z',2,2,22,null),
(88,'Yami','R. T','2014-02-01T00:00:00Z',2,NULL,21,21),
(431,'Joao da Silva','R. Y','2011-07-03T00:00:00Z',2,NULL,21,null),
(135,'Ricardo Reis','R. 33','2009-08-01T00:00:00Z',2,NULL,21,null),
(254,'Barbara','R. Z','2008-01-03T00:00:00Z',2,NULL,22,22),
(371,'Ines','R. Y','2005-01-01T00:00:00Z',2,NULL,22,null),
(476,'Flor','R. Z','2015-10-28T00:00:00Z',2,NULL,23,23),
(25,'Lina','R. 67','2014-09-01T00:00:00Z',2,NULL,23,null),
(3,'Jose da Silva','R. 8','2011-01-02T00:00:00Z',3,3,31,null),
(71,'Silverio dos Reis','R. C','2009-01-05T00:00:00Z',3,NULL,31,31),
(91,'Reis da Silva','R. Z','2011-11-05T00:00:00Z',3,NULL,31,null),
(55,'Lucas','R. 31','2013-07-01T00:00:00Z',3,NULL,32,32),
(222,'Marina','R. 31','2015-01-07T00:00:00Z',3,NULL,32,null),
(725,'Angelo','R. X','2001-03-01T00:00:00Z',2,NULL,21,null);

CREATE TABLE vencimento(
	cod_venc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO vencimento (cod_venc,nome,tipo,valor)
VALUES 
(1,'Salario base Analista de Sistemas','V',5000),
(2,'Salario base Contador','V',3000),
(3,'Salario Base Engenheiro','V',4500),
(4,'Salario Base Projetista Software','V',5000),
(5,'Salario Base Programador de Sistemas','V',3000),
(6,'Gratificacao Chefia Departamento','V',3750),
(7,'Gratificacao Chefia Divisao','V',2200),
(8,'Salario Trabalhador Costrucao Civil','V',800),
(9,'Auxilio Salario Familia','V',300),
(10,'Gratificacao Tempo de servico','V',350),
(11,'Insalubridade','V',800),
(12,'Gratificacao por titulacao - Doutorado','V',2000),
(13,'Gratificacao por Titularidade - Mestrado','V',800);


SELECT * FROM (
SELECT DISTINCT ON (1) media.departamento, media.divisao, round(max(media.media),2) as media FROM 
	(SELECT de.nome AS departamento, di.nome AS divisao , round(avg(salaries.salary),2) AS media, round(max(salaries.salary),2)AS maior FROM 
		departamento de
		JOIN divisao di
		ON de.cod_dep = di.cod_dep
		JOIN empregado e2 
		ON e2.lotacao_div = di.cod_divisao 
		JOIN 
		(SELECT v.matr, (COALESCE (sum(v.valor), 0) - COALESCE(sum(d.valor),0)) AS salary
			FROM 
			(SELECT e.matr , sum(v.valor) AS valor FROM 
				empregado e
				LEFT JOIN emp_venc ev 
				ON ev.matr = e.matr 
				LEFT JOIN vencimento v 
				ON ev.cod_venc = v.cod_venc
				GROUP BY e.matr 
			) AS v
			LEFT JOIN (SELECT ed.matr, sum(d.valor) AS valor FROM 
				emp_desc ed
				JOIN desconto d 
				ON ed.cod_desc = d.cod_desc
				GROUP BY 1) AS d 
			ON v.matr = d.matr
		GROUP BY 1
		ORDER BY v.matr) AS salaries
	ON salaries.matr = e2.matr 
	GROUP BY 1,2
	ORDER BY media DESC) AS media
GROUP BY departamento,2
ORDER BY departamento, media DESC) AS t
ORDER BY 3 desc;

DROP TABLE departamento;
DROP TABLE dependente;
DROP TABLE divisao;
DROP TABLE empregado;
DROP TABLE emp_desc;
DROP TABLE emp_venc;
DROP TABLE desconto;
DROP TABLE vencimento;


-----QUESTÃO 42, estatísticas dos departamentos





CREATE TABLE departamento(
	cod_dep integer,
	nome varchar (50),
	endereco varchar (50)
); 

INSERT INTO departamento(cod_dep,nome,endereco)
VALUES 
(1,'Contabilidade','R. X'),
(2,'TI','R. Y'),
(3,'Engenharia','R. Y');

CREATE TABLE dependente(
	matr integer,
	nome varchar (50),
endereco varchar (50)
);

INSERT INTO dependente (matr,nome,endereco)
VALUES 
(9999,'Francisco Jose','R. Z'),
(88,'Maria da Silva','R. T'),
(55,'Virgulino da Silva','R. 31');

CREATE TABLE desconto(
	cod_desc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO desconto(cod_desc,nome,tipo,valor)
values
(91,'IR','V',400),
(92,'Plano de saude','V',300),
(93,NULL,null,null);

CREATE TABLE divisao(
	cod_divisao integer,
	nome varchar(50),
	endereco varchar(50),
	cod_dep numeric
);

INSERT INTO divisao(cod_divisao,nome,endereco,cod_dep)
VALUES 
(11,'Ativo','R. X',1),
(12,'Passivo','R. X',1),
(21,'Desenvoilvimento de Projetos','R. Y',2),
(22,'Analise de Sistemas','R. Y',2),
(23,'Programacao','R. W',2),
(31,'Concreto','R. Y',3),
(32,'Calculo Estrutural','R. Y',3);

CREATE TABLE emp_desc(
	cod_desc integer,
	matr integer
);

INSERT INTO emp_desc(cod_desc,matr)
VALUES 
(91,3),
(91,27),
(91,9999),
(92,27),
(92,71),
(92,88),
(92,9999);

CREATE TABLE emp_venc(
	cod_venc integer,
	matr integer
);

INSERT INTO emp_venc(cod_venc,matr)
VALUES 
(1,27),
(1,88),
(1,135),
(1,254),
(1,431),
(2,1),
(2,5),
(2,7),
(2,13),
(2,33),
(2,9999),
(3,3),
(3,55),
(3,71),
(3,222),
(4,25),
(4,476),
(5,371),
(6,3),
(6,27),
(6,9999),
(7,5),
(7,33),
(7,55),
(7,71),
(7,88),
(7,254),
(7,476),
(8,25),
(8,91),
(9,1),
(9,27),
(9,91),
(9,135),
(9,371),
(9,9999),
(10,371),
(10,9999),
(11,91),
(12,3),
(12,27),
(12,254),
(12,9999),
(13,3),
(13,5),
(13,7),
(13,25),
(13,33),
(13,88),
(13,135);

CREATE TABLE empregado(
	matr integer,
	nome varchar(50),
	endereco varchar(50),
	data_lotacao timestamp,
	lotacao integer,
	gerencia_cod_dep integer,
	lotacao_div integer,
	gerencia_div integer
);

INSERT INTO empregado (matr,nome,endereco,data_lotacao,lotacao,gerencia_cod_dep,lotacao_div,gerencia_div)
VALUES 
(9999,'Jose Sampaio','R. Z','2006-06-06T00:00:00Z',1,1,12,null),
(33,'Jose Maria','R. 21','2006-03-01T00:00:00Z',1,NULL,11,11),
(1,'Maria Jose','R. 52','2003-03-01T00:00:00Z',1,NULL,11,null),
(7,'Yasmim','R. 13','0210-07-02T00:00:00Z',1,NULL,11,null),
(5,'Rebeca','R. 1','2011-04-01T00:00:00Z',1,NULL,12,12),
(13,'Sofia','R. 28','2010-09-09T00:00:00Z',1,NULL,12,null),
(27,'Andre','R. Z','2005-05-01T00:00:00Z',2,2,22,null),
(88,'Yami','R. T','2014-02-01T00:00:00Z',2,NULL,21,21),
(431,'Joao da Silva','R. Y','2011-07-03T00:00:00Z',2,NULL,21,null),
(135,'Ricardo Reis','R. 33','2009-08-01T00:00:00Z',2,NULL,21,null),
(254,'Barbara','R. Z','2008-01-03T00:00:00Z',2,NULL,22,22),
(371,'Ines','R. Y','2005-01-01T00:00:00Z',2,NULL,22,null),
(476,'Flor','R. Z','2015-10-28T00:00:00Z',2,NULL,23,23),
(25,'Lina','R. 67','2014-09-01T00:00:00Z',2,NULL,23,null),
(3,'Jose da Silva','R. 8','2011-01-02T00:00:00Z',3,3,31,null),
(71,'Silverio dos Reis','R. C','2009-01-05T00:00:00Z',3,NULL,31,31),
(91,'Reis da Silva','R. Z','2011-11-05T00:00:00Z',3,NULL,31,null),
(55,'Lucas','R. 31','2013-07-01T00:00:00Z',3,NULL,32,32),
(222,'Marina','R. 31','2015-01-07T00:00:00Z',3,NULL,32,null),
(725,'Angelo','R. X','2001-03-01T00:00:00Z',2,NULL,21,null);

CREATE TABLE vencimento(
	cod_venc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO vencimento (cod_venc,nome,tipo,valor)
VALUES 
(1,'Salario base Analista de Sistemas','V',5000),
(2,'Salario base Contador','V',3000),
(3,'Salario Base Engenheiro','V',4500),
(4,'Salario Base Projetista Software','V',5000),
(5,'Salario Base Programador de Sistemas','V',3000),
(6,'Gratificacao Chefia Departamento','V',3750),
(7,'Gratificacao Chefia Divisao','V',2200),
(8,'Salario Trabalhador Costrucao Civil','V',800),
(9,'Auxilio Salario Familia','V',300),
(10,'Gratificacao Tempo de servico','V',350),
(11,'Insalubridade','V',800),
(12,'Gratificacao por titulacao - Doutorado','V',2000),
(13,'Gratificacao por Titularidade - Mestrado','V',800);


SELECT 
	de.nome AS "Nome Departamento",
	count(e2.matr) AS "Numero de Empregados",
	round(avg(salaries.salary),2) AS "Media Salarial",
	round(max(salaries.salary),2) AS "Maior Salario",
	round(min(salaries.salary),2) AS "Menor Salario"
FROM 
		departamento de
		JOIN divisao di
		ON de.cod_dep = di.cod_dep
		JOIN empregado e2 
		ON e2.lotacao_div = di.cod_divisao 
		JOIN 
		(SELECT 
			v.matr,
			(COALESCE (sum(v.valor), 0) - COALESCE(sum(d.valor),0)) AS salary
		 FROM 
			(SELECT 
				e.matr,
				sum(v.valor) AS valor 
			 FROM 
				empregado e
				LEFT JOIN emp_venc ev 
				ON ev.matr = e.matr 
				LEFT JOIN vencimento v 
				ON ev.cod_venc = v.cod_venc
			 GROUP BY e.matr 
			) AS v
			LEFT JOIN (
			   SELECT
				ed.matr,
				sum(d.valor) AS valor 
				FROM 
					emp_desc ed
					JOIN desconto d 
					ON ed.cod_desc = d.cod_desc
				GROUP BY 1) AS d 
			ON v.matr = d.matr
		GROUP BY 1
		ORDER BY v.matr) AS salaries
	ON salaries.matr = e2.matr 
	GROUP BY 1
	ORDER BY "Media Salarial" DESC;



DROP TABLE departamento;
DROP TABLE dependente;
DROP TABLE divisao;
DROP TABLE empregado;
DROP TABLE emp_desc;
DROP TABLE emp_venc;
DROP TABLE desconto;
DROP TABLE vencimento;


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


----QUESTÃO 44, a mensagem do sensor

CREATE TABLE records(
	id integer PRIMARY KEY,
	temperature integer,
	mark integer
);

INSERT INTO records(id,temperature,mark)
VALUES 
(1,30,1),
(2,30,1),
(3,30,1),
(4,32,2),
(5,32,2),
(6,32,2),
(7,32,2),
(8,30,3),
(9,30,3),
(10,30,3),
(11,31,4),
(12,31,4),
(13,33,5),
(14,33,5),
(15,33,5);


SELECT r.temperature, count(temperature) AS number_of_records
FROM records r 
GROUP BY r.temperature, r.mark
ORDER BY r.mark;


DROP TABLE records;


------QUESTÃO 45, maior salário da divisão




CREATE TABLE departamento(
	cod_dep integer,
	nome varchar (50),
	endereco varchar (50)
); 

INSERT INTO departamento(cod_dep,nome,endereco)
VALUES 
(1,'Contabilidade','R. X'),
(2,'TI','R. Y'),
(3,'Engenharia','R. Y');

CREATE TABLE dependente(
	matr integer,
	nome varchar (50),
endereco varchar (50)
);

INSERT INTO dependente (matr,nome,endereco)
VALUES 
(9999,'Francisco Jose','R. Z'),
(88,'Maria da Silva','R. T'),
(55,'Virgulino da Silva','R. 31');

CREATE TABLE desconto(
	cod_desc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO desconto(cod_desc,nome,tipo,valor)
values
(91,'IR','V',400),
(92,'Plano de saude','V',300),
(93,NULL,null,null);

CREATE TABLE divisao(
	cod_divisao integer,
	nome varchar(50),
	endereco varchar(50),
	cod_dep numeric
);

INSERT INTO divisao(cod_divisao,nome,endereco,cod_dep)
VALUES 
(11,'Ativo','R. X',1),
(12,'Passivo','R. X',1),
(21,'Desenvoilvimento de Projetos','R. Y',2),
(22,'Analise de Sistemas','R. Y',2),
(23,'Programacao','R. W',2),
(31,'Concreto','R. Y',3),
(32,'Calculo Estrutural','R. Y',3);

CREATE TABLE emp_desc(
	cod_desc integer,
	matr integer
);

INSERT INTO emp_desc(cod_desc,matr)
VALUES 
(91,3),
(91,27),
(91,9999),
(92,27),
(92,71),
(92,88),
(92,9999);

CREATE TABLE emp_venc(
	cod_venc integer,
	matr integer
);

INSERT INTO emp_venc(cod_venc,matr)
VALUES 
(1,27),
(1,88),
(1,135),
(1,254),
(1,431),
(2,1),
(2,5),
(2,7),
(2,13),
(2,33),
(2,9999),
(3,3),
(3,55),
(3,71),
(3,222),
(4,25),
(4,476),
(5,371),
(6,3),
(6,27),
(6,9999),
(7,5),
(7,33),
(7,55),
(7,71),
(7,88),
(7,254),
(7,476),
(8,25),
(8,91),
(9,1),
(9,27),
(9,91),
(9,135),
(9,371),
(9,9999),
(10,371),
(10,9999),
(11,91),
(12,3),
(12,27),
(12,254),
(12,9999),
(13,3),
(13,5),
(13,7),
(13,25),
(13,33),
(13,88),
(13,135);

CREATE TABLE empregado(
	matr integer,
	nome varchar(50),
	endereco varchar(50),
	data_lotacao timestamp,
	lotacao integer,
	gerencia_cod_dep integer,
	lotacao_div integer,
	gerencia_div integer
);

INSERT INTO empregado (matr,nome,endereco,data_lotacao,lotacao,gerencia_cod_dep,lotacao_div,gerencia_div)
VALUES 
(9999,'Jose Sampaio','R. Z','2006-06-06T00:00:00Z',1,1,12,null),
(33,'Jose Maria','R. 21','2006-03-01T00:00:00Z',1,NULL,11,11),
(1,'Maria Jose','R. 52','2003-03-01T00:00:00Z',1,NULL,11,null),
(7,'Yasmim','R. 13','0210-07-02T00:00:00Z',1,NULL,11,null),
(5,'Rebeca','R. 1','2011-04-01T00:00:00Z',1,NULL,12,12),
(13,'Sofia','R. 28','2010-09-09T00:00:00Z',1,NULL,12,null),
(27,'Andre','R. Z','2005-05-01T00:00:00Z',2,2,22,null),
(88,'Yami','R. T','2014-02-01T00:00:00Z',2,NULL,21,21),
(431,'Joao da Silva','R. Y','2011-07-03T00:00:00Z',2,NULL,21,null),
(135,'Ricardo Reis','R. 33','2009-08-01T00:00:00Z',2,NULL,21,null),
(254,'Barbara','R. Z','2008-01-03T00:00:00Z',2,NULL,22,22),
(371,'Ines','R. Y','2005-01-01T00:00:00Z',2,NULL,22,null),
(476,'Flor','R. Z','2015-10-28T00:00:00Z',2,NULL,23,23),
(25,'Lina','R. 67','2014-09-01T00:00:00Z',2,NULL,23,null),
(3,'Jose da Silva','R. 8','2011-01-02T00:00:00Z',3,3,31,null),
(71,'Silverio dos Reis','R. C','2009-01-05T00:00:00Z',3,NULL,31,31),
(91,'Reis da Silva','R. Z','2011-11-05T00:00:00Z',3,NULL,31,null),
(55,'Lucas','R. 31','2013-07-01T00:00:00Z',3,NULL,32,32),
(222,'Marina','R. 31','2015-01-07T00:00:00Z',3,NULL,32,null),
(725,'Angelo','R. X','2001-03-01T00:00:00Z',2,NULL,21,null);

CREATE TABLE vencimento(
	cod_venc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO vencimento (cod_venc,nome,tipo,valor)
VALUES 
(1,'Salario base Analista de Sistemas','V',5000),
(2,'Salario base Contador','V',3000),
(3,'Salario Base Engenheiro','V',4500),
(4,'Salario Base Projetista Software','V',5000),
(5,'Salario Base Programador de Sistemas','V',3000),
(6,'Gratificacao Chefia Departamento','V',3750),
(7,'Gratificacao Chefia Divisao','V',2200),
(8,'Salario Trabalhador Costrucao Civil','V',800),
(9,'Auxilio Salario Familia','V',300),
(10,'Gratificacao Tempo de servico','V',350),
(11,'Insalubridade','V',800),
(12,'Gratificacao por titulacao - Doutorado','V',2000),
(13,'Gratificacao por Titularidade - Mestrado','V',800);



SELECT 
	nome,
	round(maior,2) AS salario
FROM 
	(SELECT 
		media.*
	FROM 
		(SELECT
			e2.matr,
			e2.nome,
			e2.lotacao_div,
			di.nome AS divisao,
			round(avg(salaries.salary),2) AS media,
			round(max(salaries.salary),2)AS maior 
		FROM 
			departamento de
			JOIN divisao di
			ON de.cod_dep = di.cod_dep
			JOIN empregado e2 
			ON e2.lotacao_div = di.cod_divisao 
			JOIN 
				(SELECT 
					v.matr,
					(COALESCE (sum(v.valor), 0) - COALESCE(sum(d.valor),0)) AS salary
				FROM 
					(SELECT
						e.matr,
						sum(v.valor) AS valor 
					FROM 
						empregado e
						LEFT JOIN emp_venc ev 
						ON ev.matr = e.matr 
						LEFT JOIN vencimento v 
						ON ev.cod_venc = v.cod_venc
					GROUP BY e.matr) AS v
				LEFT JOIN 
					(SELECT 
						ed.matr,
						sum(d.valor) AS valor 
					FROM 
						emp_desc ed
						JOIN desconto d 
						ON ed.cod_desc = d.cod_desc
					GROUP BY 1) AS d 
				ON v.matr = d.matr
				GROUP BY 1
				ORDER BY v.matr) AS salaries
		ON salaries.matr = e2.matr 
		GROUP BY 1,2,3,4
		ORDER BY media DESC) AS media
	ORDER BY media DESC) AS liquido
WHERE liquido.maior >= 8000
ORDER BY liquido.lotacao_div;

DROP TABLE departamento;
DROP TABLE dependente;
DROP TABLE divisao;
DROP TABLE empregado;
DROP TABLE emp_desc;
DROP TABLE emp_venc;
DROP TABLE desconto;
DROP TABLE vencimento;


------QUESTÃO 46, pagamento dos empregados




CREATE TABLE departamento(
	cod_dep integer,
	nome varchar (50),
	endereco varchar (50)
); 

INSERT INTO departamento(cod_dep,nome,endereco)
VALUES 
(1,'Contabilidade','R. X'),
(2,'TI','R. Y'),
(3,'Engenharia','R. Y');

CREATE TABLE dependente(
	matr integer,
	nome varchar (50),
endereco varchar (50)
);

INSERT INTO dependente (matr,nome,endereco)
VALUES 
(9999,'Francisco Jose','R. Z'),
(88,'Maria da Silva','R. T'),
(55,'Virgulino da Silva','R. 31');

CREATE TABLE desconto(
	cod_desc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO desconto(cod_desc,nome,tipo,valor)
values
(91,'IR','V',400),
(92,'Plano de saude','V',300),
(93,NULL,null,null);

CREATE TABLE divisao(
	cod_divisao integer,
	nome varchar(50),
	endereco varchar(50),
	cod_dep numeric
);

INSERT INTO divisao(cod_divisao,nome,endereco,cod_dep)
VALUES 
(11,'Ativo','R. X',1),
(12,'Passivo','R. X',1),
(21,'Desenvoilvimento de Projetos','R. Y',2),
(22,'Analise de Sistemas','R. Y',2),
(23,'Programacao','R. W',2),
(31,'Concreto','R. Y',3),
(32,'Calculo Estrutural','R. Y',3);

CREATE TABLE emp_desc(
	cod_desc integer,
	matr integer
);

INSERT INTO emp_desc(cod_desc,matr)
VALUES 
(91,3),
(91,27),
(91,9999),
(92,27),
(92,71),
(92,88),
(92,9999);

CREATE TABLE emp_venc(
	cod_venc integer,
	matr integer
);

INSERT INTO emp_venc(cod_venc,matr)
VALUES 
(1,27),
(1,88),
(1,135),
(1,254),
(1,431),
(2,1),
(2,5),
(2,7),
(2,13),
(2,33),
(2,9999),
(3,3),
(3,55),
(3,71),
(3,222),
(4,25),
(4,476),
(5,371),
(6,3),
(6,27),
(6,9999),
(7,5),
(7,33),
(7,55),
(7,71),
(7,88),
(7,254),
(7,476),
(8,25),
(8,91),
(9,1),
(9,27),
(9,91),
(9,135),
(9,371),
(9,9999),
(10,371),
(10,9999),
(11,91),
(12,3),
(12,27),
(12,254),
(12,9999),
(13,3),
(13,5),
(13,7),
(13,25),
(13,33),
(13,88),
(13,135);

CREATE TABLE empregado(
	matr integer,
	nome varchar(50),
	endereco varchar(50),
	data_lotacao timestamp,
	lotacao integer,
	gerencia_cod_dep integer,
	lotacao_div integer,
	gerencia_div integer
);

INSERT INTO empregado (matr,nome,endereco,data_lotacao,lotacao,gerencia_cod_dep,lotacao_div,gerencia_div)
VALUES 
(9999,'Jose Sampaio','R. Z','2006-06-06T00:00:00Z',1,1,12,null),
(33,'Jose Maria','R. 21','2006-03-01T00:00:00Z',1,NULL,11,11),
(1,'Maria Jose','R. 52','2003-03-01T00:00:00Z',1,NULL,11,null),
(7,'Yasmim','R. 13','0210-07-02T00:00:00Z',1,NULL,11,null),
(5,'Rebeca','R. 1','2011-04-01T00:00:00Z',1,NULL,12,12),
(13,'Sofia','R. 28','2010-09-09T00:00:00Z',1,NULL,12,null),
(27,'Andre','R. Z','2005-05-01T00:00:00Z',2,2,22,null),
(88,'Yami','R. T','2014-02-01T00:00:00Z',2,NULL,21,21),
(431,'Joao da Silva','R. Y','2011-07-03T00:00:00Z',2,NULL,21,null),
(135,'Ricardo Reis','R. 33','2009-08-01T00:00:00Z',2,NULL,21,null),
(254,'Barbara','R. Z','2008-01-03T00:00:00Z',2,NULL,22,22),
(371,'Ines','R. Y','2005-01-01T00:00:00Z',2,NULL,22,null),
(476,'Flor','R. Z','2015-10-28T00:00:00Z',2,NULL,23,23),
(25,'Lina','R. 67','2014-09-01T00:00:00Z',2,NULL,23,null),
(3,'Jose da Silva','R. 8','2011-01-02T00:00:00Z',3,3,31,null),
(71,'Silverio dos Reis','R. C','2009-01-05T00:00:00Z',3,NULL,31,31),
(91,'Reis da Silva','R. Z','2011-11-05T00:00:00Z',3,NULL,31,null),
(55,'Lucas','R. 31','2013-07-01T00:00:00Z',3,NULL,32,32),
(222,'Marina','R. 31','2015-01-07T00:00:00Z',3,NULL,32,null),
(725,'Angelo','R. X','2001-03-01T00:00:00Z',2,NULL,21,null);

CREATE TABLE vencimento(
	cod_venc integer,
	nome varchar(50),
	tipo varchar(10),
	valor numeric
);

INSERT INTO vencimento (cod_venc,nome,tipo,valor)
VALUES 
(1,'Salario base Analista de Sistemas','V',5000),
(2,'Salario base Contador','V',3000),
(3,'Salario Base Engenheiro','V',4500),
(4,'Salario Base Projetista Software','V',5000),
(5,'Salario Base Programador de Sistemas','V',3000),
(6,'Gratificacao Chefia Departamento','V',3750),
(7,'Gratificacao Chefia Divisao','V',2200),
(8,'Salario Trabalhador Costrucao Civil','V',800),
(9,'Auxilio Salario Familia','V',300),
(10,'Gratificacao Tempo de servico','V',350),
(11,'Insalubridade','V',800),
(12,'Gratificacao por titulacao - Doutorado','V',2000),
(13,'Gratificacao por Titularidade - Mestrado','V',800);


SELECT
	liquido.Departamento,
	liquido.Empregado,
	liquido.Salario_Bruto,
	liquido.desconto AS Total_Desconto,
	liquido.salary AS Salario_Liquidoaws
FROM 
	(SELECT
		de.nome AS Departamento,
		e2.nome AS Empregado,
		di.nome AS divisao,
		salaries.Salario_Bruto,
		salaries.desconto,
		salaries.salary
	FROM 
		departamento de
		JOIN divisao di
		ON de.cod_dep = di.cod_dep
		JOIN empregado e2 
		ON e2.lotacao_div = di.cod_divisao 
		JOIN 
			(SELECT 
				v.matr,
				(COALESCE (sum(v.valor), 0) - COALESCE(sum(d.valor),0)) AS salary,
				COALESCE (sum(v.valor), 0) AS salario_bruto, 
				COALESCE(sum(d.valor),0) AS desconto
			FROM 
				(SELECT
					e.matr,
					sum(v.valor) AS valor 
				FROM 
					empregado e
					LEFT JOIN emp_venc ev 
					ON ev.matr = e.matr 
					LEFT JOIN vencimento v 
					ON ev.cod_venc = v.cod_venc
				GROUP BY e.matr) AS v
			LEFT JOIN 
				(SELECT 
					ed.matr,
					sum(d.valor) AS valor 
				FROM 
					emp_desc ed
					JOIN desconto d 
					ON ed.cod_desc = d.cod_desc
				GROUP BY 1) AS d 
			ON v.matr = d.matr
			GROUP BY 1
			ORDER BY v.matr) AS salaries
	ON salaries.matr = e2.matr) AS liquido
ORDER BY salario_liquidoaws DESC;


DROP TABLE departamento;
DROP TABLE dependente;
DROP TABLE divisao;
DROP TABLE empregado;
DROP TABLE emp_desc;
DROP TABLE emp_venc;
DROP TABLE desconto;
DROP TABLE vencimento;
