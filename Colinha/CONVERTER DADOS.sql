/*MySQL*/

SELECT CAST("2017-08-29" AS DATE);
SELECT CONVERT("2017-08-29", DATE);

/* Converte e Limita em 5 char */
SELECT CAST(ClienteNome AS CHAR(5)) FROM clientes;

/* Converte e Limita em 5 char */
SELECT CONVERT(ClienteNome, CHAR(5)) FROM clientes;