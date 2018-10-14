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
('Roger','Rodriguez','Rosti','116800684','85693147','Administrador de Empresas'),
('Gerardo','Muñoz','Artavia','782950458','88921245','Ingeniero en Construccion')
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

INSERT INTO ETAPA (Nombre, Presupuesto, Fecha_inicio, Fecha_final, Id_proyecto)
VALUES
('Trabajo Preliminar',40000,'2018/6/2','2018/6/4',1000),
('Cimientos',350000,'2018/6/5','2018/6/18',1000),
('Paredes',1500000,'2018/6/19','2018/6/30',1000),
('Concreto Reforzado',55000,'2018/7/1','2018/7/9',1000),
('Techos',250000,'2018/7/10','2018/7/15',1000),
('Cielos',135000,'2018/7/16','2018/7/21',1000),
('Repello',45000,'2018/7/22','2018/7/25',1000),
('Entrepisos',50000,'2018/7/26','2018/7/31',1000),
('Pisos',125000,'2018/7/27','2018/8/1',1000),
('Enchapes',60000,'2018/7/25','2018/7/31',1000),
('Instalacion Pluvial',105000,'2018/7/17','2018/7/25',1000),
('Instalacion Sanitaria',95000,'2018/7/18','2018/7/26',1000),
('Instalacion Electrica',175000,'2018/7/19','2018/7/28',1000),
('Puertas',135000,'2018/8/2','2018/8/4',1000),
('Cerrajería',55000,'2018/8/3','2018/8/4',1000),
('Ventanas',140000,'2018/8/5','2018/8/10',1000),
('Closets',85000,'2018/8/7','2018/8/11',1000),
('Mueble de Cocina',100000,'2018/8/12','2018/8/16',1000),
('Pintura',75000,'2018/8/17','2018/8/23',1000),
('Escaleras',105000,'2018/7/11','2018/7/19',1000),
('Trabajo Preliminar',45000,'2018/9/18','2018/9/20',1001),
('Cimientos',80000,'2018/9/21','2018/10/5',1001),
('Paredes',165000,'2018/10/6','2018/10/18',1001),
('Trabajo Preliminar',35000,'2018/9/28','2018/9/30',1002),
('Cimientos',70000,'2018/10/1','2018/10/13',1002)
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


INSERT INTO COMPRA (Descripcion, Precio, Fecha_compra, Lugar_compra, Cantidad, Id_etapa, Id_material)
VALUES

--Etapa Cimientos del proyecto 1000
('Piedra para los cimientos',25000,'2018/6/5','Las Gravilias',125,1001, 1000),
('Cemento para los cimientos', 100000, '2018/6/5','Las Gravilias',10,1001,1005),
('Varilla de metal para los cimientos', 100000, '2018/6/5','Las Gravilias', 20, 1001,1004),
('Arena para los cimientos',25000,'2018/6/5','Las Gravilias',50,1001,1001),
('Tubos metalicos para los cimientos',50000,'2018/6/5','Las Gravilias', 5,1001,1017),

--Etapa paredes del proyecto 1000
('Blocks de concreto para las paredes',500000,'2018/6/19','Las Gravilias',500,1002,1003),
('Varilla de metal para las paredes', 350000,'2018/6/19','Las Gravilias', 70,1002,1004),
('Bolsas de cemento para las paredes',325000,'2018/6/19','Las Gravilias',325,1002,1005),
('Tubos metalicos para cableado', 100000,'2018/6/19','Las Gravilias',10,1002,1017),
('Lamina Gypsum para las paredes del cobertizo', 300000,'2018/6/19','Las Gravilias',30, 1002,1010),

--Etapa concreto reforzado del proyecto 100
('Block de concreto para el concreto reforzado', 60000,'2018/7/1','Las Gravilias',60,1003,1003),

--Etapa techos del proyecto 1000
('Laminas de metal para el techo',150000,'2018/7/10','Las Gravilias',10,1004,1006),
('Tejas para el techo',90000,'2018/7/10','Las Gravilias',180,1004,1007),

--Etapa cielos del proyecto 1000
('Cables electricos', 60000,'2018/7/16','Las Gravilias',8,1005,1016),
('Lamina Madera',96000,'2018/7/16','Las Gravilias',12,1005,1023),

--Etapa repello del proyecto 1000
('Pintura blanca para el repello',42000,'2018/7/22','Las Gravilias',6,1006,1025),

--Etapa entrepisos del proyecto 1000
('Laminas de madera para los entrepisos',64000,'2018/7/26','Las Gravilias',8,1007,1023),

--Etapa pisos del proyecto 1000
('Ceramica para el piso', 96000,'2018/7/27','Las Gravilias', 32,1008,1009),
('Cemento para el piso', 30000,'2018/7/27','Las Gravilias',3,1008,1005),

--Etapa enchapes del proyecto 1000
('Cemento para los enchapes',30000,'2018-07-25','Las Gravilias',3,1009,1005),
('Arena para los enchapes', 20000,'2018-07-25','Las Gravilias',40,1009,1001),
('Azulejos para los enchapes',30000,'2018-07-25','Las Gravilias',10,1009,1008),

--Etapa instalacion pluvial del proyecto 1000
('Tubos PVC para la instalacion pluvial',50000,'2018-07-17','Las Gravilias',10,1010,1011),
('Canoas para la instalación pluvial',60000,'2018-07-17','Las Gravilias',3,1010,1012),

--Etapa instalacion sanitaria del proyecto 1000
('Inodoro para la instalacion sanitaria',12000,'2018-07-18','Las Gravilas',1,1011,1013),
('Lavatorio para instalacion sanitaria',15000,'2018-07-18','Las Gravilias',1,1011,1015),
('Tubos para la instalacion sanitaria',25000,'2018-07-18','Las Gravilias',5,1011,1011),
('Azulejos para la instalacion sanitaria',15000,'2018-07-18','Las Gravilias',5,1011,1008),
('Cemento para la instalacion pluvial',30000,'2018-07-18','Las Gravilias',3,1011,1005),

--Etapa instalacion electrica del proyecto 1000
('Cables para la instalacion electrica',180000,'2018-07-19','Las Gravilias',24,1012,1016),

--Etapa puertas del proyecto 1000
('Puertas necesarias para dejar todo cerrado',100000,'2018-08-02','Las Gravilias',2,1013,1018),

--Etapa Cerrajeria del proyecto 1000
('Llavines para las puertas',60000,'2018-08-03','Las Gravilias',4,1014,1020),

--Etapa ventanas del proyecto 1000
('Marcos de madera para las ventanas',32000,'2018-08-05','Las Gravilias',4,1015,1022),
('Vidrios para las ventanas',100000,'2018-08-05','Las Gravilias',10,1015,1021),

--Etapa closets del proyecto 1000
('Laminas de madera para el closet',80000,'2018-08-07','Las Gravilias',10,1016,1023),

--Etapa mueble cocina del proyecto 1000
('Block de concreto para el mueble cocina',25000,'2018-08-12','Las Gravilias',25,1017,1003),
('Cemento para el mueble cocina',20000,'2018-08-12','Las Gravilias',2,1017,1005),
('Ceramica para el mueble cocina',45000,'2018-08-12','Las Gravilias',15,1017,1009),

--Etapa pintura del proyecto 1000
('Pintura blanca',28000,'2018-08-17','Las Gravilias',4,1018,1025),
('Pintura beige',28000,'2018-08-17','Las Gravilias',4,1018,1026),
('Pintura cafe',28000,'2018-08-17','Las Gravilias',4,1018,1028),

--Etapa escaleras del proyecto 1000
('Laminas de madera para las escaleras',72000,'2018-07-11','Las Gravilias',9,1019,1023),

--Etapa Cimientos preliminar del proyecto 1001
('Bolsas de cemento para los cimientos',80000,'2018-09-21','Las Gravilias',8,1021,1005),

--Etapa paredes del proyecto 1001
('Blocks para las paredes',50000,'2018-10-06','Las Gravilias',50,1022,1003),
('Cemento para las paredes',60000,'2018-10-06','Las Gravilias',6,1022,1005),

--Etapa Cimientos preliminar del proyecto 1001
('Bolsas de cemento para los cimientos',80000,'2018-09-21','Las Gravilias',8,1024,1005)


INSERT INTO EMPLEADO_POR_PROYECTO --(Cedula_empleado, Id_proyecto)
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

--Faltaria agregar las semanas de los otros 15 obreros o eliminamos 3 proyectos? porque ya es mucho jaja
INSERT INTO OBRERO_POR_PROYECTO (Cedula_obrero, Id_proyecto, Numero_semana, Horas_laboradas)
VALUES
('103202101',1000,1,37),
('203202101',1000,1,34),
('303202101',1000,1,33),
('403202101',1000,1,32),
('503202101',1000,1,36),
('103202101',1000,2,35),
('203202101',1000,2,35),
('303202101',1000,2,31),
('403202101',1000,2,33),
('503202101',1000,2,35),
('103202101',1000,3,37),
('203202101',1000,3,34),
('303202101',1000,3,33),
('403202101',1000,3,32),
('503202101',1000,3,36),
('103202101',1000,4,35),
('203202101',1000,4,35),
('303202101',1000,4,31),
('403202101',1000,4,33),
('503202101',1000,4,35),
('103202101',1000,5,37),
('203202101',1000,5,34),
('303202101',1000,5,33),
('403202101',1000,5,32),
('503202101',1000,5,36),
('103202101',1000,6,35),
('203202101',1000,6,35),
('303202101',1000,6,31),
('403202101',1000,6,33),
('503202101',1000,6,35),
('103202101',1000,7,37),
('203202101',1000,7,34),
('303202101',1000,7,33),
('403202101',1000,7,32),
('503202101',1000,7,36),
('103202101',1000,8,35),
('203202101',1000,8,35),
('303202101',1000,8,31),
('403202101',1000,8,33),
('503202101',1000,8,35),
('103202101',1000,9,37),
('203202101',1000,9,34),
('303202101',1000,9,33),
('403202101',1000,9,32),
('503202101',1000,9,36),
('103202101',1000,10,35),
('203202101',1000,10,35),
('303202101',1000,10,31),
('403202101',1000,10,33),
('503202101',1000,10,35),
('103202101',1000,11,37),
('203202101',1000,11,34),
('303202101',1000,11,33),
('403202101',1000,11,32),
('503202101',1000,11,36),
('103202101',1000,12,28),
('203202101',1000,12,27),
('303202101',1000,12,26),
('403202101',1000,12,28),
('503202101',1000,12,29),
('603202101',1001,1,28),
('703202101',1001,1,27),
('803202101',1001,1,26),
('903202101',1001,1,28),
('113202101',1001,1,29),
('603202101',1000,2,35),
('703202101',1000,2,35),
('803202101',1000,2,31),
('903202101',1000,2,33),
('113202101',1000,2,35),
('603202101',1000,3,37),
('703202101',1000,3,34),
('803202101',1000,3,33),
('903202101',1000,3,32),
('113202101',1000,3,36),
('603202101',1000,4,35),
('703202101',1000,4,35),
('803202101',1000,4,31),
('903202101',1000,4,33),
('113202101',1000,4,35),
('603202101',1001,5,28),
('703202101',1001,5,27),
('803202101',1001,5,26),
('903202101',1001,5,28),
('113202101',1001,5,29),
('123202101',1002,1,28),
('133202101',1001,1,27),
('143202101',1001,1,26),
('153202101',1001,1,28),
('163202101',1001,1,29),
('123202101',1000,2,35),
('133202101',1000,2,35),
('143202101',1000,2,31),
('153202101',1000,2,33),
('163202101',1000,2,35),
('123202101',1002,3,28),
('133202101',1001,3,27),
('143202101',1001,3,26),
('153202101',1001,3,28),
('163202101',1001,3,29)
;




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
