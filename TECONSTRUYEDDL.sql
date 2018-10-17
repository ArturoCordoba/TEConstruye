CREATE DATABASE TECONSTRUYE
GO

/*USE master
GO
DROP DATABASE TECONSTRUYE
GO*/

USE TECONSTRUYE
GO

CREATE TABLE EMPLEADO
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Codigo				int					NOT NULL		IDENTITY(1000,1),
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	Especialidad		varchar(30),

	PRIMARY KEY(Cedula),
	UNIQUE(Codigo)
	);


CREATE TABLE OBRERO
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	Pago_por_hora		decimal(8,1)		NOT NULL,

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
	Fecha_inicio		date,
	Cedula_cliente		char(9)				NOT NULL,

	PRIMARY KEY(Id)
	);


CREATE TABLE ETAPA
	(Nombre				varchar(30)			NOT NULL,
	Descripcion			varchar(100),
	Id					int					NOT NULL		IDENTITY(1000,1),
	Fecha_inicio		date,
	Fecha_final			date,
	Id_proyecto			int					NOT NULL,

	PRIMARY KEY(Id)
	);


CREATE TABLE MATERIAL
	(Nombre				varchar(20)			NOT NULL,
	Codigo				int					NOT NULL		IDENTITY(1000,1),
	Precio_unitario		decimal(10,1)		NOT NULL,
		
	PRIMARY KEY(Codigo)
	);


CREATE TABLE COMPRA
	(Descripcion		varchar(50)			NOT NULL,
	Precio				decimal(10,1)		NOT NULL,
	Fecha_compra		date,
	Lugar_compra		varchar(30),	
	Id					int					NOT NULL		IDENTITY(1000,1),
	Id_etapa			int					NOT NULL,		

	PRIMARY KEY(Id)
	);

CREATE TABLE ROL
	(Id					int					NOT NULL		IDENTITY(1,1),
	Nombre				varchar(20)			NOT NULL,
	
	PRIMARY KEY(Id)
	);
	
CREATE TABLE ROL_POR_EMPLEADO
	(Id_empleado		char(9)				NOT NULL,
	Id_rol				int					NOT NULL,
	
	PRIMARY KEY(Id_empleado,Id_rol)
	);		

CREATE TABLE EMPLEADO_POR_PROYECTO
	(Cedula_empleado	char(9)				NOT NULL,
	Id_proyecto			int					NOT NULL,

	PRIMARY KEY(Cedula_empleado, Id_proyecto)
	);


CREATE TABLE OBRERO_POR_PROYECTO
	(Cedula_obrero		char(9)				NOT NULL,
	Id_proyecto			int					NOT NULL,
	Horas_laboradas		decimal(4,1)		NOT NULL,
	Semana				date				NOT NULL,

	PRIMARY KEY(Cedula_obrero, Id_proyecto, Semana)
	);

CREATE TABLE MATERIAL_POR_ETAPA
	(Codigo_material	int					NOT NULL,
	Id_etapa			int					NOT NULL,
	Cantidad			int					NOT NULL,
	Precio_actual		decimal(10,1)		NOT NULL,

	PRIMARY KEY(Codigo_material,Id_etapa)
	);


ALTER TABLE PROYECTO
	ADD FOREIGN KEY (Cedula_cliente) REFERENCES CLIENTE(Cedula)

ALTER TABLE ETAPA
	ADD FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id)

ALTER TABLE COMPRA
	ADD FOREIGN KEY (Id_etapa) REFERENCES ETAPA(Id)

ALTER TABLE ROL_POR_EMPLEADO
	ADD FOREIGN KEY (Id_empleado) REFERENCES EMPLEADO(Cedula),
		FOREIGN KEY (Id_rol) REFERENCES ROL(Id)

ALTER TABLE EMPLEADO_POR_PROYECTO
	ADD FOREIGN KEY	(Cedula_empleado) REFERENCES EMPLEADO(Cedula),
		FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id)

ALTER TABLE OBRERO_POR_PROYECTO
	ADD FOREIGN KEY (Cedula_obrero) REFERENCES OBRERO(CEDULA),
		FOREIGN KEY (Id_proyecto) REFERENCES PROYECTO(Id)

ALTER TABLE MATERIAL_POR_ETAPA
	ADD FOREIGN KEY (Codigo_material) REFERENCES MATERIAL(Codigo),
		FOREIGN KEY (Id_etapa) REFERENCES ETAPA(Id)

GO
CREATE PROCEDURE usp_Presupuesto
AS
BEGIN
	SELECT
	  MATERIAL.Nombre AS [Nombre Material],
	  MATERIAL_POR_ETAPA.Cantidad AS [Cantidad Material],
	  MATERIAL_POR_ETAPA.Precio_actual AS [Precio],
	  MATERIAL_POR_ETAPA.Cantidad*MATERIAL_POR_ETAPA.Precio_actual AS [Total],
	  ETAPA.Nombre AS [Nombre Etapa],
	  PROYECTO.Nombre AS [Nombre Proyecto]
	FROM
	  MATERIAL_POR_ETAPA
	  INNER JOIN MATERIAL
		ON MATERIAL_POR_ETAPA.Codigo_material = MATERIAL.Codigo
	  INNER JOIN ETAPA
		ON MATERIAL_POR_ETAPA.Id_etapa = ETAPA.Id
	  INNER JOIN PROYECTO
		ON ETAPA.Id_proyecto = PROYECTO.Id
END;
GO
--DROP PROC usp_Presupuesto;
--usp_Presupuesto;

GO
CREATE PROCEDURE usp_Planilla
AS
BEGIN
	SELECT
	  OBRERO.Primer_nombre AS [Primer Nombre],
	  OBRERO.Primer_apellido AS [Primer Apellido],
	  OBRERO.Segundo_apellido AS [Segundo Apellido],
	  OBRERO.Pago_por_hora AS [Pago Hora],
	  OBRERO.Cedula AS [Cedula Obrero],
	  OBRERO_POR_PROYECTO.Horas_laboradas AS [Horas Laboradas],
	  OBRERO_POR_PROYECTO.Semana,
	  PROYECTO.Nombre AS [Nombre Proyecto],
	  OBRERO_POR_PROYECTO.Horas_laboradas*OBRERO.Pago_por_hora AS [Total]
	FROM
	  OBRERO_POR_PROYECTO
	  INNER JOIN OBRERO
		ON OBRERO_POR_PROYECTO.Cedula_obrero = OBRERO.Cedula
	  INNER JOIN PROYECTO
		ON OBRERO_POR_PROYECTO.Id_proyecto = PROYECTO.Id;
END;
GO
--DROP PROC usp_Planilla;
--usp_Planilla;

GO
CREATE PROCEDURE usp_Gastos
AS
BEGIN
	SELECT
	  COMPRA.Precio AS [Monto],
	  DATEADD(wk,DATEDIFF(wk,0,Compra.Fecha_compra),0) AS [Semana],
	  COMPRA.Lugar_compra AS [Lugar Compra],
	  COMPRA.Fecha_compra AS [Fecha Compra],
	  ETAPA.Nombre AS [Nombre Etapa],
	  COMPRA.Id AS [Id Compra],
	  PROYECTO.Nombre AS [Nombre Proyecto],
	  PROYECTO.Id AS [Id Proyecto]
	FROM
	  ETAPA
	  INNER JOIN COMPRA
		ON ETAPA.Id = COMPRA.Id_etapa
	  INNER JOIN PROYECTO
		ON ETAPA.Id_proyecto = PROYECTO.Id;
END;
GO
--DROP PROC usp_Gastos;
--usp_Gastos;

--Store Procedure para reporte de estado financiero
GO
CREATE PROCEDURE usp_Estado
AS
BEGIN
SELECT



--Store Procedure para el registro de empleados
GO
CREATE PROCEDURE usp_registroEmpleado
	@Primer_nombre		varchar(20),
	@Primer_apellido	varchar(20),
	@Segundo_apellido	varchar(20),
	@Cedula_empleado	char(9),
	@Telefono_empleado	char(8),
	@Especialidad		varchar(30),
	@Id_rol				int
AS
INSERT INTO [EMPLEADO]
    ([Primer_nombre],
	[Primer_apellido],
	[Segundo_apellido],	
	[Cedula],
	[Telefono],
	[Especialidad])
VALUES
    (@Primer_nombre,
	@Primer_apellido,
	@Segundo_apellido,
	@Cedula_empleado,
	@Telefono_empleado,
	@Especialidad)

INSERT INTO [ROL_POR_EMPLEADO]
	([Id_empleado],
	[Id_rol])
VALUES
	(@Cedula_empleado,
	@Id_rol)
GO
--DROP PROC ups_registroEmpleado;
--usp_registroEmpleado 'Arturo','Cordoba','Villalobos','987654321','84579658','Ingeniero Electrico',2;

--Store Procedure para el registro de clientes
GO
CREATE PROCEDURE usp_registroCliente
	@Primer_nombre		varchar(20),
	@Primer_apellido	varchar(20),
	@Segundo_apellido	varchar(20),
	@Cedula_cliente		char(9),
	@Telefono_cliente	char(8)
AS
INSERT INTO [CLIENTE]	
	([Primer_nombre],
	[Primer_apellido],
	[Segundo_apellido],
	[Cedula],
	[Telefono])
VALUES
	(@Primer_nombre,
	@Primer_apellido,
	@Segundo_apellido,
	@Cedula_cliente,
	@Telefono_cliente)
GO
--DROP PROC usp_registoCliente;
--usp_registroCliente 'Fabian','Gonzalez','Araya','456789123','82174596';

--Store Procedure para el registro de obreros
GO
CREATE PROCEDURE usp_registroObrero
	@Primer_nombre		varchar(20),
	@Primer_apellido	varchar(20),
	@Segundo_apellido	varchar(20),
	@Cedula_obrero		char(9),
	@Telefono_obrero	char(8),
	@Pago_por_hora		decimal(8,1)
AS
INSERT INTO [OBRERO]
	([Primer_nombre],
	[Primer_apellido],
	[Segundo_apellido],
	[Cedula],
	[Telefono],
	[Pago_por_hora])
VALUES
	(@Primer_nombre,
	@Primer_apellido,
	@Segundo_apellido,
	@Cedula_obrero,
	@Telefono_obrero,
	@Pago_por_hora)
GO
--DROP PROC usp_registroObrero;
--usp_registroObrero 'Anthony','Loaiza','Rosales','321654987','89741230',1000;

--Store Procedure para el registro de materiales
GO
CREATE PROCEDURE usp_registroMaterial
	@Nombre_material	varchar(20),
	@Precio_unitario	decimal(10,1)
AS
INSERT INTO [MATERIAL]
	([Nombre],
	[Precio_unitario])
VALUES
	(@Nombre_material,
	@Precio_unitario)
GO
--DROP PROC usp_registroMaterial;
--usp_registroMaterial 'Zacate',8000;

--Store Procedure para el registro de etapas
GO
CREATE PROCEDURE usp_registroEtapa
	@Nombre_etapa 		varchar(30),
	@Id_proyecto		int,
	@Fecha_inicio		date,
	@Fecha_final		date
AS
INSERT INTO [ETAPA]
	([Nombre],
	[Id_proyecto],
	[Fecha_inicio],
	[Fecha_final])
VALUES
	(@Nombre_etapa,
	@Id_proyecto,
	@Fecha_inicio,
	@Fecha_final)
GO
--DROP PROC usp_registroEtapa;
--usp_registroEtapa 'Jardin',1000,'2018/7/20','2018/7/22';


/*
--Store Procedure para el registro de proyecto
GO
CREATE PROCEDURE usp_registroProyecto
	@Nombre_proyecto	varchar(20),
	@Estado_proyecto	varchar(10),
	@Ubicacion			varchar(40),
	@Fecha_inicio		date,
	@Cedula_cliente		char(9),
	@Cedula_empleado	char(9),
AS
INSERT INTO [PROYECTO]
	([Nombre],
	[Estado],
	[Ubicacion],
	[Fecha_inicio],
	[Cedula_cliente]
--Ingresar varios empleados en un parametro
*/
--DROP PROC usp_registroProyecto;
--

--Store Procedure para asignar cantidad y material a cada etapa
GO
CREATE PROCEDURE usp_asignarMaterialEtapa
	@Codigo_material	int,
	@Id_etapa		int,
	@Cantidad_material	int
AS
INSERT INTO [MATERIAL_POR_ETAPA]
	([Codigo_material],
	[Id_etapa],
	[Cantidad])
VALUES
	(@Codigo_material,
	@Id_etapa,
	@Cantidad_material)
GO
--DROP PROC usp_asignarMaterialEtapa
--usp_asignarMaterialEtapa 1029,1026,10;

--Store Procedure para generacion de presupuesto
/*
--Store Procedure para asignar horas de un obrero a un proyecto
GO
CREATE PROCEDURE usp_asignarObreroProyecto
	@Cedula_obrero		char(9),
	@Id_proyecto		int,
	@Horas_laboradas	decimal(4,1),
	@Semana				date
AS
INSERT INTO [OBRERO_POR_PROYECTO]*/