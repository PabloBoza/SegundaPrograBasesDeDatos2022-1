CREATE PROCEDURE sp_EliminarEmpleado 
				 @id int
AS
BEGIN
UPDATE Empleado SET 
	Activado=0
	WHERE Empleado.id=@id
END