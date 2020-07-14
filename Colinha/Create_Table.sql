--ddl (comandos de criação de tabelas, comandos que definem o que eu quero fazer)
CREATE TABLE Vendas
(
    ID_VENDA INT CONSTRAINT PK_VENDAS PRIMARY KEY, --sempre dar nome para constraint
    IDADE INT CONSTRAINT CHK_IDADE CHECK ([IDADE]>= 18),
    ID_CLIENTE INT CONSTRAINT FK_CLIENTE FOREIGN KEY
        REFERENCES Clientes (ClienteCodigo)
)