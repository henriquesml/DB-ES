--Total de movimentos por agência

SELECT * FROM Clientes
SELECT * FROM Movimentos
SELECT * FROM Contas


-- Movimento por sexo, mostrando sexo por extenso
SELECT CASE when Clientes.ClienteSexo = 'M' THEN 'Masculino'
else 'Feminino' end as Sexo,
    sum(Movimentos.MovimentoValor) as Total
    FROM Movimentos
    INNER JOIN Contas 
        on (Contas.ContaNumero=Movimentos.ContaNumero)
    INNER JOIN Clientes
        on (Contas.ClienteCodigo=Clientes.ClienteCodigo)
GROUP BY Clientes.ClienteSexo