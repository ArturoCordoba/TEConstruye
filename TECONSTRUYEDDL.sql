CREATE DATABASE TECONSTRUYE
GO

USE TECONSTRUYE
GO

CREATE TABLE EMPLEADO
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Codigo				int					NOT NULL		IDENTITY(1000,1),
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	Especialidad		varchar(20),

	PRIMARY KEY(Cedula),
	UNIQUE(Codigo)
	);


CREATE TABLE OBRERO
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	Pago_por_hora		DECIMAL(8,1)		NOT NULL,

	PRIMARY KEY(Cedula)
	);


CREATE TABLE CLIENTE
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	
	PRIMARY KEY(Cedula)
	);


CREATE TABLE PROYECTO
	(Nombre				varchar(20)			NOT NULL,
	Estado				varchar(10),
	Id					int					NOT NULL		IDENTITY(1000, 1),	
	Ubicacion			varchar(40)			NOT NULL,
	Fecha_inicio		DATE,
	Cedula_cliente		char(9)				NOT NULL,

	PRIMARY KEY(Id)
	);


CREATE TABLE ETAPA
	(Nombre				varchar(30)			NOT NULL,
	Id					int					NOT NULL		IDENTITY(1000,1),
	Presupuesto			DECIMAL(15,1)		NOT NULL,
	Fecha_inicio		DATE,
	Fecha_final			DATE,
	Id_proyecto			int					NOT NULL,

	PRIMARY KEY(Id)
	);


CREATE TABLE MATERIAL
	(Nombre				varchar(20)			NOT NULL,
	Codigo				int					NOT NULL		IDENTITY(1000,1),
	Precio_unitario		DECIMAL(10,1)		NOT NULL,
		
	PRIMARY KEY(Codigo)
	);


CREATE TABLE COMPRA
	(Descripcion		varchar(50)			NOT NULL,
	Precio				DECIMAL(10,1)		NOT NULL,
	Fecha_compra		DATE,
	Id					int					NOT NULL		IDENTITY(1000,1),
	Id_etapa			int					NOT NULL,			

	PRIMARY KEY(Id)
	);


CREATE TABLE EMPLEADOS_POR_PROYECTO
	(Cedula_empleado	char(9)				NOT NULL,
	Id_proyecto			int					NOT NULL,

	PRIMARY KEY(Cedula_empleado, Id_proyecto)
	);


CREATE TABLE OBREROS_POR_PROYECTO
	(Cedula_obrero		char(9)				NOT NULL,
	Id_proyecto			int					NOT NULL,
	Horas_laboradas		DECIMAL(4,1)		NOT NULL,
	Numero_semana		int					NOT NULL,

	PRIMARY KEY(Cedula_obrero, Id_proyecto, Numero_semana)
	);

CREATE TABLE MATERIALES_POR_ETAPA
	(Codigo_material	int					NOT NULL,
	Id_etapa			int					NOT NULL,

	PRIMARY KEY(Codigo_material, Id_etapa)
	);


ALTER TABLE PROYECTO
	ADD FOREIGN KEY (Cedula_cliente) REFERENCES CLIENTE(Cedula)

ALTER TABLE ETAPA
	ADD FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id)

ALTER TABLE COMPRA
	ADD FOREIGN KEY (Id_etapa) REFERENCES ETAPA(Id)

ALTER TABLE EMPLEADOS_POR_PROYECTO
	ADD FOREIGN KEY	(Cedula_empleado) REFERENCES EMPLEADO(Cedula),
		FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id)

ALTER TABLE OBREROS_POR_PROYECTO
	ADD FOREIGN KEY (Cedula_obrero) REFERENCES OBRERO(CEDULA),
		FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id) 

ALTER TABLE MATERIALES_POR_ETAPA
	ADD FOREIGN KEY (Codigo_material) REFERENCES MATERIAL(Codigo),
		FOREIGN KEY (Id_etapa) REFERENCES ETAPA(Id)

/*USE master
GO
DROP DATABASE TECONSTRUYE
GO*/