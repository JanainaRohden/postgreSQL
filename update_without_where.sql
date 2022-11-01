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