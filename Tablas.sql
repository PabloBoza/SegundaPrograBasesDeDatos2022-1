DROP TABLE Puesto,
		   Empleado,
		   Tipo_Id_Doc,
		   Departamento,
		   Feriado


CREATE TABLE Empleado (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdTipo_Id_Doc int,
	IdPuesto int,
	IdDepartamento int,
	ValorDocumentoIdentidad int,
	Nombre varchar(64),
	FechaNacimiento date,
	Activado bit,
)
CREATE TABLE Tipo_Id_Doc (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(64),
	Activado bit
)
CREATE TABLE Puesto (
	Id int IDENTITY (1,1) PRIMARY KEY,
	Nombre varchar(64),
	SalarioXHora int,
	Activado bit
	)
CREATE TABLE Departamento (
	Id int IDENTITY (1,1) PRIMARY KEY,
	Nombre varchar(64),
	Activado bit
)
CREATE TABLE Feriado (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Nombre varchar(64),
	Fecha date,
	Activado bit
)
