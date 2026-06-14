-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2026 a las 08:06:38
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
-- Estructura de tabla para la tabla `anio_contable`
--

CREATE TABLE `anio_contable` (
  `id` int(11) NOT NULL,
  `anio_contable` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `anio_contable`
--

INSERT INTO `anio_contable` (`id`, `anio_contable`) VALUES
(1, '2013');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_empleados`
--

CREATE TABLE `cargos_empleados` (
  `id` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cargos_empleados`
--

INSERT INTO `cargos_empleados` (`id`, `cargo`) VALUES
(1, 'Gerente General'),
(2, 'Contador'),
(3, 'Encargado de Comercialización'),
(4, 'Encargado de Producción'),
(5, 'Recepcionista'),
(6, 'Motorista'),
(7, 'Auxiliar');

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
-- Estructura de tabla para la tabla `catalogo_grupos`
--

CREATE TABLE `catalogo_grupos` (
  `codigo_grupo` varchar(10) NOT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `naturaleza` varchar(15) NOT NULL,
  `nombre_grupo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `catalogo_grupos`
--

INSERT INTO `catalogo_grupos` (`codigo_grupo`, `clasificacion`, `naturaleza`, `nombre_grupo`) VALUES
('1.1', 1, 'activo', 'Activo Circulante'),
('1.2', 1, 'activo', 'Inventarios'),
('1.3', 1, 'activo', 'Activo Fijo'),
('1.4', 1, 'activo', 'Depreciación Acumulada'),
('2.1', 2, 'pasivo', 'Cuentas por Pagar'),
('3.1', 3, 'capital', 'Capital Social'),
('4.1', 4, 'resultado', 'Costos'),
('4.2', 4, 'resultado', 'Ingresos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_subcuentas`
--

CREATE TABLE `catalogo_subcuentas` (
  `codigo_subcuenta` varchar(20) NOT NULL,
  `naturaleza` varchar(20) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `nombre_subcuenta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `catalogo_subcuentas`
--

INSERT INTO `catalogo_subcuentas` (`codigo_subcuenta`, `naturaleza`, `cuenta`, `nombre_subcuenta`) VALUES
('1.2.1.1.1', 'activo', '1.2.1.1', 'Naranja'),
('1.2.1.1.2', 'activo', '1.2.1.1', 'Mandarina'),
('1.2.1.1.3', 'activo', '1.2.1.1', 'Piña'),
('1.2.1.1.4', 'activo', '1.2.1.1', 'Marañón'),
('1.2.1.1.5', 'activo', '1.2.1.1', 'Coco'),
('1.2.1.1.6', 'activo', '1.2.1.1', 'Rosa de Jamaica'),
('1.2.1.2.1', 'activo', '1.2.1.2', 'Azúcar'),
('1.2.1.2.2', 'activo', '1.2.1.2', 'Levadura'),
('1.2.1.2.3', 'activo', '1.2.1.2', 'Cápsulas de Seguridad'),
('1.2.1.2.4', 'activo', '1.2.1.2', 'Etiquetas'),
('1.2.1.2.5', 'activo', '1.2.1.2', 'Cajas'),
('4.1.2.2.1', 'resultado', '4.1.2.2', 'Aguinaldo'),
('4.1.2.2.2', 'resultado', '4.1.2.2', 'Vacaciones');

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
('1.1', NULL, 'Caja', 'No', NULL, 2000, 0),
('1.2', NULL, 'Banco', 'No', NULL, 1500, 0),
('1.3', NULL, 'Inventario de mercadería', 'No', NULL, 309.75, 0),
('1.4', NULL, 'Mobiliario y equipos', 'No', NULL, 1000, 0),
('2.1', NULL, 'Proveedores', 'No', NULL, 0, 1500),
('2.2', NULL, 'Préstamo bancario', 'No', NULL, 0, 2000),
('3.1', NULL, 'Capital social', 'No', NULL, 0, 5500);

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
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `codigo_empleado` varchar(8) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `salario_mensual_contratado` double NOT NULL,
  `isss_trabajador` double DEFAULT NULL,
  `isss_patrono` double DEFAULT NULL,
  `afp_trabajador` double DEFAULT NULL,
  `afp_patrono` double DEFAULT NULL,
  `salario_diario` double DEFAULT NULL,
  `vacaciones` double DEFAULT NULL,
  `aguinaldo` double DEFAULT NULL,
  `salario_mensual` double DEFAULT NULL,
  `aportaciones_mensuales_patrono` double DEFAULT NULL,
  `pago_salario_patrono` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `codigo_empleado`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `cargo`, `salario_mensual_contratado`, `isss_trabajador`, `isss_patrono`, `afp_trabajador`, `afp_patrono`, `salario_diario`, `vacaciones`, `aguinaldo`, `salario_mensual`, `aportaciones_mensuales_patrono`, `pago_salario_patrono`) VALUES
(1, 'GG000001', 'Juan', 'José', 'Pérez', 'Martínez', 'Gerente General', 500, 15, 37.5, 31.25, 22.5, 16.67, 27.08, 13.89, 460.91, 60, 520.91),
(2, 'CR000001', 'Carlos', 'Alberto', 'Rivas', 'Rodríguez', 'Contador', 400, 12, 30, 25, 18, 13.33, 21.67, 11.11, 371.97, 48, 419.97),
(3, 'EC000001', 'María', 'Sandra', 'Romero', 'López', 'Encargado de Comercialización', 300, 9, 22.5, 18.75, 13.5, 10, 16.25, 8.33, 283.02, 36, 319.02),
(4, 'EP000001', 'Carmen', 'Alejandra', 'Villalobos', 'Hernández', 'Encargado de Producción', 300, 9, 22.5, 18.75, 13.5, 10, 16.25, 8.33, 283.02, 36, 319.02),
(5, 'RR000001', 'Susana', 'Carolina', 'Martínez', 'Romero', 'Recepcionista', 207.78, 6.23, 15.58, 12.99, 9.35, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52),
(6, 'MM000001', 'Pedro', 'Antonio', 'Monterrosa', 'Vanegas', 'Motorista', 207.78, 6.23, 15.58, 12.99, 9.35, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52),
(7, 'AX000001', 'Stephanie', 'Emperatriz', 'Cerna', 'Espinosa', 'Auxiliar', 207.78, 6.23, 15.58, 12.99, 9.35, 6.93, 11.25, 5.77, 205.59, 24.93, 230.52),
(10, 'CC000002', 'Juan', 'Alberto', 'Martínez', 'Arriaza', 'Contador', 400, 12, 30, 25, 27, 13.333333333333, 52, 11.111111111111, 500.11111111111, 27, 527.11111111111),
(11, 'CC000003', 'Luis', 'Armando', 'García', 'López', 'Contador', 400, 12, 30, 25, 27, 13.333333333333, 52, 11.111111111111, 500.11111111111, 27, 527.11111111111),
(12, 'MM000002', 'Hector', 'Francisco', 'Soriano', 'Recinos', 'Motorista', 207.78, 6.2334, 15.5835, 12.98625, 14.02515, 6.926, 27.0114, 5.7716666666667, 259.78271666667, 14.02515, 273.80786666667),
(13, 'AX000003', 'María', 'Mercedes', 'Pleitez', 'González', 'Auxiliar', 207.78, 6.2334, 15.5835, 12.98625, 14.02515, 6.926, 27.0114, 5.7716666666667, 259.78271666667, 14.02515, 273.80786666667);

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
  `id_inventario` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(6) NOT NULL,
  `precio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `nombre`, `cantidad`, `precio`) VALUES
(1, 'Coca Cola 600ml', 55, 1.00),
(2, 'Pepsi 600ml', 40, 0.95),
(3, 'Leche Entera', 30, 1.50),
(4, 'Arroz 1kg', 25, 1.25),
(5, 'Azucar 1kg', 20, 1.10),
(6, 'Frijoles 1lb', 35, 0.90),
(7, 'Galletas Oreo', 40, 0.75),
(8, 'Pan de Molde', 15, 1.80),
(9, 'Jugo Del Valle', 25, 1.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE `iva` (
  `id` int(1) UNSIGNED NOT NULL,
  `iva` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `iva`
--

INSERT INTO `iva` (`id`, `iva`) VALUES
(1, 0.13);

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
(1, '2013-09-02', 1, '', '1.3.6.1', 'Eliminación de Pared', 22.50, 0.00, 'Eliminación de pared. Dimensiones: 2.5m x 3.0m. Área total: 7.5 metros cuadrados. Costo por metro cuadrado: $3.00. Cantidad: 1. Total: $22.50', NULL, '', NULL, 'administrador', NULL, '::1'),
(2, '2013-09-02', 1, '', '1.3.6.1', 'Emparejamiento de suelo', 15.60, 0.00, 'Emparejamiento de suelo. Área total: 7.8 metros cuadrados. Costo por metro cuadrado: $2.00. Cantidad: 1. Total: 15.60', NULL, '', NULL, 'administrador', NULL, '::1'),
(3, '2013-09-02', 1, '', '1.3.6.1', 'División Comedor-Producción', 12.75, 0.00, 'División Comedor-Producción (1.7m x 3.0m). Área total: 5.1 metros cuadrados. Costo por metro cuadrado: $2.50. Cantidad: 1. Total: 12.75', NULL, '', NULL, 'administrador', NULL, '::1'),
(4, '2013-09-02', 1, '', '1.3.6.1', 'División Patio-Producción', 15.00, 0.00, 'División Patio-Producción (3.5m x 3.0m). Área total: 6.0 metros cuadrados. Costo por metro cuadrado: $2.50. Cantidad: 1. Total: $26.75', NULL, '', NULL, 'administrador', NULL, '::1'),
(5, '2013-09-02', 1, '', '1.3.6.1', 'División Producto en Proceso', 26.25, 0.00, 'División Producto en Proceso (3.5m x 3.0m). Área total: 10.5 metros cuadrados. Costo por metro cuadrado: $2.50. Total: $26.25', NULL, '', NULL, 'administrador', NULL, '::1'),
(6, '2013-09-02', 1, '', '1.3.6.1', 'Divisiones', 20.00, 0.00, 'Divisiones (2m x 2m). Área total: 4.0 metros cuadrados. Costo por metro cuadrado: $2.50. Total: $20.00', NULL, '', NULL, 'administrador', NULL, '::1'),
(7, '2013-09-02', 1, '', '1.3.6.1', 'Divisiones', 16.50, 0.00, 'Test', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(9, '2013-09-03', 1, '', '1.3.6.1', 'Puertas', 105.30, 0.00, 'Test', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(10, '2013-09-04', 2, '', '1.3.2.1', 'Pelador de naranjas', 48.00, 0.00, '4 peladores a $12.00 c/u', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(11, '2013-09-04', 2, '', '1.3.2.1', 'Pelador de Cítricos', 12.00, 0.00, '4 peladores a $3.00 c/u', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(12, '2013-09-04', 2, '', '1.3.2.1', 'Pelador y cortador de Piña', 20.00, 0.00, '4 unidades a $5.00 c/u', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(13, '2013-09-04', 2, '', '1.3.2.1', 'Cocina eléctrica para Rosa de Jamaica', 80.00, 0.00, '2 unidades a $40.00 c/u', NULL, NULL, NULL, 'administrador', NULL, '::1'),
(14, '2013-09-04', 2, '', '1.3.2.1', 'Olla para hervir', 14.00, 0.00, '2 unidades a $7.00 c/u.', NULL, NULL, NULL, 'administrador', NULL, '127.0.0.1'),
(15, '2013-09-06', 2, '', '1.3.2.1', 'Exprimidor/Prensa de cítricos', 132.00, 0.00, '4 unidades a $33.00 c/u.', NULL, NULL, NULL, 'administrador', NULL, '127.0.0.1'),
(16, '2013-09-06', 2, '', '1.3.2.1', 'Encorchadora', 116.50, 0.00, '1 unidad a $116.50', NULL, NULL, NULL, 'administrador', NULL, '127.0.0.1');

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
(424, '2026-06-14 00:05:46', 'Se modificó un registro en la tabla cuentas.', 'root@localhost', 'root@localhost');

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
-- Estructura Stand-in para la vista `ver_subcuentas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_subcuentas` (
`codigo_clasificacion` int(11)
,`codigo_grupo` varchar(10)
,`codigo_subgrupo` varchar(20)
,`codigo_cuenta` varchar(20)
,`codigo_subcuenta` varchar(20)
,`naturaleza` varchar(20)
,`nombre_subcuenta` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_subcuentas`
--
DROP TABLE IF EXISTS `ver_subcuentas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_subcuentas`  AS   (select `a`.`codigo_clasificacion` AS `codigo_clasificacion`,`b`.`codigo_grupo` AS `codigo_grupo`,`c`.`codigo_subgrupo` AS `codigo_subgrupo`,`d`.`codigo_cuenta` AS `codigo_cuenta`,`e`.`codigo_subcuenta` AS `codigo_subcuenta`,`e`.`naturaleza` AS `naturaleza`,`e`.`nombre_subcuenta` AS `nombre_subcuenta` from ((((`clasificaciones` `a` join `catalogo_grupos` `b`) join `catalogo_subgrupos` `c`) join `catalogo_cuentas` `d`) join `catalogo_subcuentas` `e`) where `e`.`cuenta` = `d`.`codigo_cuenta` and `d`.`subgrupo` = `c`.`codigo_subgrupo` and `c`.`grupo` = `b`.`codigo_grupo` and `b`.`clasificacion` = `a`.`codigo_clasificacion`)  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anio_contable`
--
ALTER TABLE `anio_contable`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `catalogo_grupos`
--
ALTER TABLE `catalogo_grupos`
  ADD PRIMARY KEY (`codigo_grupo`),
  ADD KEY `clasificacion` (`clasificacion`);

--
-- Indices de la tabla `catalogo_subcuentas`
--
ALTER TABLE `catalogo_subcuentas`
  ADD PRIMARY KEY (`codigo_subcuenta`),
  ADD KEY `cuenta` (`cuenta`);

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
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`codigo_cuenta`),
  ADD KEY `subgrupo` (`subgrupo`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_empleado` (`codigo_empleado`);

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
-- Indices de la tabla `iva`
--
ALTER TABLE `iva`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anio_contable`
--
ALTER TABLE `anio_contable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cargos_empleados`
--
ALTER TABLE `cargos_empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `mayor`
--
ALTER TABLE `mayor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `security_log`
--
ALTER TABLE `security_log`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo_cuentas`
--
ALTER TABLE `catalogo_cuentas`
  ADD CONSTRAINT `catalogo_cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `catalogo_subgrupos` (`codigo_subgrupo`);

--
-- Filtros para la tabla `catalogo_grupos`
--
ALTER TABLE `catalogo_grupos`
  ADD CONSTRAINT `catalogo_grupos_ibfk_1` FOREIGN KEY (`clasificacion`) REFERENCES `catalogo_clasificaciones` (`codigo_clasificacion`);

--
-- Filtros para la tabla `catalogo_subcuentas`
--
ALTER TABLE `catalogo_subcuentas`
  ADD CONSTRAINT `catalogo_subcuentas_ibfk_1` FOREIGN KEY (`cuenta`) REFERENCES `catalogo_cuentas` (`codigo_cuenta`);

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`subgrupo`) REFERENCES `subgrupos` (`codigo_subgrupo`);

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
