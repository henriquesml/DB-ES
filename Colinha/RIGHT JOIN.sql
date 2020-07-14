SELECT Clientes.ClienteNome, Contas.ContaNumero
    FROM Clientes
INNER JOIN Contas -- FILTRA, mostra a igualdade das duas
    ON (Contas.ClienteCodigo = Clientes.ClienteCodigo)

SELECT Clientes.ClienteNome, CartaoCredito.CartaoCodigo
    FROM Clientes
    LEFT JOIN CartaoCredito -- A tebela que manda é a da ESQUERDA
        ON (Clientes.ClienteCodigo = CartaoCredito.ClienteCodigo)

SELECT Clientes.ClienteNome, CartaoCredito.CartaoCodigo
    FROM Clientes
    RIGHT JOIN CartaoCredito -- A tabela que manda na consulta é a Tabela da DIREITA
        ON (Clientes.ClienteCodigo = CartaoCredito.ClienteCodigo)