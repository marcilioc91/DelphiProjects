CREATE TABLE inss (
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    aliquota DECIMAL(10,2),
    minimo DECIMAL(10,2),
    maximo DECIMAL(10,2)
);


SELECT f.codigo, f.nome, f.dataNascimento, f.contato, f.email, f.ativo,
c.codigo AS codCargo, c.nome AS cargo
FROM funcionario f
LEFT JOIN cargo c ON c.codigo = f.cargo
ORDER BY f.codigo

SELECT *
  FROM H_SALARIO

SELECT MAX(h.data) AS data FROM h_salario h WHERE h.funcionario = 1  
  
SELECT MAX(h.data) AS data, h.funcionario AS codFunc, h.salario 
FROM h_salario h
INNER JOIN funcionario f ON f.codigo = h.funcionario
GROUP BY h.funcionario, h.salario
