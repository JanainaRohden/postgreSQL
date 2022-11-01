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