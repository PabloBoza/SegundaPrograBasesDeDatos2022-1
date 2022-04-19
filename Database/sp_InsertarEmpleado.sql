CREATE OR ALTER PROCEDURE sp_InsertarEmpleado 
                        @tipo_id_doc int,
                        @nombrepuesto varchar(64),
                        @iddepartamento int,
						@nombre varchar(64),
						@fechaNacimiento date,
						@OutResultCode int OUTPUT
AS

SET NOCOUNT ON;

BEGIN TRY
/*
IF EXISTS (SELECT id
 FROM dbo.Empleado
 Where( Empleado.Nombre=@nombre))
BEGIN
	SET @OutResultCode = 50001; -- Ya existe ese Empleado
END
ELSE
*/

BEGIN TRANSACTION InsertarEmpleado
INSERT INTO dbo.Empleado(
            IdTipo_Id_Doc,
            NombrePuesto,
            IdDepartamento,
			Nombre,
			FechaNacimiento,
            Activado
			) VALUES (
                @tipo_id_doc,
                @nombrepuesto,
                @iddepartamento,
                @nombre,
                @fechaNacimiento,
                1);
COMMIT TRANSACTION InsertarEmpleado
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
