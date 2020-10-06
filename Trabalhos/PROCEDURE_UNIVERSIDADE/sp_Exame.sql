CREATE PROCEDURE sp_Exame
(
    @MATRICULA INT,
    @CURSO CHAR(3),
    @MATERIA CHAR(3),
    @PERLETIVO CHAR(4),
    @NOTA_EXAME FLOAT
)
AS
BEGIN

    BEGIN
		DECLARE @CARGAHORA INT 
        SET @CARGAHORA = (SELECT CARGAHORARIA from MATERIAS where sigla = @MATERIA and curso = @CURSO)
        
        UPDATE MATRICULA
        SET N4 = (@NOTA_EXAME + N4),
            MEDIA = (@NOTA_EXAME + N1 + N2 + N3 + N4) / 4,
            RESULTADO = (
            	case
                  when ((@NOTA_EXAME + N1 + N2 + N3 + N4) / 4 >= 7) AND (100 -( ((F1 + F2 + F3 + F4)* @CARGAHORA )/100) >= 70) then 'Aprovado'
                  else 'Reprovado'
                 end
            )
                   WHERE MATRICULA = @MATRICULA
              AND CURSO = @CURSO
              AND MATERIA = @MATERIA
              AND PERLETIVO = @PERLETIVO;
    END;

    SELECT *
    FROM MATRICULA
    WHERE MATRICULA = @MATRICULA;
END;

EXEC sp_Exame @MATRICULA= 3, @CURSO = 'ENG', @MATERIA='BDA', @PERLETIVO = 2020,  @NOTA_EXAME = 0.4


