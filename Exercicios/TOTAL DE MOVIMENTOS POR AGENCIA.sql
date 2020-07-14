--Total de movimentos por agência

SELECT Agencias.AgenciaCodigo, (SUM(ISNULL(MovimentoValor, 0)))  as Total FROM Agencias -- Subititui por 0 os valores NULL, SÓ CONSEGUE SUBTITUIR UM VALOR
    LEFT JOIN Contas 
        ON (Agencias.AgenciaCodigo = Contas.AgenciaCodigo)
    LEFT JOIN Movimentos 
        ON (Contas.ContaNumero = Movimentos.ContaNumero)
GROUP BY Agencias.AgenciaCodigo
