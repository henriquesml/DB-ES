SELECT * FROM Clientes
WHERE ClienteNome LIKE 'r%' -- Começa com a Letra R

SELECT * FROM Clientes
WHERE ClienteNome LIKE '%r' -- Termina com a Letra R

SELECT * FROM Clientes
WHERE ClienteNome LIKE '%r%' -- Tem a Letra R no meio

SELECT * FROM Clientes
WHERE ClienteNome LIKE 'r' -- Tem que ser igual

-- NOT LIKE (não será igual)