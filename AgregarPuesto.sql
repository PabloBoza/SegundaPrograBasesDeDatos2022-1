CREATE OR ALTER PROCEDURE sp_AgregarArticulo 
						@Nombre varchar(128),
						@SalarioXHora int,
						@OutResultCode int OUTPUT
AS

SET NOCOUNT ON;

BEGIN TRY

IF EXISTS (SELECT id
 FROM dbo.Puesto
 Where( Puesto.Nombre=@Nombre))
BEGIN
	SET @OutResultCode = 50001; -- Ya existe ese articulo
END
ELSE

INSERT INTO dbo.Puestoculo(
			Nombre,
			SalarioXHora
			) VALUES (@nombre,@SalarioXHora);
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