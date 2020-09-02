CREATE PROCEDURE uspRetornaIdadeSimples
AS
SELECT Clientes.ClienteNome, YEAR (GETDATE())-YEAR (ClienteNascimento) AS IDADE
FROM Clientes
INNER JOIN Contas on Clientes.ClienteCodigo  = Contas.ClienteCodigo

EXEC uspRetornaIdadeSimples