SELECT TOP 5 Clientes.ClienteBairro, -- Ele diz quem são os TOP 5
    sum(Movimentos.MovimentoValor) as Total
    FROM Movimentos
    INNER JOIN Contas 
        on (Contas.ContaNumero=Movimentos.ContaNumero)
    INNER JOIN Clientes
        on (Contas.ClienteCodigo=Clientes.ClienteCodigo)
GROUP BY Clientes.ClienteBairro
ORDER BY Total desc -- Maior para o menor