CREATE PROCEDURE sp_CadastraNotas
(
    @MATRICULA INT,
    @CURSO CHAR(3),
    @MATERIA CHAR(3),
    @PERLETIVO CHAR(4),
    @NOTA FLOAT,
    @FALTA INT,
    @BIMESTRE INT
)
AS
BEGIN

    IF @BIMESTRE = 1
    BEGIN

        UPDATE MATRICULA
        SET N1 = @NOTA,
            F1 = @FALTA,
            TOTALPONTOS = @NOTA,
            TOTALFALTAS = @FALTA,
            MEDIA = @NOTA
        WHERE MATRICULA = @MATRICULA
              AND CURSO = @CURSO
              AND MATERIA = @MATERIA
              AND PERLETIVO = @PERLETIVO;
    END;

    ELSE IF @BIMESTRE = 2
    BEGIN

        UPDATE MATRICULA
        SET N2 = @NOTA,
            F2 = @FALTA,
            TOTALPONTOS = @NOTA + N1,
            TOTALFALTAS = @FALTA + F1,
            MEDIA = (@NOTA + N1) / @BIMESTRE
        WHERE MATRICULA = @MATRICULA
              AND CURSO = @CURSO
              AND MATERIA = @MATERIA
              AND PERLETIVO = @PERLETIVO;
    END;

    ELSE IF @BIMESTRE = 3
    BEGIN

        UPDATE MATRICULA
        SET N3 = @NOTA,
            F3 = @FALTA,
            TOTALPONTOS = @NOTA + N1 + N2,
            TOTALFALTAS = @FALTA + F1 + F2,
            MEDIA = (@NOTA + N1 + N2) / @BIMESTRE
        WHERE MATRICULA = @MATRICULA
              AND CURSO = @CURSO
              AND MATERIA = @MATERIA
              AND PERLETIVO = @PERLETIVO;
    END;

    ELSE IF @BIMESTRE = 4
    BEGIN

        DECLARE @RESULTADO VARCHAR(50),
                @FREQUENCIA FLOAT;

        DECLARE @CARGAHORA INT 
        SET @CARGAHORA = (SELECT CARGAHORARIA from MATERIAS where sigla = @MATERIA and curso = @CURSO)

        UPDATE MATRICULA
        SET N4 = @NOTA,
            F4 = @FALTA,
            TOTALPONTOS = @NOTA + N1 + N2 + N3,
            TOTALFALTAS = @FALTA + F1 + F2 + F3,
            MEDIA = (@NOTA + N1 + N2 + N3) / @BIMESTRE,
            PERCFREQ = 100 -( ((@FALTA + F1 + F2 + F3)* @CARGAHORA )/100),
            RESULTADO = (
            	case
                  when ((@NOTA + N1 + N2 + N3) / @BIMESTRE >= 7) AND (100 -( ((@FALTA + F1 + F2 + F3)* @CARGAHORA )/100) >= 70) then 'Aprovado'
                  when (100 -( ((@FALTA + F1 + F2 + F3)* @CARGAHORA )/100) < 70) then 'Reprovado'
                  else 'Exame'
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


