CREATE PROCEDURE sp_EliminarPuesto
				 @id int
AS
BEGIN
UPDATE Puesto SET 
	Activado=0
	WHERE Puesto.id=@id
END