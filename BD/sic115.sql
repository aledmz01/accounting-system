-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2026 a las 01:58:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sic115`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `reiniciar_saldos` ()   BEGIN
		update subcuentas set saldo_debe=0.00, saldo_haber=0.00;
		update cuentas set saldo_debe=0.00, saldo_haber=0.00;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_clasificaciones`
--

CREATE TABLE `catalogo_clasificaciones` (
  `codigo_clasificacion` int(11) NOT NULL,
  `nombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `catalogo_clasificaciones`
--

INSERT INTO `catalogo_clasificaciones` (`codigo_clasificacion`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Pasivo'),
(3, 'Capital'),
(4, 'Resultado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_cuentas`
--

CREATE TABLE `catalogo_cuentas` (
  `codigo_cuenta` varchar(20) NOT NULL,
  `naturaleza` varchar(20) NOT NULL,
  `subgrupo` varchar(10) NOT NULL,
  `nombre_cuenta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `catalogo_cuentas`
--

INSERT INTO `catalogo_cuentas` (`codigo_cuenta`, `naturaleza`, `subgrupo`, `nombre_cuenta`) VALUES
('1.2.1.1', 'activo', '1.2.1', 'Materiales Directos'),
('1.2.1.2', 'activo', '1.2.1', 'Materiales Indirectos'),
('1.2.2.1', 'activo', '1.2.2', 'Botellas de Vino de Naranja'),
('1.2.2.2', 'activo', '1.2.2', 'Botellas de Vino de Mandarina'),
('1.2.2.3', 'activo', '1.2.2', 'Botellas de Vino de Piña'),
('1.2.2.4', 'activo', '1.2.2', 'Botellas de Vino de Marañón'),
('1.2.2.5', 'activo', '1.2.2', 'Botellas de Vino de Coco'),
('1.2.2.6', 'activo', '1.2.2', 'Botellas de Vino de Rosa de Jamaica'),
('4.1.1.1', 'resultado', '4.1.1', 'Mano de Obra Directa'),
('4.1.1.2', 'resultado', '4.1.1', 'Costo de Materias Primas'),
('4.1.2.1', 'resultado', '4.1.2', 'Sueldos y Salarios'),
('4.1.2.2', 'resultado', '4.1.2', 'Prestaciones Laborales'),
('4.1.2.3', 'resultado', '4.1.2', 'Servicios Médicos'),
('4.1.3.1', 'resultado', '4.1.3', 'Luz'),
('4.1.3.2', 'resultado', '4.1.3', 'Teléfono'),
('4.1.3.3', 'resultado', '4.1.3', 'Agua'),
('4.1.3.4', 'resultado', '4.1.3', 'Internet'),
('4.1.4.1', 'resultado', '4.1.4', 'Depreciación de bienes Muebles'),
('4.1.4.2', 'resultado', '4.1.4', 'Depreciación de Maquinaria y equipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_subgrupos`
--

CREATE TABLE `catalogo_subgrupos` (
  `codigo_subgrupo` varchar(20) NOT NULL,
  `naturaleza` varchar(15) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `nombre_subgrupo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `catalogo_subgrupos`
--

INSERT INTO `catalogo_subgrupos` (`codigo_subgrupo`, `naturaleza`, `grupo`, `nombre_subgrupo`) VALUES
('1.1.1', 'activo', '1.1', 'Efectivo en Caja'),
('1.2.1', 'activo', '1.2', 'Materia Prima'),
('1.2.2', 'activo', '1.2', 'Producto Terminado'),
('1.3.1', 'activo', '1.3', 'Edificio'),
('1.3.2', 'activo', '1.3', 'Maquinaria'),
('1.3.3', 'activo', '1.3', 'Inventario'),
('1.3.4', 'activo', '1.3', 'Automóviles'),
('2.1.1', 'pasivo', '2.1', 'Proveedores'),
('2.1.2', 'pasivo', '2.1', 'Pasivos a Largo plazo'),
('4.1.1', 'resultado', '4.1', 'Costos de Producción'),
('4.1.2', 'resultado', '4.1', 'Gastos de Administración'),
('4.1.3', 'resultado', '4.1', 'Costos Indirectos'),
('4.1.4', 'resultado', '4.1', 'Depreciación'),
('4.2.1', 'resultado', '4.2', 'Ingresos por Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaciones`
--

CREATE TABLE `clasificaciones` (
  `codigo_clasificacion` int(11) NOT NULL,
  `nombre_clasificacion` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `clasificaciones`
--

INSERT INTO `clasificaciones` (`codigo_clasificacion`, `nombre_clasificacion`) VALUES
(1, 'Activo'),
(2, 'Pasivo'),
(3, 'Capital'),
(4, 'Resultado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `tipo_pago` enum('CONTADO','CREDITO') NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compra`, `fecha`, `concepto`, `tipo_pago`, `subtotal`, `total`) VALUES
(1, '2026-06-14', 'Compra de leche', 'CONTADO', 3.60, 3.60),
(2, '2026-06-14', 'Compra de ARROZ', 'CREDITO', 2.25, 2.25),
(3, '2026-06-14', 'Compra de mercadería', 'CONTADO', 3.15, 3.15),
(4, '2026-06-15', 'Compra de mercadería', 'CONTADO', 45.00, 45.00),
(5, '2026-06-15', 'Compra de mercadería', 'CONTADO', 110.00, 110.00),
(6, '2026-06-15', 'Compra de mercadería', 'CREDITO', 1.80, 1.80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `codigo_cuenta` varchar(20) NOT NULL,
  `subgrupo` varchar(20) DEFAULT NULL,
  `nombre_cuenta` varchar(50) NOT NULL,
  `tiene_subcuenta` enum('Si','No') NOT NULL,
  `descripcion_cuenta` varchar(255) DEFAULT NULL,
  `saldo_debe` double NOT NULL,
  `saldo_haber` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`codigo_cuenta`, `subgrupo`, `nombre_cuenta`, `tiene_subcuenta`, `descripcion_cuenta`, `saldo_debe`, `saldo_haber`) VALUES
('1.1', NULL, 'Caja', 'No', NULL, 117.6, 110),
('1.2', NULL, 'Banco', 'No', NULL, 0, 0),
('1.3', NULL, 'Inventario de mercadería', 'No', NULL, 111.8, 73.45000000000002),
('1.4', NULL, 'Mobiliario y equipos', 'No', NULL, 0, 0),
('1.5', NULL, 'Cuentas por cobrar', 'No', NULL, 2.7, 0),
('2.1', NULL, 'Proveedores', 'No', NULL, 0, 1.8),
('2.2', NULL, 'Préstamo bancario', 'No', NULL, 0, 0),
('3.1', NULL, 'Capital social', 'No', NULL, 0, 0),
('4.1', NULL, 'Ventas', 'No', NULL, 0, 120.3),
('5.1', NULL, 'Costo de ventas', 'No', NULL, 73.45000000000002, 0),
('5.2', NULL, 'Gastos administrativos', 'No', NULL, 0, 0);

--
-- Disparadores `cuentas`
--
DELIMITER $$
CREATE TRIGGER `log_delete_cuentas` AFTER DELETE ON `cuentas` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) 
		VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se eliminó un registro en la tabla cuentas. El registro eliminado es:',old.codigo_cuenta), USER(), CURRENT_USER());
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_insert_cuentas` AFTER INSERT ON `cuentas` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) 
		VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se insertó un nuevo registro en la tabla cuentas. El valor es:',new.codigo_cuenta), USER(), CURRENT_USER());
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_cuentas` AFTER UPDATE ON `cuentas` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) 
		VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se modificó un registro en la tabla cuentas.'), USER(), CURRENT_USER());
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id_detalle` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id_detalle`, `id_compra`, `id_inventario`, `cantidad`, `costo_unitario`, `subtotal`) VALUES
(1, 1, 3, 4, 0.90, 3.60),
(2, 2, 4, 3, 0.75, 2.25),
(3, 3, 1, 5, 0.50, 2.50),
(4, 3, 5, 1, 0.65, 0.65),
(5, 4, 7, 100, 0.45, 45.00),
(6, 5, 6, 200, 0.55, 110.00),
(7, 6, 7, 4, 0.45, 1.80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `id_inventario`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 7, 5, 3, 1.10, 3.30),
(2, 7, 8, 5, 1.80, 9.00),
(3, 8, 5, 3, 1.10, 3.30),
(4, 8, 8, 2, 1.80, 3.60),
(5, 9, 6, 2, 0.90, 1.80),
(6, 9, 8, 3, 1.80, 5.40),
(7, 10, 2, 5, 0.95, 4.75),
(8, 10, 9, 2, 1.20, 2.40),
(9, 11, 6, 2, 0.90, 1.80),
(10, 11, 9, 2, 1.20, 2.40),
(11, 12, 3, 2, 1.50, 3.00),
(12, 12, 8, 2, 1.80, 3.60),
(13, 13, 3, 2, 1.50, 3.00),
(14, 13, 8, 2, 1.80, 3.60),
(15, 14, 2, 3, 0.95, 2.85),
(16, 14, 1, 2, 1.00, 2.00),
(17, 15, 1, 5, 1.00, 5.00),
(18, 16, 1, 9, 1.00, 9.00),
(19, 17, 3, 3, 1.50, 4.50),
(20, 18, 7, 50, 0.75, 37.50),
(21, 19, 7, 1, 0.75, 0.75),
(22, 20, 6, 124, 0.90, 111.60),
(23, 21, 6, 3, 0.90, 2.70),
(24, 22, 7, 7, 0.75, 5.25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `codigo_grupo` varchar(10) NOT NULL,
  `nombre_grupo` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`codigo_grupo`, `nombre_grupo`, `descripcion`, `clasificacion`) VALUES
('1.1', 'Activo Circulante', NULL, 1),
('1.2', 'Inventarios', NULL, 1),
('1.3', 'Activo Fijo', NULL, 1),
('1.4', 'Depreciacion Acumulada', NULL, 1),
('2.1', 'Cuentas por Pagar', NULL, 2),
('3.1', 'Capital Social', NULL, 3),
('3.2', 'Capital', 'capital', 3),
('4.1', 'Costos', NULL, 4),
('4.2', 'Ingresos', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` decimal(8,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(8,2) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `nombre`, `cantidad`, `costo`, `precio`, `activo`) VALUES
(1, 'Coca Cola 600ml', 0, 0.50, 1.00, 1),
(2, 'Pepsi 600ml', 0, 0.55, 0.95, 1),
(3, 'Leche Entera', 0, 0.90, 1.50, 1),
(4, 'Arroz 1kg', 0, 0.75, 1.35, 0),
(5, 'Azucar 1kg', 0, 0.65, 1.10, 0),
(6, 'Frijoles 1lb', 73, 0.55, 0.90, 1),
(7, 'Galletas Oreo', 46, 0.45, 0.75, 1),
(8, 'Pan de Molde', 0, 1.20, 1.80, 1),
(9, 'Jugo Del Valle', 0, 0.70, 1.20, 1),
(13, 'churros', 0, 0.00, 0.15, 1),
(14, 'soda', 0, 0.00, 1.10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mayor`
--

CREATE TABLE `mayor` (
  `id` int(11) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `debe` double NOT NULL,
  `haber` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `transaccion` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `cuenta` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `concepto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `debe` decimal(18,2) DEFAULT NULL,
  `haber` decimal(18,2) DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `partida_doble` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `justificante` varchar(30) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_creacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `usuario_modif` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `fecha`, `transaccion`, `tipo`, `cuenta`, `concepto`, `debe`, `haber`, `descripcion`, `partida_doble`, `justificante`, `fecha_modificacion`, `usuario_creacion`, `usuario_modif`, `ip`) VALUES
(17, '2026-06-14', 3, 'VENTA', '1.1', 'Venta de producto', 7.50, 0.00, 'Ingreso por venta', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(18, '2026-06-14', 3, 'VENTA', '4.1', 'Venta de producto', 0.00, 7.50, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(19, '2026-06-14', 4, 'VENTA', '5.1', 'Costo de venta', 7.50, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(20, '2026-06-14', 4, 'VENTA', '1.3', 'Salida de inventario', 0.00, 7.50, 'Disminución de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(21, '2026-06-14', 5, 'VENTA', '1.5', 'Venta de productos diarios', 12.30, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(22, '2026-06-14', 5, 'VENTA', '4.1', 'Venta de productos diarios', 0.00, 12.30, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(23, '2026-06-14', 5, 'VENTA', '5.1', 'Venta de productos diarios', 0.00, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(24, '2026-06-14', 5, 'VENTA', '1.3', 'Venta de productos diarios', 0.00, 0.00, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(25, '2026-06-14', 6, 'VENTA', '1.1', 'Venta de productos de uso diario', 6.90, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(26, '2026-06-14', 6, 'VENTA', '4.1', 'Venta de productos de uso diario', 0.00, 6.90, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(27, '2026-06-14', 6, 'VENTA', '5.1', 'Venta de productos de uso diario', 0.00, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(28, '2026-06-14', 6, 'VENTA', '1.3', 'Venta de productos de uso diario', 0.00, 0.00, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(29, '2026-06-14', 7, 'VENTA', '1.1', 'Venta de mercadería', 7.20, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(30, '2026-06-14', 7, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 7.20, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(31, '2026-06-14', 7, 'VENTA', '5.1', 'Venta de mercadería', 15.50, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(32, '2026-06-14', 7, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 15.50, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(33, '2026-06-14', 8, 'VENTA', '1.5', 'Venta de productos de limpieza', 7.15, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(34, '2026-06-14', 8, 'VENTA', '4.1', 'Venta de productos de limpieza', 0.00, 7.15, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(35, '2026-06-14', 8, 'VENTA', '5.1', 'Venta de productos de limpieza', 15.50, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(36, '2026-06-14', 8, 'VENTA', '1.3', 'Venta de productos de limpieza', 0.00, 15.50, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(37, '2026-06-14', 9, 'VENTA', '1.1', 'Venta de snacks', 4.20, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(38, '2026-06-14', 9, 'VENTA', '4.1', 'Venta de snacks', 0.00, 4.20, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(39, '2026-06-14', 9, 'VENTA', '5.1', 'Venta de snacks', 19.00, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(40, '2026-06-14', 9, 'VENTA', '1.3', 'Venta de snacks', 0.00, 19.00, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(41, '2026-06-14', 10, 'VENTA', '1.5', 'Venta de golosinas', 6.60, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(42, '2026-06-14', 10, 'VENTA', '4.1', 'Venta de golosinas', 0.00, 6.60, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(43, '2026-06-14', 10, 'VENTA', '5.1', 'Venta de golosinas', 9.00, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(44, '2026-06-14', 10, 'VENTA', '1.3', 'Venta de golosinas', 0.00, 9.00, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(45, '2026-06-14', 11, 'VENTA', '1.1', 'Venta de productos basicos', 6.60, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(46, '2026-06-14', 11, 'VENTA', '4.1', 'Venta de productos basicos', 0.00, 6.60, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(47, '2026-06-14', 11, 'VENTA', '5.1', 'Venta de productos basicos', 4.20, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(48, '2026-06-14', 11, 'VENTA', '1.3', 'Venta de productos basicos', 0.00, 4.20, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(49, '2026-06-14', 12, 'VENTA', '1.5', 'Venta de bebidas gaseosas', 4.85, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(50, '2026-06-14', 12, 'VENTA', '4.1', 'Venta de bebidas gaseosas', 0.00, 4.85, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(51, '2026-06-14', 12, 'VENTA', '5.1', 'Venta de bebidas gaseosas', 2.85, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(52, '2026-06-14', 12, 'VENTA', '1.3', 'Venta de bebidas gaseosas', 0.00, 2.85, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(53, '2026-06-14', 13, 'COMPRA', '1.3', 'Compra de leche', 3.60, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(54, '2026-06-14', 13, 'COMPRA', '1.1', 'Compra de leche', 0.00, 3.60, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(55, '2026-06-14', 14, 'COMPRA', '1.3', 'Compra de ARROZ', 2.25, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(56, '2026-06-14', 14, 'COMPRA', '2.1', 'Compra de ARROZ', 0.00, 2.25, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(57, '2026-06-14', 15, 'VENTA', '1.1', 'Venta de mercadería', 5.00, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(58, '2026-06-14', 15, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 5.00, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(59, '2026-06-14', 15, 'VENTA', '5.1', 'Venta de mercadería', 3.00, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(60, '2026-06-14', 15, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 3.00, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(61, '2026-06-14', 16, 'VENTA', '1.1', 'Venta de mercadería', 9.00, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(62, '2026-06-14', 16, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 9.00, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(63, '2026-06-14', 16, 'VENTA', '5.1', 'Venta de mercadería', 5.40, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(64, '2026-06-14', 16, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 5.40, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(65, '2026-06-14', 17, 'COMPRA', '1.3', 'Compra de mercadería', 3.15, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(66, '2026-06-14', 17, 'COMPRA', '1.1', 'Compra de mercadería', 0.00, 3.15, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(67, '2026-06-15', 18, 'VENTA', '1.5', 'Venta de mercadería', 4.50, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(68, '2026-06-15', 18, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 4.50, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(69, '2026-06-15', 18, 'VENTA', '5.1', 'Venta de mercadería', 2.70, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(70, '2026-06-15', 18, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 2.70, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(71, '2026-06-15', 19, 'COMPRA', '1.3', 'Compra de mercadería', 45.00, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(72, '2026-06-15', 19, 'COMPRA', '1.1', 'Compra de mercadería', 0.00, 45.00, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(73, '2026-06-15', 20, 'VENTA', '1.1', 'Venta de mercadería', 37.50, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(74, '2026-06-15', 20, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 37.50, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(75, '2026-06-15', 20, 'VENTA', '5.1', 'Venta de mercadería', 22.50, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(76, '2026-06-15', 20, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 22.50, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(77, '2026-06-15', 21, 'VENTA', '1.1', 'Venta de mercadería', 0.75, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(78, '2026-06-15', 21, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 0.75, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(79, '2026-06-15', 21, 'VENTA', '5.1', 'Venta de mercadería', 0.45, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(80, '2026-06-15', 21, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 0.45, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(81, '2026-06-15', 22, 'COMPRA', '1.3', 'Compra de mercadería', 110.00, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(82, '2026-06-15', 22, 'COMPRA', '1.1', 'Compra de mercadería', 0.00, 110.00, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(83, '2026-06-15', 23, 'VENTA', '1.1', 'Venta de mercadería', 111.60, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(84, '2026-06-15', 23, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 111.60, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(85, '2026-06-15', 23, 'VENTA', '5.1', 'Venta de mercadería', 68.20, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(86, '2026-06-15', 23, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 68.20, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(87, '2026-06-15', 24, 'VENTA', '1.5', 'Venta de mercadería', 2.70, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(88, '2026-06-15', 24, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 2.70, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(89, '2026-06-15', 24, 'VENTA', '5.1', 'Venta de mercadería', 1.65, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(90, '2026-06-15', 24, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 1.65, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(91, '2026-06-15', 25, 'COMPRA', '1.3', 'Compra de mercadería', 1.80, 0.00, 'Ingreso de mercadería', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(92, '2026-06-15', 25, 'COMPRA', '2.1', 'Compra de mercadería', 0.00, 1.80, 'Registro de compra', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(93, '2026-06-15', 26, 'VENTA', '1.1', 'Venta de mercadería', 5.25, 0.00, 'Venta registrada', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(94, '2026-06-15', 26, 'VENTA', '4.1', 'Venta de mercadería', 0.00, 5.25, 'Ingreso por ventas', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(95, '2026-06-15', 26, 'VENTA', '5.1', 'Venta de mercadería', 3.15, 0.00, 'Costo de mercadería vendida', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(96, '2026-06-15', 26, 'VENTA', '1.3', 'Venta de mercadería', 0.00, 3.15, 'Salida de inventario', NULL, NULL, NULL, 'administrador', NULL, '::1');

--
-- Disparadores `registro`
--
DELIMITER $$
CREATE TRIGGER `log_delete_registro` AFTER DELETE ON `registro` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se eliminó un registro en la tabla registro.'), USER(), CURRENT_USER());
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_insert_registro` AFTER INSERT ON `registro` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se insertó un nuevo registro en la tabla registro.'), USER(), CURRENT_USER());
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_registro` AFTER UPDATE ON `registro` FOR EACH ROW BEGIN
		INSERT INTO `sic115`.`security_log` (`fecha`, `evento`, `user`, `ip`) VALUES (CONCAT_WS(' ',CURDATE(), CURTIME()), CONCAT_WS(' ','Se actualizó un registro en la tabla registro.'), USER(), CURRENT_USER());
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `security_log`
--

CREATE TABLE `security_log` (
  `id_evento` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `evento` varchar(255) NOT NULL,
  `user` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `security_log`
--

INSERT INTO `security_log` (`id_evento`, `fecha`, `evento`, `user`, `ip`) VALUES
(1, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(2, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(3, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(4, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(5, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(6, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(7, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(8, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(9, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(10, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(11, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(12, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(13, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(14, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(15, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(16, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(17, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(18, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(19, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(20, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(21, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(22, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(23, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(24, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(25, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(26, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(27, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(28, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(29, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(30, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(31, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(32, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(33, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(34, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(35, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(36, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(37, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(38, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(39, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(40, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(41, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(42, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(43, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(44, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(45, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(46, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(47, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(48, '2026-06-11 18:48:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(49, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(50, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(51, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(52, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(53, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(54, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(55, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(56, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(57, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(58, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(59, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(60, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(61, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(62, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(63, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(64, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(65, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(66, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(67, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(68, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(69, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(70, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(71, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(72, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(73, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(74, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(75, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(76, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(77, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(78, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(79, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(80, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(81, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(82, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(83, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(84, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(85, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(86, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(87, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(88, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(89, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(90, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(91, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(92, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(93, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(94, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(95, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(96, '2026-06-11 18:53:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(97, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(98, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(99, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(100, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(101, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(102, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(103, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(104, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(105, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(106, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(107, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(108, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(109, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(110, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(111, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(112, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(113, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(114, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(115, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(116, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(117, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(118, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(119, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(120, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(121, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(122, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(123, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(124, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(125, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(126, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(127, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(128, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(129, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(130, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(131, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(132, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(133, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(134, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(135, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(136, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(137, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(138, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(139, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(140, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(141, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(142, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(143, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(144, '2026-06-13 19:20:55', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(145, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(146, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(147, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(148, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(149, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(150, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(151, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(152, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(153, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(154, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(155, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(156, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(157, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(158, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(159, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(160, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(161, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(162, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(163, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(164, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(165, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(166, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(167, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(168, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(169, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(170, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(171, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(172, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(173, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(174, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(175, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(176, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(177, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(178, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(179, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(180, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(181, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(182, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(183, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(184, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(185, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(186, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(187, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(188, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(189, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(190, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(191, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(192, '2026-06-13 19:58:51', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(193, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(194, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(195, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(196, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(197, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(198, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(199, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(200, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(201, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(202, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(203, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(204, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(205, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(206, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(207, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(208, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(209, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(210, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(211, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(212, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(213, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(214, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(215, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(216, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(217, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(218, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(219, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(220, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(221, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(222, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(223, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(224, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(225, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(226, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(227, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(228, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(229, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(230, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(231, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(232, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(233, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(234, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(235, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(236, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(237, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(238, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(239, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(240, '2026-06-13 20:08:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(241, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(242, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(243, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(244, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(245, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(246, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(247, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(248, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(249, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(250, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(251, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(252, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(253, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(254, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(255, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(256, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(257, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(258, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(259, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(260, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(261, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(262, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(263, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(264, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(265, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(266, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(267, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(268, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(269, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(270, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(271, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(272, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(273, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(274, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(275, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(276, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(277, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(278, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(279, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(280, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(281, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(282, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(283, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(284, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(285, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(286, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(287, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(288, '2026-06-13 20:24:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(289, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(290, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(291, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(292, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(293, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(294, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(295, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(296, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(297, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(298, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(299, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(300, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(301, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(302, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(303, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(304, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(305, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(306, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(307, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(308, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(309, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(310, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(311, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(312, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(313, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(314, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(315, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(316, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(317, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(318, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(319, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(320, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(321, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(322, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(323, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(324, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(325, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(326, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(327, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(328, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(329, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(330, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(331, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(332, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(333, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(334, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(335, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(336, '2026-06-13 20:27:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(337, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(338, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(339, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(340, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(341, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(342, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(343, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(344, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(345, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(346, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(347, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(348, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(349, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(350, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(351, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(352, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(353, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(354, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(355, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(356, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(357, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(358, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(359, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(360, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(361, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(362, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(363, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(364, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(365, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(366, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(367, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(368, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(369, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(370, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(371, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(372, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(373, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(374, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(375, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(376, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(377, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(378, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(379, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(380, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(381, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(382, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(383, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(384, '2026-06-13 20:37:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(385, '2026-06-13 20:47:58', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.1.1.1', 'root@localhost', 'root@localhost'),
(386, '2026-06-13 20:48:25', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.1', 'root@localhost', 'root@localhost'),
(387, '2026-06-13 20:48:28', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.2', 'root@localhost', 'root@localhost'),
(388, '2026-06-13 20:48:34', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.3', 'root@localhost', 'root@localhost'),
(389, '2026-06-13 20:48:37', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.4', 'root@localhost', 'root@localhost'),
(390, '2026-06-13 20:48:38', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.5', 'root@localhost', 'root@localhost'),
(391, '2026-06-13 20:48:41', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.2.6', 'root@localhost', 'root@localhost'),
(392, '2026-06-13 20:48:43', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.3.2.1', 'root@localhost', 'root@localhost'),
(393, '2026-06-13 20:48:45', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.3.5.1', 'root@localhost', 'root@localhost'),
(394, '2026-06-13 20:48:47', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.3.6.1', 'root@localhost', 'root@localhost'),
(395, '2026-06-13 20:48:49', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.1.1', 'root@localhost', 'root@localhost'),
(396, '2026-06-13 20:48:52', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.1.2', 'root@localhost', 'root@localhost'),
(397, '2026-06-13 20:48:54', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.2.1', 'root@localhost', 'root@localhost'),
(398, '2026-06-13 20:48:59', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.2.3', 'root@localhost', 'root@localhost'),
(399, '2026-06-13 20:49:01', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.3.1', 'root@localhost', 'root@localhost'),
(400, '2026-06-13 20:49:08', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.3.2', 'root@localhost', 'root@localhost'),
(401, '2026-06-13 20:49:20', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.3.3', 'root@localhost', 'root@localhost'),
(402, '2026-06-13 20:49:22', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.3.4', 'root@localhost', 'root@localhost'),
(403, '2026-06-13 20:49:25', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.4.2', 'root@localhost', 'root@localhost'),
(404, '2026-06-13 20:49:27', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.4.1', 'root@localhost', 'root@localhost'),
(405, '2026-06-13 20:49:47', 'Se eliminó un registro en la tabla subcuentas. El registro eliminado es: 1.2.1.1.1', 'root@localhost', 'root@localhost'),
(406, '2026-06-13 20:50:04', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 4.1.2.2', 'root@localhost', 'root@localhost'),
(407, '2026-06-13 20:50:06', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.1.2', 'root@localhost', 'root@localhost'),
(408, '2026-06-13 20:50:08', 'Se eliminó un registro en la tabla cuentas. El registro eliminado es: 1.2.1.1', 'root@localhost', 'root@localhost'),
(409, '2026-06-13 20:52:43', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 1.1', 'root@localhost', 'root@localhost'),
(410, '2026-06-13 20:54:19', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 1.2', 'root@localhost', 'root@localhost'),
(411, '2026-06-13 20:55:52', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 1.3', 'root@localhost', 'root@localhost'),
(412, '2026-06-13 20:56:45', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 1.4', 'root@localhost', 'root@localhost'),
(413, '2026-06-13 20:57:19', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 2.1', 'root@localhost', 'root@localhost'),
(414, '2026-06-13 20:57:54', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 2.2', 'root@localhost', 'root@localhost'),
(415, '2026-06-13 20:58:38', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 3.1', 'root@localhost', 'root@localhost'),
(416, '2026-06-13 21:00:14', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(417, '2026-06-13 21:00:24', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(418, '2026-06-13 21:00:33', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(419, '2026-06-13 21:06:24', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(420, '2026-06-13 21:06:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(421, '2026-06-14 00:00:27', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(422, '2026-06-14 00:00:36', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(423, '2026-06-14 00:00:41', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(424, '2026-06-14 00:05:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(425, '2026-06-14 00:18:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(426, '2026-06-14 00:25:39', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(427, '2026-06-14 00:28:24', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(428, '2026-06-14 00:28:25', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(429, '2026-06-14 00:28:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(430, '2026-06-14 00:39:14', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(431, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(432, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(433, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(434, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(435, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(436, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(437, '2026-06-14 00:42:34', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(438, '2026-06-14 00:42:39', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost');
INSERT INTO `security_log` (`id_evento`, `fecha`, `evento`, `user`, `ip`) VALUES
(439, '2026-06-14 00:42:56', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(440, '2026-06-14 00:43:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(441, '2026-06-14 00:43:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(442, '2026-06-14 00:55:53', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(443, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(444, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(445, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(446, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(447, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(448, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(449, '2026-06-14 00:56:45', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(450, '2026-06-14 00:56:49', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(451, '2026-06-14 00:56:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(452, '2026-06-14 01:04:37', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(453, '2026-06-14 01:04:37', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(454, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(455, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(456, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(457, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(458, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(459, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(460, '2026-06-14 01:04:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(461, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(462, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(463, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(464, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(465, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(466, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(467, '2026-06-14 01:04:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(468, '2026-06-14 01:05:06', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(469, '2026-06-14 01:05:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(470, '2026-06-14 01:06:33', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(471, '2026-06-14 01:06:33', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(472, '2026-06-14 01:06:35', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(473, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(474, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(475, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(476, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(477, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(478, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(479, '2026-06-14 01:06:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(480, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(481, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(482, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(483, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(484, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(485, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(486, '2026-06-14 01:11:26', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(487, '2026-06-14 01:11:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(488, '2026-06-14 01:11:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(489, '2026-06-14 01:11:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(490, '2026-06-14 01:11:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(491, '2026-06-14 01:11:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(492, '2026-06-14 01:11:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(493, '2026-06-14 01:11:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(494, '2026-06-14 01:11:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(495, '2026-06-14 01:11:48', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(496, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(497, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(498, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(499, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(500, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(501, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(502, '2026-06-14 01:14:54', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(503, '2026-06-14 01:24:49', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(504, '2026-06-14 01:24:49', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(505, '2026-06-14 06:34:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(506, '2026-06-14 06:34:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(507, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(508, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(509, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(510, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(511, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(512, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(513, '2026-06-14 06:34:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(514, '2026-06-14 06:45:08', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 4.1', 'root@localhost', 'root@localhost'),
(515, '2026-06-14 06:45:08', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 5.1', 'root@localhost', 'root@localhost'),
(516, '2026-06-14 06:50:57', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(517, '2026-06-14 06:50:57', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(518, '2026-06-14 06:50:57', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(519, '2026-06-14 06:50:57', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(520, '2026-06-14 06:50:59', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(521, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(522, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(523, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(524, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(525, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(526, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(527, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(528, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(529, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(530, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(531, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(532, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(533, '2026-06-14 06:51:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(534, '2026-06-14 07:20:31', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 1.5', 'root@localhost', 'root@localhost'),
(535, '2026-06-14 07:22:48', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(536, '2026-06-14 07:22:48', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(537, '2026-06-14 07:22:48', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(538, '2026-06-14 07:22:48', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(539, '2026-06-14 07:27:30', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(540, '2026-06-14 07:27:30', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(541, '2026-06-14 07:27:30', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(542, '2026-06-14 07:27:30', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(543, '2026-06-14 07:35:19', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(544, '2026-06-14 07:35:19', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(545, '2026-06-14 07:35:19', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(546, '2026-06-14 07:35:19', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(547, '2026-06-14 07:36:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(548, '2026-06-14 07:36:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(549, '2026-06-14 07:36:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(550, '2026-06-14 07:36:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(551, '2026-06-14 07:37:47', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(552, '2026-06-14 07:37:47', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(553, '2026-06-14 07:37:47', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(554, '2026-06-14 07:37:47', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(555, '2026-06-14 07:39:05', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(556, '2026-06-14 07:39:05', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(557, '2026-06-14 07:39:05', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(558, '2026-06-14 07:39:05', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(559, '2026-06-14 07:43:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(560, '2026-06-14 07:43:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(561, '2026-06-14 07:43:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(562, '2026-06-14 07:43:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(563, '2026-06-14 08:05:16', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(564, '2026-06-14 08:05:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(565, '2026-06-14 08:13:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(566, '2026-06-14 08:13:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(567, '2026-06-14 08:13:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(568, '2026-06-14 08:13:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(569, '2026-06-14 11:42:24', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(570, '2026-06-14 11:42:32', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(571, '2026-06-14 11:45:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(572, '2026-06-14 11:45:59', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(573, '2026-06-14 11:55:27', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(574, '2026-06-14 11:55:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(575, '2026-06-14 11:55:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(576, '2026-06-14 11:56:06', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(577, '2026-06-14 11:56:06', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(578, '2026-06-14 11:56:09', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(579, '2026-06-14 11:56:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(580, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(581, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(582, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(583, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(584, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(585, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(586, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(587, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(588, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(589, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(590, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(591, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(592, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(593, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(594, '2026-06-14 11:56:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(595, '2026-06-14 11:56:47', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(596, '2026-06-14 11:58:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(597, '2026-06-14 11:58:55', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(598, '2026-06-14 12:14:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(599, '2026-06-14 12:30:13', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(600, '2026-06-14 12:30:27', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(601, '2026-06-14 12:35:02', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(602, '2026-06-14 12:37:39', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(603, '2026-06-14 15:06:27', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(604, '2026-06-14 15:06:27', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(605, '2026-06-14 15:06:27', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(606, '2026-06-14 15:06:27', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(607, '2026-06-14 15:06:28', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(608, '2026-06-14 15:06:41', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(609, '2026-06-14 15:06:41', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(610, '2026-06-14 15:06:41', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(611, '2026-06-14 15:06:41', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(612, '2026-06-14 15:06:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(613, '2026-06-14 15:07:04', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(614, '2026-06-14 15:07:51', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(615, '2026-06-14 15:07:51', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(616, '2026-06-14 15:07:52', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(617, '2026-06-14 15:08:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(618, '2026-06-14 15:14:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(619, '2026-06-14 15:14:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(620, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(621, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(622, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(623, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(624, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(625, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(626, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(627, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(628, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(629, '2026-06-14 15:20:50', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(630, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(631, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(632, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(633, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(634, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(635, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(636, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(637, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(638, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(639, '2026-06-14 15:24:57', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(640, '2026-06-14 15:28:41', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(641, '2026-06-14 15:29:33', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(642, '2026-06-14 15:33:46', 'Se insertó un nuevo registro en la tabla cuentas. El valor es: 5.2', 'root@localhost', 'root@localhost'),
(643, '2026-06-14 15:42:05', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(644, '2026-06-14 15:46:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(645, '2026-06-14 15:54:39', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(646, '2026-06-14 15:55:19', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(647, '2026-06-14 15:55:23', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(648, '2026-06-14 16:05:33', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(649, '2026-06-14 16:05:33', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(650, '2026-06-14 16:05:33', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(651, '2026-06-14 16:05:33', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(652, '2026-06-14 16:05:35', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(653, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(654, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(655, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(656, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(657, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(658, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(659, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(660, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(661, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(662, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(663, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(664, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(665, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(666, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(667, '2026-06-14 16:11:07', 'Se eliminó un registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(668, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(669, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(670, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(671, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(672, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(673, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(674, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(675, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(676, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(677, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(678, '2026-06-14 16:12:00', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(679, '2026-06-14 16:12:07', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(680, '2026-06-14 16:12:16', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(681, '2026-06-14 16:20:40', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(682, '2026-06-14 16:20:44', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(683, '2026-06-14 16:21:01', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(684, '2026-06-14 16:21:38', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(685, '2026-06-14 16:22:17', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(686, '2026-06-14 16:26:56', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(687, '2026-06-14 16:34:42', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(688, '2026-06-14 16:35:25', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(689, '2026-06-14 16:35:25', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(690, '2026-06-14 16:35:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(691, '2026-06-14 16:35:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(692, '2026-06-14 16:35:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(693, '2026-06-14 16:35:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(694, '2026-06-14 16:42:22', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(695, '2026-06-14 16:42:22', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(696, '2026-06-14 16:42:22', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(697, '2026-06-14 16:42:22', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(698, '2026-06-14 16:42:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(699, '2026-06-14 16:42:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(700, '2026-06-14 16:42:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(701, '2026-06-14 16:42:22', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(702, '2026-06-14 16:43:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(703, '2026-06-14 16:43:38', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(704, '2026-06-14 16:43:38', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(705, '2026-06-14 16:43:38', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(706, '2026-06-14 16:44:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(707, '2026-06-14 16:44:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(708, '2026-06-14 16:44:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(709, '2026-06-14 16:44:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(710, '2026-06-14 16:44:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(711, '2026-06-14 16:44:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(712, '2026-06-14 16:44:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(713, '2026-06-14 16:44:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(714, '2026-06-14 16:45:58', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(715, '2026-06-14 16:45:58', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(716, '2026-06-14 16:45:58', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(717, '2026-06-14 16:45:58', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(718, '2026-06-14 16:45:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(719, '2026-06-14 16:45:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(720, '2026-06-14 16:45:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(721, '2026-06-14 16:45:58', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(722, '2026-06-14 16:46:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(723, '2026-06-14 16:46:12', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(724, '2026-06-14 16:46:12', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(725, '2026-06-14 16:46:12', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(726, '2026-06-14 17:52:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(727, '2026-06-14 17:52:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(728, '2026-06-14 17:52:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(729, '2026-06-14 17:52:20', 'Se insertó un nuevo registro en la tabla registro.', 'root@localhost', 'root@localhost'),
(730, '2026-06-14 17:52:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(731, '2026-06-14 17:52:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(732, '2026-06-14 17:52:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost'),
(733, '2026-06-14 17:52:20', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subgrupos`
--

CREATE TABLE `subgrupos` (
  `codigo_subgrupo` varchar(20) NOT NULL,
  `nombre_subgrupo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `grupo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `subgrupos`
--

INSERT INTO `subgrupos` (`codigo_subgrupo`, `nombre_subgrupo`, `descripcion`, `grupo`) VALUES
('1.1.1', 'Efectivo en Caja', NULL, '1.1'),
('1.2.1', 'Materia Prima', NULL, '1.2'),
('1.2.2', 'Producto Terminado', NULL, '1.2'),
('1.3.1', 'Edificio', NULL, '1.3'),
('1.3.2', 'Maquinaria', NULL, '1.3'),
('1.3.3', 'Inventario', NULL, '1.3'),
('1.3.4', 'Automóviles', NULL, '1.3'),
('1.3.5', 'Mobiliario y Equipo de Oficina', 'Subgrupo para las cuentas relacionadas al mobiliario y equipo de oficina', '1.3'),
('1.3.6', 'Obra Civil', 'Este rubro se refiere a todas las actividades de construcción de la obra civil, desde la preparación del terreno hasta la infraestructura externa e interna de todas las áreas establecidas como necesarias en la sección de Distribución en planta.', '1.3'),
('2.1.1', 'Proveedores', NULL, '2.1'),
('2.1.2', 'Pasivos a Largo Plazo', NULL, '2.1'),
('3.2.1', 'test', 'test', '3.2'),
('4.1.1', 'Costos de Producción', NULL, '4.1'),
('4.1.2', 'Gastos de Administración', NULL, '4.1'),
('4.1.3', 'Costos Indirectos', NULL, '4.1'),
('4.1.4', 'Depreciación', NULL, '4.1'),
('4.1.5', 'Gastos de venta', 'Cuenta para registrar los gastos de las ventas.', '4.1'),
('4.1.6', 'Gastos financieros', 'Cuentas para los gastos financieros.', '4.1'),
('4.2.1', 'Ingresos por Venta', NULL, '4.2'),
('4.2.2', 'Otros ingresos', 'Apartado para registrar otros ingresos para la Sociedad.', '4.2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` char(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `password`, `fecha`, `tipo`) VALUES
('administrador', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2013-01-10', 'administrador'),
('alex', '60c6d277a8bd81de7fdde19201bf9c58a3df08f4', '2011-08-01', 'estandar'),
('jose', '4a3487e57d90e2084654b6d23937e75af5c8ee55', '2013-11-17', 'administrador'),
('juan', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2013-11-17', 'estandar'),
('pedro', '4410d99cefe57ec2c2cdbd3f1d5cf862bb4fb6f8', '2013-11-22', 'estandar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `tipo_pago` enum('CONTADO','CREDITO') NOT NULL DEFAULT 'CONTADO',
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `total`, `fecha`, `concepto`, `tipo_pago`, `subtotal`) VALUES
(1, 4.75, '2026-06-14 08:41:47', NULL, 'CONTADO', 0.00),
(2, 12.50, '2026-06-14 09:04:37', NULL, 'CONTADO', 0.00),
(3, 25.00, '2026-06-14 09:11:44', NULL, 'CONTADO', 0.00),
(4, 12.50, '2026-06-14 09:24:49', NULL, 'CONTADO', 0.00),
(5, 4.75, '2026-06-14 14:34:44', NULL, 'CONTADO', 0.00),
(6, 7.50, '2026-06-14 14:50:57', NULL, 'CONTADO', 0.00),
(7, 12.30, '2026-06-14 15:22:48', 'Venta de productos diarios', 'CREDITO', 12.30),
(8, 6.90, '2026-06-14 15:27:30', 'Venta de productos de uso diario', 'CONTADO', 6.90),
(9, 7.20, '2026-06-14 15:35:19', 'Venta de mercadería', 'CONTADO', 7.20),
(10, 7.15, '2026-06-14 15:36:55', 'Venta de productos de limpieza', 'CREDITO', 7.15),
(11, 4.20, '2026-06-14 15:37:47', 'Venta de snacks', 'CONTADO', 4.20),
(12, 6.60, '2026-06-14 15:39:05', 'Venta de golosinas', 'CREDITO', 6.60),
(13, 6.60, '2026-06-14 15:43:12', 'Venta de productos basicos', 'CONTADO', 6.60),
(14, 4.85, '2026-06-14 16:13:12', 'Venta de bebidas gaseosas', 'CREDITO', 4.85),
(15, 5.00, '2026-06-14 23:06:27', 'Venta de mercadería', 'CONTADO', 5.00),
(16, 9.00, '2026-06-14 23:06:41', 'Venta de mercadería', 'CONTADO', 9.00),
(17, 4.50, '2026-06-15 00:05:33', 'Venta de mercadería', 'CREDITO', 4.50),
(18, 37.50, '2026-06-15 00:35:38', 'Venta de mercadería', 'CONTADO', 37.50),
(19, 0.75, '2026-06-15 00:42:22', 'Venta de mercadería', 'CONTADO', 0.75),
(20, 111.60, '2026-06-15 00:44:20', 'Venta de mercadería', 'CONTADO', 111.60),
(21, 2.70, '2026-06-15 00:45:58', 'Venta de mercadería', 'CREDITO', 2.70),
(22, 5.25, '2026-06-15 01:52:20', 'Venta de mercadería', 'CONTADO', 5.25);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_subcuentas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_subcuentas` (
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_subcuentas`
--
DROP TABLE IF EXISTS `ver_subcuentas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_subcuentas`  AS SELECT `a`.`codigo_clasificacion` AS `codigo_clasificacion`, `b`.`codigo_grupo` AS `codigo_grupo`, `c`.`codigo_subgrupo` AS `codigo_subgrupo`, `d`.`codigo_cuenta` AS `codigo_cuenta`, `e`.`codigo_subcuenta` AS `codigo_subcuenta`, `e`.`naturaleza` AS `naturaleza`, `e`.`nombre_subcuenta` AS `nombre_subcuenta` FROM ((((`clasificaciones` `a` join `catalogo_grupos` `b`) join `catalogo_subgrupos` `c`) join `catalogo_cuentas` `d`) join `catalogo_subcuentas` `e`) WHERE `e`.`cuenta` = `d`.`codigo_cuenta` AND `d`.`subgrupo` = `c`.`codigo_subgrupo` AND `c`.`grupo` = `b`.`codigo_grupo` AND `b`.`clasificacion` = `a`.`codigo_clasificacion` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo_clasificaciones`
--
ALTER TABLE `catalogo_clasificaciones`
  ADD PRIMARY KEY (`codigo_clasificacion`);

--
-- Indices de la tabla `catalogo_cuentas`
--
ALTER TABLE `catalogo_cuentas`
  ADD PRIMARY KEY (`codigo_cuenta`),
  ADD KEY `subgrupo` (`subgrupo`);

--
-- Indices de la tabla `catalogo_subgrupos`
--
ALTER TABLE `catalogo_subgrupos`
  ADD PRIMARY KEY (`codigo_subgrupo`);

--
-- Indices de la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  ADD PRIMARY KEY (`codigo_clasificacion`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`codigo_cuenta`),
  ADD KEY `subgrupo` (`subgrupo`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`codigo_grupo`),
  ADD KEY `clasificacion` (`clasificacion`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`);

--
-- Indices de la tabla `mayor`
--
ALTER TABLE `mayor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cuenta` (`cuenta`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `security_log`
--
ALTER TABLE `security_log`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  ADD PRIMARY KEY (`codigo_subgrupo`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `mayor`
--
ALTER TABLE `mayor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `security_log`
--
ALTER TABLE `security_log`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=734;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo_cuentas`
--
ALTER TABLE `catalogo_cuentas`
  ADD CONSTRAINT `catalogo_cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `catalogo_subgrupos` (`codigo_subgrupo`);

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `subgrupos` (`codigo_subgrupo`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`clasificacion`) REFERENCES `clasificaciones` (`codigo_clasificacion`);

--
-- Filtros para la tabla `subgrupos`
--
ALTER TABLE `subgrupos`
  ADD CONSTRAINT `subgrupos_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`codigo_grupo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
