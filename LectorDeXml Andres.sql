use PlanillaObrera;
 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    Nombre varchar(64),
		Contrasenha varchar(64))
 INSERT 
 INTO @xmlTable 
	SELECT Nombre,
		   Contrasenha
 FROM 
	OPENXML(@hDoc, 'Datos/Usuarios/Usuario') 
WITH  
(	Nombre varchar(64)'@Nombre',
	Contrasenha varchar(64)'@Password'
 );  
INSERT 
	INTO dbo.Usuario 
	SELECT Nombre,
		   Contrasenha
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO

use PlanillaObrera;
 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    Nombre varchar(64))
 INSERT 
 INTO @xmlTable 
	SELECT Nombre
 FROM 
	OPENXML(@hDoc, 'Datos/Tipo_Doc/TipoDocuIdentidad ') 
WITH  
(	Nombre varchar(64)'@Nombre'
 );  
INSERT 
	INTO dbo.Tipo_Id_Doc 
	SELECT Nombre,
		   1
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO

use PlanillaObrera;
 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    Nombre varchar(64),
		SalarioXHora int)
 INSERT 
 INTO @xmlTable 
	SELECT Nombre,
		   SalarioXHora
 FROM 
	OPENXML(@hDoc, 'Datos/Puestos/Puesto ') 
WITH  
(	Nombre varchar(64)'@Nombre',
	SalarioXHora int '@SalarioXHora'	
 );  
INSERT 
	INTO dbo.Puesto 
	SELECT Nombre,
		   SalarioXHora,
		   1
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO

use PlanillaObrera;
 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    Nombre varchar(64))
 INSERT 
 INTO @xmlTable 
	SELECT Nombre
 FROM 
	OPENXML(@hDoc, 'Datos/Departamentos/Departamento') 
WITH  
(	Nombre varchar(64)'@Nombre'
 );  
INSERT 
	INTO dbo.Departamento 
	SELECT Nombre,
		   1
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO

use PlanillaObrera;
 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    IdTipo_Id_Doc int,
		Puesto varchar(64),
		IdDepartamento int,
		ValorDocumentoIdentidad int,
		Nombre varchar(64),
		FechaNacimiento date)
 INSERT 
 INTO @xmlTable 
	SELECT IdTipo_Id_Doc,
		   Puesto,
		   IdDepartamento,
		   ValorDocumentoIdentidad,
		   Nombre,
		   FechaNacimiento
 FROM 
	OPENXML(@hDoc, 'Datos/Empleados/Empleado') 
WITH  
(		IdTipo_Id_Doc int'@IdTipoIdentificacion',
		Puesto varchar(64)'@Puesto',
		IdDepartamento int'@IdDepartamento',
		ValorDocumentoIdentidad int'@ValorDocumentoIdentificacion',
		Nombre varchar(64)'@Nombre',
		FechaNacimiento date'@FechaNacimiento'
 );  
INSERT 
	INTO dbo.Empleado 
	SELECT IdTipo_Id_Doc,
		   Puesto,
		   IdDepartamento,
		   ValorDocumentoIdentidad,
		   Nombre,
		   FechaNacimiento,
		   1
		   
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO

 GO
 DECLARE @XML AS XML,
		 @hDoc AS INT, 
		 @SQL NVARCHAR (MAX)

 SET @XML = (SELECT CONVERT(XML, BulkColumn) 
			 AS BulkColumn 
			 FROM OPENROWSET(BULK 'C:\Users\pablo\Downloads\Progra2.xml', SINGLE_BLOB) AS x)
 EXEC sp_xml_preparedocument @hDoc
 OUTPUT, @XML
 DECLARE @xmlTable  
 Table (id INT IDENTITY(1,1) PRIMARY KEY,	
	    Nombre varchar(64),
		Fecha date)
 INSERT 
 INTO @xmlTable 
	SELECT Nombre,
		   Fecha
 FROM 
	OPENXML(@hDoc, 'Datos/Feriados/Feriado') 
WITH  
(	Nombre varchar(64)'@Nombre',
	Fecha date'@Fecha'
 );  
INSERT 
	INTO dbo.Feriado 
	SELECT Nombre,
		   Fecha,
		   1
	FROM @xmlTable;  
EXEC sp_xml_removedocument @hDoc 



GO