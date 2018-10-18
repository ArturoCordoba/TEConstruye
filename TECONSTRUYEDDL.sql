--Creacion de la base de datos de TEConstruye
CREATE DATABASE TECONSTRUYE
GO

/*USE master
GO
DROP DATABASE TECONSTRUYE
GO*/

USE TECONSTRUYE
GO

/*Creacion de la tabla de empleados:
  Atributos:
	Primer_nombre: string que representa el primer nombre del empleado
	Primer_apellido: string que representa el primer apellido del empleado
	Segundo_apellido: string que representa el segundo apellido del empleado
	Codigo: string unico que representa el codigo de ingeniero o arquitecto
	Cedula: string que representa el numero de cedula del empleado
	Telefono: string que representa el numero telefonico del empleado
	Especialidad: string que representa la especialidad de carrera del empleado
*/
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

/*Creacion de tabla de obreros:
  Atributos:
	Primer_nombre: string que representa el primer nombre del obrero
	Primer_apellido: string que representa el primer apellido del obrero
	Segundo_apellido: string que representa el segundo apellido del obrero
	Cedula: string que representa el numero de cedula del obrero (llave primaria)
	Telefono: string que representa el numero telefonico del obrero
	Pago_por_hora: valor numerico que representa el pago por hora del obrero
*/
CREATE TABLE OBRERO
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	Pago_por_hora		decimal(8,1)		NOT NULL,

	PRIMARY KEY(Cedula),
	CHECK(Pago_por_hora>0)
	);

/*Creacion la tabla de clientes:
  Atributos:
	Primer_nombre: string que representa el primer nombre del cliente
	Primer_apellido: string que representa el primer apellido del cliente
	Segundo_apellido: string que representa el segundo apellido del cliente
	Cedula: string que representa la cedula del cliente (llave primaria)
	Telefono: string que representa el telefono del cliente
*/
CREATE TABLE CLIENTE
	(Primer_nombre		varchar(20)			NOT NULL,
	Primer_apellido		varchar(20)			NOT NULL,
	Segundo_apellido	varchar(20)			NOT NULL,
	Cedula				char(9)				NOT NULL,
	Telefono			char(8),
	
	PRIMARY KEY(Cedula)
	);

/*Creacion de tabla de proyectos:
  Atributos:
	Nombre: string que representa el nombre del proyecto
	Estado: string que representa el estado del proyecto
	Id: valor numerico identificador del proyecto (llave primaria)
	Ubicacion: string que representa la ubicacion del proyecto
	Fecha_inicio: fecha que representa la fecha de inicio del proyecto
	Cedula_cliente: string que representa el numero de cedula del cliente
*/
CREATE TABLE PROYECTO
	(Nombre				varchar(20)			NOT NULL,
	Estado				varchar(10),
	Id					int					NOT NULL		IDENTITY(1000, 1),	
	Ubicacion			varchar(40)			NOT NULL,
	Fecha_inicio		date,
	Cedula_cliente		char(9)				NOT NULL,

	PRIMARY KEY(Id)
	);

/*Creacion de tabla de etapas
  Atributos:
	Nombre: string que representa el nombre de la etapa
	Descripcion: string que representa la descripcion general de la etapa
	Id: valor numerico identificador de cada etapa (llave primaria)
	Fecha_inicio: fecha que representa la fecha de inicio de la etapa
	Fecha_final: fecha que representa la fecha de finalizacion de la etapa
	Id_proyecto: valor numerico identificador de proyecto que pertenece la etapa
*/
CREATE TABLE ETAPA
	(Nombre				varchar(30)			NOT NULL,
	Descripcion			varchar(100),
	Id					int					NOT NULL		IDENTITY(1000,1),
	Fecha_inicio		date,
	Fecha_final			date,
	Id_proyecto			int					NOT NULL,

	PRIMARY KEY(Id)
	);

/*Creacion de tabla de materiales
  Atributos:
	Nombre: string que representa el nombre del material
	Codigo: valor numerico identificador del material (llave primaria)
	Precio_unitario: valor numerico que representa el precio unitario del material
*/
CREATE TABLE MATERIAL
	(Nombre				varchar(20)			NOT NULL,
	Codigo				int					NOT NULL		IDENTITY(1000,1),
	Precio_unitario		decimal(10,1)		NOT NULL,
		
	PRIMARY KEY(Codigo),
	CHECK(Precio_unitario>0)
	);

/*Creacion de tabla de compras
  Atributos:
	Descripcion: string que representa la descripcion general de la compra
	Precio: string que representa el precio del gasto total de la compra
	Fecha_compra: fecha que representa la fecha de compra
	Lugar_compra: 
*/
CREATE TABLE COMPRA
	(Descripcion		varchar(50)			NOT NULL,
	Precio				decimal(10,1)		NOT NULL,
	Fecha_compra		date,
	Lugar_compra		varchar(30),	
	Id					int					NOT NULL		IDENTITY(1000,1),
	Id_etapa			int					NOT NULL,		

	PRIMARY KEY(Id),
	CHECK(Precio>0)
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

	PRIMARY KEY(Cedula_obrero, Id_proyecto, Semana),
	CHECK(Horas_laboradas>0)
	);

CREATE TABLE MATERIAL_POR_ETAPA
	(Codigo_material	int					NOT NULL,
	Id_etapa			int					NOT NULL,
	Cantidad			int					NOT NULL,
	Precio_actual		decimal(10,1)		NOT NULL,

	PRIMARY KEY(Codigo_material,Id_etapa),
	CHECK(Cantidad>0),
	CHECK(Precio_actual>0)
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
		ON ETAPA.Id_proyecto = PROYECTO.Id
	ORDER BY Etapa.Id;
END;
GO
--DROP PROC usp_Gastos;
--usp_Gastos;

GO
CREATE VIEW Presupuesto_por_etapa
AS SELECT 
        PROYECTO.Nombre AS Nombre_proyecto, 
        PROYECTO.Id AS Proyecto_id,
        ETAPA.Nombre AS Nombre_etapa, 
        ETAPA.Id AS Etapa_id,
        SUM(MATERIAL_POR_ETAPA.Cantidad*MATERIAL_POR_ETAPA.Precio_actual) AS Presupuesto
    FROM
        PROYECTO INNER JOIN ETAPA ON PROYECTO.Id = ETAPA.Id_proyecto INNER JOIN MATERIAL_POR_ETAPA ON ETAPA.Id = MATERIAL_POR_ETAPA.Id_etapa

    GROUP BY PROYECTO.Nombre,PROYECTO.Id,ETAPA.Nombre,ETAPA.Id

GO
CREATE VIEW Gasto_por_etapa
AS SELECT
        ETAPA.Id AS Id_etapa,
        SUM(COMPRA.Precio) AS Gasto_real
    FROM
        PROYECTO INNER JOIN ETAPA ON PROYECTO.Id = ETAPA.Id_proyecto
                 INNER JOIN COMPRA ON ETAPA.Id = COMPRA.Id_etapa
    GROUP BY ETAPA.Nombre,ETAPA.Id 


GO
CREATE PROCEDURE usp_Estado
AS
BEGIN
    SELECT
        Nombre_proyecto, 
        Proyecto_id,
        Nombre_etapa,
        Id_etapa,
        Presupuesto,
        Gasto_real AS [Gasto Real],
		Presupuesto-Gasto_real AS [Diferencia] 
    FROM 
        Presupuesto_por_etapa INNER JOIN Gasto_por_etapa ON Id_etapa = Etapa_id

END;
GO
--usp_Estado;


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
BEGIN
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
END;
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
BEGIN
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
END;
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
BEGIN
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
END;
GO
--DROP PROC usp_registroObrero;
--usp_registroObrero 'Anthony','Loaiza','Rosales','321654987','89741230',1000;

--Store Procedure para el registro de materiales
GO
CREATE PROCEDURE usp_registroMaterial
	@Nombre_material	varchar(20),
	@Precio_unitario	decimal(10,1)
AS
BEGIN
	INSERT INTO [MATERIAL]
		([Nombre],
		[Precio_unitario])
	VALUES
		(@Nombre_material,
		@Precio_unitario)
END;
GO
--DROP PROC usp_registroMaterial;
--usp_registroMaterial 'Zacate',8000;

--Store Procedure para el registro de etapas
GO
CREATE PROCEDURE usp_registroEtapa
	@Nombre_etapa 		varchar(30),
	@Descripcion		varchar(50),
	@Id_proyecto		int,
	@Fecha_inicio		date,
	@Fecha_final		date
AS
BEGIN
	INSERT INTO [ETAPA]
		([Nombre],
		[Descripcion],
		[Id_proyecto],
		[Fecha_inicio],
		[Fecha_final])
	VALUES
		(@Nombre_etapa,
		@Descripcion,
		@Id_proyecto,
		@Fecha_inicio,
		@Fecha_final)
END;
GO
--DROP PROC usp_registroEtapa;
--usp_registroEtapa 'Jardin','Etapa de instalacion de jardin',1000,'2018/7/20','2018/7/22';



--Store Procedure para el registro de proyecto
GO
CREATE PROCEDURE usp_registroProyecto
	@Nombre_proyecto	varchar(20),
	@Estado_proyecto	varchar(10),
	@Ubicacion			varchar(40),
	@Fecha_inicio		date,
	@Cedula_cliente		char(9)
AS
BEGIN
	INSERT INTO [PROYECTO]
		([Nombre],
		[Estado],
		[Ubicacion],
		[Fecha_inicio],
		[Cedula_cliente])
	VALUES
		(@Nombre_proyecto,
		@Estado_proyecto,
		@Ubicacion,
		@Fecha_inicio,
		@Cedula_cliente)
END;
GO
--DROP PROC usp_registroProyecto;
--usp_registroProyecto 'Casa W567', 'Pendiente', 'Santa Ana', '2018/11/1','456789123';

--Store Procedure para asignar cantidad y material a cada etapa
GO
CREATE PROCEDURE usp_asignarMaterialEtapa
	@Codigo_material	int,
	@Id_etapa			int,
	@Cantidad_material	int,
	@Precio_actual		decimal(10,1)
AS
BEGIN
	INSERT INTO [MATERIAL_POR_ETAPA]
		([Codigo_material],
		[Id_etapa],
		[Cantidad],
		[Precio_actual])
	VALUES
		(@Codigo_material,
		@Id_etapa,
		@Cantidad_material,
		@Precio_actual)
END;
GO
--DROP PROC usp_asignarMaterialEtapa
--usp_asignarMaterialEtapa 1029,1025,10,8000;

--Store Procedure para asignar empleados a un proyecto
GO
CREATE PROCEDURE usp_asignarEmpleadoProyecto
	@Cedula_empleado	char(9),
	@Id_proyecto		int
AS
BEGIN
	INSERT INTO [EMPLEADO_POR_PROYECTO]
		([Cedula_empleado],
		[Id_proyecto])
	VALUES
		(@Cedula_empleado,
		@Id_proyecto)
END;
GO
--DROP PROC usp_asignarEmpleadoProyecto
--usp_asignarEmpleadoProyecto '987654321',1006;

--Store Procedure para asignar horas de un obrero a un proyecto
GO
CREATE PROCEDURE usp_asignarObreroProyecto
	@Cedula_obrero		char(9),
	@Id_proyecto		int,
	@Horas_laboradas	decimal(4,1),
	@Semana				date
AS
BEGIN
	INSERT INTO [OBRERO_POR_PROYECTO]
		([Cedula_obrero],
		[Id_proyecto],
		[Horas_laboradas],
		[Semana])
	VALUES
		(@Cedula_obrero,
		@Id_proyecto,
		@Horas_laboradas,
		DATEADD(wk,DATEDIFF(wk,0,@Semana),0))
END;
GO
--DROP PROC usp_asignarObreroProyecto
--usp_asignarObreroProyecto '321654987',1006,18,'2018/11/2';

--Store procedures para asignar gastos a un proyecto
GO
CREATE PROCEDURE usp_asignarGastosProyecto
	@Descripcion		varchar(50),
	@Gasto				decimal(10,1),
	@Fecha_compra		date,
	@Lugar_compra		varchar(30),	
	@Id_etapa			int
AS
BEGIN
	INSERT INTO [COMPRA]
		([Descripcion],
		[Precio],
		[Fecha_compra],
		[Lugar_compra],
		[Id_etapa])
	VALUES
		(@Descripcion,
		@Gasto,
		@Fecha_compra,
		@Lugar_compra,
		@Id_etapa)
END;
GO
--DROP PROC usp_asignarGastosProyecto
--usp_asignarGastosProyecto 'Zacate para el jardin',80000,'2018/7/21','Zacate Monterrey',1025;

--Store Procedure para consultar toda la tabla de empleados
GO
CREATE PROCEDURE usp_consultarEmpleados
AS
BEGIN
	SELECT * FROM EMPLEADO
END;
GO
--DROP PROC usp_consultarEmpleados;
--usp_consultarEmpleados;

--Store Procedure para consultar toda la tabla de clientes
GO
CREATE PROCEDURE usp_consultarClientes
AS
BEGIN
	SELECT * FROM CLIENTE
END;
GO
--DROP PROC usp_consultarClientes;
--usp_consultarClientes;

--Store Procedure para consultar toda la tabla de obreros
GO
CREATE PROCEDURE usp_consultarObreros
AS
BEGIN
	SELECT * FROM OBRERO
END;
GO
--DROP PROC usp_consultarObreros;
--usp_consultarObreros;

--Store Procedure para consultar toda la tabla de proyectos
GO
CREATE PROCEDURE usp_consultarProyectos
AS
BEGIN
	SELECT * FROM PROYECTO
END;
GO
--DROP PROC usp_consultarProyectos;
--usp_consultarProyectos;

--Store Procedure para consultar toda la tabla de etapas
GO
CREATE PROCEDURE usp_consultarEtapas
AS
BEGIN
	SELECT * FROM ETAPA
END;
GO
--DROP PROC usp_consultarEtapas;
--usp_consultarEtapas;

--Store Procedure para consultar toda la tabla de materiales
GO
CREATE PROCEDURE usp_consultarMateriales
AS
BEGIN
	SELECT * FROM MATERIAL
END;
GO
--DROP PROC usp_consultarMateriales;
--usp_consultarMateriales;

--Store Procedure para consultar toda la tabla de compras
GO
CREATE PROCEDURE usp_consultarCompras
AS
BEGIN
	SELECT * FROM COMPRA
END;
GO
--DROP PROC usp_consultarCompras;
--usp_consultarCompras;

--Store Procedure para consultar toda la tabla de roles
GO
CREATE PROCEDURE usp_consultarRoles
AS
BEGIN
	SELECT * FROM ROL
END;
GO
--DROP PROC usp_consultarRoles;
--usp_consultarRoles;

--Store Procedure para consultar toda la tabla de roles por empleado
GO
CREATE PROCEDURE usp_consultarRolesEmpleado
AS
BEGIN
	SELECT * FROM ROL_POR_EMPLEADO
END;
GO
--DROP PROC usp_consultarRolesEmpleado;
--usp_consultarRolesEmpleado;

--Store Procedure para consultar toda la tabla de empleados por proyecto
GO
CREATE PROCEDURE usp_consultarEmpleadosProyecto
AS
BEGIN
	SELECT * FROM EMPLEADO_POR_PROYECTO
END;
GO
--DROP PROC usp_consultarEmpleadosProyecto;
--usp_consultarEmpleadosProyecto;

--Store Procedure para consultar toda la tabla de empleados
GO
CREATE PROCEDURE usp_consultarObrerosProyecto
AS
BEGIN
	SELECT * FROM OBRERO_POR_PROYECTO
END;
GO
--DROP PROC usp_consultarObrerosProyecto;
--usp_consultarObrerosProyecto;

--Store Procedure para consultar toda la tabla de empleados
GO
CREATE PROCEDURE usp_consultarMaterialesEtapa
AS
BEGIN
	SELECT * FROM MATERIAL_POR_ETAPA
END;
GO
--DROP PROC usp_consultarMaterialesEtapa;
--usp_consultarMaterialesEtapa;
