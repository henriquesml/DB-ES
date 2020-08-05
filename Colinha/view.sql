--Criar view

CREATE VIEW vBairroTotal
AS
SELECT SUM(MovimentoValor) AS Total,
Clientes.ClienteBairro 
    FROM Movimentos
    INNER join Contas on contas.ContaNumero=Movimentos.ContaNumero
    INNER JOIN Clientes ON CONTAS.ClienteCodigo=Clientes.ClienteCodigo
GROUP BY Clientes.ClienteBairro 
 
SELECT * FROM vBairroTotal

-- ALterar view
ALTER VIEW vBairroTotal
AS
SELECT SUM(MovimentoValor) AS Valor,
Clientes.ClienteBairro 
    FROM Movimentos
    INNER join Contas on contas.ContaNumero=Movimentos.ContaNumero
    INNER JOIN Clientes ON CONTAS.ClienteCodigo=Clientes.ClienteCodigo
GROUP BY Clientes.ClienteBairro 
 
SELECT * FROM vBairroTotal