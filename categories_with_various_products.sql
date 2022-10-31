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