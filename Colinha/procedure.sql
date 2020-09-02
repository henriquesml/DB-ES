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

-- Com dois Parametros e variáveis

CREATE PROCEDURE uspRetornaOpcao
@opcao int,
@valor float

AS

IF @opcao = 1
	BEGIN
		SELECT 'Você escolheu a opção', @opcao, @valor
	END
ELSE
	BEGIN
		DECLARE @opcao_interna int = 99, @valor_interna int = 99
		SELECT 'Você escolheu a opção', @opcao_interna, @valor_interna
	END

EXEC uspRetornaOpcao 1, 2.0