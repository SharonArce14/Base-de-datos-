-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2025 a las 14:33:03
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
-- Base de datos: `mr-eggy`
--
CREATE DATABASE IF NOT EXISTS `mr-eggy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mr-eggy`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--
-- Creación: 17-10-2024 a las 12:57:21
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` varchar(15) DEFAULT NULL,
  `producto_id` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_producto_general` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `usuario_id`, `producto_id`, `cantidad`, `fecha_agregado`, `id_producto_general`) VALUES
(11, '1146124300', 'A', 1, '2024-10-17 19:53:48', NULL),
(12, '1146124300', 'AA', 1, '2024-10-17 19:53:56', NULL),
(19, '1028840419', 'A', 1, '2024-10-18 14:55:24', NULL),
(20, '1028840419', 'A', 1, '2024-10-18 15:03:41', NULL),
(26, '1028840419', 'AA', 1, '2024-10-18 16:28:13', NULL),
(27, '1028840419', 'AAA', 1, '2024-10-18 16:34:15', NULL),
(28, '1028840419', 'AA', 1, '2024-10-18 16:37:03', NULL),
(29, '1028840419', 'AA', 1, '2024-10-18 16:55:12', NULL),
(30, '1028840419', 'AAA', 1, '2024-10-19 22:24:34', NULL),
(31, '1028840419', 'AA', 1, '2024-10-26 13:48:44', NULL),
(33, '19457294', 'AA', 1, '2024-11-02 15:28:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--
-- Creación: 17-10-2024 a las 12:51:02
--

CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_caja` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_producto_generales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--
-- Creación: 17-10-2024 a las 17:49:29
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` varchar(15) DEFAULT NULL,
  `estado` enum('pendiente','procesando','enviado','entregado') DEFAULT 'pendiente',
  `total` decimal(10,2) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_entrega` date DEFAULT NULL,
  `numero_tarjeta` varchar(16) DEFAULT NULL,
  `fecha_expiracion` varchar(5) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `total_pedido` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_items`
--
-- Creación: 17-10-2024 a las 19:29:55
--

CREATE TABLE `pedido_items` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` varchar(10) DEFAULT NULL,
  `productos_generales_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--
-- Creación: 16-10-2024 a las 17:53:21
--

CREATE TABLE `productos` (
  `talla` varchar(10) NOT NULL,
  `tipo_huevo` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `cantidad_por_caja` int(11) NOT NULL,
  `precio_unidad` decimal(10,2) NOT NULL,
  `precio_caja` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`talla`, `tipo_huevo`, `color`, `cantidad_por_caja`, `precio_unidad`, `precio_caja`, `stock`, `created_at`, `updated_at`) VALUES
('A', 'Codorniz', 'Blanco', 9, 400.00, 12000.00, 24, '2024-10-17 00:50:04', '2024-11-02 14:55:29'),
('AA', 'Normal', 'Café', 12, 800.00, 16000.00, 23, '2024-10-17 16:37:38', '2024-10-17 16:37:38'),
('AAA', 'Criollo', 'Blanco', 15, 800.00, 20000.00, 24, '2024-10-17 17:21:13', '2024-11-02 14:55:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_generales`
--
-- Creación: 17-10-2024 a las 12:26:24
--

CREATE TABLE `productos_generales` (
  `id` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `cantidad_por_unidad` int(11) DEFAULT NULL,
  `precio_unidad` decimal(10,2) NOT NULL,
  `precio_caja` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `unidad_medida` varchar(10) DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 16-10-2024 a las 17:48:46
--

CREATE TABLE `usuarios` (
  `documento` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `tipo_usuario` enum('cliente','admin') DEFAULT 'cliente',
  `contrasena` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`documento`, `nombre`, `apellidos`, `correo`, `telefono`, `direccion`, `tipo_usuario`, `contrasena`, `created_at`, `updated_at`) VALUES
('1013106626', 'Patrick Steven', 'Sierra Castro', 'sierrap128@gmail.com', '3017245509', 'cl 18 #9-39', 'cliente', '$2y$10$/mXbdh6uDN0hccSoycE0c.0iSgRFj.9kPCjVrz9RhJXYOcc38CZoa', '2024-10-18 14:44:39', '2024-10-18 14:44:39'),
('1028840419', 'Ailyn', 'Rubio Quiroz', 'ailynrubio@gmail.com', '3003259881', 'cr. 79 c bis #58 l 11 norte', 'admin', '$2y$10$tvAYVwctKjKXB4siMtEQq.yJWmFA.h3kr8oxd7LLCBBE6ndwt7VXC', '2024-10-17 14:56:36', '2025-05-21 14:59:24'),
('1028869271', 'Maria Fernanda', 'Rodriguez Alvarado ', 'pulido@gmail.com', '3227111001', 'cr. 87 m #59-52 sur', 'cliente', '$2y$10$.CW8pWzaM9wWq1kzRo1EZuRBJ.Kyo85fCDYg5XLPbNk9jYGgKHBai', '2024-10-18 14:16:52', '2024-10-18 14:16:52'),
('1146124300', 'andres', 'macias', 'amcias@gmail.com', '3202553811', 'cl 66b #7876', 'cliente', '$2y$10$OG9ISLG.WIg9G40jq8EEReYxs3W181mhHZLfX0qNc/.grchtltWDq', '2024-10-17 19:52:49', '2024-10-17 19:52:49'),
('1146124409', 'Yineeth', 'Arce Beltran', 'arcecharon4b@gmail.com', '3138866384', 'cr. 87 m #59-52 sur', 'admin', '1146124409CA', '2024-10-17 17:22:58', '2025-05-21 17:05:23'),
('18502439', 'Luis Fernando', 'Agudelo', 'contalfa@hotmail.com', '3118650656', 'cll 10  80 f - 40', 'cliente', '$2y$10$/pIbwjf/NaCmELoXfV6lsO9ZAeJ5h0iT5VPUiNTifWRdoNNj7G.S.', '2024-10-18 16:23:38', '2024-10-18 16:23:38'),
('19457294', 'Rosemberg', 'Muñoz Parra', 'juanrubio2277@gmail.com', '3144514103', 'cll 52 #87J 20', 'cliente', '$2y$10$h4NCjqIRd1o.yqZZC47LKOAxHwAPV3awueCDBKpBoLhcDWS0/ImOK', '2024-11-02 15:26:36', '2024-11-02 15:34:11'),
('52757950', 'Adriana', 'Rios Huertas', 'adriana.r28@hotmail.com', '3202887181', 'diagonal 64 sur 86 a 50', 'cliente', '$2y$10$0gtwvZlwr52GRvBr1jpprOMJC6fLKmX/dSvq1LuYWQ.LVFx3tJAyO', '2024-10-18 14:31:57', '2024-10-18 14:31:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `fk_carrito_producto_general` (`id_producto_general`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `fk_detalles_pedido_producto_generales` (`id_producto_generales`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `productos_generales_id` (`productos_generales_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`talla`);

--
-- Indices de la tabla `productos_generales`
--
ALTER TABLE `productos_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`documento`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`documento`),
  ADD CONSTRAINT `fk_carrito_producto_general` FOREIGN KEY (`id_producto_general`) REFERENCES `productos_generales` (`id`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_detalles_pedido_producto_generales` FOREIGN KEY (`id_producto_generales`) REFERENCES `productos_generales` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`documento`);

--
-- Filtros para la tabla `pedido_items`
--
ALTER TABLE `pedido_items`
  ADD CONSTRAINT `pedido_items_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedido_items_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`talla`),
  ADD CONSTRAINT `pedido_items_ibfk_3` FOREIGN KEY (`productos_generales_id`) REFERENCES `productos_generales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
