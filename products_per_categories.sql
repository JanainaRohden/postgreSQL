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
