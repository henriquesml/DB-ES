SET DATEFORMAT DMY
SET LANGUAGE PORTUGUESE

SELECT DATEADD(YY, 3, GETDATE()) -- joga 3 anos para frente

SELECT GETDATE() -- DATA ATUAL

SELECT DATENAME(MONTH, (GETDATE())) -- MES ATUAl


SELECT Clientes.ClienteNome, 
    YEAR(getdate()) - YEAR(ClienteNascimento) AS Idade -- PEGANDO IDADE DO CLIENTE PELA SUBTRAÇÃO
FROM Clientes
    where ClienteCodigo in (1,2)



SELECT Clientes.ClienteNome, 
    DATEDIFF(YEAR, ClienteNascimento, GETDATE()) AS Idade -- PEGANDO PELA DIFERENÇA
FROM Clientes
    where ClienteCodigo in (1,2)



SELECT Clientes.ClienteNome, 
    DATEPART(yy, GETDATE()) AS [Ano Atual], -- PEGANDO Ano da data
    DATEPART(mm, GETDATE()) AS [Mes Atual] -- PEGANDO Mês da data
FROM Clientes
    where ClienteCodigo in (1,2)



SELECT Clientes.ClienteNome, 
    DATEADD(dd, 1, GETDATE()) AS [Dia de amanha],
    DAY(DATEADD(dd, 1, GETDATE())) AS [Dia de amanha (dia)]
FROM Clientes
    where ClienteCodigo in (1,2)


-- VARIOS TIPOS DE EXTRAIR DATA
SELECT Clientes.ClienteNome, 
    YEAR(getdate()) - YEAR(ClienteNascimento) AS Idade,
    DATEDIFF(YEAR,ClienteNascimento, GETDATE()) AS Idade2,
    DATEDIFF(MONTH,ClienteNascimento, GETDATE()) AS Idade3,
    DATEDIFF(DAY,ClienteNascimento, GETDATE()) AS Idade4,
    DATEPART(yy,GETDATE()) as [Ano Atual],
    DATEPART(mm,GETDATE()) as [Mês Atual],
    DAY(DATEADD(dd,1,GETDATE())) as [Dia de Amanhã],
    DAY(DATEADD(dd,-1,GETDATE())) as [Dia de Ontem],
    EOMONTH(GETDATE()) AS [Última data do mês],
    EOMONTH(dateadd(mm,-1,GETDATE())) AS [Última data do mês anterior],
    DATENAME(MONTH,(GETDATE())) AS [Nome do Mês],
    MONTH(getdate()) AS Mês,
    day(getdate()) AS dia,
    DATEPART(HH,GETDATE()) as [Hora Atual]
FROM Clientes
where ClienteCodigo in (1,2)
