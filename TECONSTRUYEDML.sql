USE TECONSTRUYE
GO

INSERT INTO EMPLEADO (Primer_Nombre, Primer_Apellido, Segundo_Apellido, Cedula, Telefono, Especialidad)
VALUES
('Anthonny','Loaiza','Rosales','116950116','85621439','Ingeniero Civil'),
('Rodrigo','Gonzalez','Gonzalez','216950116','85821439','Arquitecto'),
('James','Perez','Diaz','316950116','85521639','Ingeniero Civil'),
('Juan','Chavarria','Rosales','416950116','85121439','Arquitecto'),
('Daniela','Rodriguez','Araya','516950116','87521439','Ingeniero Civil'),
('Sandra','Casas','Herrero','616950116','83855217','Arquitecto'),
('Roger','Rodriguez','Rosti','116800684','85693147','Administrador'),
('Gerardo','Muñoz','Artavia','782950458','88921245','Ingeniero Construccion')
;


INSERT INTO OBRERO (Primer_nombre, Primer_apellido, Segundo_apellido, Cedula, Telefono, Pago_por_hora)
VALUES
('Ricardo','Montoya','Arrieta','103202101','85878889',1000),
('Marcos','Fernandez','Marquez','203202101','88378889',1500),
('Pedro','Ferrer','Prieto','303202101','88808889',1500),
('Guillermo','Ramos','Hidalgo','403202101','83878389',1500),
('John','Fernandez','Santana','503202101','88878829',1000),
('Isaac','Serrano','Vega','603202101','88871889',1000),
('Oriol','Dominguez','Gil','703202101','88078889',1500),
('Rafael','Santos','Calvo','803202101','88878809',1000),
('Enrique','Carmona','Gonzalez','903202101','88872889',1500),
('Hugo','Gonzalez','Crespo','113202101','88178889',1000),
('Roberto','Vidal','Suarez','123202101','88483003',1000),
('Adrian','Vila','Esteban','133202101','88483104',1500),
('Mateo','Serra','Gomez','143202101','88483205',1000),
('Raul','Soler','Medina','153202101','88483306',1500),
('Antonio','Muñoz','Soto','163202101','88493407',1500)
;


INSERT INTO CLIENTE (Primer_nombre, Primer_apellido, Segundo_apellido, Cedula, Telefono)
VALUES
('Carlos','Calvo','Marin','116401303','83854017'),
('Rodrigo','Ramos','Alvarez','116402303','84854118'),
('Irene','Reyes','Garcia','116403303','85854219'),
('Natalia','Calvo','Romero','116404303','86854320'),
('Lorena','Roca','Arias','116405303','86854421')
;


INSERT INTO PROYECTO (Nombre, Estado, Ubicacion, Fecha_inicio, Cedula_cliente)
VALUES
('Casa H34','Finalizado','Santa Ana','2018/6/1','116401303'),
('Casa L41','Pendiente','Escazu','2018/9/17','116402303'),
('Casa Z34','Pendiente','Tres Rios','2018/9/27','116403303'),
('Local T32','Pendiente','San Pedro','2019/1/19','116403303'),
('Casa F16','Pendiente','Lindora','2019/5/24','116404303'),
('Casa B03','Pendiente','San Rafael','2019/2/10','116405303')
;

INSERT INTO ETAPA (Nombre, Descripcion, Fecha_inicio, Fecha_final, Id_proyecto)
VALUES

--Etapas del proyecto 1000
('Trabajo Preliminar','Etapa de inspeccion preliminar antes de construccion','2018/6/2','2018/6/4',1000),
('Cimientos','Etapa de cimentacion de la construccion','2018/6/5','2018/6/18',1000),
('Paredes','Etapa de construccion de paredes','2018/6/19','2018/6/30',1000),
('Concreto Reforzado','Etapa de refuerzo de paredes con concreto','2018/7/1','2018/7/9',1000),
('Techos','Etapa de construccion de techos','2018/7/10','2018/7/15',1000),
('Cielos','Etapa de construccion de cielos rasos','2018/7/16','2018/7/21',1000),
('Repello','Etapa de repello de las paredes','2018/7/22','2018/7/25',1000),
('Entrepisos','Etapa de construccion de entrepisos','2018/7/26','2018/7/31',1000),
('Pisos','Etapa de construccion de pisos','2018/7/27','2018/8/1',1000),
('Enchapes','Etapa de construccion de enchapes','2018/7/25','2018/7/31',1000),
('Instalacion Pluvial','Etapa de instalacion pluvial de construccion','2018/7/17','2018/7/25',1000),
('Instalacion Sanitaria','Etapa de instalacion sanitaria de construccion','2018/7/18','2018/7/26',1000),
('Instalacion Electrica','Etapa de instalacion electrica de construccion','2018/7/19','2018/7/28',1000),
('Puertas','Etapa de instalacion de puertas','2018/8/2','2018/8/4',1000),
('Cerrajería','Etapa de instalacion de llavines','2018/8/3','2018/8/4',1000),
('Ventanas','Etapa de instalacion de ventanas','2018/8/5','2018/8/10',1000),
('Closets','Etapa de instalacion de closets','2018/8/7','2018/8/11',1000),
('Mueble de Cocina','Etapa de instalacion de muebles de cocina','2018/8/12','2018/8/16',1000),
('Pintura','Etapa de pintura de paredes','2018/8/17','2018/8/23',1000),
('Escaleras','Etapa de construccion/instalacion de escaleras','2018/7/11','2018/7/19',1000),

--Etapas del proyecto 1001
('Trabajo Preliminar','Etapa de inspeccion preliminar antes de construccion','2018/9/18','2018/9/20',1001),
('Cimientos','Etapa de cimentacion de la construccion','2018/9/21','2018/10/5',1001),
('Paredes','Etapa de construccion de paredes','2018/10/6','2018/10/18',1001),

--Etapas de proyecto 1002
('Trabajo Preliminar','Etapa de inspeccion preliminar antes de construccion','2018/9/28','2018/9/30',1002),
('Cimientos','Etapa de cimentacion de la construccion','2018/10/1','2018/10/13',1002)
;

INSERT INTO MATERIAL (Nombre, Precio_unitario)
VALUES
('Piedra', 200),
('Arena', 500),
('Cal', 100),
('Blocks Concreto', 1000),
('Varilla Metal', 5000),
('Bolsa Cemento', 10000),
('Lamina Metal', 15000),
('Teja', 500),
('Azulejos', 3000),
('Ceramica', 3000),
('Lamina Gypsum', 10000),
('Tubos PVC', 5000),
('Canoa Metal', 20000),
('Inodoro', 12000),
('Fregadero', 15000),
('Lavatorio', 15000),
('Cables', 7500),
('Tubo Metalico', 10000),
('Puerta Madera', 50000),
('Puerta Hierro', 60000),
('Llavin Hierro', 15000),
('Vidrio', 10000),
('Marco Madera', 8000),
('Lamina Madera', 8000),
('Gaveta Madera', 12000),
('Pintura Blanca', 7000),
('Pintura Beige', 7000),
('Pintura Azul', 7000),
('Pintura Cafe', 7000)
;

INSERT INTO ROL(Nombre)
VALUES
('Administrador'),
('Ingeniero'),
('Arquitecto')
;

INSERT INTO ROL_POR_EMPLEADO(Id_empleado,Id_rol)
VALUES
('116800684',1),
('116950116',2),
('216950116',3),
('316950116',2),
('416950116',3),
('516950116',2),
('616950116',3),
('782950458',2),
('782950458',1)
;

INSERT INTO COMPRA (Descripcion, Precio, Fecha_compra, Lugar_compra, Id_etapa)
VALUES

--Etapa Cimientos del proyecto 1000
('Piedra para los cimientos',25000,'2018/6/5','Las Gravilias',1001),
('Cemento para los cimientos', 100000, '2018/6/5','Las Gravilias',1001),
('Varilla de metal para los cimientos', 100000, '2018/6/5','Las Gravilias',1001),
('Arena para los cimientos',25000,'2018/6/5','Las Gravilias',1001),
('Tubos metalicos para los cimientos',50000,'2018/6/5','Las Gravilias',1001),

--Etapa paredes del proyecto 1000
('Blocks de concreto para las paredes',500000,'2018/6/19','Las Gravilias',1002),
('Varilla de metal para las paredes', 350000,'2018/6/19','Las Gravilias',1002),
('Bolsas de cemento para las paredes',325000,'2018/6/19','Las Gravilias',1002),
('Tubos metalicos para cableado', 100000,'2018/6/19','Las Gravilias',1002),
('Lamina Gypsum para las paredes del cobertizo', 300000,'2018/6/19','Las Gravilias',1002),

--Etapa concreto reforzado del proyecto 1000
('Block de concreto para el concreto reforzado', 60000,'2018/7/1','Las Gravilias',1003),

--Etapa techos del proyecto 1000
('Laminas de metal para el techo',150000,'2018/7/10','Las Gravilias',1004),
('Tejas para el techo',90000,'2018/7/10','Las Gravilias',1004),

--Etapa cielos del proyecto 1000
('Cables electricos', 60000,'2018/7/16','Las Gravilias',1005),
('Lamina Madera',96000,'2018/7/16','Las Gravilias',1005),

--Etapa repello del proyecto 1000
('Bolsas de cemento para el repello',42000,'2018/7/22','Las Gravilias',1006),

--Etapa entrepisos del proyecto 1000
('Laminas de madera para los entrepisos',64000,'2018/7/26','Las Gravilias',1007),

--Etapa pisos del proyecto 1000
('Ceramica para el piso', 96000,'2018/7/27','Las Gravilias',1008),
('Cemento para el piso', 30000,'2018/7/27','Las Gravilias',1008),

--Etapa enchapes del proyecto 1000
('Cemento para los enchapes',30000,'2018-07-25','Las Gravilias',1009),
('Arena para los enchapes', 20000,'2018-07-25','Las Gravilias',1009),
('Azulejos para los enchapes',30000,'2018-07-25','Las Gravilias',1009),

--Etapa instalacion pluvial del proyecto 1000
('Tubos PVC para la instalacion pluvial',50000,'2018-07-17','Las Gravilias',1010),
('Canoas para la instalación pluvial',60000,'2018-07-17','Las Gravilias',1010),

--Etapa instalacion sanitaria del proyecto 1000
('Inodoro para la instalacion sanitaria',12000,'2018-07-18','Las Gravilas',1011),
('Lavatorio para instalacion sanitaria',15000,'2018-07-18','Las Gravilias',1011),
('Tubos para la instalacion sanitaria',25000,'2018-07-18','Las Gravilias',1011),
('Azulejos para la instalacion sanitaria',15000,'2018-07-18','Las Gravilias',1011),
('Cemento para la instalacion pluvial',30000,'2018-07-18','Las Gravilias',1011),

--Etapa instalacion electrica del proyecto 1000
('Cables para la instalacion electrica',180000,'2018-07-19','Las Gravilias',1012),

--Etapa puertas del proyecto 1000
('Puertas necesarias para dejar todo cerrado',100000,'2018-08-02','Las Gravilias',1013),

--Etapa Cerrajeria del proyecto 1000
('Llavines para las puertas',60000,'2018-08-03','Las Gravilias',1014),

--Etapa ventanas del proyecto 1000
('Marcos de madera para las ventanas',32000,'2018-08-05','Las Gravilias',1015),
('Vidrios para las ventanas',100000,'2018-08-05','Las Gravilias',1015),

--Etapa closets del proyecto 1000
('Laminas de madera para el closet',80000,'2018-08-07','Las Gravilias',1016),

--Etapa mueble cocina del proyecto 1000
('Block de concreto para el mueble cocina',25000,'2018-08-12','Las Gravilias',1017),
('Cemento para el mueble cocina',20000,'2018-08-12','Las Gravilias',1017),
('Ceramica para el mueble cocina',45000,'2018-08-12','Las Gravilias',1017),

--Etapa pintura del proyecto 1000
('Pintura blanca',28000,'2018-08-17','Las Gravilias',1018),
('Pintura beige',28000,'2018-08-17','Las Gravilias',1018),
('Pintura cafe',28000,'2018-08-17','Las Gravilias',1018),

--Etapa escaleras del proyecto 1000
('Laminas de madera para las escaleras',72000,'2018-07-11','Las Gravilias',1019),

--Etapa Cimientos preliminar del proyecto 1001
('Bolsas de cemento para los cimientos',80000,'2018-09-21','Las Gravilias',1021),

--Etapa paredes del proyecto 1001
('Blocks para las paredes',50000,'2018-10-06','Las Gravilias',1022),
('Cemento para las paredes',60000,'2018-10-06','Las Gravilias',1022),

--Etapa Cimientos preliminar del proyecto 1002
('Bolsas de cemento para los cimientos',85000,'2018-09-21','Las Gravilias',1024)

INSERT INTO MATERIAL_POR_ETAPA (Codigo_Material, Id_etapa, Cantidad, Precio_actual)
VALUES

--Etapa Cimientos del proyecto 1000
(1000,1001,130,200),
(1005,1001,15,10000),
(1004,1001,20,5000),
(1001,1001,60,500),
(1017,1001,5,10000),

--Etapa paredes del proyecto 1000
(1003,1002,500,1000),
(1004,1002,65,5000),
(1005,1002,30,10000),
(1017,1002,10,10000),
(1010,1002,25,10000),

--Etapa concreto reforzado del proyecto 1000
(1003,1003,55,1000),

--Etapa techos del proyecto 1000
(1006,1004,15,15000),
(1007,1004,180,500),

--Etapa cielos del proyecto 1000
(1016,1005,10,7500),
(1023,1005,12,8000),

--Etapa repello del proyecto 1000
(1005,1006,5,10000),

--Etapa entrepisos del proyecto 1000
(1023,1007,10,8000),

--Etapa pisos del proyecto 1000
(1009,1008,32,3000),
(1005,1008,5,10000),

--Etapa enchapes del proyecto 1000
(1005,1009,5,10000),
(1001,1009,40,500),
(1008,1009,10,3000),

--Etapa instalacion pluvial del proyecto 1000
(1011,1010,10,5000),
(1012,1010,5,20000),

--Etapa instalacion sanitaria del proyecto 1000
(1013,1011,1,12000),
(1015,1011,1,15000),
(1011,1011,5,5000),
(1008,1011,5,3000),
(1005,1011,5,10000),

--Etapa instalacion electrica del proyecto 1000
(1016,1012,24,7500),

--Etapa puertas del proyecto 1000
(1018,1013,2,50000),

--Etapa Cerrajeria del proyecto 1000
(1020,1014,4,15000),

--Etapa ventanas del proyecto 1000
(1022,1015,4,8000),
(1021,1015,10,10000),

--Etapa closets del proyecto 1000
(1023,1016,10,8000),

--Etapa mueble cocina del proyecto 1000
(1003,1017,25,1000),
(1005,1017,5,10000),
(1009,1017,15,3000),

--Etapa pintura del proyecto 1000
(1025,1018,3,7000),
(1026,1018,4,7000),
(1028,1018,3,7000),

--Etapa escaleras del proyecto 1000
(1023,1019,8,8000),

--Etapa Cimientos preliminar del proyecto 1001
(1005,1021,10,10000),

--Etapa paredes del proyecto 1001
(1003,1022,50,1000),
(1005,1022,5,10000),

--Etapa Cimientos preliminar del proyecto 1001
(1005,1024,8,10000)
;

INSERT INTO EMPLEADO_POR_PROYECTO (Cedula_empleado, Id_proyecto)
VALUES
('116950116',1000),
('216950116',1000),
('316950116',1001),
('416950116',1001),
('516950116',1002),
('616950116',1002),
('116950116',1003),
('616950116',1003),
('316950116',1004),
('416950116',1004),
('516950116',1005),
('216950116',1005)
;

INSERT INTO OBRERO_POR_PROYECTO (Cedula_obrero, Id_proyecto, Semana, Horas_laboradas)
VALUES
('103202101',1000,'2018/6/4',37),
('203202101',1000,'2018/6/4',34),
('303202101',1000,'2018/6/4',33),
('403202101',1000,'2018/6/4',32),
('503202101',1000,'2018/6/4',36),
('103202101',1000,'2018/6/11',35),
('203202101',1000,'2018/6/11',35),
('303202101',1000,'2018/6/11',31),
('403202101',1000,'2018/6/11',33),
('503202101',1000,'2018/6/11',35),
('103202101',1000,'2018/6/18',37),
('203202101',1000,'2018/6/18',34),
('303202101',1000,'2018/6/18',33),
('403202101',1000,'2018/6/18',32),
('503202101',1000,'2018/6/18',36),
('103202101',1000,'2018/6/25',35),
('203202101',1000,'2018/6/25',35),
('303202101',1000,'2018/6/25',31),
('403202101',1000,'2018/6/25',33),
('503202101',1000,'2018/6/25',35),
('103202101',1000,'2018/7/2',37),
('203202101',1000,'2018/7/2',34),
('303202101',1000,'2018/7/2',33),
('403202101',1000,'2018/7/2',32),
('503202101',1000,'2018/7/2',36),
('103202101',1000,'2018/7/9',35),
('203202101',1000,'2018/7/9',35),
('303202101',1000,'2018/7/9',31),
('403202101',1000,'2018/7/9',33),
('503202101',1000,'2018/7/9',35),
('103202101',1000,'2018/7/16',37),
('203202101',1000,'2018/7/16',34),
('303202101',1000,'2018/7/16',33),
('403202101',1000,'2018/7/16',32),
('503202101',1000,'2018/7/16',36),
('103202101',1000,'2018/7/23',35),
('203202101',1000,'2018/7/23',35),
('303202101',1000,'2018/7/23',31),
('403202101',1000,'2018/7/23',33),
('503202101',1000,'2018/7/23',35),
('103202101',1000,'2018/7/30',37),
('203202101',1000,'2018/7/30',34),
('303202101',1000,'2018/7/30',33),
('403202101',1000,'2018/7/30',32),
('503202101',1000,'2018/7/30',36),
('103202101',1000,'2018/8/6',35),
('203202101',1000,'2018/8/6',35),
('303202101',1000,'2018/8/6',31),
('403202101',1000,'2018/8/6',33),
('503202101',1000,'2018/8/6',35),
('103202101',1000,'2018/8/13',37),
('203202101',1000,'2018/8/13',34),
('303202101',1000,'2018/8/13',33),
('403202101',1000,'2018/8/13',32),
('503202101',1000,'2018/8/13',36),
('103202101',1000,'2018/8/20',28),
('203202101',1000,'2018/8/20',27),
('303202101',1000,'2018/8/20',26),
('403202101',1000,'2018/8/20',28),
('503202101',1000,'2018/8/20',29),
('603202101',1001,'2018/9/17',28),
('703202101',1001,'2018/9/17',27),
('803202101',1001,'2018/9/17',26),
('903202101',1001,'2018/9/17',28),
('113202101',1001,'2018/9/17',29),
('603202101',1001,'2018/9/24',35),
('703202101',1001,'2018/9/24',35),
('803202101',1001,'2018/9/24',31),
('903202101',1001,'2018/9/24',33),
('113202101',1001,'2018/9/24',35),
('603202101',1001,'2018/10/1',37),
('703202101',1001,'2018/10/1',34),
('803202101',1001,'2018/10/1',33),
('903202101',1001,'2018/10/1',32),
('113202101',1001,'2018/10/1',36),
('603202101',1001,'2018/10/8',35),
('703202101',1001,'2018/10/8',35),
('803202101',1001,'2018/10/8',31),
('903202101',1001,'2018/10/8',33),
('113202101',1001,'2018/10/8',35),
('603202101',1001,'2018/10/15',28),
('703202101',1001,'2018/10/15',27),
('803202101',1001,'2018/10/15',26),
('903202101',1001,'2018/10/15',28),
('113202101',1001,'2018/10/15',29),
('123202101',1002,'2018/9/24',8),
('133202101',1002,'2018/9/24',5),
('143202101',1002,'2018/9/24',6),
('153202101',1002,'2018/9/24',6),
('163202101',1002,'2018/9/24',7),
('123202101',1002,'2018/10/1',35),
('133202101',1002,'2018/10/1',35),
('143202101',1002,'2018/10/1',31),
('153202101',1002,'2018/10/1',33),
('163202101',1002,'2018/10/1',35),
('123202101',1002,'2018/10/8',28),
('133202101',1002,'2018/10/8',27),
('143202101',1002,'2018/10/8',26),
('153202101',1002,'2018/10/8',28),
('163202101',1002,'2018/10/8',29)
;



/*
SELECT * FROM EMPLEADO;
--DELETE FROM EMPLEADO;
SELECT * FROM OBRERO;
--DELETE FROM OBRERO;
SELECT * FROM CLIENTE;
--DELETE FROM CLIENTE;
SELECT * FROM PROYECTO;
--DELETE FROM PROYECTO;
SELECT * FROM ETAPA;
--DELETE FROM ETAPA;
SELECT * FROM COMPRA;
--DELETE FROM COMPRA;
SELECT * FROM MATERIAL
--DELETE FROM MATERIAL
SELECT * FROM EMPLEADO_POR_PROYECTO;
--DELETE FROM EMPLEADO_POR_PROYECTO;
SELECT * FROM OBRERO_POR_PROYECTO;
--DELETE FROM OBRERO_POR_PROYECTO;
SELECT * FROM ROL_POR_EMPLEADO;
--DELETE FROM ROL_POR_EMPLEADO;
SELECT * FROM MATERIAL_POR_ETAPA
ORDER BY Id_etapa;
--DELETE FROM MATERIAL_POR_ETAPA;
*/