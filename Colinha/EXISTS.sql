SELECT Contas.ClienteCodigo, ClienteNome, Contas.ContaNumero, AgenciaCodigo FROM Clientes, Contas
    WHERE Clientes.ClienteCodigo=Contas.ClienteCodigo
AND EXISTS
( 
    SELECT * FROM CartaoCredito 
    WHERE AgenciaCodigo = Contas.AgenciaCodigo -- EXISTS permite comparar com a consulta de cima
    AND ContaNumero = Contas.ContaNumero -- EXISTS permite comparar com a consulta de cima
    AND ClienteCodigo =  Clientes.ClienteCodigo -- EXISTS permite comparar com a consulta de cima
)
