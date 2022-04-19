DROP TABLE Puesto,
		   Empleado,
		   Tipo_Id_Doc,
		   Departamento,
		   Feriado

CREATE TABLE Tipo_Id_Doc (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(64) SECONDARY KEY,
	Activado bit
)
CREATE TABLE Puesto (
	Id int IDENTITY (1,1) PRIMARY KEY,
	Nombre varchar(64) SECONDARY KEY,
	SalarioXHora int,
	Activado bit
	)
CREATE TABLE Departamento (
	Id int IDENTITY (1,1) PRIMARY KEY,
	Nombre varchar(64) SECONDARY KEY,
	Activado bit
)
CREATE TABLE Feriado (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(64),
	Fecha date,
	Activado bit
)
CREATE TABLE Empleado (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdTipo_Id_Doc int FOREIGN KEY REFERENCES dbo.Tipo_Id_Doc(Id),
	NombrePuesto varchar(64) FOREIGN KEY REFERENCES dbo.Puesto(Nombre),
	IdDepartamento int FOREIGN KEY REFERENCES dbo.Departamento(Id),
	ValorDocumentoIdentidad int,
	Nombre varchar(64),
	FechaNacimiento date,
	Activado bit,
)