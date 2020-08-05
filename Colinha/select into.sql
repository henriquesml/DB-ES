--SELECT INTO
--UMA MANEIRA RÁPIDA DE COPIAR DADOS
--PERSISTIR ALGO NO BANCO DE DADOS
SELECT Clientes.ClienteNome, CartaoCredito.CartaoCodigo 
INTO ClientesCartao
FROM Clientes
INNER JOIN CartaoCredito
    ON Clientes.ClienteCodigo=CartaoCredito.ClienteCodigo
 
SELECT * 
INTO    Clientes_bkp
FROM Clientes
 
SELECT * FROM Clientes_bkp
