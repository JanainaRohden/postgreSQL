----QUESTÃO 36, cpf dos empregados
	
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
