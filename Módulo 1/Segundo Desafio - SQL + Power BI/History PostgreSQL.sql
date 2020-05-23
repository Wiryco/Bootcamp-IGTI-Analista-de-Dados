--- 22-05-2020 15:16:54
--- PostgreSQL

CREATE TABLE EMPREGADO
	( PNOME VARCHAR(15) NOT NULL,
	MINICIAL CHAR,
	UNOME VARCHAR(15) NOT NULL,
	SSN CHAR(9) NOT NULL,
	DATANASC DATE,
	ENDERECO VARCHAR(30),
	SEXO CHAR,
	SALARIO DECIMAL(10,2),
	SUPERSSN CHAR(9),
	PRIMARY KEY(SSN),
	FOREIGN KEY(SUPERSSN) REFERENCES EMPREGADO(SSN));

CREATE TABLE DEPARTAMENTO (
	DNOME VARCHAR(15) NOT NULL ,
	DNUMERO INT NOT NULL ,
	GERSSN CHAR(9) NULL ,
	GERDATAINICIO DATE,
	PRIMARY KEY (DNUMERO) ,
	UNIQUE (DNOME) ,
	FOREIGN KEY (GERSSN) REFERENCES EMPREGADO(SSN));

ALTER TABLE EMPREGADO
	ADD DNO INTEGER,
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTAMENTO(DNUMERO);

CREATE TABLE DEPTO_LOCALIZACOES (
	DNUMERO INT NOT NULL,
	DLOCALIZACAO VARCHAR(15) NOT NULL,
	PRIMARY KEY (DNUMERO, DLOCALIZACAO) ,
	FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE PROJETO (
	PJNOME VARCHAR(15) NOT NULL ,
	PNUMERO INT NOT NULL ,
	PLOCALIZACAO VARCHAR(15),
	DNUM INT NOT NULL ,
	PRIMARY KEY (PNUMERO) , UNIQUE (PJNOME) ,
	FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE TRABALHA_EM (
	ESSN CHAR(9) NOT NULL ,
	PNO INT NOT NULL,
	HORAS DECIMAL(3,1) NOT NULL ,
	PRIMARY KEY (ESSN, PNO) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN) ,
	FOREIGN KEY (PNO) REFERENCES PROJETO(PNUMERO));

CREATE TABLE DEPENDENTE(
	ESSN CHAR(9) NOT NULL ,
	NOME_DEPENDENTE VARCHAR(15) NOT NULL,
	SEX CHAR,
	DATANASC DATE,
	PARENTESCO VARCHAR(8) ,
	PRIMARY KEY (ESSN, NOME_DEPENDENTE) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN));

INSERT INTO DEPARTAMENTO VALUES
('Headquarters', 1, NULL, '1971-06-19'),
('Administration', 4, NULL, '1985-01-01'),
('Research', 5, NULL, '1978-05-22'),
('Automation', 7, NULL, '2006-10-05');

INSERT INTO EMPREGADO VALUES
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5),
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000, '987654321', 4);

UPDATE DEPARTAMENTO SET GERSSN = '888665555' WHERE DNUMERO = 1;
UPDATE DEPARTAMENTO SET GERSSN = '987654321' WHERE DNUMERO = 4;
UPDATE DEPARTAMENTO SET GERSSN = '333445555' WHERE DNUMERO = 5;
UPDATE DEPARTAMENTO SET GERSSN = '123456789' WHERE DNUMERO = 7;

INSERT INTO DEPENDENTE VALUES
('123456789', 'Alice', 'F', CAST('31-Dec-78' as DATE), 'Daughter'),
('123456789', 'Elizabeth', 'F', CAST('05-May-57' as DATE), 'Spouse'),
('123456789', 'Michael', 'M', CAST('01-Jan-78' as DATE), 'Son'),
('333445555', 'Alice', 'F', CAST('05-Apr-76' as DATE), 'Daughter'),
('333445555', 'Joy', 'F', CAST('03-May-48' as DATE), 'Spouse'),
('333445555', 'Theodore', 'M', CAST('25-Oct-73' as DATE), 'Son'),
('987654321', 'Abner', 'M', CAST('29-Feb-32' as DATE), 'Spouse');

INSERT INTO DEPTO_LOCALIZACOES VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO PROJETO VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO TRABALHA_EM VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--- 22-05-2020 15:17:10
--- PostgreSQL
select * from empregado;

--- 22-05-2020 15:26:11
--- PostgreSQL
/***** ERROR ******
42703 column "departamento" does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT departamento;
*****/

--- 22-05-2020 15:26:41
--- PostgreSQL
/***** ERROR ******
42P01 relation "dnome" does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT departamento from dnome;
*****/

--- 22-05-2020 15:27:13
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT dnome from departamento;

--- 22-05-2020 15:28:13
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT pnome from empregado;

--- 22-05-2020 15:28:24
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT * from empregado;

--- 22-05-2020 15:29:20
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT * from departamento;

--- 22-05-2020 15:29:29
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT * from empregado;

--- 22-05-2020 15:41:45
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 15:43:06
--- PostgreSQL
/***** ERROR ******
42703 column "Research" does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
departamento.dnumero = "Research";
*****/

--- 22-05-2020 15:43:38
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 15:44:54
--- PostgreSQL
/***** ERROR ******
42703 column "Research" does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome, sum(departamento.dnome = "Research")
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 15:45:07
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 15:47:28
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';

--- 22-05-2020 15:48:24
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "empregado"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
SUM empregado.salario where departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:48:33
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "where"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
SUM(empregado.salario where departamento.dnome like '%Research');
*****/

--- 22-05-2020 15:49:31
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "departamento"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
SUM(empregado.salario) departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:49:42
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near ","
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
SUM(empregado.salario), departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:50:16
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome, SUM(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:50:41
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "from"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, SUM(empregado.salario), departamento.dnome,
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:50:54
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "from"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome,
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:51:20
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';

--- 22-05-2020 15:59:03
--- PostgreSQL
/***** ERROR ******
42601 unterminated /* comment at or near "/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from empregado

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research';
*****/

--- 22-05-2020 15:59:13
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from empregado

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:00:20
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from projeto

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:00:30
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from trabalha_em

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:00:43
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from depto_localizacoes

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:01:02
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from dependente

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:01:18
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

select * from empregado

/*SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'*/;

--- 22-05-2020 16:04:49
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT empregado.pnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;

--- 22-05-2020 16:05:44
--- PostgreSQL
/***** ERROR ******
42601 syntax error at end of input
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT *
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
WHERE;
*****/

--- 22-05-2020 16:05:54
--- PostgreSQL
/***** ERROR ******
42601 syntax error at end of input
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
WHERE;
*****/

--- 22-05-2020 16:06:07
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;

--- 22-05-2020 16:08:25
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
WHERE
departamento.gerssn = empregado.ssn;

--- 22-05-2020 16:09:22
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
WHERE
empregado.pnome LIKE '%Franklin';

--- 22-05-2020 16:09:38
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;

--- 22-05-2020 16:12:06
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "SELECT"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;
*****/

--- 22-05-2020 16:12:14
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/;

--- 22-05-2020 16:13:51
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;

--- 22-05-2020 16:15:43
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn;

--- 22-05-2020 16:17:44
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "select"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
where departamento.gerssn(
  select empregado.ssn from empregado.pnome LINK '%Franklin'
);
*****/

--- 22-05-2020 16:18:22
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "select"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.ssn = departamento.gerssn
where departamento.gerssn(
  select empregado.ssn from empregado where empregado.pnome LINK '%Franklin'
);
*****/

--- 22-05-2020 16:19:28
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "select"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
where departamento.gerssn(
  select empregado.ssn from empregado where empregado.pnome LINK '%Franklin'
);
*****/

--- 22-05-2020 16:19:40
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn;

--- 22-05-2020 16:24:17
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  );

--- 22-05-2020 17:02:02
--- PostgreSQL
/***** ERROR ******
[2.5] DB 15min afk limit exceeded, DB-Drop!
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select * from dependente

SELECT * from empregado
INNER JOIN dependente
ON
empregado.dno = 
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  );
*****/

--- 22-05-2020 17:02:19
--- PostgreSQL

CREATE TABLE EMPREGADO
	( PNOME VARCHAR(15) NOT NULL,
	MINICIAL CHAR,
	UNOME VARCHAR(15) NOT NULL,
	SSN CHAR(9) NOT NULL,
	DATANASC DATE,
	ENDERECO VARCHAR(30),
	SEXO CHAR,
	SALARIO DECIMAL(10,2),
	SUPERSSN CHAR(9),
	PRIMARY KEY(SSN),
	FOREIGN KEY(SUPERSSN) REFERENCES EMPREGADO(SSN));

CREATE TABLE DEPARTAMENTO (
	DNOME VARCHAR(15) NOT NULL ,
	DNUMERO INT NOT NULL ,
	GERSSN CHAR(9) NULL ,
	GERDATAINICIO DATE,
	PRIMARY KEY (DNUMERO) ,
	UNIQUE (DNOME) ,
	FOREIGN KEY (GERSSN) REFERENCES EMPREGADO(SSN));

ALTER TABLE EMPREGADO
	ADD DNO INTEGER,
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTAMENTO(DNUMERO);

CREATE TABLE DEPTO_LOCALIZACOES (
	DNUMERO INT NOT NULL,
	DLOCALIZACAO VARCHAR(15) NOT NULL,
	PRIMARY KEY (DNUMERO, DLOCALIZACAO) ,
	FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE PROJETO (
	PJNOME VARCHAR(15) NOT NULL ,
	PNUMERO INT NOT NULL ,
	PLOCALIZACAO VARCHAR(15),
	DNUM INT NOT NULL ,
	PRIMARY KEY (PNUMERO) , UNIQUE (PJNOME) ,
	FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE TRABALHA_EM (
	ESSN CHAR(9) NOT NULL ,
	PNO INT NOT NULL,
	HORAS DECIMAL(3,1) NOT NULL ,
	PRIMARY KEY (ESSN, PNO) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN) ,
	FOREIGN KEY (PNO) REFERENCES PROJETO(PNUMERO));

CREATE TABLE DEPENDENTE(
	ESSN CHAR(9) NOT NULL ,
	NOME_DEPENDENTE VARCHAR(15) NOT NULL,
	SEX CHAR,
	DATANASC DATE,
	PARENTESCO VARCHAR(8) ,
	PRIMARY KEY (ESSN, NOME_DEPENDENTE) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN));

INSERT INTO DEPARTAMENTO VALUES
('Headquarters', 1, NULL, '1971-06-19'),
('Administration', 4, NULL, '1985-01-01'),
('Research', 5, NULL, '1978-05-22'),
('Automation', 7, NULL, '2006-10-05');

INSERT INTO EMPREGADO VALUES
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5),
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000, '987654321', 4);

UPDATE DEPARTAMENTO SET GERSSN = '888665555' WHERE DNUMERO = 1;
UPDATE DEPARTAMENTO SET GERSSN = '987654321' WHERE DNUMERO = 4;
UPDATE DEPARTAMENTO SET GERSSN = '333445555' WHERE DNUMERO = 5;
UPDATE DEPARTAMENTO SET GERSSN = '123456789' WHERE DNUMERO = 7;

INSERT INTO DEPENDENTE VALUES
('123456789', 'Alice', 'F', CAST('31-Dec-78' as DATE), 'Daughter'),
('123456789', 'Elizabeth', 'F', CAST('05-May-57' as DATE), 'Spouse'),
('123456789', 'Michael', 'M', CAST('01-Jan-78' as DATE), 'Son'),
('333445555', 'Alice', 'F', CAST('05-Apr-76' as DATE), 'Daughter'),
('333445555', 'Joy', 'F', CAST('03-May-48' as DATE), 'Spouse'),
('333445555', 'Theodore', 'M', CAST('25-Oct-73' as DATE), 'Son'),
('987654321', 'Abner', 'M', CAST('29-Feb-32' as DATE), 'Spouse');

INSERT INTO DEPTO_LOCALIZACOES VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO PROJETO VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO TRABALHA_EM VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--- 22-05-2020 17:02:30
--- PostgreSQL

CREATE TABLE EMPREGADO
	( PNOME VARCHAR(15) NOT NULL,
	MINICIAL CHAR,
	UNOME VARCHAR(15) NOT NULL,
	SSN CHAR(9) NOT NULL,
	DATANASC DATE,
	ENDERECO VARCHAR(30),
	SEXO CHAR,
	SALARIO DECIMAL(10,2),
	SUPERSSN CHAR(9),
	PRIMARY KEY(SSN),
	FOREIGN KEY(SUPERSSN) REFERENCES EMPREGADO(SSN));

CREATE TABLE DEPARTAMENTO (
	DNOME VARCHAR(15) NOT NULL ,
	DNUMERO INT NOT NULL ,
	GERSSN CHAR(9) NULL ,
	GERDATAINICIO DATE,
	PRIMARY KEY (DNUMERO) ,
	UNIQUE (DNOME) ,
	FOREIGN KEY (GERSSN) REFERENCES EMPREGADO(SSN));

ALTER TABLE EMPREGADO
	ADD DNO INTEGER,
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTAMENTO(DNUMERO);

CREATE TABLE DEPTO_LOCALIZACOES (
	DNUMERO INT NOT NULL,
	DLOCALIZACAO VARCHAR(15) NOT NULL,
	PRIMARY KEY (DNUMERO, DLOCALIZACAO) ,
	FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE PROJETO (
	PJNOME VARCHAR(15) NOT NULL ,
	PNUMERO INT NOT NULL ,
	PLOCALIZACAO VARCHAR(15),
	DNUM INT NOT NULL ,
	PRIMARY KEY (PNUMERO) , UNIQUE (PJNOME) ,
	FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE TRABALHA_EM (
	ESSN CHAR(9) NOT NULL ,
	PNO INT NOT NULL,
	HORAS DECIMAL(3,1) NOT NULL ,
	PRIMARY KEY (ESSN, PNO) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN) ,
	FOREIGN KEY (PNO) REFERENCES PROJETO(PNUMERO));

CREATE TABLE DEPENDENTE(
	ESSN CHAR(9) NOT NULL ,
	NOME_DEPENDENTE VARCHAR(15) NOT NULL,
	SEX CHAR,
	DATANASC DATE,
	PARENTESCO VARCHAR(8) ,
	PRIMARY KEY (ESSN, NOME_DEPENDENTE) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN));

INSERT INTO DEPARTAMENTO VALUES
('Headquarters', 1, NULL, '1971-06-19'),
('Administration', 4, NULL, '1985-01-01'),
('Research', 5, NULL, '1978-05-22'),
('Automation', 7, NULL, '2006-10-05');

INSERT INTO EMPREGADO VALUES
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5),
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000, '987654321', 4);

UPDATE DEPARTAMENTO SET GERSSN = '888665555' WHERE DNUMERO = 1;
UPDATE DEPARTAMENTO SET GERSSN = '987654321' WHERE DNUMERO = 4;
UPDATE DEPARTAMENTO SET GERSSN = '333445555' WHERE DNUMERO = 5;
UPDATE DEPARTAMENTO SET GERSSN = '123456789' WHERE DNUMERO = 7;

INSERT INTO DEPENDENTE VALUES
('123456789', 'Alice', 'F', CAST('31-Dec-78' as DATE), 'Daughter'),
('123456789', 'Elizabeth', 'F', CAST('05-May-57' as DATE), 'Spouse'),
('123456789', 'Michael', 'M', CAST('01-Jan-78' as DATE), 'Son'),
('333445555', 'Alice', 'F', CAST('05-Apr-76' as DATE), 'Daughter'),
('333445555', 'Joy', 'F', CAST('03-May-48' as DATE), 'Spouse'),
('333445555', 'Theodore', 'M', CAST('25-Oct-73' as DATE), 'Son'),
('987654321', 'Abner', 'M', CAST('29-Feb-32' as DATE), 'Spouse');

INSERT INTO DEPTO_LOCALIZACOES VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO PROJETO VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO TRABALHA_EM VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--- 22-05-2020 17:02:56
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "SELECT"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select * from dependente

SELECT * from empregado
INNER JOIN dependente
ON
empregado.dno = 
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  );
*****/

--- 22-05-2020 17:03:03
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select * from dependente;

--- 22-05-2020 17:03:21
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select * from empregado;

--- 22-05-2020 17:03:37
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

select * from dependente;

--- 22-05-2020 17:04:01
--- PostgreSQL
/***** ERROR ******
42883 operator does not exist: integer = character
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.dno = dependente.essn
and empregado.superssn = departamento.gerssn;
*****/

--- 22-05-2020 17:04:31
--- PostgreSQL
/***** ERROR ******
42883 operator does not exist: integer = character
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.dno = dependente.essn;
*****/

--- 22-05-2020 17:04:41
--- PostgreSQL
/***** ERROR ******
42883 operator does not exist: integer = character
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON empregado.dno = dependente.essn;
*****/

--- 22-05-2020 17:04:56
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn;

--- 22-05-2020 17:05:57
--- pgsql.1
SELECT * from dependente;

--- 22-05-2020 17:07:06
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:07:44
--- pgsql.2
SELECT * from dependente;

--- 22-05-2020 17:12:17
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn
WHERE empregado.ssn in(
  SELECT dependente.essn from dependente WHERE dependente.nome_dependente = dependente.nome_dependente
  );

--- 22-05-2020 17:14:09
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn
WHERE dependente.essn in(
  SELECT empregado.ssn from empregado WHERE empregado.ssn = empregado.ssn
  );

--- 22-05-2020 17:14:35
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn;

--- 22-05-2020 17:15:43
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn
WHERE
dependente.nome_dependente = dependente.nome_dependente;

--- 22-05-2020 17:16:31
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT DISTINCT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn
WHERE
dependente.nome_dependente = dependente.nome_dependente;

--- 22-05-2020 17:16:39
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT DISTINCT * from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn;

--- 22-05-2020 17:17:16
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT DISTINCT empregado.pnome, dependente.nome_dependente from empregado
INNER JOIN dependente
ON
empregado.ssn = dependente.essn;

--- 22-05-2020 17:19:14
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "GROUP"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1;
*****/

--- 22-05-2020 17:19:22
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "GROUP"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1;
*****/

--- 22-05-2020 17:20:04
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1;

--- 22-05-2020 17:23:16
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 0;

--- 22-05-2020 17:23:23
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1;

--- 22-05-2020 17:26:00
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:27:03
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/* SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research' */

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1 */
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

SELECT AVG(empregado.salario)
from empregado;

--- 22-05-2020 17:28:17
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/;

--- 22-05-2020 17:29:27
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:29:33
--- pgsql.2
SELECT * from projeto;

--- 22-05-2020 17:30:29
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:30:41
--- pgsql.2
SELECT * from projeto;

--- 22-05-2020 17:31:36
--- pgsql.3
SELECT * from trabalha_em;

--- 22-05-2020 17:32:20
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near ","
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto, trabalha_em;
*****/

--- 22-05-2020 17:33:14
--- PostgreSQL
/***** ERROR ******
42601 syntax error at end of input
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
INNER JOIN trabalha_em;
*****/

--- 22-05-2020 17:33:20
--- PostgreSQL
/***** ERROR ******
42601 syntax error at end of input
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
INNER JOIN trabalha_em;
*****/

--- 22-05-2020 17:34:21
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:34:27
--- pgsql.2
SELECT * from projeto;

--- 22-05-2020 17:34:36
--- pgsql.3
SELECT * from trabalha_em;

--- 22-05-2020 17:34:41
--- pgsql.2
SELECT * from projeto;

--- 22-05-2020 17:35:38
--- pgsql.3
SELECT * from trabalha_em;

--- 22-05-2020 17:35:50
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno;

--- 22-05-2020 17:36:38
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%New';

--- 22-05-2020 17:36:48
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits';

--- 22-05-2020 17:38:38
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, MAX(trabalha_em.horas) from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits';
*****/

--- 22-05-2020 17:38:59
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT MAX(trabalha_em.horas) from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits';

--- 22-05-2020 17:39:13
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, MAX(trabalha_em.horas) from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits';
*****/

--- 22-05-2020 17:40:45
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by MAX(trabalha_em.horas);
*****/

--- 22-05-2020 17:41:00
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits';

--- 22-05-2020 17:41:47
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by MAX(trabalha_em.horas) DESC;
*****/

--- 22-05-2020 17:41:57
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:43:48
--- pgsql.3
SELECT * from departamento;

--- 22-05-2020 17:45:46
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:50:53
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 17:51:19
--- pgsql.3
SELECT * from trabalha_em;

--- 22-05-2020 17:51:37
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/


SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:53:59
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:54:44
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:54:58
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "."
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
order by trabalha_em.horas DESC;
*****/

--- 22-05-2020 17:55:04
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
order by trabalha_em.horas DESC;

--- 22-05-2020 17:58:59
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "ON"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
ON
empregado.salario := ((empregado.salario * 110)/100);
*****/

--- 22-05-2020 17:59:23
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "as"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
as
empregado.salario := ((empregado.salario * 110)/100);
*****/

--- 22-05-2020 18:00:30
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "end"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
end
empregado.salario := ((empregado.salario * 110)/100);
*****/

--- 22-05-2020 18:03:45
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX';

--- 22-05-2020 18:04:07
--- PostgreSQL
/***** ERROR ******
42883 function reajuste(numeric) does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome,
Reajuste((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX';
*****/

--- 22-05-2020 18:04:18
--- PostgreSQL
/***** ERROR ******
42883 function reaj(numeric) does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome,
REAJ((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX';
*****/

--- 22-05-2020 18:04:24
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX';

--- 22-05-2020 18:10:04
--- PostgreSQL
/***** ERROR ******
42712 table name "trabalha_em" specified more than once
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero,trabalha_em.horas
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX';
*****/

--- 22-05-2020 18:10:43
--- PostgreSQL
/***** ERROR ******
42712 table name "trabalha_em" specified more than once
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero,trabalha_em.horas
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn;
*****/

--- 22-05-2020 18:11:12
--- pgsql.4
SELECT * from departamento;

--- 22-05-2020 18:11:57
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 18:12:21
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "="
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero,trabalha_em.horas
from empregado
INNER JOIN empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:12:56
--- PostgreSQL
/***** ERROR ******
42P01 missing FROM-clause entry for table "projeto"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero,trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:13:09
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:13:35
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnumero = 5;

--- 22-05-2020 18:14:02
--- pgsql.2
SELECT * from projeto;

--- 22-05-2020 18:14:17
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 18:15:14
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "INNER"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
WHERE
projeto.pjnome LIKE '%ProjectX';
*****/

--- 22-05-2020 18:15:31
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "INNER"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
WHERE
projeto.pjnome LIKE '%ProductX';
*****/

--- 22-05-2020 18:15:56
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
WHERE
projeto.pjnome LIKE '%ProductX';

--- 22-05-2020 18:16:10
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX';

--- 22-05-2020 18:16:28
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX';

--- 22-05-2020 18:16:50
--- pgsql.3
SELECT * from trabalha_em;

--- 22-05-2020 18:17:16
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn;

--- 22-05-2020 18:17:46
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10;

--- 22-05-2020 18:19:56
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas;

--- 22-05-2020 18:20:10
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10;

--- 22-05-2020 18:20:19
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas;

--- 22-05-2020 18:21:20
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas;

--- 22-05-2020 18:27:36
--- PostgreSQL
/***** ERROR ******
42P01 relation "empregao" does not exist
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregao
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:27:46
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT empregado.pnome, empregado.salario, departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:28:29
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.pnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT empregado.pnome, AVG(empregado.salario), departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:28:43
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:29:32
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:29:39
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:32:06
--- PostgreSQL
/***** ERROR ******
42803 aggregate functions are not allowed in WHERE
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
AVG(empregado.salario);
*****/

--- 22-05-2020 18:32:15
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "as"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
as
AVG(empregado.salario);
*****/

--- 22-05-2020 18:32:21
--- PostgreSQL
/***** ERROR ******
42601 syntax error at or near "AVG"
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
AVG(empregado.salario);
*****/

--- 22-05-2020 18:32:53
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:50:54
--- PostgreSQL
/***** ERROR ******
[2.5] DB 15min afk limit exceeded, DB-Drop!
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE departamento.dnome in(
  
  );
*****/

--- 22-05-2020 18:51:20
--- PostgreSQL

CREATE TABLE EMPREGADO
	( PNOME VARCHAR(15) NOT NULL,
	MINICIAL CHAR,
	UNOME VARCHAR(15) NOT NULL,
	SSN CHAR(9) NOT NULL,
	DATANASC DATE,
	ENDERECO VARCHAR(30),
	SEXO CHAR,
	SALARIO DECIMAL(10,2),
	SUPERSSN CHAR(9),
	PRIMARY KEY(SSN),
	FOREIGN KEY(SUPERSSN) REFERENCES EMPREGADO(SSN));

CREATE TABLE DEPARTAMENTO (
	DNOME VARCHAR(15) NOT NULL ,
	DNUMERO INT NOT NULL ,
	GERSSN CHAR(9) NULL ,
	GERDATAINICIO DATE,
	PRIMARY KEY (DNUMERO) ,
	UNIQUE (DNOME) ,
	FOREIGN KEY (GERSSN) REFERENCES EMPREGADO(SSN));

ALTER TABLE EMPREGADO
	ADD DNO INTEGER,
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTAMENTO(DNUMERO);

CREATE TABLE DEPTO_LOCALIZACOES (
	DNUMERO INT NOT NULL,
	DLOCALIZACAO VARCHAR(15) NOT NULL,
	PRIMARY KEY (DNUMERO, DLOCALIZACAO) ,
	FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE PROJETO (
	PJNOME VARCHAR(15) NOT NULL ,
	PNUMERO INT NOT NULL ,
	PLOCALIZACAO VARCHAR(15),
	DNUM INT NOT NULL ,
	PRIMARY KEY (PNUMERO) , UNIQUE (PJNOME) ,
	FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO(DNUMERO));

CREATE TABLE TRABALHA_EM (
	ESSN CHAR(9) NOT NULL ,
	PNO INT NOT NULL,
	HORAS DECIMAL(3,1) NOT NULL ,
	PRIMARY KEY (ESSN, PNO) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN) ,
	FOREIGN KEY (PNO) REFERENCES PROJETO(PNUMERO));

CREATE TABLE DEPENDENTE(
	ESSN CHAR(9) NOT NULL ,
	NOME_DEPENDENTE VARCHAR(15) NOT NULL,
	SEX CHAR,
	DATANASC DATE,
	PARENTESCO VARCHAR(8) ,
	PRIMARY KEY (ESSN, NOME_DEPENDENTE) ,
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN));

INSERT INTO DEPARTAMENTO VALUES
('Headquarters', 1, NULL, '1971-06-19'),
('Administration', 4, NULL, '1985-01-01'),
('Research', 5, NULL, '1978-05-22'),
('Automation', 7, NULL, '2006-10-05');

INSERT INTO EMPREGADO VALUES
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5),
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000, '987654321', 4);

UPDATE DEPARTAMENTO SET GERSSN = '888665555' WHERE DNUMERO = 1;
UPDATE DEPARTAMENTO SET GERSSN = '987654321' WHERE DNUMERO = 4;
UPDATE DEPARTAMENTO SET GERSSN = '333445555' WHERE DNUMERO = 5;
UPDATE DEPARTAMENTO SET GERSSN = '123456789' WHERE DNUMERO = 7;

INSERT INTO DEPENDENTE VALUES
('123456789', 'Alice', 'F', CAST('31-Dec-78' as DATE), 'Daughter'),
('123456789', 'Elizabeth', 'F', CAST('05-May-57' as DATE), 'Spouse'),
('123456789', 'Michael', 'M', CAST('01-Jan-78' as DATE), 'Son'),
('333445555', 'Alice', 'F', CAST('05-Apr-76' as DATE), 'Daughter'),
('333445555', 'Joy', 'F', CAST('03-May-48' as DATE), 'Spouse'),
('333445555', 'Theodore', 'M', CAST('25-Oct-73' as DATE), 'Son'),
('987654321', 'Abner', 'M', CAST('29-Feb-32' as DATE), 'Spouse');

INSERT INTO DEPTO_LOCALIZACOES VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO PROJETO VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO TRABALHA_EM VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);

--- 22-05-2020 18:53:50
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, ROUND(AVG(empregado.salario))
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;
*****/

--- 22-05-2020 18:55:14
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario), COUNT(*)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, COUNT;
*****/

--- 22-05-2020 18:55:35
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario), COUNT(*)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, COUNT(*);
*****/

--- 22-05-2020 18:55:58
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario), COUNT(*)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario, COUNT(*);
*****/

--- 22-05-2020 18:56:22
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario;
*****/

--- 22-05-2020 18:56:44
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario;

--- 22-05-2020 18:57:12
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, SUM(empregado.salario);
*****/

--- 22-05-2020 18:57:28
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero;

--- 22-05-2020 18:58:02
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario;
*****/

--- 22-05-2020 18:58:08
--- PostgreSQL
/***** ERROR ******
42803 column "departamento.dnome" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, SUM(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario;
*****/

--- 22-05-2020 18:58:31
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
ORDER BY departamento.dnome, empregado.salario;

--- 22-05-2020 19:05:59
--- pgsql.4
SELECT * from departamento;

--- 22-05-2020 19:06:19
--- pgsql.1
SELECT * from empregado;

--- 22-05-2020 19:13:54
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome, empregado.salario;

--- 22-05-2020 19:16:10
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by AVG(empregado.salario);

--- 22-05-2020 19:16:22
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.salario" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, empregado.salario
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by AVG(empregado.salario);
*****/

--- 22-05-2020 19:16:33
--- PostgreSQL
/***** ERROR ******
42803 column "empregado.salario" must appear in the GROUP BY clause or be used in an aggregate function
 ----- 
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by empregado.salario;
*****/

--- 22-05-2020 19:16:40
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by AVG(empregado.salario);

--- 22-05-2020 19:18:21
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

/*
SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by AVG(empregado.salario)
*/

select d.dnome, avg(e.salario) -- a função avg retorna a média de valores 
from departamento d
inner join empregado e on d.dnumero = e.dno
group by d.dnome -- realiza agrupamento pelo nome do departamento
order by avg(e.salario) asc -- ordena de forma ascedente;

--- 22-05-2020 19:28:50
--- PostgreSQL
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/

/*
SELECT sum(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
WHERE
departamento.dnome like '%Research'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?
*/

/*
SELECT * from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and empregado.superssn = departamento.gerssn
WHERE departamento.gerssn in(
  SELECT empregado.ssn from empregado WHERE empregado.pnome LIKE '%Franklin'
  )
*/
  
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/

/*
SELECT
    empregado.pnome, dependente.nome_dependente, COUNT(*)
FROM
    empregado INNER JOIN dependente
ON
	empregado.ssn = dependente.essn
GROUP BY
    empregado.pnome, dependente.nome_dependente
HAVING 
    COUNT(*) > 1
*/
    
/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/

/*
SELECT AVG(empregado.salario)
from empregado
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/

/*
SELECT empregado.pnome, projeto.pjnome, trabalha_em.horas from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%Newbenefits'
order by trabalha_em.horas DESC
*/

/*
Considere o banco de dados do enunciado.
Crie uma consulta em SQL e responda:
Qual seria o custo do projeto com folha salarial (soma de todos os salários),
caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/

/*
SELECT empregado.pnome, empregado.salario, projeto.pjnome,
ROUND((cast(empregado.salario as DECIMAL)*110)/100)
from empregado
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
INNER JOIN trabalha_em
ON
projeto.pnumero = trabalha_em.pno
AND
empregado.ssn = trabalha_em.essn
WHERE
projeto.pjnome LIKE '%ProductX'
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/

/*
SELECT empregado.pnome, projeto.pjnome, departamento.dnumero, sum(trabalha_em.horas)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
and
departamento.dnumero = 5
INNER JOIN projeto
ON
empregado.dno = projeto.dnum
and
projeto.pjnome LIKE '%ProductX'
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
AND
trabalha_em.horas > 10
GROUP BY empregado.pnome, projeto.pjnome, departamento.dnumero, trabalha_em.horas
*/

/*
Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda:
Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/

SELECT departamento.dnome, AVG(empregado.salario)
from empregado
INNER JOIN departamento
ON
empregado.dno = departamento.dnumero
GROUP BY departamento.dnome
ORDER by AVG(empregado.salario);

