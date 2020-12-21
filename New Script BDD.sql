--
-- Base de datos: `proyecto_stock`
--

-- --------------------------------------------------------

--
-- Creación base de datos `proyecto_stock`
--

CREATE SCHEMA IF NOT EXISTS `proyecto_stock` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_stock`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ccosto_area`
--

CREATE TABLE `ccosto_area` (
  `id_ccosto_area` int(10) NOT NULL,
  `nombre_area` varchar(45) NOT NULL,
  `nombre_ccosto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ccosto_area`
--

INSERT INTO `ccosto_area` (`id_ccosto_area`, `nombre_area`, `nombre_ccosto`) VALUES
(16081921 ,'Mantención'								 ,'Mantención'),
(1609199  ,'Cetecom'									 ,'Cetecom'),
(1608202  ,'Servicios Generales'						 ,'Servicios Generales'),
(1608170  ,'iVARAS'									 ,'iVARAS'),
(160810202,'Pañol - ING EN CONEC Y REDES'				 ,'Pañol - ING EN CONEC Y REDES'),
(160810204,'Pañol - TEC TELECOMUNICACIONES'			 ,'Pañol - TEC TELECOMUNICACIONES'),
(160810203,'Pañol - ING INFORMATICA'					 ,'Pañol - ING INFORMATICA'),
(160810207,'Pañol - ING EN INFRAESTRUCTURA Y PLAT TEC.','Pañol - ING EN INFRAESTRUCTURA Y PLAT TEC.');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nombre_menu` varchar(45) NOT NULL,
  `url_menu` varchar(45) NOT NULL,
  `id_menu_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre_menu`, `url_menu`, `id_menu_padre`) VALUES
(1, 'No Aplica', '', NULL),
(2, 'Usuario', '', NULL),
(3, 'Agregar Usuario', 'RegistroUsuario.jsp', 2),
(4, 'Listar Usuario', 'ListaUsuario.jsp',     2),
(5, 'Producto', '', NULL),
(6, 'Agregar Producto', 'RegistroProducto.jsp', 		   5),
(7, 'Listar Productos', 'ListaProducto.jsp',    		   5),
(8, 'Carga Masiva de Productos', 'CargaMasivaProducto.jsp',5),
(9, 'Proveedor', '', NULL),
(10, 'Agregar Proveedor', 'RegistroProveedor.jsp', 9),
(11, 'Lista Proveedores', 'ListaProveedor.jsp',    9),
(12, 'Centro de Costos', '', NULL),
(13, 'Agregar Centro', 'RegistroCentroDeCosto.jsp',             12),
(14, 'Listar Centro de Costos','ListaCentroDeCosto.jsp',        12),
(15, 'Carga Masiva de Centro de Costos', 'CargaMasivaCecos.jsp',12 ),
(16, 'Sede', '', NULL),
(17, 'Agregar Sede', 'RegistrarSede.jsp', 16),
(18, 'Listar Sede', 'ListaSedes.jsp',     16),
(19, 'Area', '', NULL),
(20, 'Agregar Area', 'RegistrarArea.jsp', 19),
(21, 'Listar Area', 'ListaArea.jsp',      19),
(22, 'Bodega', '', NULL),
(23, 'Agregar Bodega', 'RegistrarBodega.jsp', 22),
(24, 'Listar Bodega', 'ListaBodegas.jsp',     22),
(25, 'Tipos de Usuario', '', NULL),
(26, 'Agregar Tipo de Usuario', 'RegistroTipoUsuario.jsp', 25),
(27, 'Listar Tipos de Usuario', 'ListaTipoUsuario.jsp',    25),
(28, 'Menu', '', NULL),
(29, 'Agregar Menu', 'RegistroMenu.jsp', 28),
(30, 'Listar Menu', 'ListaMenu.jsp',     28),
(31, 'Permisos', '', NULL),
(32, 'Agregar Permisos', 'RegistroTipoMenu.jsp', 31),
(33, 'Listar Permisos', 'ListaTipoMenu.jsp',     31),
(45, 'Larvilla', '', NULL),
(47, 'Listar Larvillas', 'ListaLarvilla.jsp', 45),
(48, 'Ubicacion', '', NULL),
(49, 'Agregar Ubicacion', 'RegistroUbicacion.jsp', 48),
(50, 'Lista Ubicacion', 'ListaUbicacion.jsp',      48),
(51, 'Tipo Unidad', '', NULL),
(52, 'Agregar Tipo Unidad', 'RegistrarTipoUnidad.jsp', 51),
(53, 'Listar Tipo Unidad', 'ListaTipoUnidad.jsp',      51),
(54, 'Tipo Producto', '', NULL),
(55, 'Agregar Tipo Producto', 'RegistrarTipoProducto.jsp', 54),
(56, 'Listar Tipo Producto', 'ListaTipoProducto.jsp',      54),
(59, 'Tipo Ubicacion', '', NULL),
(60, 'Agregar Tipo Ubicacion', 'RegistrarTipoUbicacion.jsp', 59),
(61, 'Lista Tipo Ubicacion', 'ListaTipoUbicacion.jsp',       59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(500) DEFAULT NULL,
  `valor_producto` int(11) NOT NULL,
  `marca_producto` varchar(45) NOT NULL,
  `serial_producto` varchar(45) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `estado_producto` varchar(20) NOT NULL,
  `id_proveedor` int(10) not null,
  `id_tipo_producto` int(10) NOT NULL,
  `id_tipo_unidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`nombre_producto`, `descripcion_producto`, `valor_producto`,
						`marca_producto`, `serial_producto`, `stock_minimo`, `estado_producto`,
						`id_proveedor`, `id_tipo_producto`, `id_tipo_unidad`) VALUES
('Jabon', 'Jabon para Baños', 690, 'Le Sancy', '00002', 10, 'Stock', 1, 7, 13),
('Arroz', 'Arroz para comer', 890, 'Tucapel', '23123', 5, 'Reponer Stock', 1, 9, 1),
('Mouse', 'Reacondicionados', 3600,  'hp', '001004', 50, 'Reponer Stock',1 , 8, 1),
('Tallarines', 'Numero 78',  650,  'Carozzi', '332200', 1, 'Stock', 1, 9, 1),
('Editado', 'edit',  12313, '123213', '23213', 21321313, 'Reponer Stock', 1, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `rut_proveedor` varchar(15) NOT NULL UNIQUE,
  `nombre_proveedor` varchar(100) NOT NULL,
  `razonSocial_proveedor` varchar(100) NOT NULL,
  `correo_proveedor` varchar(45) DEFAULT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `fono_proveedor` varchar(15) NOT NULL,
  `estado_proveedor` varchar(1),
  `id_comuna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`rut_proveedor`, `nombre_proveedor`, `razonSocial_proveedor`, 
						`correo_proveedor`, `direccion_proveedor`, `fono_proveedor`,`id_comuna`) VALUES
('195655383', 'felipe', 'felipe s.a', 'Santiago@santiago.cl', 'santiagooooo', '45093332',12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(10) NOT NULL,
  `nombre_sede` varchar(100) NOT NULL,
  `direccion_sede` varchar(200) NOT NULL,
  `id_comuna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id_sede`, `nombre_sede`, `direccion_sede`,`id_comuna`) VALUES
(1, 'Sede Antonio Varas', 'Antonio Varas 666, Providencia.',1),
(2, 'Sede Alameda', ' Av. España 8, Santiago Centro, Metro Estación República (esquina Alameda).',12),
(4, 'Sede Educación Continua', 'Miguel Claro 337, Providencia, Santiago',1),
(5, 'Sede Maipú', ' Av. Esquina Blanca 501, Maipú.',14),
(6, 'Sede Melipilla', 'Serrano 1105, Melipilla.',15),
(7, 'Sede Padre Alonso de Ovalle', ' Padre Alonso de Ovalle 1586, Santiago Centro',12),
(8, 'Sede Plaza Norte', 'Calle Nueva 1660, Huechuraba.',16),
(9, 'Sede Plaza Oeste', 'Av. Américo Vespucio 1501, Mall Plaza Oeste,Cerrillos',17),
(10, 'Sede Plaza Vespucio', 'Froilán Roa 7107, Mall Plaza Vespucio, La Florida.',2),
(11, 'Sede Puente Alto', 'Av. Concha y Toro 1340 c/San Carlos, Puente Alto.',3),
(12, 'Sede San Bernardo', 'Freire 857, San Bernardo.',4),
(13, 'Sede San Carlos de Apoquindo', 'Camino El Alba 12881, Las Condes.',5),
(14, 'Sede San Joaquín', 'Av. Vicuña Mackenna 4917, Metro San Joaquín, San Joaquín.',6),
(15, 'Sede Valparaíso', 'Av. Brasil 2021, esquina Rodríguez, Valparaíso.',7),
(16, 'Sede Viña del Mar', 'Álvarez 2366, Chorrillos, Viña del Mar.',8),
(17, 'Campus Arauco', 'Camino a Carampangue N° 1060, Arauco.',9),
(18, 'Sede San Andrés de Concepción', 'Paicaví 3280 (Sector Rotonda El Trébol), Concepción.',10),
(19, 'Campus Villarrica', 'Anfión Muñoz 51, Villarrica.',11),
(20, 'Sede Puerto Montt Egaña', '651, Puerto Montt.',13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_menu`
--

CREATE TABLE `tipo_menu` (
  `id_tipo_menu` int(11) AUTO_INCREMENT PRIMARY KEY,
  `id_menu` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_menu`
--

INSERT INTO `tipo_menu` (`id_menu`, `id_tipo_usuario`) VALUES
( 2, 1),
( 3, 1),
( 4, 1),
( 5, 1),
( 6, 1),
( 7, 1),
( 8, 1),
( 9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(59, 1),
(60, 1),
(61, 1),
( 5, 2),
( 6, 2),
( 7, 2),
( 8, 2),
( 9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int(11) NOT NULL,
  `categoria_tipo_producto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo_producto`, `categoria_tipo_producto`) VALUES
(7, 'Insumo'),
(8, 'Electronico'),
(9, 'Gastronomico'),
(16, 'Ferreteria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_unidad`
--

CREATE TABLE `tipo_unidad` (
  `id_tipo_unidad` int(11) NOT NULL,
  `nombre_unidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_unidad`
--

INSERT INTO `tipo_unidad` (`id_tipo_unidad`, `nombre_unidad`) VALUES
(1, 'Kilo'),
(13, 'Litro'),
(14, 'Caja'),
(15, 'Pallet'),
(16, 'Bidón'),
(18, 'Unidad'),
(19, 'Docena'),
(20, '1/2 Docena'),
(21, '1/2 Kilo'),
(22, 'Barril');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `categoria_tipo_usuario` varchar(45) NOT NULL DEFAULT 'Operador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `categoria_tipo_usuario`) VALUES
(1, 'Administrador'),
(2, 'Operador'),
(13, 'Sin Permisos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `codigo_ubicacion` varchar(10) NOT NULL,
  `nombre_ubicacion` varchar(45),
  `descripcion_ubicacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`codigo_ubicacion`, `nombre_ubicacion`,`descripcion_ubicacion`) VALUES
('L101','Laboratorio 101','Laboratorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  `rut_usuario` varchar(15) NOT NULL UNIQUE,
  `nombre_usuario` varchar(45) NOT NULL,
  `password_usuario` varchar(45) NOT NULL,
  `ape_paterno_usuario` varchar(45) NOT NULL,
  `ape_materno_usuario` varchar(45) NOT NULL,
  `celular_usuario` varchar(15) NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `direccion_usuario` varchar(45) NOT NULL,
  `estado_usuario` varchar(1),
  `id_tipo_usuario` int(11) NOT NULL,
  `id_ccosto_area` int(10) NOT NULL,
  `id_comuna` int(10) NOT NULL,
  `id_sede` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`rut_usuario`, `nombre_usuario`, `password_usuario`, `ape_paterno_usuario`, 
					   `ape_materno_usuario`, `celular_usuario`, `correo_usuario`, `direccion_usuario`, 
					   `id_tipo_usuario`, `id_ccosto_area`,`id_comuna`, `id_sede`) VALUES
('10.000.000-0','Felipe',  '1234',    'Zapata',   'Soto',    '971239234','fe.zapatas@alumnos.duoc.cl',  'El Valle 01300',  2,1609199,1,1),
('16.000.000-0','Diego',   '1234',    'Conejeros','Perez',   '987598076','diego.conejeros03@gmail.com', 'Isla Snag 175',   2,1609199,1,1),
('8.888.888-8', 'Jose',    '1234',    'Quiroz',   'Mamani',  '999514531','jose.quirozm@alumnos.duoc.cl','Las Condes #1060',2,1609199,1,1),
('admin', 		'admin',   'admin',   'admin',    'admin',   'admin',    'admin@admin.cl', 			    'admin', 		   1,1609199,1,1),
('admin2', 		'admin2',  'admin2',  'admin2',   'admin2',  'admin2',   'admin2@admin2.cl',            'admin2', 		   1,1609199,1,1),
('operador', 	'operador','operador','operador', 'operador','operador', 'operador@operador.cl',        'operador',        2,1609199,1,1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_region` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre_region` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`nombre_region`) VALUES
('Región de Arica y Parinacota'),
('Región de Tarapacá'),
('Región de Antofagasta'),
('Región de Atacama'),
('Región de Coquimbo'),
('Región de Valparaíso'),
('Región Metropolitana'),
('Región del Libertador General Bernardo O´Higgins'),
('Región del Maule'),
('Región de Ñuble'),
('Región del Bío-Bío'),
('Región de La Araucanía'),
('Región de Los Ríos'),
('Región de Los Lagos'),
('Región de Aysén del General Carlos Ibáñez del Campo'),
('Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id_comuna` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre_comuna` varchar(50) NOT NULL,
  `id_region` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`nombre_comuna`,`id_region`) VALUES
('Providencia',  7),
('La Florida',   7),
('Puente Alto',  7),
('San Bernardo', 7),
('Las Condes',   7),
('San Joaquín',  7),
('Valparaíso',   6),
('Viña del Mar', 6),
('Arauco',      11),
('Concepción',  11),
('Villarrica',  12),
('Santiago',	 7),
('Puerto Montt',14),
('Maipú',        7),
('Melipilla',    7),
('Huechuraba',   7),
('Cerrillos',    7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `descripcion_tipo_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`descripcion_tipo_documento`) VALUES
('Factura'),
('Guía de despacho'),
('Memorandum interno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre_tipo_movimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`nombre_tipo_movimiento`) VALUES
('Ingreso'),
('Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `numero_movimiento` int(10) NOT NULL,
  `fecha_documento` datetime NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_ccosto_area` int(10) NOT NULL,
  `id_tipo_movimiento` int(10) NOT NULL,
  `id_tipo_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento`
--

/**
INSERT INTO `movimiento` (`id_movimiento`,`numero_movimiento`,`fecha_documento`
						`id_usuario`,`id_ccosto_area`,`id_tipo_movimiento`,`id_tipo_documento`) VALUES
(`DATOS`);
**/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_movimiento`
--

CREATE TABLE `detalle_movimiento` (
  `id_detalle_movimiento` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cantidad_detalle_movimiento` int(10) NOT NULL,
  `precio_detalle_movimiento` int(10) NOT NULL,
  `codigo_activo` int(10) NOT NULL,
  `estado_detalle_movimiento` varchar(1),
  `fecha_movimiento` datetime,
  `id_movimiento` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `id_ubicacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_movimiento`
--

/**
INSERT INTO `detalle_movimiento` (`cantidad_detalle_movimiento`,`precio_detalle_movimiento`,`codigo_activo`,
						`estado_detalle_movimiento`,`id_movimiento`,`id_producto`,`id_ubicacion`) VALUES
(`DATOS`);
**/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro_producto`
--

CREATE TABLE `maestro_producto` (
  `id_maestro_producto` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `total_producto` int(10) NOT NULL,
  `id_detalle_movimiento` int(10) NOT NULL,
  `id_movimiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maestro_producto`
--

/**
INSERT INTO `maestro_producto` (`total_producto`,`id_detalle_movimiento`,`id_movimiento`) VALUES
(`DATOS`);
**/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fecha_inventario` datetime NOT NULL,
  `descripcion_inventario` varchar(100) NOT NULL,
  `codigo_inventario` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_ccosto_area` int(10) NOT NULL,
  `id_ubicacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

/**
INSERT INTO `inventario` (`fecha_inventario`,`descripcion_inventario`,`codigo_inventario`
						`id_usuario`,`id_ccosto_area`,`id_ubicacion`) VALUES
(`DATOS`);
**/

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE `detalle_inventario` (
  `id_detalle_inventario` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cantidad_producto_inventario` int(10) NOT NULL,
  `ubicacion_bodega` varchar(50) NOT NULL,
  `id_inventario` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_inventario`
--

/**
INSERT INTO `detalle_inventario` (`cantidad_producto_inventario`,`ubicacion_bodega`,
						`id_inventario`,`id_producto`) VALUES
(`Movimiento simple`);
**/

-- --------------------------------------------------------

--
-- Índices para tablas volcadas
--

-- --------------------------------------------------------

--
-- Indices de la tabla `ccosto_area`
--
ALTER TABLE `ccosto_area`
  ADD PRIMARY KEY (`id_ccosto_area`);

--
-- Indices de la tabla `menu`
--

ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_Menu_Menu` (`id_menu_padre`);

--
-- Indices de la tabla `producto`
--

ALTER TABLE `producto`
  ADD KEY `fk_Producto_Proveedor` (`id_proveedor`),
  ADD KEY `fk_Producto_Tipo_Producto` (`id_tipo_producto`),
  ADD KEY `fk_Producto_Tipo_Unidad` (`id_tipo_unidad`);

--
-- Indices de la tabla `proveedor`
--

ALTER TABLE `proveedor`
  ADD KEY `fk_Proveedor_Comuna` (`id_comuna`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD KEY `fk_Sede_Comuna` (`id_comuna`);

--
-- Indices de la tabla `tipo_menu`
--

ALTER TABLE `tipo_menu`
  ADD KEY `fk_Tipo_Menu_Menu` (`id_menu`),
  ADD KEY `fk_Tipo_Menu_Tipo_Usuario` (`id_tipo_usuario`);

--
-- Indices de la tabla `tipo_producto`
--

ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `tipo_unidad`
--

ALTER TABLE `tipo_unidad`
  ADD PRIMARY KEY (`id_tipo_unidad`);

--
-- Indices de la tabla `tipo_usuario`
--

ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuario`
--

ALTER TABLE `usuario`
  ADD KEY `fk_Usuario_Tipo_Usuario` (`id_tipo_usuario`),
  ADD KEY `fk_Usuario_CCosto_Area`  (`id_ccosto_area`),
  ADD KEY `fk_Usuario_Comuna`       (`id_comuna`),
  ADD KEY `fk_Usuario_Sede`         (`id_sede`);

--
-- Indices de la tabla `comuna`
--

ALTER TABLE `comuna`
  ADD KEY `fk_Comuna_Region` (`id_region`);

--
-- Indices de la tabla `movimiento`
--

ALTER TABLE `movimiento`
  ADD KEY `fk_Movimiento_Usuario`         (`id_usuario`),
  ADD KEY `fk_Movimiento_CCosto_Area`     (`id_ccosto_area`),
  ADD KEY `fk_Movimiento_Tipo_Movimiento` (`id_tipo_movimiento`),
  ADD KEY `fk_Movimiento_Tipo_Documento`  (`id_tipo_documento`);

--
-- Indices de la tabla `detalle_movimiento`
--

ALTER TABLE `detalle_movimiento`
  ADD KEY `fk_Detalle_Movimiento_Movimiento` (`id_movimiento`),
  ADD KEY `fk_Detalle_Movimiento_Producto`   (`id_producto`),
  ADD KEY `fk_Detalle_Movimiento_Ubicacion`  (`id_ubicacion`);

--
-- Indices de la tabla `maestro_producto`
--

ALTER TABLE `maestro_producto`
  ADD KEY `fk_Maestro_Producto_DDetalle`   (`id_detalle_movimiento`),
  ADD KEY `fk_Maestro_Producto_DMovimiento`(`id_movimiento`);

--
-- Indices de la tabla `inventario`
--

ALTER TABLE `inventario`
  ADD KEY `fk_Inventario_Usuario`     (`id_usuario`),
  ADD KEY `fk_Inventario_CCosto_Area` (`id_ccosto_area`),
  ADD KEY `fk_Inventario_Ubicacion`   (`id_ccosto_area`);

--
-- Indices de la tabla `detalle_inventario`
--

ALTER TABLE `detalle_inventario`
  ADD KEY `fk_Detalle_Inventario_Inventario` (`id_inventario`),
  ADD KEY `fk_Detalle_Inventario_Producto`   (`id_producto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_Menu_Menu1` FOREIGN KEY (`id_menu_padre`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Producto1` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Unidad1` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `tipo_unidad` (`id_tipo_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Proveedor_Comuna1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sede`
--
ALTER TABLE `sede`
  ADD CONSTRAINT `fk_Sede_Comuna1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD CONSTRAINT `fk_Tipo_Menu_Menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tipo_Menu_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_CCosto_Area1` FOREIGN KEY (`id_ccosto_area`) REFERENCES `ccosto_area` (`id_ccosto_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Comuna1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Sede1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `fk_Comuna_Region1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_Movimiento_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimiento_CCosto_Area1` FOREIGN KEY (`id_ccosto_area`) REFERENCES `ccosto_area` (`id_ccosto_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimiento_Tipo_Movimiento1` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipo_movimiento` (`id_tipo_movimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimiento_Tipo_Documento1` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_movimiento`
--
ALTER TABLE `detalle_movimiento`
  ADD CONSTRAINT `fk_Detalle_Movimiento_Movimiento1` FOREIGN KEY (`id_movimiento`) REFERENCES `movimiento` (`id_movimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalle_Movimiento_Producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalle_Movimiento_Ubicacion1` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

COMMIT;