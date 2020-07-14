-- FUnções de Agregação
SELECT SUM(Movimentos.MovimentoValor) AS 'TotalMovimentos' FROM Movimentos

SELECT SUM(Movimentos.MovimentoValor) AS 'TotalMovimentos', AVG(Movimentos.MovimentoValor) AS 'MediaMovimentos' FROM Movimentos

SELECT SUM(Movimentos.MovimentoValor) AS 'TotalMovimentos', AVG(Movimentos.MovimentoValor) AS 'MediaMovimentos', COUNT(*) 'TotalDeMovimentacoes' FROM Movimentos


SELECT SUM(Movimentos.MovimentoValor) AS 'TotalMovimentos', 
    AVG(Movimentos.MovimentoValor) AS 'MediaMovimentos',
        COUNT(*) 'TotalDeMovimentacoes',
            TipoMovimento.TipoMovimentoDescricao -- Para inserir campos que não estejam em agregação, precisa de group by
                FROM Movimentos
                    INNER JOIN TipoMovimento
                    ON (Movimentos.MovimentoTipo = TipoMovimento.TipoMovimentoCodigo)
GROUP BY TipoMovimento.TipoMovimentoDescricao --Valores que não estão na agregação, precisam ser ordenados


-- Mais de UMA ordenação e Group by
SELECT SUM(Movimentos.MovimentoValor) AS 'TotalMovimentos', 
    AVG(Movimentos.MovimentoValor) AS 'MediaMovimentos',
        COUNT(*) 'TotalDeMovimentacoes',
            TipoMovimento.TipoMovimentoDescricao, -- Para inserir campos que não estejam em agregação, precisa de group by
            Clientes.ClienteBairro
                FROM Movimentos
                    INNER JOIN TipoMovimento
                    ON (Movimentos.MovimentoTipo = TipoMovimento.TipoMovimentoCodigo)
                    INNER JOIN Contas
                    ON (Movimentos.ContaNumero = Contas.ContaNumero)
                    INNER JOIN Clientes
                    ON (Clientes.ClienteCodigo = Contas.ClienteCodigo)
GROUP BY TipoMovimento.TipoMovimentoDescricao, Clientes.ClienteBairro --Valores que não estão na agregação, precisam ser ordenados
ORDER BY Clientes.ClienteBairro