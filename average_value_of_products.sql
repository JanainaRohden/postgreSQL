----QUESTÃO 9, valor médio dos produtos

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
