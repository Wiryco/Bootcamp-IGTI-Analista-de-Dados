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
SELECT count(*)
from empregado
INNER JOIN trabalha_em
ON
empregado.ssn = trabalha_em.essn
INNER JOIN projeto
ON
trabalha_em.pno = projeto.pnumero
WHERE
trabalha_em.horas > 10
AND
empregado.dno = 5
and
projeto.pjnome LIKE '%ProductX'
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
ORDER by AVG(empregado.salario)
