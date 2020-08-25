CREATE FUNCTION fnRetornaAno(data DATE)
RETURNS int
AS
  BEGIN
  DECLARE @ano int
  SET @ano = YEAR(@data)
    RETURN @ano
end;


dbo.fnRetornaAno(GETDATE())