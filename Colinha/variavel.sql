--VARIÁVEIS

DECLARE @CODIGO INT, @NOME VARCHAR(5)

SELECT @CODIGO = ClienteCodigo, @NOME = ClienteNome FROM Clientes
WHERE Clientes.ClienteNome = 'Jon'
and ClienteSobrenome = 'Yang'

SELECT @CODIGO, @NOME

SET @nome = (SELECT ClienteNome FROM Clientes
WHERE Clientes.ClienteNome = 'Jon'
and ClienteSobrenome = 'Yang')