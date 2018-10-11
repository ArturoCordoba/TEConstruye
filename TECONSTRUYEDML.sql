USE TECONSTRUYE
GO

INSERT INTO EMPLEADO (Primer_Nombre, Primer_Apellido, Segundo_Apellido, Cedula, Telefono, Especialidad)
VALUES
('Anthonny','Loaiza','Rosales','116950116','85621439','Ingeniero Civil'),
('Rodrigo','Gonzalez','Gonzalez','216950116','85821439','Arquitecto'),
('James','Perez','Diaz','316950116','85521639','Ingeniero Civil'),
('Juan','Chavarria','Rosales','416950116','85121439','Arquitecto'),
('Daniela','Rodriguez','Araya','516950116','87521439','Ingeniero Civil'),
('Sandra','Casas','Herrero','616950116','83855217','Arquitecto');
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
('Cimientos',75000,'2018/6/5','2018/6/18',1000),
('Paredes',150000,'2018/6/19','2018/6/30',1000),
('Concreto Reforzado',55000,'2018/7/1','2018/7/9',1000),
('Techos',210000,'2018/7/10','2018/7/15',1000),
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

--Falta asignar precios unitarios
INSERT INTO MATERIAL (Nombre, Precio_unitario)
VALUES
('Piedra', 200),
('Arena', 500),
('Cal', 100),
('Blocks Concreto', 1000),
('Varilla Metal', 5000),
('Bolsa Cemento', 10000),
('Lamina Metal', 15000),
('Teja', 5000),
('Azulejos', 3000),
('Ceramica', 3000),
('Lamina Gypsum', 10000),
('Tubos PVC', 5000),
('Canoa Metal', 50000),
('Inodoro', 75000),
('Fregadero', 40000),
('Lavatorio', 35000),
('Cables', 7500),
('Tubo Metalico', 10000),
('Puerta Madera', 50000),
('Puerta Hierro, 60000'),
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

--Faltan las compras de las etapas
INSERT INTO COMPRA (Descripcion, Precio, Fecha_compra, Id_etapa)
VALUES
('Materiales preliminares',38000,'2018/6/2',1000),
('Arena para los cimientos', 13000, '2018/6/5', 1001),
('Piedra para los cimientos', 20000, '2018/6/5', 1001),
('Varilla de metal para los cimientos', 30000, '2018/6/5', 1001),
('Sacos de cemento para las paredes', 30000, '2018/6/19', 1002),
('Blocks de concreto para las paredes', 40000, '2018/6/19', 1002),
('Varillas de metal para las paredes', 35000, '2018/6/19', 1002),
('Bolsas de cemento para concreto reforzado', 25000, '2018/7/1', 1003),
('Varillas de metal para concreto reforzado', 20000, '2018/7/1', 1003),
('Tejas para el techo', 50000, '2018/7/10', 1004),
('Laminas de metal para el techo', 50000, '2018/7/10', 1004),
()

INSERT INTO EMPLEADOS_POR_PROYECTO --(Cedula_empleado, Id_proyecto)
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
INSERT INTO OBREROS_POR_PROYECTO (Cedula_obrero, Id_proyecto, Numero_semana, Horas_laboradas)
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
DELETE FROM EMPLEADO;
SELECT * FROM OBRERO;
DELETE FROM OBRERO;
SELECT * FROM CLIENTE;
DELETE FROM CLIENTE;
SELECT * FROM PROYECTO;
DELETE FROM PROYECTO;
SELECT * FROM ETAPA;
DELETE FROM ETAPA;
SELECT * FROM COMPRA;
DELETE FROM COMPRA;
SELECT * FROM EMPLEADOS_POR_PROYECTO;
DELETE FROM EMPLEADOS_POR_PROYECTO;
SELECT * FROM OBREROS_POR_PROYECTO;
DELETE FROM OBREROS_POR_PROYECTO;
SELECT * FROM MATERIALES_POR_ETAPA;
DELETE FROM MATERIALES_POR_ETAPA;
