CREATE OR ALTER PROCEDURE sp_MostrarPuestos
				@OutResultCode int OUTPUT

AS

SET NOCOUNT ON;

BEGIN TRY
	IF NOT EXISTS (SELECT * FROM dbo.Puesto)
		BEGIN
			SET @OutResultCode=50001; --No hay Puestos
			RETURN
		END;
			SELECT	Id,
					Nombre,
					SalarioXHora,
			FROM dbo.Puesto
            WHERE (dbo.Puesto(Activado) == 1)
			ORDER BY Nombre ASC
END TRY
BEGIN CATCH
	IF @@TRANCOUNT>0


		INSERT INTO dbo.BE_DBErrors VALUES (
			SUSER_SNAME(),
			ERROR_NUMBER(),
			ERROR_STATE(),
			ERROR_SEVERITY(),
			ERROR_LINE(),
			ERROR_PROCEDURE(),
			ERROR_MESSAGE(),
			GETDATE()
		);

		SET @OutResultCode=50005;

END CATCH
SET NOCOUNT OFF;

--TESTING
--DECLARE @OutResultCode int;
--EXEC MostrarArticulos @OutResultCode