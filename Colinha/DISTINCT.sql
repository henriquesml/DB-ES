SELECT DISTINCT ClienteBairro FROM Clientes ORDER BY ClienteBairro --Pega somente um de casa, não repete

SELECT DISTINCT ClienteCodigo, ClienteNome, ClienteBairro, ClienteSobrenome FROM Clientes ORDER BY ClienteNome --filtrando corretamente pelo id