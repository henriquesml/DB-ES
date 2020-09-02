CREATE PROCEDURE uspRetornaIdadeSimples
AS
SELECT Clientes.ClienteNome, YEAR (GETDATE())-YEAR (ClienteNascimento) AS IDADE
FROM Clientes
INNER JOIN Contas on Clientes.ClienteCodigo  = Contas.ClienteCodigo

EXEC uspRetornaIdadeSimples

-- Com Parametro

CREATE PROCEDURE uspRetornaIdade
@CodigoCliente int
AS
SELECT Clientes.ClienteNome, YEAR (GETDATE())-YEAR (ClienteNascimento) AS IDADE
FROM Clientes
INNER JOIN Contas on Clientes.ClienteCodigo  = Contas.ClienteCodigo
WHERE Clientes.ClienteCodigo = @CodigoCliente;

EXEC uspRetornaIdade 1