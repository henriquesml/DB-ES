--MOSTRAR O TOTAL DE MOVIMENTAÇÃO APENAS DOS CLIENTES
-- QUE POSSUEM CARTÃO DE CRÉDITO

SELECT Clientes.ClienteNome,CartaoCredito.CartaoCodigo,
    sum(Movimentos.MovimentoValor) as Total
    FROM Movimentos
    INNER JOIN Contas 
        on (Contas.ContaNumero=Movimentos.ContaNumero)
    INNER JOIN Clientes
        on (Contas.ClienteCodigo=Clientes.ClienteCodigo)
    INNER  JOIN CartaoCredito
        on (Clientes.ClienteCodigo=CartaoCredito.ClienteCodigo)
GROUP BY Clientes.ClienteNome,CartaoCredito.CartaoCodigo
order by CartaoCredito.CartaoCodigo desc
