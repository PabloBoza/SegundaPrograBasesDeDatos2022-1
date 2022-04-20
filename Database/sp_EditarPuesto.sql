CREATE PROCEDURE sp_EditarPuesto 
                 @id int ,
                 @Nombre varchar(64),
                 @SalarioXHora int
                 
AS
BEGIN
UPDATE Puesto SET 
	Nombre=@Nombre,
    SalarioXHora=@SalarioXHora
	WHERE Puesto.id=@id
END