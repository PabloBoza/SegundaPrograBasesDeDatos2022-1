CREATE OR ALTER PROCEDURE sp_InsertarPuesto
						@nombre varchar(64),
                        @salarioxhora int,
						@OutResultCode int OUTPUT
AS

SET NOCOUNT ON;

BEGIN TRY
/*
IF EXISTS (SELECT id
 FROM dbo.Empleado
 Where( Empleado.Nombre=@nombre))
BEGIN
	SET @OutResultCode = 50001; -- Ya existe ese Departamento
END
ELSE
*/
BEGIN TRANSACTION InsertarPuesto
INSERT INTO dbo.Empleado(
			Nombre,
            SalarioXHora,
            Activado
			) VALUES (
                @nombre,
                @salarioxhora,
                1);
COMMIT TRANSACTION InsertarPuesto
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
--DECLARE @a varchar(128) = 'Panadol';
--DECLARE @b Money = '950';
--DECLARE @c int;
--EXEC sp_AgregarArticulo @a, @b, @c
--SELECT * FROM dbo.Articulo
