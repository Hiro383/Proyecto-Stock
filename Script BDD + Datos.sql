-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2020 a las 01:09:47
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_stock`
--

-- --------------------------------------------------------

--
-- Creación base de datos 'proyecto_stock'
--

CREATE SCHEMA IF NOT EXISTS `proyecto_stock` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_stock` ;

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `codigo_area` varchar(10) NOT NULL,
  `nombre_area` varchar(45) NOT NULL,
  `codigo_sede` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`codigo_area`, `nombre_area`, `codigo_sede`) VALUES
('1', 'Patio', '7'),
('1111', 'aaaaa', '1'),
('131331', '31313', '1'),
('AA023', 'Biblioteca', '1'),
('AAA111', 'NADA', '19'),
('juaquin', 'juaquin', '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `codigo_bodega` varchar(10) NOT NULL,
  `volumen_bodega` int(11) NOT NULL,
  `ubicacion_bodega` varchar(45) NOT NULL,
  `codigo_centro_costo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`codigo_bodega`, `volumen_bodega`, `ubicacion_bodega`, `codigo_centro_costo`) VALUES
('1', 5, 'Duoc Antonio Varas', 'ADF515'),
('AA18', 50, 'Subterraneo', 'AA102'),
('AFD218', 1000, 'Duoc Antonio Varas', 'AF103'),
('AH220', 95, '5to piso', 'ADF515'),
('BOD512', 150, 'Antonio Varas 666', 'AF103');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costo`
--

CREATE TABLE `centro_costo` (
  `codigo_centro_costo` varchar(10) NOT NULL,
  `nombre_centro_costo` varchar(100) NOT NULL,
  `fecha_compra_centro_costo` date ,
  `totalGasto_centro_costo` int(11) ,
  `codigo_area` varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centro_costo`
--

INSERT INTO `centro_costo` (`codigo_centro_costo`, `nombre_centro_costo`, `fecha_compra_centro_costo`, `totalGasto_centro_costo`, `codigo_area`) VALUES
('123123', 'Centro de ASDAD', '2020-10-29', 12313123, '1'),
('31321', '123213', '2020-10-19', 1233, 'juaquin'),
('AA102', 'Area Administrativa', '2020-10-14', 50000, '1'),
('ADF515', 'Área RR.HH.', '2020-10-21', 100000, 'juaquin'),
('AF103', 'Area Financiera', '2020-09-09', 50000, '1'),
('ARD218', 'Ovalle', '2020-10-19', 500000, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto`
--

CREATE TABLE `detalle_producto` (
  `id_detalle_producto` int(11) NOT NULL,
  `rut_proveedor` varchar(15) NOT NULL,
  `id_producto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(6, 'Agregar Producto', 'RegistroProducto.jsp', 5),
(7, 'Listar Productos', 'ListaProducto.jsp',    5),
(8, 'Carga Masiva de Productos', 'CargaMasivaProducto.jsp',5),
(9, 'Proveedor', '', NULL),
(10, 'Agregar Proveedor', 'RegistroProveedor.jsp', 9),
(11, 'Lista Proveedores', 'ListaProveedor.jsp',    9),
(12, 'Centro de Costos', '', NULL),
(13, 'Agregar Centro', 'RegistroCentroDeCosto.jsp',             12),
(14, 'Listar Centro de Costos', 'ListaCentroDeCosto.jsp',       12),
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
  `id_producto` varchar(10) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(500) DEFAULT NULL,
  `estado_producto` varchar(20) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `valorNeto_producto` int(11) NOT NULL,
  `valorIva_producto` int(11) NOT NULL DEFAULT 19,
  `valorTotal_producto` int(11) NOT NULL,
  `marca_producto` varchar(45) NOT NULL,
  `serial_producto` varchar(45) NOT NULL,
  `stock_minimo_producto` int(11) NOT NULL,
  `fecha_ingreso_producto` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_salida_producto` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_capital_producto` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_vencimiento_producto` datetime NOT NULL DEFAULT current_timestamp(),
  `codigo_activo_producto` int(11) DEFAULT NULL,
  `numero_orden_compra` int(10) NOT NULL,
  `codigo_bodega` varchar(10) NOT NULL,
  `id_tipo_producto` int(11) NOT NULL,
  `id_tipo_unidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `descripcion_producto`, `estado_producto`, `cantidad_producto`, `valorNeto_producto`, `valorIva_producto`, `valorTotal_producto`, `marca_producto`, `serial_producto`, `stock_minimo_producto`, `fecha_ingreso_producto`, `fecha_salida_producto`, `fecha_capital_producto`, `codigo_activo_producto`, `codigo_bodega`, `id_tipo_producto`, `id_tipo_unidad`, `fecha_vencimiento_producto`, `numero_orden_compra`) VALUES
('0001', 'Jabon', 'Jabon para Baños', 'Stock', 10, 690, 821, 8210, 'Le Sancy', '00002', 10, '2020-10-28 00:00:00', '2020-10-28 00:00:00', '2020-10-28 00:00:00', 3, '1', 7, 13, '2020-11-16 10:21:21', 0),
('0002', 'Arroz', 'Arroz para comer', 'Reponer Stock', 1, 890, 1059, 1059, 'Tucapel', '23123', 5, '2020-10-21 00:00:00', '2020-10-21 00:00:00', '2020-10-21 00:00:00', 123213, '1', 9, 1, '2020-11-16 10:21:21', 0),
('001005', 'Mouse', 'Reacondicionados', 'Reponer Stock', 20, 3600, 4284, 85680, 'hp', '001004', 50, '2020-11-16 00:00:00', '2020-11-18 00:00:00', '2020-11-22 00:00:00', 81881, '1', 8, 1, '2020-11-29 00:00:00', 3005),
('0022', 'Tallarines', 'Numero 78', 'Stock', 22, 650, 774, 17028, 'Carozzi', '332200', 1, '2020-11-16 00:00:00', '2020-11-17 00:00:00', '2020-11-19 00:00:00', 552255, '1', 9, 1, '2020-11-16 10:21:21', 0),
('12313', 'Editado', 'edit', 'Reponer Stock', 10, 12313, 14652, 146520, '123213', '23213', 21321313, '2020-10-14 00:00:00', '2020-10-14 00:00:00', '2020-10-14 00:00:00', 12211231, 'BOD512', 7, 1, '2020-11-16 00:00:00', 44444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `rut_proveedor` varchar(15) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `razonSocial_proveedor` varchar(50) NOT NULL,
  `correo_proveedor` varchar(45) DEFAULT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `fono_proveedor` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`rut_proveedor`, `nombre_proveedor`, `razonSocial_proveedor`, `correo_proveedor`, `direccion_proveedor`, `fono_proveedor`) VALUES
('195655383', 'felipe', 'felipe s.a', 'Santiago@santiago.cl', 'santiagooooo', '45093332');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `codigo_sede` varchar(10) NOT NULL,
  `nombre_sede` varchar(100) NOT NULL,
  `direccion_sede` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`codigo_sede`, `nombre_sede`, `direccion_sede`) VALUES
('1', 'Sede Antonio Varas', 'Antonio Varas 666, Providencia.'),
('10', 'Sede Plaza Vespucio', 'Froilán Roa 7107, Mall Plaza Vespucio, La Florida.'),
('11', 'Sede Puente Alto', 'Av. Concha y Toro 1340 c/San Carlos, Puente Alto.'),
('12', 'Sede San Bernardo', 'Freire 857, San Bernardo.'),
('13', 'Sede San Carlos de Apoquindo', 'Camino El Alba 12881, Las Condes.'),
('14', 'Sede San Joaquín', 'Av. Vicuña Mackenna 4917, Metro San Joaquín, San Joaquín.'),
('15', 'Sede Valparaíso', 'Av. Brasil 2021, esquina Rodríguez, Valparaíso.'),
('16', 'Sede Viña del Mar', 'Álvarez 2366, Chorrillos, Viña del Mar.'),
('17', 'Campus Arauco', 'Camino a Carampangue N° 1060, Arauco.'),
('18', 'Sede San Andrés de Concepción', 'Paicaví 3280 (Sector Rotonda El Trébol), Concepción.'),
('19', 'Campus Villarrica', 'Anfión Muñoz 51, Villarrica.'),
('2', 'Sede Alameda', ' Av. España 8, Santiago Centro, Metro Estación República (esquina Alameda).'),
('20', 'Sede Puerto Montt Egaña', '651, Puerto Montt.'),
('4', 'Sede Educación Continua', 'Miguel Claro 337, Providencia, Santiago.'),
('5', 'Sede Maipú', ' Av. Esquina Blanca 501, Maipú.'),
('6', 'Sede Melipilla', 'Serrano 1105, Melipilla.'),
('7', 'Sede Padre Alonso de Ovalle', ' Padre Alonso de Ovalle 1586, Santiago Centro'),
('8', 'Sede Plaza Norte', 'Calle Nueva 1660, Huechuraba.'),
('9', 'Sede Plaza Oeste', 'Av. Américo Vespucio 1501, Mall Plaza Oeste, ');

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
-- Estructura de tabla para la tabla `tipo_ubicacion`
--

CREATE TABLE `tipo_ubicacion` (
  `id_tipo_ubicacion` int(11) NOT NULL,
  `nombre_tipo_ubicacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_ubicacion`
--

INSERT INTO `tipo_ubicacion` (`id_tipo_ubicacion`, `nombre_tipo_ubicacion`) VALUES
(1, 'Laboratorio'),
(2, 'Sala'),
(4, 'Biblioteca'),
(5, 'Casino'),
(6, 'Patio'),
(7, 'Baño'),
(8, 'Ascensor'),
(9, 'Camarin'),
(10, 'Bodega'),
(11, 'Cancha'),
(12, 'Escalera');

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
  `codigo_ubicacion` varchar(10) NOT NULL,
  `descripcion_ubicacion` varchar(500) DEFAULT NULL,
  `codigo_area` varchar(10) NOT NULL,
  `id_tipo_ubicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`codigo_ubicacion`, `descripcion_ubicacion`, `codigo_area`, `id_tipo_ubicacion`) VALUES
('3123', 'adasd', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `rut_usuario` varchar(15) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password_usuario` varchar(45) NOT NULL,
  `ape_paterno_usuario` varchar(45) NOT NULL,
  `ape_materno_usuario` varchar(45) NOT NULL,
  `celular_usuario` varchar(15) NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `direccion_usuario` varchar(45) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `codigo_centro_costo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`rut_usuario`, `nombre_usuario`, `password_usuario`, `ape_paterno_usuario`, `ape_materno_usuario`, `celular_usuario`, `correo_usuario`, `direccion_usuario`, `id_tipo_usuario`, `codigo_centro_costo`) VALUES
('10.000.000-0', 'Felipe', '1234', 'Zapata', 'Soto', '971239234', 'fe.zapatas@alumnos.duoc.cl', 'El Valle 01300', 2, 'AA102'),
('19.517.540-3','Sebastian','123','Bray','Hernandez','973647399','s.bray@alumnos.duoc.cl','Chipre 1279',2,'AA102'),
('16.000.000-0', 'Diego', '1234', 'Conejeros', 'Perez', '987598076', 'diego.conejeros03@gmail.com', 'Isla Snag 175', 2, 'AA102'),
('8.888.888-8', 'Jose', '1234', 'Quiroz', 'Mamani', '999514531', 'jose.quirozm@alumnos.duoc.cl', 'Las Condes #1060', 2, 'AA102'),
('admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin@admin.cl', 'admin', 1, 'AF103'),
('admin2', 'admin2', 'admin2', 'admin2', 'admin2', 'admin2', 'admin2@admin2.cl', 'admin2', 1, 'AF103'),
('operador', 'operador', 'operador', 'operador', 'operador', 'operador', 'operador@operador.cl', 'operador', 2, 'AA102');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`codigo_area`),
  ADD KEY `fk_Area_Sede_idx` (`codigo_sede`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`codigo_bodega`),
  ADD KEY `fk_Bodega_Centro_Costo_idx` (`codigo_centro_costo`);

--
-- Indices de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD PRIMARY KEY (`codigo_centro_costo`),
  ADD KEY `fk_Centro_Costo_Area_idx` (`codigo_area`);

--
-- Indices de la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD PRIMARY KEY (`id_detalle_producto`),
  ADD KEY `fk_Detalle_Producto_Proveedor_idx` (`rut_proveedor`),
  ADD KEY `fk_Detalle_Producto_Producto_idx` (`id_producto`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_Menu_Menu_idx` (`id_menu_padre`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_Producto_Tipo_Producto_idx` (`id_tipo_producto`),
  ADD KEY `fk_Producto_Bodega_idx` (`codigo_bodega`),
  ADD KEY `fk_Producto_Tipo_Unidad_idx` (`id_tipo_unidad`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`rut_proveedor`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`codigo_sede`);

--
-- Indices de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD KEY `fk_Tipo_Menu_Menu_idx` (`id_menu`),
  ADD KEY `fk_Tipo_Menu_Tipo_Usuario_idx` (`id_tipo_usuario`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `tipo_ubicacion`
--
ALTER TABLE `tipo_ubicacion`
  ADD PRIMARY KEY (`id_tipo_ubicacion`);

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
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`codigo_ubicacion`),
  ADD KEY `fk_Ubicacion_Area_idx` (`codigo_area`),
  ADD KEY `fk_Ubicacion_Tipo_Ubicacion_idx` (`id_tipo_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rut_usuario`),
  ADD KEY `fk_Usuario_Tipo_Usuario_idx` (`id_tipo_usuario`),
  ADD KEY `fk_Usuario_Centro_Costo_idx` (`codigo_centro_costo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  MODIFY `id_detalle_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  MODIFY `id_tipo_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_ubicacion`
--
ALTER TABLE `tipo_ubicacion`
  MODIFY `id_tipo_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  MODIFY `id_tipo_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `fk_Area_Sede1` FOREIGN KEY (`codigo_sede`) REFERENCES `sede` (`codigo_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `fk_Bodega_Centro_Costo1` FOREIGN KEY (`codigo_centro_costo`) REFERENCES `centro_costo` (`codigo_centro_costo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD CONSTRAINT `fk_Centro_Costo_Area1` FOREIGN KEY (`codigo_area`) REFERENCES `area` (`codigo_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_producto`
--
ALTER TABLE `detalle_producto`
  ADD CONSTRAINT `fk_Detalle_Producto_Producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalle_Producto_Proveedor1` FOREIGN KEY (`rut_proveedor`) REFERENCES `proveedor` (`rut_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_Menu_Menu1` FOREIGN KEY (`id_menu_padre`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Bodega1` FOREIGN KEY (`codigo_bodega`) REFERENCES `bodega` (`codigo_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Producto1` FOREIGN KEY (`id_tipo_producto`) REFERENCES `tipo_producto` (`id_tipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Unidad1` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `tipo_unidad` (`id_tipo_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD CONSTRAINT `fk_Tipo_Menu_Menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tipo_Menu_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `fk_Ubicacion_Area` FOREIGN KEY (`codigo_area`) REFERENCES `area` (`codigo_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ubicacion_Tipo_Ubicacion` FOREIGN KEY (`id_tipo_ubicacion`) REFERENCES `tipo_ubicacion` (`id_tipo_ubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Centro_Costo1` FOREIGN KEY (`codigo_centro_costo`) REFERENCES `centro_costo` (`codigo_centro_costo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
