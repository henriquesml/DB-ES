SELECT Clientes.ClienteNome, Contas.ContaNumero, Movimentos.MovimentoValor FROM Clientes
INNER JOIN Contas ON (Contas.ClienteCodigo = Clientes.ClienteCodigo) -- condição da Busca, filtra dados que estão na condição 
INNER JOIN Movimentos ON (Contas.ContaNumero = Movimentos.ContaNumero) --(posso usar quanto joins eu quiser)
-- Relação interna, intersecção, relacionamento restritivo.

SELECT Clientes.ClienteNome, CartaoCredito.CartaoCodigo, Clientes.ClienteCodigo, CartaoCredito.ClienteCodigo FROM Clientes
LEFT JOIN CartaoCredito
    ON (Clientes.ClienteCodigo = CartaoCredito.ClienteCodigo) -- LEFT Diz que a tabela da esquerda vem inteira, ela manda no relacionamento. Não descarta o respeito do verdadeiro vindo do outro lado (RIGTH)
ORDER By CartaoCredito.CartaoCodigo desc


SELECT Clientes.ClienteNome, Clientes.ClienteTelefone,
CASE WHEN CartaoCredito.CartaoCodigo IS NULL
    THEN 'LIGAR'
    ELSE 'NÃO LIGAR'
END AS MESAGEM

FROM Clientes
LEFT JOIN CartaoCredito
    ON (Clientes.ClienteCodigo = CartaoCredito.ClienteCodigo) -- LEFT Diz que a tabela da esquerda vem inteira, ela manda no relacionamento. Não descarta o respeito do verdadeiro vindo do outro lado (RIGTH)
ORDER By CartaoCredito.CartaoCodigo desc