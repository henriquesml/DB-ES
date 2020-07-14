SELECT ClienteNome, ClienteEstadoCivil,
CASE 
    WHEN ClienteEstadoCivil = 'S' THEN 'SOLTEIRO'
    ELSE 'CASADO'
END AS 'EstadoCivil' --nomear coluna
FROM Clientes


SELECT ClienteNome, ClienteEstadoCivil,
CASE 
    ClienteEstadoCivil WHEN 'S' THEN 'SOLTEIRO'
    ELSE 'CASADO'
END AS 'EstadoCivil' --nomear coluna
FROM Clientes


--Com Números
SELECT ContaNumero, MovimentoValor,
CASE 
    WHEN MovimentoValor >= 100 THEN 'BOM'
    ELSE 'RUIM'
END AS 'Classificacao'
FROM Movimentos

--BETWEEN
SELECT MovimentoValor FROM Movimentos WHERE MovimentoValor BETWEEN 50 AND 100