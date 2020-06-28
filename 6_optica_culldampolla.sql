-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-06-2020 a las 00:44:48
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `nombre` varchar(100) NOT NULL,
  `cp` varchar(100) NOT NULL,
  `telefono` int(9) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `recomendacion` varchar(100) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `gafas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `clientes`:
--   `gafas`
--       `Gafas` -> `id_gafas`
--

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nombre`, `cp`, `telefono`, `email`, `fecha_registro`, `recomendacion`, `id_cliente`, `gafas`) VALUES
('Manuel', '08016', 677543521, 'manuel@email.com', '2020-06-28 22:42:21', 'Cliente1', 1, 1),
('Cliente1', '08014', 654879087, 'cliente1@email.com', '2020-06-28 22:25:28', '', 2, 8),
('Marc', '08077', 651123221, 'marc@email.com', '2020-06-28 22:25:21', '', 3, 6),
('Esther', '08222', 659834022, 'esther@email.com', '2020-06-28 22:25:21', '', 4, 5),
('Ana', '08033', 657900877, 'ana@email.com', '2020-06-28 22:42:34', 'Esther', 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compra`
--

CREATE TABLE `Compra` (
  `id_compra` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `Compra`:
--   `cliente`
--       `clientes` -> `id_cliente`
--

--
-- Volcado de datos para la tabla `Compra`
--

INSERT INTO `Compra` (`id_compra`, `cliente`, `fecha`) VALUES
(1, 5, '2020-06-02 00:39:40'),
(2, 2, '2020-05-05 00:40:48'),
(3, 4, '2020-06-21 00:41:01'),
(4, 1, '2020-06-17 00:41:10'),
(5, 3, '2020-06-01 00:41:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `nombre` varchar(50) NOT NULL,
  `cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `Empleado`:
--   `cliente`
--       `clientes` -> `id_cliente`
--

--
-- Volcado de datos para la tabla `Empleado`
--

INSERT INTO `Empleado` (`nombre`, `cliente`, `id_empleado`) VALUES
('Empleado1', 1, 1),
('Empleado2', 3, 2),
('Empleado2', 2, 4),
('Empleado1', 4, 5),
('Empleado1', 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Gafas`
--

CREATE TABLE `Gafas` (
  `graduacion` varchar(100) NOT NULL,
  `montura_tipo` set('pasta','flotante','metalica') NOT NULL DEFAULT 'flotante',
  `montura_color` varchar(20) NOT NULL,
  `cristal_color` varchar(30) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `id_gafas` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `Gafas`:
--   `marca`
--       `Marcas` -> `id_marca`
--   `proveedor`
--       `Proveedor` -> `id_proveedor`
--

--
-- Volcado de datos para la tabla `Gafas`
--

INSERT INTO `Gafas` (`graduacion`, `montura_tipo`, `montura_color`, `cristal_color`, `precio`, `id_gafas`, `proveedor`, `marca`) VALUES
('Graduacion1', 'metalica', 'azul', 'blanco', '100.00', 1, 1, 3),
('Graduacion2', 'metalica', 'rojo', 'blanco', '81.00', 2, 2, 1),
('Graduacion3', 'pasta', 'negro', 'blanco', '120.50', 5, 6, 15),
('Graduacion4', 'pasta', 'gris', 'blanco', '114.99', 6, 3, 14),
('Graduacion5', 'metalica', 'amarillo', 'blanco', '99.99', 8, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marcas`
--

CREATE TABLE `Marcas` (
  `nombre` varchar(50) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `Marcas`:
--   `proveedor`
--       `Proveedor` -> `id_proveedor`
--

--
-- Volcado de datos para la tabla `Marcas`
--

INSERT INTO `Marcas` (`nombre`, `proveedor`, `id_marca`) VALUES
('Marca1', 2, 1),
('Marca2', 1, 3),
('Marca3', 5, 4),
('Marca8', 6, 6),
('Marca9', 3, 14),
('Marca55', 4, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `nombre` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int(5) NOT NULL,
  `piso` int(3) NOT NULL,
  `puerta` varchar(25) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `cp` varchar(200) NOT NULL,
  `pais` varchar(20) NOT NULL,
  `telefono` int(9) NOT NULL,
  `fax` int(100) NOT NULL,
  `nif` varchar(100) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `Proveedor`:
--

--
-- Volcado de datos para la tabla `Proveedor`
--

INSERT INTO `Proveedor` (`nombre`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `cp`, `pais`, `telefono`, `fax`, `nif`, `id_proveedor`) VALUES
('proveedor1', 'calle1', 1, 4, '3', 'Barcelona', '08014', 'España', 688737290, 575756, '658392765h', 1),
('proveedor2', 'calle2', 4, 2, '1', 'Barcelona', '08090', 'España', 653098765, 759365, '866473g', 2),
('Proveedor5', 'Gayarre', 45, 7, '3', 'Barcelona', '08029', 'España', 678900876, 759375022, '65830583j', 3),
('Proveedor8', 'Numancia', 18, 5, '4', 'Barcelona', '08015', 'España', 609675533, 875643839, '485760373l', 4),
('Proveedor22', 'calle', 44, 1, '1', 'Barcelona', '08098', 'España', 687123431, 75639465, '7452830000k', 5),
('Proveedor44', 'carrer sants', 22, 6, '3', 'Barcelona', '08033', 'España', 678330099, 657839375, '75937565t', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `gafas` (`gafas`);

--
-- Indices de la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD UNIQUE KEY `cliente` (`cliente`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `cliente` (`cliente`);

--
-- Indices de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD PRIMARY KEY (`id_gafas`),
  ADD UNIQUE KEY `proveedor` (`proveedor`),
  ADD UNIQUE KEY `marca` (`marca`);

--
-- Indices de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `proveedor` (`proveedor`),
  ADD KEY `proveedor_2` (`proveedor`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `Compra`
--
ALTER TABLE `Compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Gafas`
--
ALTER TABLE `Gafas`
  MODIFY `id_gafas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`gafas`) REFERENCES `Gafas` (`id_gafas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `Empleado_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Gafas`
--
ALTER TABLE `Gafas`
  ADD CONSTRAINT `Gafas_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `Marcas` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Gafas_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `Proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Marcas`
--
ALTER TABLE `Marcas`
  ADD CONSTRAINT `Marcas_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `Proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
