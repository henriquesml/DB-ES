SELECT CartaoCredito.CartaoCodigo, Clientes.ClienteNome FROM CartaoCredito 
    FULL OUTER JOIN Clientes  -- Semelhante ao left join, junta todos os contundos, ou mostra as diferenças, tirando a intersecção
        ON (CartaoCredito.ClienteCodigo = Clientes.ClienteCodigo)