CREATE PROCEDURE sp_EditarEmpleado 
				 @id int ,
				 @idTipoDocumentacionIdentificacion int,
				 @nombrePuesto varchar(64),
				 @idDepartamento int,
				 @ValorDocumentoIdentidad int,
				 @Nombre varchar(64),
				 @FechaNacimiento date
AS
BEGIN
UPDATE Empleado SET 
	IdTipo_Id_Doc=@idTipoDocumentacionIdentificacion,
	NombrePuesto=@nombrePuesto,
	idDepartamento=@idDepartamento,
	ValorDocumentoIdentidad=@ValorDocumentoIdentidad,
	Nombre=@Nombre,
	FechaNacimiento=@FechaNacimiento
	WHERE Empleado.id=@id
END