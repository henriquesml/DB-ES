--Mostrar a média de idade por bairro

SELECT CLIENTES.ClienteBairro, AVG(DATEDIFF(YEAR, CLIENTES.ClienteNascimento, GETDATE())) AS Media FROM CLIENTES
GROUP BY CLIENTES.ClienteBairro
ORDER BY CLIENTES.ClienteBairro

-- =======================================================================================

-- Mostrar quais bairros de idade média acima da média geral
-- A  media é 36

SELECT Clientes.ClienteBairro,
    AVG(DATEDIFF(YEAR,ClienteNascimento, GETDATE())) AS Idade 
FROM Clientes
GROUP BY Clientes.ClienteBairro
HAVING AVG(DATEDIFF(YEAR,ClienteNascimento, GETDATE())) >
    (
        SELECT AVG(DATEDIFF(YEAR,ClienteNascimento, GETDATE()))  FROM Clientes
    )

-- =======================================================================================

-- Mostrar o total de movimentações por agência, mesmo que a agencia não tenha movimentação

-- Usando RIGHT --
SELECT Agencias.AgenciaCodigo, Agencias.AgenciaNome, 
    (SUM(ISNULL(Movimentos.MovimentoValor, 0))) AS TOTAL_MOVIMENTO FROM Contas -- Subititui por 0 os valores NULL, SÓ CONSEGUE SUBTITUIR UM VALOR
    RIGHT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero)
    RIGHT JOIN Agencias ON (Agencias.AgenciaCodigo = Contas.AgenciaCodigo)
GROUP BY Agencias.AgenciaCodigo, Agencias.AgenciaNome
ORDER BY Agencias.AgenciaNome

-- Usando LEFT --
SELECT Agencias.AgenciaCodigo, Agencias.AgenciaNome, 
    (SUM(ISNULL(Movimentos.MovimentoValor, 0))) AS TOTAL_MOVIMENTO FROM Agencias -- Subititui por 0 os valores NULL, SÓ CONSEGUE SUBTITUIR UM VALOR
    LEFT JOIN Contas ON (Contas.AgenciaCodigo = Agencias.AgenciaCodigo )
    LEFT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero)
GROUP BY Agencias.AgenciaCodigo, Agencias.AgenciaNome
ORDER BY Agencias.AgenciaNome

-- Usando LEFT e CASE--
SELECT Agencias.AgenciaCodigo, Agencias.AgenciaNome,

    CASE WHEN (SUM(Movimentos.MovimentoValor)) IS NULL THEN 0 
    ELSE (SUM(Movimentos.MovimentoValor)) END 
    AS TOTAL_MOVIMENTO FROM Agencias 

    LEFT JOIN Contas ON (Contas.AgenciaCodigo = Agencias.AgenciaCodigo )
    LEFT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero)

GROUP BY Agencias.AgenciaCodigo, Agencias.AgenciaNome
ORDER BY Agencias.AgenciaNome

-- =======================================================================================
-- Mostrar o total de movimentações por agência, mesmo que a agencia não tenha movimentação
-- Agrupar por sexo

SELECT * FROM CONTAS
SELECT * FROM CLIENTES

SELECT Agencias.AgenciaNome, Clientes.ClienteSexo,
    (SUM(ISNULL(Movimentos.MovimentoValor, 0))) AS TOTAL_MOVIMENTO FROM Agencias -- Subititui por 0 os valores NULL, SÓ CONSEGUE SUBTITUIR UM VALOR
    LEFT JOIN Contas ON (Contas.AgenciaCodigo = Agencias.AgenciaCodigo )
    LEFT JOIN Clientes ON (Clientes.ClienteCodigo = Contas.ClienteCodigo )
    LEFT JOIN Movimentos ON (Movimentos.ContaNumero = Contas.ContaNumero)
GROUP BY Agencias.AgenciaNome, Clientes.ClienteSexo
ORDER BY 3 DESC, 1, 2 DESC -- CAMPOS QUE ESTÃO NO SELECT, o 1 é agencia nome, o dois cliente sexo e etc