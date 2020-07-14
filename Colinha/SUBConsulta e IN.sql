SELECT * FROM Clientes 
WHERE ClienteCodigo 
    IN 
    (
        SELECT ClienteCodigo FROM Clientes WHERE ClienteBairro IN ('BOM RETIRO', 'PROFIPO') -- Em subconsultas o IN deve retornar apenas UM atributo
    )