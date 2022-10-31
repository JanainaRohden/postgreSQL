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