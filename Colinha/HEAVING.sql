SELECT Clientes.ClienteBairro, 
    sum(Movimentos.MovimentoValor) as Total
    FROM Movimentos
    INNER JOIN Contas 
        on (Contas.ContaNumero=Movimentos.ContaNumero)
    INNER JOIN Clientes
        on (Contas.ClienteCodigo=Clientes.ClienteCodigo)
GROUP BY Clientes.ClienteBairro
HAVING sum(Movimentos.MovimentoValor) > (SELECT AVG(Movimentos.MovimentoValor) FROM Movimentos) -- Media de movimentação, poderia colocar um valor fixo, mas não é legal
ORDER BY Total desc

-- o Heaving Compara o valor de uma funão de agragação. É usado para comparar a função de agregação com algum valor