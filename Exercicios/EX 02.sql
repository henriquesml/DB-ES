--1)  Crie uma consulta que mostre os bairros classificados por região e seu total em movimentação. 
--    Classifique pelo menos duas regiões com dois bairros cada uma. Lembre-se que não temos Região na nossa base de dados.


SELECT distinct Clientes.ClienteBairro,
SUM(Movimentos.MovimentoValor) AS TotalMovimento,
CASE 
    WHEN Clientes.ClienteBairro in ('BOM RETIRO', 'SANTO ANTONIO') THEN 'NORTE'
    WHEN Clientes.ClienteBairro in ('FLORESTA', 'PROFIPO') THEN 'SUL'
    ELSE 'SEM CLASSIFICAÇÃO'
END AS 'REGIÃO'
FROM Clientes
LEFT JOIN Contas ON (Contas.ClienteCodigo = Clientes.ClienteCodigo) -- Usando o left para trazer todas as contas
LEFT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero) -- Usando o left para trazer todas as contas
GROUP BY Clientes.ClienteBairro 

---------- professor

SELECT distinct case 
    when ClienteBairro 
        in ('BOM RETIRO','SANTO ANTONIO')
            THEN 'NORTE'
    when ClienteBairro 
        in ('FLORESTA','ANITA GARIBALDI')
            THEN 'SUL'
    ELSE 'OUTROS' END AS 'REGIÃO',
    SUM(Movimentos.MovimentoValor) AS TOTAL
    FROM Clientes 
        LEFT JOIN Contas ON (CONTAS.ClienteCodigo = CLIENTES.ClienteCodigo)
        LEFT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero)
    GROUP BY case 
    when ClienteBairro 
        in ('BOM RETIRO','SANTO ANTONIO')
            THEN 'NORTE'
    when ClienteBairro 
        in ('FLORESTA','ANITA GARIBALDI')
            THEN 'SUL'
    ELSE 'OUTROS' END

--2) Crie uma consulta que mostre as 10 melhores contas do banco.

SELECT TOP 10 
    Movimentos.ContaNumero, SUM(MovimentoValor) AS Total 
FROM Movimentos
    LEFT JOIN Contas ON (Movimentos.ContaNumero = Contas.ContaNumero)
GROUP BY Movimentos.ContaNumero
ORDER BY 2 DESC



--3) Insira mais dois clientes na tabela de Cartão de Crédito.

SELECT * FROM CartaoCredito
SELECT * FROM Agencias --3
SELECT * FROM CONTAS

INSERT CartaoCredito 
    (AgenciaCodigo, ContaNumero, ClienteCodigo, CartaoCodigo, CartaoLimite, CartaoExpira, CartaoCodigoSeguranca) 
VALUES
    (1, '006226-6', 48, '1052-2200-3300-4400', 300, DATEADD(YY, 3, GETDATE()), 225)


INSERT CartaoCredito 
    (AgenciaCodigo, ContaNumero, ClienteCodigo, CartaoCodigo, CartaoLimite, CartaoExpira, CartaoCodigoSeguranca) 
VALUES
    (1, '009134-6', 846, '1232-2260-3344-4450', 300, DATEADD(YY, 3, GETDATE()), 225)

--4) Atualize o limite do cartão de crédito de todos os clientes em 10%.

SELECT CartaoLimite, CartaoLimite * 1.1 FROM CartaoCredito
UPDATE CartaoCredito SET CartaoLimite = CartaoLimite * 1.1