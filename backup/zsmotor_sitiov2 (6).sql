-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2017 at 09:47 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zsmotor_sitiov2`
--

-- --------------------------------------------------------

--
-- Table structure for table `sitio_administradores`
--

CREATE TABLE `sitio_administradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perfil_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(200) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_administradores`
--

INSERT INTO `sitio_administradores` (`id`, `perfil_id`, `nombre`, `email`, `clave`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 1, 'Sistemas Reach Latam', 'sistemas@reach-latam.com', '090bab43b805379aec218a4ac399ba13efa627b8', 1, 0, '2017-11-12 01:11:18', '2017-11-23 16:16:18');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_banners`
--

CREATE TABLE `sitio_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `programado` tinyint(1) UNSIGNED DEFAULT '0',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_termino` datetime DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `orden` int(10) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_campo_paginas`
--

CREATE TABLE `sitio_campo_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pagina_id` bigint(20) UNSIGNED NOT NULL,
  `identificador` varchar(80) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `valor` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_cargas`
--

CREATE TABLE `sitio_cargas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identificador` varchar(80) NOT NULL,
  `ejecutando` tinyint(1) UNSIGNED DEFAULT '1',
  `error` tinyint(1) UNSIGNED DEFAULT '0',
  `ultimo_mensaje` text,
  `productos_total` int(10) UNSIGNED DEFAULT '0',
  `productos_nuevos` int(10) UNSIGNED DEFAULT '0',
  `productos_modificados` int(10) UNSIGNED DEFAULT '0',
  `productos_eliminados` int(10) UNSIGNED DEFAULT '0',
  `manual` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_categorias`
--

CREATE TABLE `sitio_categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `slug_full` varchar(80) NOT NULL,
  `producto_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `privado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_categorias`
--

INSERT INTO `sitio_categorias` (`id`, `parent_id`, `nombre`, `slug`, `slug_full`, `producto_count`, `activo`, `eliminado`, `privado`, `created`, `modified`) VALUES
(1, 0, 'Llantas', 'llantas', 'llantas', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00'),
(2, 0, 'Neumáticos', 'neumaticos', 'neumaticos', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00'),
(3, 0, 'Accesorios', 'accesorios', 'accesorios', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00'),
(4, 3, 'Iluminacion', 'iluminacion', 'iluminacion', 0, 1, 0, 0, NULL, NULL),
(5, 3, 'Tuning', 'tuning', 'tuning', 0, 1, 0, 0, NULL, NULL),
(6, 3, 'Accesorios Interior', 'accesorios-interior', 'accesorios-interior', 0, 1, 0, 0, NULL, NULL),
(7, 3, 'Tecnologia', 'tecnologia', 'tecnologia', 0, 1, 0, 0, NULL, NULL),
(8, 3, 'Proteccion Y Seguridad', 'proteccion-y-seguridad', 'proteccion-y-seguridad', 0, 1, 0, 0, NULL, NULL),
(9, 3, 'Off Road', 'off-road', 'off-road', 0, 1, 0, 0, NULL, NULL),
(10, 3, 'Carros De Arrastre', 'carros-de-arrastre', 'carros-de-arrastre', 0, 1, 0, 0, NULL, NULL),
(11, 3, 'Thule', 'thule', 'thule', 0, 1, 0, 0, NULL, NULL),
(12, 3, 'Repuestos', 'repuestos', 'repuestos', 0, 1, 0, 0, NULL, NULL),
(13, 3, 'Herramientas', 'herramientas', 'herramientas', 0, 1, 0, 0, NULL, NULL),
(14, 3, 'Encendidos', 'encendidos', 'encendidos', 0, 1, 0, 0, NULL, NULL),
(15, 3, 'Detailing', 'detailing', 'detailing', 0, 1, 0, 0, NULL, NULL),
(16, 3, 'Audio Y Video', 'audio-y-video', 'audio-y-video', 0, 1, 0, 0, NULL, NULL),
(17, 3, 'Accecorios Para Motos', 'accecorios-para-motos', 'accecorios-para-motos', 0, 1, 0, 0, NULL, NULL),
(18, 3, 'Accesorios Llantas', 'accesorios-llantas', 'accesorios-llantas', 0, 1, 0, 0, NULL, NULL),
(19, 3, 'Accesorios Exterior', 'accesorios-exterior', 'accesorios-exterior', 0, 1, 0, 0, NULL, NULL),
(20, 3, 'Supfam Otros', 'supfam-otros', 'supfam-otros', 0, 1, 0, 0, NULL, NULL),
(21, 3, 'Error Inventario', 'error-inventario', 'error-inventario', 0, 1, 0, 0, NULL, NULL),
(22, 3, 'Meguiars', 'meguiars', 'meguiars', 0, 1, 0, 0, NULL, NULL),
(23, 3, 'Servicios', 'servicios', 'servicios', 0, 1, 0, 0, NULL, NULL),
(24, 3, 'Insumos Bodega', 'insumos-bodega', 'insumos-bodega', 0, 1, 0, 0, NULL, NULL),
(25, 3, 'Activo Fijo', 'activo-fijo', 'activo-fijo', 0, 1, 0, 0, NULL, NULL),
(26, 3, 'Construccion Pudahuel', 'construccion-pudahuel', 'construccion-pudahuel', 0, 1, 0, 0, NULL, NULL),
(27, 3, 'Aceites/liquidos/quimicos', 'aceites-liquidos-quimicos', 'aceites-liquidos-quimicos', 0, 1, 0, 0, NULL, NULL),
(28, 3, 'Gastos x compras y similares  ', '', '', 0, 1, 0, 0, NULL, NULL),
(29, 5, 'Volantes Y Acc', 'volantes-y-acc', 'volantes-y-acc', 0, 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_categoria_paginas`
--

CREATE TABLE `sitio_categoria_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_clientes`
--

CREATE TABLE `sitio_clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` varchar(80) DEFAULT NULL,
  `modified` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_compras`
--

CREATE TABLE `sitio_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `estado_compra_id` bigint(20) UNSIGNED NOT NULL,
  `retiro_sucursal` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `direccion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sucursal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `valor_despacho` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `despacho_gratis` tinyint(1) UNSIGNED DEFAULT '0',
  `total_descuentos` int(10) UNSIGNED DEFAULT '0',
  `total` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pagado` tinyint(1) UNSIGNED DEFAULT '0',
  `aceptado` tinyint(1) UNSIGNED DEFAULT '0',
  `reversado` tinyint(1) UNSIGNED DEFAULT '0',
  `tbk_orden_compra` varchar(26) DEFAULT NULL,
  `tbk_tipo_transaccion` varchar(50) DEFAULT NULL,
  `tbk_respuesta` int(2) DEFAULT NULL,
  `tbk_monto` int(10) DEFAULT NULL,
  `tbk_codigo_autorizacion` varchar(6) DEFAULT NULL,
  `tbk_final_numero_tarjeta` int(4) DEFAULT NULL,
  `tbk_fecha_contable` int(4) DEFAULT NULL,
  `tbk_fecha_transaccion` varchar(255) DEFAULT NULL,
  `tbk_hora_transaccion` int(6) DEFAULT NULL,
  `tbk_id_sesion` varchar(61) DEFAULT NULL,
  `tbk_id_transaccion` varchar(255) DEFAULT NULL,
  `tbk_tipo_pago` varchar(2) DEFAULT NULL,
  `tbk_numero_cuotas` int(2) DEFAULT NULL,
  `tbk_vci` varchar(3) DEFAULT NULL,
  `tbk_mac` text,
  `created` varchar(255) DEFAULT NULL,
  `modified` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_compras`
--

INSERT INTO `sitio_compras` (`id`, `usuario_id`, `estado_compra_id`, `retiro_sucursal`, `direccion_id`, `sucursal_id`, `subtotal`, `valor_despacho`, `despacho_gratis`, `total_descuentos`, `total`, `pagado`, `aceptado`, `reversado`, `tbk_orden_compra`, `tbk_tipo_transaccion`, `tbk_respuesta`, `tbk_monto`, `tbk_codigo_autorizacion`, `tbk_final_numero_tarjeta`, `tbk_fecha_contable`, `tbk_fecha_transaccion`, `tbk_hora_transaccion`, `tbk_id_sesion`, `tbk_id_transaccion`, `tbk_tipo_pago`, `tbk_numero_cuotas`, `tbk_vci`, `tbk_mac`, `created`, `modified`) VALUES
(1, 1, 4, 0, 1, NULL, 145306, 0, 0, 0, 145306, 1, 1, 0, '20171122184822314', 'TR_NORMAL_WS', 0, 145306, '1213', 6623, NULL, '2017-11-22T18:48:21.571-03:00', NULL, NULL, 'ee13d7671e993d68424800f3b12119dc18759779ee5e1a33537157f10ec09581', 'VD', 0, 'TSY', NULL, '20171122 18:48:19', '1511387318'),
(2, 1, 4, 0, 1, NULL, 72653, 0, 0, 0, 72653, 1, 1, 0, '20171123091312324', 'TR_NORMAL_WS', 0, 72653, '1213', 6623, NULL, '2017-11-23T09:13:11.875-03:00', NULL, NULL, 'ec2e1e485d05bceefb497d2132aaa1eaa6496947a2e3563690e4a95aa7d27ecd', 'VD', 0, 'TSY', NULL, '20171123 09:13:07', '1511439210'),
(3, 1, 4, 0, 1, NULL, 72653, 0, 0, 0, 72653, 1, 1, 0, '20171123092541429', 'TR_NORMAL_WS', 0, 72653, '1213', 6623, NULL, '2017-11-23T09:25:41.309-03:00', NULL, NULL, 'ed34367544e79692238f5903921fa5f61bffcc802d03206ec6cf061b041eb583', 'VD', 0, 'TSY', NULL, '20171123 09:25:01', '1511439958'),
(4, 1, 4, 0, 1, NULL, 72653, 0, 0, 0, 72653, 1, 1, 0, '20171123092956601', 'TR_NORMAL_WS', 0, 72653, '1213', 6623, NULL, '2017-11-23T09:29:56.035-03:00', NULL, NULL, 'ecf2c1143f335d872531f16f0e4dc1f6e49d3068fd83aa5c75e4b897770a955d', 'VD', 0, 'TSY', NULL, '20171123 09:29:52', '1511440212'),
(5, 1, 4, 0, 1, NULL, 72653, 0, 0, 0, 72653, 1, 1, 0, '20171123093255426', 'TR_NORMAL_WS', 0, 72653, '1213', 6623, NULL, '2017-11-23T09:32:54.820-03:00', NULL, NULL, 'e7e13c83eb830089bc9b048ed3c8d5a51a556ebf734cbcc35b3237faf7d6c6d2', 'VD', 0, 'TSY', NULL, '20171123 09:32:51', '1511440392'),
(6, 2, 4, 0, 2, NULL, 72653, 0, 0, 0, 72653, 1, 1, 0, '20171123094031744', 'TR_NORMAL_WS', 0, 72653, '1213', 6623, NULL, '2017-11-23T09:40:31.330-03:00', NULL, NULL, 'e518ed3ba66dff19eaae782c4195d4dc9e1657b46b8affad1d6503d3f90b817c', 'VD', 0, 'TSY', NULL, '20171123 09:40:20', '1511440848'),
(7, 2, 1, 0, 2, NULL, 72653, 0, 0, 0, 72653, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20171123 09:41:27', '20171123 09:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_comunas`
--

CREATE TABLE `sitio_comunas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_comunas`
--

INSERT INTO `sitio_comunas` (`id`, `nombre`, `region_id`, `activo`) VALUES
(1, 'ARICA', 15, 1),
(2, 'IQUIQUE', 1, 1),
(3, 'HUARA', 1, 1),
(4, 'PICA', 1, 1),
(5, 'POZO ALMONTE', 1, 1),
(6, 'TOCOPILLA', 2, 1),
(7, 'ANTOFAGASTA', 2, 1),
(8, 'MEJILLONES', 2, 1),
(9, 'TALTAL', 2, 1),
(10, 'CALAMA', 2, 1),
(11, 'CHAÑARAL', 3, 1),
(12, 'DIEGO DE ALMAGRO', 3, 1),
(13, 'COPIAPO', 3, 1),
(14, 'CALDERA', 3, 1),
(15, 'TIERRA AMARILLA', 3, 1),
(16, 'VALLENAR', 3, 1),
(17, 'FREIRINA', 3, 1),
(18, 'HUASCO', 3, 1),
(19, 'LA SERENA', 4, 1),
(20, 'LA HIGUERA', 4, 1),
(21, 'COQUIMBO', 4, 1),
(22, 'ANDACOLLO', 4, 1),
(23, 'VICUÑA', 4, 1),
(24, 'PAIHUANO', 4, 1),
(25, 'OVALLE', 4, 1),
(26, 'MONTE PATRIA', 4, 1),
(27, 'PUNITAQUI', 4, 1),
(28, 'RIO HURTADO', 4, 1),
(29, 'COMBARBALA', 4, 1),
(30, 'ILLAPEL', 4, 1),
(31, 'CANELA', 4, 1),
(32, 'SALAMANCA', 4, 1),
(33, 'LOS VILOS', 4, 1),
(34, 'VALPARAISO', 5, 1),
(35, 'QUINTERO', 5, 1),
(36, 'PUCHUNCAVI', 5, 1),
(37, 'VIÑA DEL MAR', 5, 1),
(38, 'QUILPUE', 5, 1),
(39, 'VILLA ALEMANA', 5, 1),
(40, 'CASABLANCA', 5, 1),
(41, 'ISLA DE PASCUA', 5, 1),
(42, 'SAN ANTONIO', 5, 1),
(43, 'SANTO DOMINGO', 5, 1),
(44, 'ALGARROBO', 5, 1),
(45, 'EL QUISCO', 5, 1),
(46, 'CARTAGENA', 5, 1),
(47, 'EL TABO', 5, 1),
(48, 'QUILLOTA', 5, 1),
(49, 'LA CRUZ', 5, 1),
(50, 'LA CALERA', 5, 1),
(51, 'HIJUELAS', 5, 1),
(52, 'NOGALES', 5, 1),
(53, 'LIMACHE', 5, 1),
(54, 'OLMUE', 5, 1),
(55, 'PETORCA', 5, 1),
(56, 'CABILDO', 5, 1),
(57, 'PAPUDO', 5, 1),
(58, 'ZAPALLAR', 5, 1),
(59, 'LA LIGUA', 5, 1),
(60, 'SAN FELIPE', 5, 1),
(61, 'PUTAENDO', 5, 1),
(62, 'PANQUEHUE', 5, 1),
(63, 'CATEMU', 5, 1),
(64, 'SANTA MARIA', 5, 1),
(65, 'LLAY LLAY', 5, 1),
(66, 'LOS ANDES', 5, 1),
(67, 'CALLE LARGA', 5, 1),
(68, 'RINCONADA', 5, 1),
(69, 'SAN ESTEBAN', 5, 1),
(70, 'SANTIAGO', 13, 1),
(71, 'LAS CONDES', 13, 1),
(72, 'PROVIDENCIA', 13, 1),
(75, 'CONCHALI', 13, 1),
(76, 'COLINA', 13, 1),
(77, 'RENCA', 13, 1),
(78, 'LAMPA', 13, 1),
(79, 'QUILICURA', 13, 1),
(80, 'TIL-TIL', 13, 1),
(81, 'QUINTA NORMAL', 13, 1),
(82, 'PUDAHUEL', 13, 1),
(83, 'CURACAVI', 13, 1),
(85, 'PEÑAFLOR', 13, 1),
(86, 'TALAGANTE', 13, 1),
(87, 'ISLA DE MAIPO', 13, 1),
(88, 'MELIPILLA', 13, 1),
(89, 'EL MONTE', 13, 1),
(90, 'MARIA PINTO', 13, 1),
(91, 'ÑUÑOA', 13, 1),
(92, 'LA REINA', 13, 1),
(93, 'LA FLORIDA', 13, 1),
(94, 'MAIPU', 13, 1),
(95, 'SAN MIGUEL', 13, 1),
(96, 'LA CISTERNA', 13, 1),
(97, 'LA GRANJA', 13, 1),
(98, 'SAN BERNARDO', 13, 1),
(99, 'CALERA DE TANGO', 13, 1),
(100, 'PUENTE ALTO', 13, 1),
(101, 'PIRQUE', 13, 1),
(102, 'SAN JOSE DE MAIPO', 13, 1),
(103, 'BUIN', 13, 1),
(104, 'PAINE', 13, 1),
(105, 'RANCAGUA', 6, 1),
(106, 'MACHALI', 6, 1),
(107, 'GRANEROS', 6, 1),
(108, 'SAN PEDRO', 13, 1),
(109, 'ALHUE', 13, 1),
(110, 'CODEGUA', 6, 1),
(111, 'SAN FRANCISCO DE MOSTAZAL', 6, 1),
(112, 'DOÑIHUE', 6, 1),
(113, 'COLTAUCO', 6, 1),
(114, 'COINCO', 6, 1),
(115, 'PEUMO', 6, 1),
(116, 'LAS CABRAS', 6, 1),
(117, 'SAN VICENTE', 6, 1),
(118, 'PICHIDEGUA', 6, 1),
(119, 'REQUINOA', 6, 1),
(120, 'OLIVAR', 6, 1),
(121, 'RENGO', 6, 1),
(122, 'MALLOA', 6, 1),
(123, 'QUINTA DE TILCOCO', 6, 1),
(124, 'SAN FERNANDO', 6, 1),
(125, 'CHIMBARONGO', 6, 1),
(126, 'NANCAGUA', 6, 1),
(127, 'PLACILLA', 6, 1),
(128, 'SANTA CRUZ', 6, 1),
(129, 'LOLOL', 6, 1),
(130, 'PALMILLA', 6, 1),
(131, 'PERALILLO', 6, 1),
(132, 'CHEPICA', 6, 1),
(133, 'PAREDONES', 6, 1),
(134, 'MARCHIGUE', 6, 1),
(135, 'PUMANQUE', 6, 1),
(136, 'LITUECHE', 6, 1),
(137, 'PICHILEMU', 6, 1),
(138, 'NAVIDAD', 6, 1),
(139, 'LA ESTRELLA', 6, 1),
(140, 'CURICO', 7, 1),
(141, 'ROMERAL', 7, 1),
(142, 'TENO', 7, 1),
(143, 'RAUCO', 7, 1),
(144, 'HUALAÑE', 7, 1),
(145, 'LICANTEN', 7, 1),
(146, 'VICHUQUEN', 7, 1),
(147, 'MOLINA', 7, 1),
(148, 'SAGRADA FAMILIA', 7, 1),
(149, 'RIO CLARO', 7, 1),
(150, 'TALCA', 7, 1),
(151, 'SAN CLEMENTE', 7, 1),
(152, 'PELARCO', 7, 1),
(153, 'PENCAHUE', 7, 1),
(154, 'MAULE', 7, 1),
(155, 'CUREPTO', 7, 1),
(156, 'SAN JAVIER', 7, 1),
(157, 'CONSTITUCION', 7, 1),
(158, 'EMPEDRADO', 7, 1),
(159, 'LINARES', 7, 1),
(160, 'YERBAS BUENAS', 7, 1),
(161, 'COLBUN', 7, 1),
(162, 'LONGAVI', 7, 1),
(163, 'VILLA ALEGRE', 7, 1),
(164, 'PARRAL', 7, 1),
(165, 'RETIRO', 7, 1),
(166, 'CAUQUENES', 7, 1),
(167, 'CHANCO', 7, 1),
(168, 'CHILLAN', 8, 1),
(169, 'PINTO', 8, 1),
(170, 'COIHUECO', 8, 1),
(171, 'PORTEZUELO', 8, 1),
(172, 'QUIRIHUE', 8, 1),
(173, 'TREHUACO', 8, 1),
(174, 'NINHUE', 8, 1),
(175, 'COBQUECURA', 8, 1),
(176, 'SAN CARLOS', 8, 1),
(177, 'SAN GREGORIO DE ÑIQUEN', 8, 1),
(178, 'SAN FABIAN', 8, 1),
(179, 'SAN NICOLAS', 8, 1),
(180, 'BULNES', 8, 1),
(181, 'SAN IGNACIO', 8, 1),
(182, 'QUILLON', 8, 1),
(183, 'YUNGAY', 8, 1),
(184, 'PEMUCO', 8, 1),
(185, 'EL CARMEN', 8, 1),
(186, 'COELEMU', 8, 1),
(187, 'RANQUIL', 8, 1),
(188, 'CONCEPCION', 8, 1),
(189, 'TALCAHUANO', 8, 1),
(190, 'TOME', 8, 1),
(191, 'PENCO', 8, 1),
(192, 'HUALQUI', 8, 1),
(193, 'FLORIDA', 8, 1),
(194, 'CORONEL', 8, 1),
(195, 'LOTA', 8, 1),
(196, 'SANTA JUANA', 8, 1),
(197, 'CURANILAHUE', 8, 1),
(198, 'ARAUCO', 8, 1),
(199, 'LEBU', 8, 1),
(200, 'LOS ALAMOS', 8, 1),
(201, 'CAÑETE', 8, 1),
(202, 'CONTULMO', 8, 1),
(203, 'TIRUA', 8, 1),
(204, 'LOS ANGELES', 8, 1),
(205, 'SANTA BARBARA', 8, 1),
(206, 'QUILLECO', 8, 1),
(207, 'YUMBEL', 8, 1),
(208, 'CABRERO', 8, 1),
(209, 'TUCAPEL', 8, 1),
(210, 'LAJA', 8, 1),
(211, 'SAN ROSENDO', 8, 1),
(212, 'NACIMIENTO', 8, 1),
(213, 'NEGRETE', 8, 1),
(214, 'MULCHEN', 8, 1),
(215, 'QUILACO', 8, 1),
(216, 'ANGOL', 9, 1),
(217, 'PUREN', 9, 1),
(218, 'LOS SAUCES', 9, 1),
(219, 'RENAICO', 9, 1),
(220, 'COLLIPULLI', 9, 1),
(221, 'ERCILLA', 9, 1),
(222, 'TRAIGUEN', 9, 1),
(223, 'LUMACO', 9, 1),
(224, 'VICTORIA', 9, 1),
(225, 'CURACAUTIN', 9, 1),
(226, 'LONQUIMAY', 9, 1),
(227, 'TEMUCO', 9, 1),
(228, 'VILCUN', 9, 1),
(229, 'FREIRE', 9, 1),
(230, 'CUNCO', 9, 1),
(231, 'LAUTARO', 9, 1),
(232, 'GALVARINO', 9, 1),
(233, 'PERQUENCO', 9, 1),
(234, 'NUEVA IMPERIAL', 9, 1),
(235, 'CARAHUE', 9, 1),
(236, 'PUERTO SAAVEDRA', 9, 1),
(237, 'PITRUFQUEN', 9, 1),
(238, 'GORBEA', 9, 1),
(239, 'TOLTEN', 9, 1),
(240, 'LONCOCHE', 9, 1),
(241, 'VILLARRICA', 9, 1),
(242, 'PUCON', 9, 1),
(243, 'VALDIVIA', 14, 1),
(244, 'CORRAL', 14, 1),
(245, 'MARIQUINA', 14, 1),
(246, 'MAFIL', 14, 1),
(247, 'LOS LAGOS', 14, 1),
(248, 'FUTRONO', 14, 1),
(249, 'LANCO', 14, 1),
(250, 'PANGUIPULLI', 14, 1),
(251, 'LA UNION', 14, 1),
(252, 'PAILLACO', 14, 1),
(253, 'RIO BUENO', 14, 1),
(254, 'LAGO RANCO', 14, 1),
(255, 'OSORNO', 10, 1),
(256, 'PUYEHUE', 10, 1),
(257, 'SAN PABLO', 10, 1),
(258, 'PUERTO OCTAY', 10, 1),
(259, 'RIO NEGRO', 10, 1),
(260, 'PURRANQUE', 10, 1),
(261, 'PUERTO MONTT', 10, 1),
(262, 'COCHAMO', 10, 1),
(263, 'MAULLIN', 10, 1),
(264, 'LOS MUERMOS', 10, 1),
(265, 'CALBUCO', 10, 1),
(266, 'PUERTO VARAS', 10, 1),
(267, 'LLANQUIHUE', 10, 1),
(268, 'FRESIA', 10, 1),
(269, 'FRUTILLAR', 10, 1),
(270, 'CASTRO', 10, 1),
(271, 'CHONCHI', 10, 1),
(272, 'QUEILEN', 10, 1),
(273, 'QUELLON', 10, 1),
(274, 'PUQUELDON', 10, 1),
(275, 'QUINCHAO', 10, 1),
(276, 'CURACO DE VELEZ', 10, 1),
(277, 'ANCUD', 10, 1),
(278, 'QUEMCHI', 10, 1),
(279, 'DALCAHUE', 10, 1),
(280, 'CHAITEN', 10, 1),
(281, 'FUTALEUFU', 10, 1),
(282, 'PALENA', 10, 1),
(284, 'COYHAIQUE', 11, 1),
(285, 'AYSEN', 11, 1),
(286, 'CISNES', 11, 1),
(287, 'CHILE CHICO', 11, 1),
(288, 'RIO IBAÑEZ', 11, 1),
(289, 'COCHRANE', 11, 1),
(290, 'PUNTA ARENAS', 12, 1),
(291, 'PUERTO NATALES', 12, 1),
(292, 'PORVENIR', 12, 1),
(293, 'GENERAL LAGOS', 15, 1),
(294, 'PUTRE', 15, 1),
(295, 'CAMARONES', 15, 1),
(296, 'CAMINA', 1, 1),
(297, 'COLCHANE', 1, 1),
(298, 'MARIA ELENA', 2, 1),
(299, 'SIERRA GORDA', 2, 1),
(300, 'OLLAGÜE', 2, 1),
(301, 'SAN PEDRO DE ATACAMA', 2, 1),
(302, 'ALTO DEL CARMEN', 3, 1),
(303, 'ANTUCO', 8, 1),
(304, 'MELIPEUCO', 9, 1),
(305, 'CURARREHUE', 9, 1),
(306, 'TEODORO SCHMIDT', 9, 1),
(307, 'SAN JUAN DE LA COSTA', 10, 1),
(308, 'HUALAIHUE', 10, 1),
(309, 'GUAITECAS', 11, 1),
(310, 'O´HIGGINS', 11, 1),
(311, 'TORTEL', 11, 1),
(312, 'LAGO VERDE', 11, 1),
(313, 'TORRES DEL PAINE', 12, 1),
(314, 'RIO VERDE', 12, 1),
(315, 'SAN GREGORIO', 12, 1),
(316, 'LAGUNA BLANCA', 12, 1),
(317, 'PRIMAVERA', 12, 1),
(318, 'TIMAUKEL', 12, 1),
(319, 'NAVARINO', 12, 1),
(320, 'PELLUHUE', 7, 1),
(321, 'JUAN FERNANDEZ', 5, 1),
(322, 'PEÑALOLEN', 13, 1),
(323, 'MACUL', 13, 1),
(324, 'CERRO NAVIA', 13, 1),
(325, 'LO PRADO', 13, 1),
(326, 'SAN RAMON', 13, 1),
(327, 'LA PINTANA', 13, 1),
(328, 'ESTACION CENTRAL', 13, 1),
(329, 'RECOLETA', 13, 1),
(330, 'INDEPENDENCIA', 13, 1),
(331, 'VITACURA', 13, 1),
(332, 'LO BARNECHEA', 13, 1),
(333, 'CERRILLOS', 13, 1),
(334, 'HUECHURABA', 13, 1),
(335, 'SAN JOAQUIN', 13, 1),
(336, 'PEDRO AGUIRRE CERDA', 13, 1),
(337, 'LO ESPEJO', 13, 1),
(338, 'EL BOSQUE', 13, 1),
(339, 'PADRE HURTADO', 13, 1),
(340, 'CONCON', 5, 1),
(341, 'SAN RAFAEL', 7, 1),
(342, 'CHILLAN VIEJO', 8, 1),
(343, 'SAN PEDRO DE LA PAZ', 8, 1),
(344, 'CHIGUAYANTE', 8, 1),
(345, 'PADRE LAS CASAS', 9, 1),
(346, 'ALTO HOSPICIO', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_configuraciones`
--

CREATE TABLE `sitio_configuraciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `identificador` varchar(60) NOT NULL,
  `valor` text NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `oculto` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_detalle_cargas`
--

CREATE TABLE `sitio_detalle_cargas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `carga_id` bigint(20) UNSIGNED NOT NULL,
  `error` tinyint(1) UNSIGNED DEFAULT '0',
  `mensaje` text NOT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_detalle_compras`
--

CREATE TABLE `sitio_detalle_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT '1',
  `precio_unitario` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_detalle_compras`
--

INSERT INTO `sitio_detalle_compras` (`id`, `compra_id`, `producto_id`, `cantidad`, `precio_unitario`, `total`) VALUES
(7, 1, 387, 2, 72653, 145306),
(8, 2, 387, 1, 72653, 72653),
(9, 3, 387, 1, 72653, 72653),
(10, 4, 387, 1, 72653, 72653),
(11, 5, 387, 1, 72653, 72653),
(12, 6, 387, 1, 72653, 72653),
(14, 7, 387, 1, 72653, 72653);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_direcciones`
--

CREATE TABLE `sitio_direcciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_direccion_id` bigint(20) UNSIGNED NOT NULL,
  `comuna_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `calle` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `depto` varchar(20) DEFAULT NULL,
  `codigo_postal` int(7) UNSIGNED NOT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_direcciones`
--

INSERT INTO `sitio_direcciones` (`id`, `usuario_id`, `tipo_direccion_id`, `comuna_id`, `nombre`, `calle`, `numero`, `depto`, `codigo_postal`, `telefono`, `observaciones`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 1, 1, 294, 'Calle 12 12, PUTRE', 'Calle', '12', '12', 1231231, '12312312', '', 1, 0, '2017-11-22 17:31:16', '2017-11-23 09:32:51'),
(2, 2, 1, 342, 'Calle Transbank 123 123, CHILLAN VIEJO', 'Calle Transbank', '123', '123', 1231231, '13123123', '', 1, 0, '2017-11-23 09:40:20', '2017-11-23 09:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_emails`
--

CREATE TABLE `sitio_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `destinatario_email` text,
  `destinatario_nombre` text,
  `remitente_email` text,
  `remitente_nombre` text,
  `cc` text,
  `bcc` text,
  `procesado` tinyint(1) UNSIGNED DEFAULT '0',
  `enviado` tinyint(1) UNSIGNED DEFAULT '0',
  `reintentos` int(10) UNSIGNED DEFAULT '0',
  `html` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_encargado_sucursales`
--

CREATE TABLE `sitio_encargado_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_estado_compras`
--

CREATE TABLE `sitio_estado_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_estado_compras`
--

INSERT INTO `sitio_estado_compras` (`id`, `nombre`, `modified`) VALUES
(1, 'pendiente', NULL),
(2, 'rechazado transbank', NULL),
(3, 'rechazado negocio', NULL),
(4, 'pagado', NULL),
(5, 'anulado', NULL),
(6, 'pendiente pago', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_marcas`
--

CREATE TABLE `sitio_marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `producto_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_marcas`
--

INSERT INTO `sitio_marcas` (`id`, `nombre`, `slug`, `producto_count`, `activo`, `eliminado`, `created`, `modified`) VALUES
(107, 'Safari', 'safari', 0, 1, 0, NULL, NULL),
(108, 'Naonis S.r.l.', 'naonis-s-r-l', 0, 1, 0, NULL, NULL),
(109, 'Sinmarca', 'sinmarca', 0, 1, 0, NULL, NULL),
(110, 'Fangle  Tunning R-1', 'fangle-tunning-r-1', 0, 1, 0, NULL, NULL),
(111, 'Takahara', 'takahara', 0, 1, 0, NULL, NULL),
(112, 'Tactix', 'tactix', 0, 1, 0, NULL, NULL),
(113, 'Hub', 'hub', 0, 1, 0, NULL, NULL),
(114, 'Simota', 'simota', 0, 1, 0, NULL, NULL),
(115, 'Ruian Kangertai', 'ruian-kangertai', 0, 1, 0, NULL, NULL),
(116, 'Auto Gauge', 'auto-gauge', 0, 1, 0, NULL, NULL),
(117, 'Dubai Chile', 'dubai-chile', 0, 1, 0, NULL, NULL),
(118, 'Jinhuiju Car Decoration Compan', 'jinhuiju-car-decoration-compan', 0, 1, 0, NULL, NULL),
(119, 'Import Export Amir Ltda', 'import-export-amir-ltda', 0, 1, 0, NULL, NULL),
(120, 'Zhenjiang Sunworld', 'zhenjiang-sunworld', 0, 1, 0, NULL, NULL),
(121, 'Imagem S.a', 'imagem-s-a', 0, 1, 0, NULL, NULL),
(122, 'Sequoia Pacific', 'sequoia-pacific', 0, 1, 0, NULL, NULL),
(123, 'Zhejiang Yuanzheng', 'zhejiang-yuanzheng', 0, 1, 0, NULL, NULL),
(124, 'Yuan Cheng Auto Accesories', 'yuan-cheng-auto-accesories', 0, 1, 0, NULL, NULL),
(125, 'Ruian Jiabeir', 'ruian-jiabeir', 0, 1, 0, NULL, NULL),
(126, 'Tekmotor', 'tekmotor', 0, 1, 0, NULL, NULL),
(127, 'Ningbo Xinlu Polyurethane', 'ningbo-xinlu-polyurethane', 0, 1, 0, NULL, NULL),
(128, 'Shaft Interprises', 'shaft-interprises', 0, 1, 0, NULL, NULL),
(129, 'Pirelli Neumaticos Chile Ltltd', 'pirelli-neumaticos-chile-ltltd', 0, 1, 0, NULL, NULL),
(130, 'Rottweiler', 'rottweiler', 0, 1, 0, NULL, NULL),
(131, 'Lite-on', 'lite-on', 0, 1, 0, NULL, NULL),
(132, 'Benbawang Automotive Tech', 'benbawang-automotive-tech', 0, 1, 0, NULL, NULL),
(133, 'Bancon', 'bancon', 0, 1, 0, NULL, NULL),
(134, 'Jsl Car', 'jsl-car', 0, 1, 0, NULL, NULL),
(135, 'King Cobra', 'king-cobra', 0, 1, 0, NULL, NULL),
(136, 'Emasa S.a', 'emasa-s-a', 0, 1, 0, NULL, NULL),
(137, 'Yang Huainternacional Tra', 'yang-huainternacional-tra', 0, 1, 0, NULL, NULL),
(138, 'Black&decker', 'black-decker', 0, 1, 0, NULL, NULL),
(139, 'Wanli', 'wanli', 0, 1, 0, NULL, NULL),
(140, 'Desity Traffic', 'desity-traffic', 0, 1, 0, NULL, NULL),
(141, 'Guangzhou Winfor', 'guangzhou-winfor', 0, 1, 0, NULL, NULL),
(142, 'Henan Hualei Auto', 'henan-hualei-auto', 0, 1, 0, NULL, NULL),
(143, 'Tradesman Truck', 'tradesman-truck', 0, 1, 0, NULL, NULL),
(144, 'Foshan Zhihui Metal', 'foshan-zhihui-metal', 0, 1, 0, NULL, NULL),
(145, 'Tower Popular Industrial', 'tower-popular-industrial', 0, 1, 0, NULL, NULL),
(146, 'King Rack Industrial Co', 'king-rack-industrial-co', 0, 1, 0, NULL, NULL),
(147, 'Qee', 'qee', 0, 1, 0, NULL, NULL),
(148, 'Macrotel S.a', 'macrotel-s-a', 0, 1, 0, NULL, NULL),
(149, 'Momo Tires', 'momo-tires', 0, 1, 0, NULL, NULL),
(150, 'Continental', 'continental', 0, 1, 0, NULL, NULL),
(151, 'Rydanz', 'rydanz', 0, 1, 0, NULL, NULL),
(152, 'Neumaticos Sunny', 'neumaticos-sunny', 0, 1, 0, NULL, NULL),
(153, 'Neumaticos Durun', 'neumaticos-durun', 0, 1, 0, NULL, NULL),
(154, 'Bct', 'bct', 0, 1, 0, NULL, NULL),
(155, 'Maxxis', 'maxxis', 0, 1, 0, NULL, NULL),
(156, 'Nexen', 'nexen', 0, 1, 0, NULL, NULL),
(157, 'Hifly', 'hifly', 0, 1, 0, NULL, NULL),
(158, 'Michelin', 'michelin', 0, 1, 0, NULL, NULL),
(159, 'Dunlop', 'dunlop', 0, 1, 0, NULL, NULL),
(160, 'Neumaticos Ling Long', 'neumaticos-ling-long', 0, 1, 0, NULL, NULL),
(161, 'Nitto', 'nitto', 0, 1, 0, NULL, NULL),
(162, 'Ilink', 'ilink', 0, 1, 0, NULL, NULL),
(163, 'Goodride', 'goodride', 0, 1, 0, NULL, NULL),
(164, 'Triangle', 'triangle', 0, 1, 0, NULL, NULL),
(165, 'Runway', 'runway', 0, 1, 0, NULL, NULL),
(166, 'Qingdao Zeal-line', 'qingdao-zeal-line', 0, 1, 0, NULL, NULL),
(167, 'Thule', 'thule', 0, 1, 0, NULL, NULL),
(168, 'Malco Products', 'malco-products', 0, 1, 0, NULL, NULL),
(169, 'Repnac', 'repnac', 0, 1, 0, NULL, NULL),
(170, 'Riveros Saic', 'riveros-saic', 0, 1, 0, NULL, NULL),
(171, 'Bosch', 'bosch', 0, 1, 0, NULL, NULL),
(172, 'Bubba Autoparts', 'bubba-autoparts', 0, 1, 0, NULL, NULL),
(173, 'C Denham', 'c-denham', 0, 1, 0, NULL, NULL),
(174, 'Mann', 'mann', 0, 1, 0, NULL, NULL),
(175, 'Lucas Blandford', 'lucas-blandford', 0, 1, 0, NULL, NULL),
(176, 'Motorcraft', 'motorcraft', 0, 1, 0, NULL, NULL),
(177, 'Neumachile', 'neumachile', 0, 1, 0, NULL, NULL),
(178, 'Dacar Baterias', 'dacar-baterias', 0, 1, 0, NULL, NULL),
(179, 'Kyb', 'kyb', 0, 1, 0, NULL, NULL),
(180, 'Aceites Atm', 'aceites-atm', 0, 1, 0, NULL, NULL),
(181, 'FIRMA  MAIL ', 'firma-mail', 0, 0, 0, NULL, NULL),
(182, 'Mobil', 'mobil', 0, 1, 0, NULL, NULL),
(183, 'Amalie', 'amalie', 0, 1, 0, NULL, NULL),
(184, 'Kumho', 'kumho', 0, 1, 0, NULL, NULL),
(185, 'Haida', 'haida', 0, 1, 0, NULL, NULL),
(186, 'Sumitomo', 'sumitomo', 0, 1, 0, NULL, NULL),
(187, 'Goodyear', 'goodyear', 0, 1, 0, NULL, NULL),
(188, 'Windforce', 'windforce', 0, 1, 0, NULL, NULL),
(189, 'Zeta  Ztr', 'zeta-ztr', 0, 1, 0, NULL, NULL),
(190, 'Westlake', 'westlake', 0, 1, 0, NULL, NULL),
(191, 'Pace', 'pace', 0, 1, 0, NULL, NULL),
(192, 'Yokohama', 'yokohama', 0, 1, 0, NULL, NULL),
(193, 'Sonar', 'sonar', 0, 1, 0, NULL, NULL),
(194, 'Ceat', 'ceat', 0, 1, 0, NULL, NULL),
(195, 'Hankook', 'hankook', 0, 1, 0, NULL, NULL),
(196, 'Doblestar', 'doblestar', 0, 1, 0, NULL, NULL),
(197, 'Zhejaing Baokang Wheel', 'zhejaing-baokang-wheel', 0, 1, 0, NULL, NULL),
(198, 'Neum./llanats Pacifico', 'neum-llanats-pacifico', 0, 1, 0, NULL, NULL),
(199, 'Ningbo Motor  Zumbowh', 'ningbo-motor-zumbowh', 0, 1, 0, NULL, NULL),
(200, 'Kaiping Foreing Commercial', 'kaiping-foreing-commercial', 0, 1, 0, NULL, NULL),
(201, 'American Racing Wheel Pros', 'american-racing-wheel-pros', 0, 1, 0, NULL, NULL),
(202, 'Zhong', 'zhong', 0, 1, 0, NULL, NULL),
(203, 'Zhao Hermano', 'zhao-hermano', 0, 1, 0, NULL, NULL),
(204, 'Js International Trading', 'js-international-trading', 0, 1, 0, NULL, NULL),
(205, 'Zhejiang Putian Integrated Hou', 'zhejiang-putian-integrated-hou', 0, 1, 0, NULL, NULL),
(206, 'Guangzhou Liancheng', 'guangzhou-liancheng', 0, 1, 0, NULL, NULL),
(207, 'Sammoon Lighting', 'sammoon-lighting', 0, 1, 0, NULL, NULL),
(208, 'Winjet', 'winjet', 0, 1, 0, NULL, NULL),
(209, 'Yl Neblinero', 'yl-neblinero', 0, 1, 0, NULL, NULL),
(210, 'Tl Neblinero High Guality', 'tl-neblinero-high-guality', 0, 1, 0, NULL, NULL),
(211, 'Jing Jyun Industry', 'jing-jyun-industry', 0, 1, 0, NULL, NULL),
(212, 'Hella', 'hella', 0, 1, 0, NULL, NULL),
(213, 'Palm Beach Motoring', 'palm-beach-motoring', 0, 1, 0, NULL, NULL),
(214, 'Haining Eurode', 'haining-eurode', 0, 1, 0, NULL, NULL),
(215, 'Salfa', 'salfa', 0, 1, 0, NULL, NULL),
(216, 'Electronica Megatel S.a.', 'electronica-megatel-s-a', 0, 1, 0, NULL, NULL),
(217, 'Der Jaan Industry', 'der-jaan-industry', 0, 1, 0, NULL, NULL),
(218, 'Chemical Guys', 'chemical-guys', 0, 1, 0, NULL, NULL),
(219, 'Brillotek', 'brillotek', 0, 1, 0, NULL, NULL),
(220, 'Lake Country', 'lake-country', 0, 1, 0, NULL, NULL),
(221, 'Smart Inc.', 'smart-inc', 0, 1, 0, NULL, NULL),
(222, 'Multicenter Ltda.', 'multicenter-ltda', 0, 1, 0, NULL, NULL),
(223, 'Multimex S.a.', 'multimex-s-a', 0, 1, 0, NULL, NULL),
(224, 'Cadence', 'cadence', 0, 1, 0, NULL, NULL),
(225, 'Bld Motor Cycle', 'bld-motor-cycle', 0, 1, 0, NULL, NULL),
(226, 'Uni', 'uni', 0, 1, 0, NULL, NULL),
(227, 'Off Road Center', 'off-road-center', 0, 1, 0, NULL, NULL),
(228, 'Buyang Group', 'buyang-group', 0, 1, 0, NULL, NULL),
(229, 'Jiansu Susun  Group', 'jiansu-susun-group', 0, 1, 0, NULL, NULL),
(230, 'Bai Tai Industrial', 'bai-tai-industrial', 0, 1, 0, NULL, NULL),
(231, 'Tiantai Jiaxuan', 'tiantai-jiaxuan', 0, 1, 0, NULL, NULL),
(232, 'Lifeng Auto Acce', 'lifeng-auto-acce', 0, 1, 0, NULL, NULL),
(233, 'Homgs', 'homgs', 0, 1, 0, NULL, NULL),
(234, 'Lanxi Huamao Auto Deco', 'lanxi-huamao-auto-deco', 0, 1, 0, NULL, NULL),
(235, 'Supa', 'supa', 0, 1, 0, NULL, NULL),
(236, 'New World', 'new-world', 0, 1, 0, NULL, NULL),
(237, 'Evotaiwan', 'evotaiwan', 0, 1, 0, NULL, NULL),
(238, 'Hangzou  Easternsources', 'hangzou-easternsources', 0, 1, 0, NULL, NULL),
(239, 'Etna', 'etna', 0, 1, 0, NULL, NULL),
(240, 'Meguiars', 'meguiars', 0, 1, 0, NULL, NULL),
(241, 'Welfull Group', 'welfull-group', 0, 1, 0, NULL, NULL),
(242, 'Bridgestone', 'bridgestone', 0, 1, 0, NULL, NULL),
(243, 'Lih Yann Industrial', 'lih-yann-industrial', 0, 1, 0, NULL, NULL),
(244, 'Gtl Global Tone Limited', 'gtl-global-tone-limited', 0, 1, 0, NULL, NULL),
(245, 'Roadstone', 'roadstone', 0, 1, 0, NULL, NULL),
(246, 'Toyo', 'toyo', 0, 1, 0, NULL, NULL),
(247, 'Yal Neblinero Lynx Eye', 'yal-neblinero-lynx-eye', 0, 1, 0, NULL, NULL),
(248, 'Zs Motor', 'zs-motor', 0, 1, 0, NULL, NULL),
(249, 'Aceite Shell', 'aceite-shell', 0, 1, 0, NULL, NULL),
(250, 'Joyroad', 'joyroad', 0, 1, 0, NULL, NULL),
(251, 'Gap', 'gap', 0, 1, 0, NULL, NULL),
(252, '', '', 0, 1, 0, NULL, NULL),
(253, 'Adriazola rtpos sa            ', 'ADRIAZOLA-RTPOS-SA------------', 0, 1, 0, NULL, NULL),
(254, 'Aliance                       ', 'ALIANCE-----------------------', 0, 1, 0, NULL, NULL),
(255, 'Falken                        ', 'FALKEN------------------------', 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_noticias`
--

CREATE TABLE `sitio_noticias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `extracto` varchar(80) DEFAULT NULL,
  `cuerpo` varchar(80) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_paginas`
--

CREATE TABLE `sitio_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_pagina_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_perfiles`
--

CREATE TABLE `sitio_perfiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `ilimitado` tinyint(1) UNSIGNED DEFAULT '1',
  `permisos` text,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_perfiles`
--

INSERT INTO `sitio_perfiles` (`id`, `nombre`, `ilimitado`, `permisos`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 'Administrador', 1, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_productos`
--

CREATE TABLE `sitio_productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_erp` bigint(20) UNSIGNED DEFAULT NULL,
  `sku` varchar(40) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `descripcion` text,
  `ficha` text,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `stock_fisico` int(11) DEFAULT '0',
  `stock_compra` int(11) DEFAULT '0',
  `precio_publico` int(10) UNSIGNED DEFAULT '0',
  `oferta_publico` tinyint(1) UNSIGNED DEFAULT '0',
  `dcto_publico` float UNSIGNED DEFAULT '0',
  `preciofinal_publico` int(10) UNSIGNED DEFAULT '0',
  `precio_mayorista` int(10) UNSIGNED DEFAULT '0',
  `oferta_mayorista` tinyint(1) UNSIGNED DEFAULT '0',
  `dcto_mayorista` float UNSIGNED DEFAULT '0',
  `preciofinal_mayorista` int(10) UNSIGNED DEFAULT '0',
  `apernaduras` varchar(20) DEFAULT NULL,
  `apernadura1` varchar(80) DEFAULT NULL,
  `apernadura2` varchar(80) DEFAULT NULL,
  `aro` int(11) NOT NULL DEFAULT '0',
  `ancho` int(11) DEFAULT '0',
  `perfil` int(11) DEFAULT '0',
  `fecha_modificacion` varchar(255) DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL,
  `stock_b015` int(11) DEFAULT '0',
  `stock_b301` int(11) DEFAULT '0',
  `stock_b401` int(11) DEFAULT '0',
  `stock_b701` int(11) DEFAULT '0',
  `stock_b901` int(11) DEFAULT '0',
  `stock_bclm` int(11) DEFAULT '0',
  `stock_bvtm` int(11) DEFAULT '0',
  `stock_blco` int(11) DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `agotado` tinyint(1) UNSIGNED DEFAULT '0',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_productos`
--

INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(387, NULL, 'NE70000160001', 'NEUMATICO 700 X 16 HIFLY                          ', 'neumatico-700-x-16-hifly-ne70000160001', 'NEUMATICO 700 X 16 HIFLY                          ', '', 2, 157, 4, 0, 0, 72653, 0, 0, 72653, 72653, 1, 0, 726531, NULL, NULL, NULL, 16, 700, 16, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(388, NULL, 'NE32115150001', 'NEUMATICO MAXXIS 32X11.50 R15 6PR MA-751 MAXXIS   ', 'neumatico-maxxis-32x11-50-r15-6pr-ma-751-maxxis-ne32115150001', 'NEUMATICO MAXXIS 32X11.50 R15 6PR MA-751 MAXXIS   ', '', 2, 155, 1, 0, 0, 85855, 0, 0, 85855, 85855, 0, 0, 85855, NULL, NULL, NULL, 16, 700, 161, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(389, NULL, 'NE31535200005', 'NEUMATICO PIRELLI 315/35ZR20 106Y PZERO (F)       ', 'neumatico-pirelli-315-35zr20-106y-pzero-f-ne31535200005', 'NEUMATICO PIRELLI 315/35ZR20 106Y PZERO (F)       ', '', 2, 129, 12, 0, 0, 458900, 0, 0, 458900, 458900, 1, 20, 367120, NULL, NULL, NULL, 20, 315, 35, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(390, NULL, 'NE31535200004', 'NEUMATICO MOMO 315/35ZR20 110Y XL M-30 TOPRUN W-S ', 'neumatico-momo-315-35zr20-110y-xl-m-30-toprun-w-s-ne31535200004', 'NEUMATICO MOMO 315/35ZR20 110Y XL M-30 TOPRUN W-S ', '', 2, 149, 24, 0, 0, 239900, 0, 0, 239900, 226492, 0, 30, 158544, NULL, NULL, NULL, 20, 315, 35, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(391, NULL, 'NE31535200001', 'NEUMATICO PIRELLI 315/35 ZR20 110Y XL PZERO RFT   ', 'neumatico-pirelli-315-35-zr20-110y-xl-pzero-rft-ne31535200001', 'NEUMATICO PIRELLI 315/35 ZR20 110Y XL PZERO RFT   ', '', 2, 129, 9, 0, 0, 619900, 0, 0, 619900, 619900, 0, 20, 495919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(392, NULL, 'NE31105150010', 'NEUMATICO 31X10.50R15 AUTOGUARD JB42 109Q 6PR     ', 'neumatico-31x10-50r15-autoguard-jb42-109q-6pr-ne31105150010', 'NEUMATICO 31X10.50R15 AUTOGUARD JB42 109Q 6PR     ', '', 2, 154, 64, 0, 0, 79800, 1, 30, 55860, 67830, 1, 30, 47481, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(393, NULL, 'NE31105150009', 'NEUMATICO PIRELLI 31X10.50R15 109S SCORP. ATR WL  ', 'neumatico-pirelli-31x10-50r15-109s-scorp-atr-wl-ne31105150009', 'NEUMATICO PIRELLI 31X10.50R15 109S SCORP. ATR WL  ', '', 2, 129, 8, 0, 0, 130900, 0, 0, 130900, 130900, 0, 5, 124355, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(394, NULL, 'NE31105150008', 'NEUMATICO DUNLOP 31X10.5R15 AT3                   ', 'neumatico-dunlop-31x10-5r15-at3-ne31105150008', 'NEUMATICO DUNLOP 31X10.5R15 AT3                   ', '', 2, 159, 2, 0, 0, 67385, 0, 0, 67385, 67385, 0, 0, 67385, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(395, NULL, 'NE31105150007', 'NEUMATICO DUNLOP 31X10.50 MT1                     ', 'neumatico-dunlop-31x10-50-mt1-ne31105150007', 'NEUMATICO DUNLOP 31X10.50 MT1                     ', '', 2, 159, 1, 0, 0, 103604, 0, 0, 103604, 103604, 0, 0, 103604, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(396, NULL, 'NE31105150006', 'NEUMATICO MICHELIN 31X10.50 LTX                   ', 'neumatico-michelin-31x10-50-ltx-ne31105150006', 'NEUMATICO MICHELIN 31X10.50 LTX                   ', '', 2, 158, 1, 0, 0, 106166, 0, 0, 106166, 106166, 0, 0, 106166, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(397, NULL, 'NE31105150004', 'NEUMATICO SUNNY 31X10.5R15 SN288                  ', 'neumatico-sunny-31x10-5r15-sn288-ne31105150004', 'NEUMATICO SUNNY 31X10.5R15 SN288                  ', '', 2, 152, 1, 0, 0, 52592, 0, 0, 52592, 52592, 0, 0, 52592, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(398, NULL, 'NE31105150003', 'NEUMATICO WANLI 31X10.50 S2080                    ', 'neumatico-wanli-31x10-50-s2080-ne31105150003', 'NEUMATICO WANLI 31X10.50 S2080                    ', '', 2, 139, 1, 0, 0, 52400, 0, 0, 52400, 52400, 0, 0, 52400, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(399, NULL, 'NE31105150002', 'NEUMATICO SUNNY 31X10.50R15LT SN288C 6 109 S      ', 'neumatico-sunny-31x10-50r15lt-sn288c-6-109-s-ne31105150002', 'NEUMATICO SUNNY 31X10.50R15LT SN288C 6 109 S      ', '', 2, 152, 7, 0, 0, 59555, 0, 0, 59555, 59555, 0, 0, 59555, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(400, NULL, 'NE31105150001', 'NEUMATICO PIRELLI 31X10.50R15 109Q SCORP. MUD WL  ', 'neumatico-pirelli-31x10-50r15-109q-scorp-mud-wl-ne31105150001', 'NEUMATICO PIRELLI 31X10.50R15 109Q SCORP. MUD WL  ', '', 2, 129, 12, 0, 0, 138900, 0, 0, 138900, 138900, 0, 5, 131956, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(401, NULL, 'NE31101500001', 'NEUMATICO RYDANZ LT31X10.5R15 6PR 109Q R09        ', 'neumatico-rydanz-lt31x10-5r15-6pr-109q-r09-ne31101500001', 'NEUMATICO RYDANZ LT31X10.5R15 6PR 109Q R09        ', '', 2, 151, 53, 0, 0, 100490, 0, 0, 100490, 89405, 0, 30, 62583, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(402, NULL, 'NE30950150001', 'NEUMATICO PIRELLI 30X9.50R15LT 104Q SCORP. MUD    ', 'neumatico-pirelli-30x9-50r15lt-104q-scorp-mud-ne30950150001', 'NEUMATICO PIRELLI 30X9.50R15LT 104Q SCORP. MUD    ', '', 2, 129, 1, 0, 0, 113900, 0, 0, 113900, 113900, 0, 5, 108204, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(403, NULL, 'NE30540220001', 'NEUMATICO NITTO 305/40R22 144H NT-420S 31.6       ', 'neumatico-nitto-305-40r22-144h-nt-420s-31-6-ne30540220001', 'NEUMATICO NITTO 305/40R22 144H NT-420S 31.6       ', '', 2, 161, 2, 0, 0, 97420, 0, 0, 97420, 97419, 0, 0, 97419, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(404, NULL, 'NE30530200003', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N0)   ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-n0-ne30530200003', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N0)   ', '', 2, 129, 15, 0, 0, 519900, 0, 0, 519900, 519900, 0, 20, 415920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(405, NULL, 'NE30530200002', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (L)    ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-l-ne30530200002', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (L)    ', '', 2, 129, 2, 0, 0, 519900, 0, 0, 519900, 519900, 0, 20, 415920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(406, NULL, 'NE30530200001', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N1)   ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-n1-ne30530200001', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N1)   ', '', 2, 129, 18, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(407, NULL, 'NE30530190001', 'NEUMATICO PIRELLI 305/30ZR19 102Y XL PZERO (N2)   ', 'neumatico-pirelli-305-30zr19-102y-xl-pzero-n2-ne30530190001', 'NEUMATICO PIRELLI 305/30ZR19 102Y XL PZERO (N2)   ', '', 2, 129, 18, 0, 0, 329900, 0, 0, 329900, 329900, 0, 5, 313406, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(408, NULL, 'NE30091500001', 'NEUMATICO RYDANZ 30X9.5R15 104Q R09               ', 'neumatico-rydanz-30x9-5r15-104q-r09-ne30091500001', 'NEUMATICO RYDANZ 30X9.5R15 104Q R09               ', '', 2, 151, 8, 0, 0, 90900, 0, 0, 90900, 88298, 0, 30, 61809, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(409, NULL, 'NE29550150001', 'NEUMATICO DUNLOP 295/50R15 A15 SPORT GT           ', 'neumatico-dunlop-295-50r15-a15-sport-gt-ne29550150001', 'NEUMATICO DUNLOP 295/50R15 A15 SPORT GT           ', '', 2, 159, 1, 0, 0, 88031, 0, 0, 88031, 88031, 0, 0, 88031, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(410, NULL, 'NE29540200001', 'NEUMATICO PIRELLI 295/40ZR20 110Y PZERO ROSSO (AO)', 'neumatico-pirelli-295-40zr20-110y-pzero-rosso-ao-ne29540200001', 'NEUMATICO PIRELLI 295/40ZR20 110Y PZERO ROSSO (AO)', '', 2, 129, 4, 0, 0, 423900, 0, 0, 423900, 423899, 0, 20, 339119, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(411, NULL, 'NE29535210005', 'NEUMATICO PIRELLI 295 35/ZR21 107Y PZERO (MO)     ', 'neumatico-pirelli-295-35-zr21-107y-pzero-mo-ne29535210005', 'NEUMATICO PIRELLI 295 35/ZR21 107Y PZERO (MO)     ', '', 2, 129, 4, 0, 0, 369900, 0, 0, 369900, 369900, 0, 20, 295920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(412, NULL, 'NE29535210001', 'NEUMATICO PIRELLI 295/35R21 107Y XL PZERO (N1) GB ', 'neumatico-pirelli-295-35r21-107y-xl-pzero-n1-gb-ne29535210001', 'NEUMATICO PIRELLI 295/35R21 107Y XL PZERO (N1) GB ', '', 2, 129, 9, 0, 0, 369900, 0, 0, 369900, 369900, 0, 10, 332910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(413, NULL, 'NE29535200004', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N1)   ', 'neumatico-pirelli-295-35zr20-105y-xl-pzero-n1-ne29535200004', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N1)   ', '', 2, 129, 17, 0, 0, 359900, 0, 0, 359900, 359900, 0, 10, 323910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(414, NULL, 'NE29535200002', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N0)   ', 'neumatico-pirelli-295-35zr20-105y-xl-pzero-n0-ne29535200002', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N0)   ', '', 2, 129, 1, 0, 0, 384900, 0, 0, 384900, 384900, 0, 5, 365655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(415, NULL, 'NE29530200004', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (AMS)  ', 'neumatico-pirelli-295-30zr20-101y-xl-pzero-ams-ne29530200004', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (AMS)  ', '', 2, 129, 11, 0, 0, 429900, 0, 0, 429900, 429901, 0, 15, 365416, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(416, NULL, 'NE29530200003', 'NEUMATICO PIRELLI 295/30ZR20 101Y PZERO           ', 'neumatico-pirelli-295-30zr20-101y-pzero-ne29530200003', 'NEUMATICO PIRELLI 295/30ZR20 101Y PZERO           ', '', 2, 129, 7, 0, 0, 569745, 0, 0, 569745, 410937, 0, 5, 390390, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(417, NULL, 'NE29530200002', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (N0)   ', 'neumatico-pirelli-295-30zr20-101y-xl-pzero-n0-ne29530200002', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (N0)   ', '', 2, 129, 10, 0, 0, 344900, 0, 0, 344900, 344900, 0, 5, 327655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(418, NULL, 'NE29530190001', 'NEUMATICO PIRELLI 295/30ZR19 100Y PZERO (N2)      ', 'neumatico-pirelli-295-30zr19-100y-pzero-n2-ne29530190001', 'NEUMATICO PIRELLI 295/30ZR19 100Y PZERO (N2)      ', '', 2, 129, 9, 0, 0, 290900, 0, 0, 290900, 290900, 0, 3, 282173, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(419, NULL, 'NE29530180001', 'NEUMATICO PIRELLI 295/30ZR18 PZERO ROSSO (N4)     ', 'neumatico-pirelli-295-30zr18-pzero-rosso-n4-ne29530180001', 'NEUMATICO PIRELLI 295/30ZR18 PZERO ROSSO (N4)     ', '', 2, 129, 4, 0, 0, 226900, 0, 0, 226900, 226900, 0, 0, 226900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(420, NULL, 'NE28575160003', 'NEUMATICO RYDANZ LT285/75R16 10PR 126/123R R09    ', 'neumatico-rydanz-lt285-75r16-10pr-126-123r-r09-ne28575160003', 'NEUMATICO RYDANZ LT285/75R16 10PR 126/123R R09    ', '', 2, 151, 22, 0, 0, 128900, 0, 0, 128900, 134028, 0, 30, 93820, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(421, NULL, 'NE28570170004', 'NEUMATICO RYDANZ LT285/70R17 10PR 121/118S R09    ', 'neumatico-rydanz-lt285-70r17-10pr-121-118s-r09-ne28570170004', 'NEUMATICO RYDANZ LT285/70R17 10PR 121/118S R09    ', '', 2, 151, 19, 0, 0, 135490, 0, 0, 135490, 121475, 0, 30, 85033, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(422, NULL, 'NE28570170001', 'NEUMATICO PIRELLI 28570R17 116Q SCORP. MTR        ', 'neumatico-pirelli-28570r17-116q-scorp-mtr-ne28570170001', 'NEUMATICO PIRELLI 28570R17 116Q SCORP. MTR        ', '', 2, 129, 8, 0, 0, 189900, 0, 0, 189900, 189900, 0, 20, 151920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(423, NULL, 'NE28555180001', 'NEUMATICO PIRELLI 285/55R18 113V SCORP. ZERO      ', 'neumatico-pirelli-285-55r18-113v-scorp-zero-ne28555180001', 'NEUMATICO PIRELLI 285/55R18 113V SCORP. ZERO      ', '', 2, 129, 10, 0, 0, 229900, 0, 0, 229900, 229900, 0, 10, 206910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(424, NULL, 'NE28545200001', 'NEUMATICO PIRELLI 285/4520 112Y SCORP. VERDE (AO) ', 'neumatico-pirelli-285-4520-112y-scorp-verde-ao-ne28545200001', 'NEUMATICO PIRELLI 285/4520 112Y SCORP. VERDE (AO) ', '', 2, 129, 1, 0, 0, 389900, 0, 0, 389900, 389900, 0, 20, 311920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(425, NULL, 'NE28540220001', 'NEUMATICO PIRELLI 285/40ZR22 110Y XL PZERO (B)    ', 'neumatico-pirelli-285-40zr22-110y-xl-pzero-b-ne28540220001', 'NEUMATICO PIRELLI 285/40ZR22 110Y XL PZERO (B)    ', '', 2, 129, 8, 0, 0, 752900, 0, 0, 752900, 752900, 0, 20, 602320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(426, NULL, 'NE28540190002', 'NEU CONTINENTAL 285/40ZR19 (103Y) FR CSC 3 N0     ', 'neu-continental-285-40zr19-103y-fr-csc-3-n0-ne28540190002', 'NEU CONTINENTAL 285/40ZR19 (103Y) FR CSC 3 N0     ', '', 2, 150, 10, 0, 0, 375155, 0, 0, 375155, 375155, 1, 30, 262608, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(427, NULL, 'NE28540190001', 'NEUMATICO PIRELLI 285/40ZR19 103Y PZERO (N1)      ', 'neumatico-pirelli-285-40zr19-103y-pzero-n1-ne28540190001', 'NEUMATICO PIRELLI 285/40ZR19 103Y PZERO (N1)      ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(428, NULL, 'NE28535200002', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO (MGT)     ', 'neumatico-pirelli-285-35zr20-100y-pzero-mgt-ne28535200002', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO (MGT)     ', '', 2, 129, 10, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(429, NULL, 'NE28535200001', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO           ', 'neumatico-pirelli-285-35zr20-100y-pzero-ne28535200001', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO           ', '', 2, 129, 7, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(430, NULL, 'NE28535190005', 'NEUMATICO PIRELLI 285/35ZR19 99Y ROSSO (F)        ', 'neumatico-pirelli-285-35zr19-99y-rosso-f-ne28535190005', 'NEUMATICO PIRELLI 285/35ZR19 99Y ROSSO (F)        ', '', 2, 129, 4, 0, 0, 349900, 0, 0, 349900, 349900, 0, 10, 314911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(431, NULL, 'NE28535190002', 'NEUMATICO PIRELLI 285/35ZR19 99Y PZERO CORSA RIGHT', 'neumatico-pirelli-285-35zr19-99y-pzero-corsa-right-ne28535190002', 'NEUMATICO PIRELLI 285/35ZR19 99Y PZERO CORSA RIGHT', '', 2, 129, 1, 0, 0, 216900, 0, 0, 216900, 216900, 0, 0, 216900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(432, NULL, 'NE28535180001', 'NEUMATICO PIRELLI 285/35R18 97Y PZERO (MO)        ', 'neumatico-pirelli-285-35r18-97y-pzero-mo-ne28535180001', 'NEUMATICO PIRELLI 285/35R18 97Y PZERO (MO)        ', '', 2, 129, 6, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(433, NULL, 'NE28530210001', 'NEUMATICO PIRELLI 285/30ZR21100Y PZERO (RO1)(NCS) ', 'neumatico-pirelli-285-30zr21100y-pzero-ro1-ncs-ne28530210001', 'NEUMATICO PIRELLI 285/30ZR21100Y PZERO (RO1)(NCS) ', '', 2, 129, 11, 0, 0, 499900, 0, 0, 499900, 499900, 0, 20, 399920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(434, NULL, 'NE28530200001', 'NEUMATICO PIRELLI 285/30ZR20 99Y PZERO DE         ', 'neumatico-pirelli-285-30zr20-99y-pzero-de-ne28530200001', 'NEUMATICO PIRELLI 285/30ZR20 99Y PZERO DE         ', '', 2, 129, 6, 0, 0, 498900, 0, 0, 498900, 498900, 0, 20, 399120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(435, NULL, 'NE28530190002', 'NEUMATICO PIRELLI 285/30ZR19 98Y XL PZERO (MO)    ', 'neumatico-pirelli-285-30zr19-98y-xl-pzero-mo-ne28530190002', 'NEUMATICO PIRELLI 285/30ZR19 98Y XL PZERO (MO)    ', '', 2, 129, 24, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(436, NULL, 'NE28530190001', 'NEUMATICO PIRELLI 285/30R19 98Y PZERO (MO)        ', 'neumatico-pirelli-285-30r19-98y-pzero-mo-ne28530190001', 'NEUMATICO PIRELLI 285/30R19 98Y PZERO (MO)        ', '', 2, 129, 9, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(437, NULL, 'NE28530180002', 'NEUMATICO PIRELLI 285/30ZR18 PZERO ROSSO (N4)     ', 'neumatico-pirelli-285-30zr18-pzero-rosso-n4-ne28530180002', 'NEUMATICO PIRELLI 285/30ZR18 PZERO ROSSO (N4)     ', '', 2, 129, 8, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(438, NULL, 'NE27565180001', 'NEUMATICO PIRELLI 275/65R18 116H SCORP. ATR WL    ', 'neumatico-pirelli-275-65r18-116h-scorp-atr-wl-ne27565180001', 'NEUMATICO PIRELLI 275/65R18 116H SCORP. ATR WL    ', '', 2, 129, 3, 0, 0, 209900, 0, 0, 209900, 209901, 0, 15, 178416, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(439, NULL, 'NE27565170001', 'NEUMATICO RYDANZ 275/65R17 115H R09               ', 'neumatico-rydanz-275-65r17-115h-r09-ne27565170001', 'NEUMATICO RYDANZ 275/65R17 115H R09               ', '', 2, 151, 20, 0, 0, 102900, 0, 0, 102900, 106029, 0, 30, 74220, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(440, NULL, 'NE27560200003', 'NEUMATICO RYDANZ 275/60R20 115H R09               ', 'neumatico-rydanz-275-60r20-115h-r09-ne27560200003', 'NEUMATICO RYDANZ 275/60R20 115H R09               ', '', 2, 151, 8, 0, 0, 129900, 0, 0, 129900, 135285, 0, 30, 94700, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(441, NULL, 'NE27555200002', 'NEUMATICO PIRELLI 275/55R20 111H SCORP. STR       ', 'neumatico-pirelli-275-55r20-111h-scorp-str-ne27555200002', 'NEUMATICO PIRELLI 275/55R20 111H SCORP. STR       ', '', 2, 129, 6, 0, 0, 204900, 0, 0, 204900, 204900, 0, 10, 184411, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(442, NULL, 'NE27555200001', 'NEUMATICO PIRELLI 275/55R20 111S SCORP. ATR WL    ', 'neumatico-pirelli-275-55r20-111s-scorp-atr-wl-ne27555200001', 'NEUMATICO PIRELLI 275/55R20 111S SCORP. ATR WL    ', '', 2, 129, 2, 0, 0, 203900, 0, 0, 203900, 203901, 0, 0, 203901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(443, NULL, 'NE27555190001', 'NEUMATICO PIRELLI 275/55R19 111V SCORP. ZERO (MO) ', 'neumatico-pirelli-275-55r19-111v-scorp-zero-mo-ne27555190001', 'NEUMATICO PIRELLI 275/55R19 111V SCORP. ZERO (MO) ', '', 2, 129, 10, 0, 0, 239900, 0, 0, 239900, 239900, 0, 20, 191921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(444, NULL, 'NE27550200001', 'NEUMATICO PIRELLI 275/50R20 109H SCORP. VERDE (MO)', 'neumatico-pirelli-275-50r20-109h-scorp-verde-mo-ne27550200001', 'NEUMATICO PIRELLI 275/50R20 109H SCORP. VERDE (MO)', '', 2, 129, 1, 0, 0, 154900, 0, 0, 154900, 154900, 0, 0, 154900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(445, NULL, 'NE27545210001', 'NEUMATICO PIRELLI 275/45R21 110VSCORP. VEAS (LR)  ', 'neumatico-pirelli-275-45r21-110vscorp-veas-lr-ne27545210001', 'NEUMATICO PIRELLI 275/45R21 110VSCORP. VEAS (LR)  ', '', 2, 129, 35, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(446, NULL, 'NE27545200004', 'NEUMATICO PIRELLI 275/45R20 110H SCORP. ZERO (AO) ', 'neumatico-pirelli-275-45r20-110h-scorp-zero-ao-ne27545200004', 'NEUMATICO PIRELLI 275/45R20 110H SCORP. ZERO (AO) ', '', 2, 129, 22, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(447, NULL, 'NE27545200003', 'NEUMATICO PIRELLI 275/45R20 110V SCORP. VEAS (N0) ', 'neumatico-pirelli-275-45r20-110v-scorp-veas-n0-ne27545200003', 'NEUMATICO PIRELLI 275/45R20 110V SCORP. VEAS (N0) ', '', 2, 129, 6, 0, 0, 294900, 0, 0, 294900, 294900, 0, 20, 235920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(448, NULL, 'NE27545200002', 'NEUMATICO PIRELLI 275/45ZR20 110Y PZERO ROSSO (AO)', 'neumatico-pirelli-275-45zr20-110y-pzero-rosso-ao-ne27545200002', 'NEUMATICO PIRELLI 275/45ZR20 110Y PZERO ROSSO (AO)', '', 2, 129, 17, 0, 0, 347900, 0, 0, 347900, 347900, 0, 15, 295715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(449, NULL, 'NE27545190004', 'NEUMATICO PIRELLI 275/45ZR19 108Y XL PZERO (B)    ', 'neumatico-pirelli-275-45zr19-108y-xl-pzero-b-ne27545190004', 'NEUMATICO PIRELLI 275/45ZR19 108Y XL PZERO (B)    ', '', 2, 129, 6, 0, 0, 379900, 0, 0, 379900, 379900, 0, 10, 341911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(450, NULL, 'NE27545180003', 'NEU CONTINENTAL 275/45ZR18 (103Y) FR SC5 N0       ', 'neu-continental-275-45zr18-103y-fr-sc5-n0-ne27545180003', 'NEU CONTINENTAL 275/45ZR18 (103Y) FR SC5 N0       ', '', 2, 150, 2, 0, 0, 324805, 0, 0, 324805, 324805, 1, 30, 227364, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(451, NULL, 'NE27545180002', 'NEUMATICO PIRELLI 275/45ZR18 103Y PZERO (N0)      ', 'neumatico-pirelli-275-45zr18-103y-pzero-n0-ne27545180002', 'NEUMATICO PIRELLI 275/45ZR18 103Y PZERO (N0)      ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(452, NULL, 'NE27540220002', 'NEUMATICO PIRELLI 275/40R22 108Y PZERO (LR)(NCS)  ', 'neumatico-pirelli-275-40r22-108y-pzero-lr-ncs-ne27540220002', 'NEUMATICO PIRELLI 275/40R22 108Y PZERO (LR)(NCS)  ', '', 2, 129, 8, 0, 0, 488900, 0, 0, 488900, 488900, 0, 20, 391120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(453, NULL, 'NE27540210001', 'NEUMATICO PIRELLI 275/40R21 107Y XL SC. VERDE NCS ', 'neumatico-pirelli-275-40r21-107y-xl-sc-verde-ncs-ne27540210001', 'NEUMATICO PIRELLI 275/40R21 107Y XL SC. VERDE NCS ', '', 2, 129, 1, 0, 0, 429900, 0, 0, 429900, 429901, 0, 20, 343921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(454, NULL, 'NE27540200007', 'NEUMATICO PIRELLI 275/40ZR20 106Y PZERO ROSSO (N1)', 'neumatico-pirelli-275-40zr20-106y-pzero-rosso-n1-ne27540200007', 'NEUMATICO PIRELLI 275/40ZR20 106Y PZERO ROSSO (N1)', '', 2, 129, 8, 0, 0, 349900, 0, 0, 349900, 349900, 0, 20, 279920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(455, NULL, 'NE27540200006', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN W-S ', 'neumatico-momo-275-40zr20-106y-xl-m-30-toprun-w-s-ne27540200006', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN W-S ', '', 2, 149, 50, 0, 0, 209000, 0, 0, 209000, 178438, 0, 30, 124907, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(456, NULL, 'NE27540200005', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-9 ALUSION W-S ', 'neumatico-momo-275-40zr20-106y-xl-m-9-alusion-w-s-ne27540200005', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-9 ALUSION W-S ', '', 2, 149, 19, 0, 0, 209000, 0, 0, 209000, 168164, 0, 30, 117715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(457, NULL, 'NE27540200003', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN RFT ', 'neumatico-momo-275-40zr20-106y-xl-m-30-toprun-rft-ne27540200003', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN RFT ', '', 2, 149, 10, 0, 0, 329900, 0, 0, 329900, 285481, 0, 30, 199837, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(458, NULL, 'NE27540200002', 'NEUMATICO PIRELLI 275/40ZR20 106Y SCORP. ZERO     ', 'neumatico-pirelli-275-40zr20-106y-scorp-zero-ne27540200002', 'NEUMATICO PIRELLI 275/40ZR20 106Y SCORP. ZERO     ', '', 2, 129, 2, 0, 0, 190025, 0, 0, 190025, 190025, 0, 0, 190025, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(459, NULL, 'NE27540200001', 'NEUMATICO PIRELLI 275/40ZR20 106Y XL PZERO        ', 'neumatico-pirelli-275-40zr20-106y-xl-pzero-ne27540200001', 'NEUMATICO PIRELLI 275/40ZR20 106Y XL PZERO        ', '', 2, 129, 9, 0, 0, 273900, 0, 0, 273900, 273900, 0, 10, 246510, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(460, NULL, 'NE27540190006', 'NEU CONTINENTAL  275/40R19 101W CSC 3 SSR * FR    ', 'neu-continental-275-40r19-101w-csc-3-ssr-fr-ne27540190006', 'NEU CONTINENTAL  275/40R19 101W CSC 3 SSR * FR    ', '', 2, 150, 4, 0, 0, 367555, 0, 0, 367555, 367555, 1, 30, 257289, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(461, NULL, 'NE27540190005', 'NEUMATICO PIRELLI 275/40R19 101Y PZERO RFT (*)    ', 'neumatico-pirelli-275-40r19-101y-pzero-rft-ne27540190005', 'NEUMATICO PIRELLI 275/40R19 101Y PZERO RFT (*)    ', '', 2, 129, 3, 0, 0, 360900, 0, 0, 360900, 360900, 0, 3, 350073, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(462, NULL, 'NE27540180001', 'NEUMATICO PIRELLI 275/40R18 99Y P7 CINT. RFT      ', 'neumatico-pirelli-275-40r18-99y-p7-cint-rft-ne27540180001', 'NEUMATICO PIRELLI 275/40R18 99Y P7 CINT. RFT      ', '', 2, 129, 10, 0, 0, 375900, 0, 0, 375900, 375900, 0, 20, 300720, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(463, NULL, 'NE27535210001', 'NEUMATICO PIRELLI 275/35ZR21 103Y PZERO (B)       ', 'neumatico-pirelli-275-35zr21-103y-pzero-b-ne27535210001', 'NEUMATICO PIRELLI 275/35ZR21 103Y PZERO (B)       ', '', 2, 129, 3, 0, 0, 152125, 0, 0, 152125, 152125, 0, 0, 152125, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(464, NULL, 'NE27535200005', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO (RO1)(NCS)', 'neumatico-pirelli-275-35zr20-102y-pzero-ro1-ncs-ne27535200005', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO (RO1)(NCS)', '', 2, 129, 6, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(465, NULL, 'NE27535200004', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO ROSSO (B) ', 'neumatico-pirelli-275-35zr20-102y-pzero-rosso-b-ne27535200004', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO ROSSO (B) ', '', 2, 129, 1, 0, 0, 371900, 0, 0, 371900, 371900, 0, 10, 334710, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(466, NULL, 'NE27535200001', 'NEUMATICO PIRELLI 275/35R20 102Y XL PZERO RFT     ', 'neumatico-pirelli-275-35r20-102y-xl-pzero-rft-ne27535200001', 'NEUMATICO PIRELLI 275/35R20 102Y XL PZERO RFT     ', '', 2, 129, 3, 0, 0, 389900, 0, 0, 389900, 389900, 0, 20, 311920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(467, NULL, 'NE27535190002', 'NEUMATICO MOMO 275/35R19 100Y XL M-30 TOPRUN RFT  ', 'neumatico-momo-275-35r19-100y-xl-m-30-toprun-rft-ne27535190002', 'NEUMATICO MOMO 275/35R19 100Y XL M-30 TOPRUN RFT  ', '', 2, 149, 18, 0, 0, 249900, 0, 0, 249900, 277312, 0, 30, 194119, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(468, NULL, 'NE27535180003', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO RFT RO      ', 'neumatico-pirelli-275-35r18-95y-pzero-rft-ro-ne27535180003', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO RFT RO      ', '', 2, 129, 4, 0, 0, 375900, 0, 0, 375900, 375900, 0, 10, 338310, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(469, NULL, 'NE27535180002', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO ROSSO (MO)  ', 'neumatico-pirelli-275-35r18-95y-pzero-rosso-mo-ne27535180002', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO ROSSO (MO)  ', '', 2, 129, 10, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(470, NULL, 'NE27530210001', 'NEUMATICO PIRELLI 275/30R21 98Y XL PZERO RFT      ', 'neumatico-pirelli-275-30r21-98y-xl-pzero-rft-ne27530210001', 'NEUMATICO PIRELLI 275/30R21 98Y XL PZERO RFT      ', '', 2, 129, 4, 0, 0, 401550, 0, 0, 401550, 401550, 0, 0, 401550, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(471, NULL, 'NE26575160008', 'NEUMATICO RYDANZ 265/75R16 116S R09               ', 'neumatico-rydanz-265-75r16-116s-r09-ne26575160008', 'NEUMATICO RYDANZ 265/75R16 116S R09               ', '', 2, 151, 80, 0, 0, 112490, 0, 0, 112490, 98686, 0, 30, 69080, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(472, NULL, 'NE26575160007', 'NEUMATICO WANLI LT265/75R16 M105 123/120Q         ', 'neumatico-wanli-lt265-75r16-m105-123-120q-ne26575160007', 'NEUMATICO WANLI LT265/75R16 M105 123/120Q         ', '', 2, 139, 2, 0, 0, 99900, 0, 0, 99900, 84628, 0, 0, 84628, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(473, NULL, 'NE26575160005', 'NEUMATICO PIRELLI LT265/75R16 123R SCORP. STR-A   ', 'neumatico-pirelli-lt265-75r16-123r-scorp-str-a-ne26575160005', 'NEUMATICO PIRELLI LT265/75R16 123R SCORP. STR-A   ', '', 2, 129, 3, 0, 0, 90900, 0, 0, 90900, 90901, 0, 0, 90901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(474, NULL, 'NE26575160004', 'NEUMATICO PIRELLI 265/75R16 123S SCORP. ATR WL    ', 'neumatico-pirelli-265-75r16-123s-scorp-atr-wl-ne26575160004', 'NEUMATICO PIRELLI 265/75R16 123S SCORP. ATR WL    ', '', 2, 129, 44, 0, 0, 136900, 0, 0, 136900, 136900, 0, 3, 132793, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(475, NULL, 'NE26575160002', 'NEUMATICO DURUN 265/75R16-10PR GREEN M/T YTR08    ', 'neumatico-durun-265-75r16-10pr-green-m-t-ytr08-ne26575160002', 'NEUMATICO DURUN 265/75R16-10PR GREEN M/T YTR08    ', '', 2, 153, 3, 0, 0, 86199, 0, 0, 86199, 86199, 0, 0, 86199, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(476, NULL, 'NE26575160001', 'NEUMATICO AUTOGUARD P265/75R16 116S JB45          ', 'neumatico-autoguard-p265-75r16-116s-jb45-ne26575160001', 'NEUMATICO AUTOGUARD P265/75R16 116S JB45          ', '', 2, 154, 5, 0, 0, 46682, 0, 0, 46682, 46681, 0, 0, 46681, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(477, NULL, 'NE26570170008', 'NEUMATICO RYDANZ LT265/70R17-10PR 121/118S R09    ', 'neumatico-rydanz-lt265-70r17-10pr-121-118s-r09-ne26570170008', 'NEUMATICO RYDANZ LT265/70R17-10PR 121/118S R09    ', '', 2, 151, 49, 0, 0, 110900, 0, 0, 110900, 116490, 0, 30, 81544, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(478, NULL, 'NE26570170006', 'NEUMATICO WANLI 265/70R17 115T S-1606             ', 'neumatico-wanli-265-70r17-115t-s-1606-ne26570170006', 'NEUMATICO WANLI 265/70R17 115T S-1606             ', '', 2, 139, 3, 0, 0, 82900, 0, 0, 82900, 82943, 0, 30, 58060, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(479, NULL, 'NE26570170004', 'NEUMATICO PIRELLI 265/70R17 121/118S SCORP. STR   ', 'neumatico-pirelli-265-70r17-121-118s-scorp-str-ne26570170004', 'NEUMATICO PIRELLI 265/70R17 121/118S SCORP. STR   ', '', 2, 129, 22, 0, 0, 141900, 0, 0, 141900, 141900, 0, 0, 141900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(480, NULL, 'NE26570170003', 'NEUMATICO PIRELLI 265/70R17 113T SCORP. ATR       ', 'neumatico-pirelli-265-70r17-113t-scorp-atr-ne26570170003', 'NEUMATICO PIRELLI 265/70R17 113T SCORP. ATR       ', '', 2, 129, 22, 0, 0, 158900, 0, 0, 158900, 158900, 0, 0, 158900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(481, NULL, 'NE26570170002', 'NEUMATICO MAXXIS 265/70 R17 8PR MT-753            ', 'neumatico-maxxis-265-70-r17-8pr-mt-753-ne26570170002', 'NEUMATICO MAXXIS 265/70 R17 8PR MT-753            ', '', 2, 155, 1, 0, 0, 69869, 0, 0, 69869, 69870, 0, 0, 69870, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(482, NULL, 'NE26570170001', 'NEUMATICO PIRELLI LT 265/70R17 121/118S SCORP. ATR', 'neumatico-pirelli-lt-265-70r17-121-118s-scorp-atr-ne26570170001', 'NEUMATICO PIRELLI LT 265/70R17 121/118S SCORP. ATR', '', 2, 129, 1, 0, 0, 158900, 0, 0, 158900, 158900, 0, 15, 135065, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(483, NULL, 'NE26570160007', 'NEUMATICO RYDANZ 265/70R16 112S R09               ', 'neumatico-rydanz-265-70r16-112s-r09-ne26570160007', 'NEUMATICO RYDANZ 265/70R16 112S R09               ', '', 2, 151, 371, 0, 0, 79849, 1, 30, 55894, 79849, 1, 30, 55894, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(484, NULL, 'NE26570160005', 'NEUMATICO PIRELLI P265/70R16 112T SCORP. ATR      ', 'neumatico-pirelli-p265-70r16-112t-scorp-atr-ne26570160005', 'NEUMATICO PIRELLI P265/70R16 112T SCORP. ATR      ', '', 2, 129, 4, 0, 0, 131900, 0, 0, 131900, 131900, 0, 10, 118710, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(485, NULL, 'NE26570160003', 'NEUMATICO PIRELLI 265/70R16 112H SCORP. STR       ', 'neumatico-pirelli-265-70r16-112h-scorp-str-ne26570160003', 'NEUMATICO PIRELLI 265/70R16 112H SCORP. STR       ', '', 2, 129, 1, 0, 0, 76900, 0, 0, 76900, 76900, 0, 0, 76900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(486, NULL, 'NE26570150003', 'NEUMATICO RYDANZ 265/70R15 112S R09               ', 'neumatico-rydanz-265-70r15-112s-r09-ne26570150003', 'NEUMATICO RYDANZ 265/70R15 112S R09               ', '', 2, 151, 27, 0, 0, 100490, 0, 0, 100490, 78016, 0, 30, 54611, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(487, NULL, 'NE26570150001', 'NEUMATICO MAXXIS 265/70R15 HT-750 112S            ', 'neumatico-maxxis-265-70r15-ht-750-112s-ne26570150001', 'NEUMATICO MAXXIS 265/70R15 HT-750 112S            ', '', 2, 155, 2, 0, 0, 74828, 0, 0, 74828, 74828, 0, 0, 74828, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(488, NULL, 'NE26565170005', 'NEUMATICO RYDANZ 265/65R17 112H R06               ', 'neumatico-rydanz-265-65r17-112h-r06-ne26565170005', 'NEUMATICO RYDANZ 265/65R17 112H R06               ', '', 2, 151, 20, 0, 0, 89900, 0, 0, 89900, 93240, 0, 30, 65268, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(489, NULL, 'NE26565170003', 'NEUMATICO WANLI 265/65R17 112S  C069              ', 'neumatico-wanli-265-65r17-112s-c069-ne26565170003', 'NEUMATICO WANLI 265/65R17 112S  C069              ', '', 2, 139, 2, 0, 0, 79900, 0, 0, 79900, 79968, 0, 30, 55978, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(490, NULL, 'NE26565170002', 'NEUMATICO PIRELLI 265/65R17 112T SCORP. ATR       ', 'neumatico-pirelli-265-65r17-112t-scorp-atr-ne26565170002', 'NEUMATICO PIRELLI 265/65R17 112T SCORP. ATR       ', '', 2, 129, 5, 0, 0, 141900, 0, 0, 141900, 141900, 0, 5, 134806, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(491, NULL, 'NE26565170001', 'NEUMATICO PIRELLI P265/65R17 112H SCORP. STR      ', 'neumatico-pirelli-p265-65r17-112h-scorp-str-ne26565170001', 'NEUMATICO PIRELLI P265/65R17 112H SCORP. STR      ', '', 2, 129, 7, 0, 0, 141900, 0, 0, 141900, 141900, 0, 3, 137644, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(492, NULL, 'NE26560180003', 'NEUMATICO PIRELLI 265/60R18 110H SCORP. ATR       ', 'neumatico-pirelli-265-60r18-110h-scorp-atr-ne26560180003', 'NEUMATICO PIRELLI 265/60R18 110H SCORP. ATR       ', '', 2, 129, 9, 0, 0, 199900, 0, 0, 199900, 199900, 0, 15, 169915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(493, NULL, 'NE26550200002', 'NEUMATICO RYDANZ 265/50R20 111H XL R09            ', 'neumatico-rydanz-265-50r20-111h-xl-r09-ne26550200002', 'NEUMATICO RYDANZ 265/50R20 111H XL R09            ', '', 2, 151, 3, 0, 0, 123900, 0, 0, 123900, 117156, 0, 30, 82009, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(494, NULL, 'NE26550190002', 'NEUMATICO PIRELLI 265/50R19 110V SCORP. VEAS (N0) ', 'neumatico-pirelli-265-50r19-110v-scorp-veas-n0-ne26550190002', 'NEUMATICO PIRELLI 265/50R19 110V SCORP. VEAS (N0) ', '', 2, 129, 50, 0, 0, 259900, 0, 0, 259900, 259900, 0, 20, 207919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(495, NULL, 'NE26550190001', 'NEUMATICO PIRELLI 265/50R19 110Y XL PZERO (N0)    ', 'neumatico-pirelli-265-50r19-110y-xl-pzero-n0-ne26550190001', 'NEUMATICO PIRELLI 265/50R19 110Y XL PZERO (N0)    ', '', 2, 129, 12, 0, 0, 324900, 0, 0, 324900, 324900, 0, 20, 259920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(496, NULL, 'NE26545200002', 'NEUMATICO PIRELLI 265/45R20 104Y PZERO (N0)       ', 'neumatico-pirelli-265-45r20-104y-pzero-n0-ne26545200002', 'NEUMATICO PIRELLI 265/45R20 104Y PZERO (N0)       ', '', 2, 129, 4, 0, 0, 337900, 0, 0, 337900, 337900, 0, 20, 270320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(497, NULL, 'NE26545180001', 'NEUMATICO PIRELLI 265/45ZR18 101Y P-ZERO4 (N1)    ', 'neumatico-pirelli-265-45zr18-101y-p-zero4-n1-ne26545180001', 'NEUMATICO PIRELLI 265/45ZR18 101Y P-ZERO4 (N1)    ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(498, NULL, 'NE26540210001', 'NEU CONTINENTAL 265/40R21 105Y CROSS CONTACT UHP  ', 'neu-continental-265-40r21-105y-cross-contact-uhp-ne26540210001', 'NEU CONTINENTAL 265/40R21 105Y CROSS CONTACT UHP  ', '', 2, 150, 4, 0, 0, 379905, 0, 0, 379905, 379905, 1, 30, 265934, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(499, NULL, 'NE26540200001', 'NEUMATICO PIRELLI 265/40R20 104Y PZERO (AO)       ', 'neumatico-pirelli-265-40r20-104y-pzero-ao-ne26540200001', 'NEUMATICO PIRELLI 265/40R20 104Y PZERO (AO)       ', '', 2, 129, 5, 0, 0, 261900, 0, 0, 261900, 261900, 0, 0, 261900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(500, NULL, 'NE26540190001', 'NEUMATICO PIRELLI 265/40ZR19 98Y PZERO (N0)       ', 'neumatico-pirelli-265-40zr19-98y-pzero-n0-ne26540190001', 'NEUMATICO PIRELLI 265/40ZR19 98Y PZERO (N0)       ', '', 2, 129, 2, 0, 0, 469900, 0, 0, 469900, 469900, 0, 20, 375920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(501, NULL, 'NE26535200002', 'NEUMATICO PIRELLI 265/35ZR20 95Y PZERO (N0)       ', 'neumatico-pirelli-265-35zr20-95y-pzero-n0-ne26535200002', 'NEUMATICO PIRELLI 265/35ZR20 95Y PZERO (N0)       ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(502, NULL, 'NE26535190007', 'NEU CONTINENTAL 265/35ZR19 98Y MO CSC 5 FR        ', 'neu-continental-265-35zr19-98y-mo-csc-5-fr-ne26535190007', 'NEU CONTINENTAL 265/35ZR19 98Y MO CSC 5 FR        ', '', 2, 150, 4, 0, 0, 307900, 0, 0, 307900, 307899, 1, 30, 215529, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(503, NULL, 'NE26535190005', 'NEUMATICO PIRELLI 265/35ZR19 94Y PZERO (N2)       ', 'neumatico-pirelli-265-35zr19-94y-pzero-n2-ne26535190005', 'NEUMATICO PIRELLI 265/35ZR19 94Y PZERO (N2)       ', '', 2, 129, 16, 0, 0, 349900, 0, 0, 349900, 349900, 0, 10, 314911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(504, NULL, 'NE26535180005', 'NEU CONTINENTAL 265/35R18 CSC3 97Y MO FR          ', 'neu-continental-265-35r18-csc3-97y-mo-fr-ne26535180005', 'NEU CONTINENTAL 265/35R18 CSC3 97Y MO FR          ', '', 2, 150, 1, 0, 0, 360905, 0, 0, 360905, 360906, 1, 30, 252633, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(505, NULL, 'NE26535180002', 'NEUMATICO PIRELLI 265/35R18 97Y XL PZERO (MO)     ', 'neumatico-pirelli-265-35r18-97y-xl-pzero-mo-ne26535180002', 'NEUMATICO PIRELLI 265/35R18 97Y XL PZERO (MO)     ', '', 2, 129, 17, 0, 0, 220900, 0, 0, 220900, 220900, 0, 20, 176720, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(506, NULL, 'NE26535180001', 'NEUMATICO PIRELLI 265/35ZR18 93Y PZERO ROSSO (N4) ', 'neumatico-pirelli-265-35zr18-93y-pzero-rosso-n4-ne26535180001', 'NEUMATICO PIRELLI 265/35ZR18 93Y PZERO ROSSO (N4) ', '', 2, 129, 9, 0, 0, 220900, 0, 0, 220900, 220900, 0, 3, 214273, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(507, NULL, 'NE26530200001', 'NEUMATICO PIRELLI 265/30ZR20 94Y PZERO (R01)      ', 'neumatico-pirelli-265-30zr20-94y-pzero-r01-ne26530200001', 'NEUMATICO PIRELLI 265/30ZR20 94Y PZERO (R01)      ', '', 2, 129, 7, 0, 0, 269900, 0, 0, 269900, 269073, 0, 0, 269073, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(508, NULL, 'NE25575150003', 'NEUMATICO PIRELLI LT255/75R15 109S SCORP. ATR     ', 'neumatico-pirelli-lt255-75r15-109s-scorp-atr-ne25575150003', 'NEUMATICO PIRELLI LT255/75R15 109S SCORP. ATR     ', '', 2, 129, 16, 0, 0, 129900, 0, 0, 129900, 129900, 0, 20, 103920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(509, NULL, 'NE25575150002', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. ATR   ', 'neumatico-pirelli-255-75r15-109-105s-scorp-atr-ne25575150002', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. ATR   ', '', 2, 129, 2, 0, 0, 71900, 0, 0, 71900, 71900, 0, 0, 71900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(510, NULL, 'NE25575150001', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. S/T   ', 'neumatico-pirelli-255-75r15-109-105s-scorp-s-t-ne25575150001', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. S/T   ', '', 2, 129, 4, 0, 0, 92900, 0, 0, 92900, 92900, 0, 0, 92900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(511, NULL, 'NE25570180002', 'NEUMATICO PIRELLI 255/70R18 112S SCORP. STR       ', 'neumatico-pirelli-255-70r18-112s-scorp-str-ne25570180002', 'NEUMATICO PIRELLI 255/70R18 112S SCORP. STR       ', '', 2, 129, 11, 0, 0, 106900, 0, 0, 106900, 106315, 0, 0, 106315, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(512, NULL, 'NE25570160004', 'NEUMATICO PIRELLI P255/70R16 109H SCORP. STR      ', 'neumatico-pirelli-p255-70r16-109h-scorp-str-ne25570160004', 'NEUMATICO PIRELLI P255/70R16 109H SCORP. STR      ', '', 2, 129, 4, 0, 0, 126900, 0, 0, 126900, 126900, 0, 3, 123094, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(513, NULL, 'NE25570160003', 'NEUMATICO PIRELLI P255/70R16 109T SCORP. ATR      ', 'neumatico-pirelli-p255-70r16-109t-scorp-atr-ne25570160003', 'NEUMATICO PIRELLI P255/70R16 109T SCORP. ATR      ', '', 2, 129, 6, 0, 0, 126900, 0, 0, 126900, 126900, 0, 3, 123094, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(514, NULL, 'NE25565170001', 'NEUMATICO PIRELLI 255/65R17 110T SCORP. ATR       ', 'neumatico-pirelli-255-65r17-110t-scorp-atr-ne25565170001', 'NEUMATICO PIRELLI 255/65R17 110T SCORP. ATR       ', '', 2, 129, 15, 0, 0, 134900, 0, 0, 134900, 134900, 0, 3, 130852, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(515, NULL, 'NE25565160001', 'NEUMATICO PIRELLI 255/65R16 109H SCORP. STR       ', 'neumatico-pirelli-255-65r16-109h-scorp-str-ne25565160001', 'NEUMATICO PIRELLI 255/65R16 109H SCORP. STR       ', '', 2, 129, 22, 0, 0, 132900, 0, 0, 132900, 132900, 0, 5, 126255, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(516, NULL, 'NE25560180003', 'NEUMATICO PIRELLI 255/60R18 112T XL SCORP. ATR    ', 'neumatico-pirelli-255-60r18-112t-xl-scorp-atr-ne25560180003', 'NEUMATICO PIRELLI 255/60R18 112T XL SCORP. ATR    ', '', 2, 129, 91, 0, 0, 179788, 1, 30, 125852, 152820, 1, 30, 106974, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(517, NULL, 'NE25560180002', 'NEUMATICO PIRELLI 255/60R18 112H SCORP. VEAS      ', 'neumatico-pirelli-255-60r18-112h-scorp-veas-ne25560180002', 'NEUMATICO PIRELLI 255/60R18 112H SCORP. VEAS      ', '', 2, 129, 17, 0, 0, 153900, 0, 0, 153900, 153900, 0, 5, 146206, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(518, NULL, 'NE25560150002', 'NEUMATICO DUNLOP 255/60R15 A15 SPORT GT           ', 'neumatico-dunlop-255-60r15-a15-sport-gt-ne25560150002', 'NEUMATICO DUNLOP 255/60R15 A15 SPORT GT           ', '', 2, 159, 1, 0, 0, 83784, 0, 0, 83784, 83783, 0, 0, 83783, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(519, NULL, 'NE25555200003', 'NEU PIRELLI 255/55R20 110Y XL SCORP. VERDE A/S LR ', 'neu-pirelli-255-55r20-110y-xl-scorp-verde-a-s-lr-ne25555200003', 'NEU PIRELLI 255/55R20 110Y XL SCORP. VERDE A/S LR ', '', 2, 129, 8, 0, 0, 359900, 0, 0, 359900, 359900, 0, 10, 323910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(520, NULL, 'NE25555200002', 'NEUMATICO PIRELLI 255/55R20 110W XL SCOR VEAS (LR)', 'neumatico-pirelli-255-55r20-110w-xl-scor-veas-lr-ne25555200002', 'NEUMATICO PIRELLI 255/55R20 110W XL SCOR VEAS (LR)', '', 2, 129, 8, 0, 0, 318900, 0, 0, 318900, 249900, 0, 5, 237405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(521, NULL, 'NE25555190002', 'NEUMATICO PIRELLI 255/55R19 111V XL SCORP. ZERO   ', 'neumatico-pirelli-255-55r19-111v-xl-scorp-zero-ne25555190002', 'NEUMATICO PIRELLI 255/55R19 111V XL SCORP. ZERO   ', '', 2, 129, 30, 0, 0, 239900, 0, 0, 239900, 239900, 0, 20, 191921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(522, NULL, 'NE25555180014', 'NEU CONTINENTAL 255/55R18 105W CCC UHP MO ML      ', 'neu-continental-255-55r18-105w-ccc-uhp-mo-ml-ne25555180014', 'NEU CONTINENTAL 255/55R18 105W CCC UHP MO ML      ', '', 2, 150, 4, 0, 0, 203205, 0, 0, 203205, 203206, 1, 30, 142244, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(523, NULL, 'NE25555180013', 'NEUMATICO MOMO 255/55ZR18 109Y XL M-9 ALUSION W-S ', 'neumatico-momo-255-55zr18-109y-xl-m-9-alusion-w-s-ne25555180013', 'NEUMATICO MOMO 255/55ZR18 109Y XL M-9 ALUSION W-S ', '', 2, 149, 36, 0, 0, 139900, 0, 0, 139900, 143564, 0, 30, 100494, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(524, NULL, 'NE25555180012', 'NEUMATICO PIRELLI 255/55R18 109V XL SCORP. VERDE  ', 'neumatico-pirelli-255-55r18-109v-xl-scorp-verde-ne25555180012', 'NEUMATICO PIRELLI 255/55R18 109V XL SCORP. VERDE  ', '', 2, 129, 1, 0, 0, 179900, 0, 0, 179900, 179899, 0, 5, 170904, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(525, NULL, 'NE25555180011', 'NEUMATICO PIRELLI 255/55R18 109V XL SCO VE RFT (*)', 'neumatico-pirelli-255-55r18-109v-xl-sco-ve-rft-ne25555180011', 'NEUMATICO PIRELLI 255/55R18 109V XL SCO VE RFT (*)', '', 2, 129, 17, 0, 0, 289900, 0, 0, 289900, 289899, 0, 20, 231919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(526, NULL, 'NE25555180006', 'NEUMATICO PIRELLI 255/55R18 109V XL SCOR ZERO (N0)', 'neumatico-pirelli-255-55r18-109v-xl-scor-zero-n0-ne25555180006', 'NEUMATICO PIRELLI 255/55R18 109V XL SCOR ZERO (N0)', '', 2, 129, 20, 0, 0, 218900, 0, 0, 218900, 218900, 0, 20, 175120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(527, NULL, 'NE25555180002', 'NEUMATICO DUNLOP 255/55R18 109V PT2               ', 'neumatico-dunlop-255-55r18-109v-pt2-ne25555180002', 'NEUMATICO DUNLOP 255/55R18 109V PT2               ', '', 2, 159, 1, 0, 0, 81599, 0, 0, 81599, 81599, 0, 0, 81599, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(528, NULL, 'NE25555180001', 'NEUMATICO MICHELIN 255/55R18 4X4 SINCROME         ', 'neumatico-michelin-255-55r18-4x4-sincrome-ne25555180001', 'NEUMATICO MICHELIN 255/55R18 4X4 SINCROME         ', '', 2, 158, 1, 0, 0, 168880, 0, 0, 168880, 168880, 0, 0, 168880, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(529, NULL, 'NE25550200003', 'NEUMATICO PIRELLI 255/50R20 109W XL PZERO (J)     ', 'neumatico-pirelli-255-50r20-109w-xl-pzero-j-ne25550200003', 'NEUMATICO PIRELLI 255/50R20 109W XL PZERO (J)     ', '', 2, 129, 13, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(530, NULL, 'NE25550200001', 'NEUMATICO PIRELLI 255/50R20 109Y SCORP. ZERO      ', 'neumatico-pirelli-255-50r20-109y-scorp-zero-ne25550200001', 'NEUMATICO PIRELLI 255/50R20 109Y SCORP. ZERO      ', '', 2, 129, 12, 0, 0, 239900, 0, 0, 239900, 239900, 0, 10, 215910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(531, NULL, 'NE25550190011', 'NEUMATICO MOMO 255/50ZR19 107Y XL M-9 ALUSION W-S ', 'neumatico-momo-255-50zr19-107y-xl-m-9-alusion-w-s-ne25550190011', 'NEUMATICO MOMO 255/50ZR19 107Y XL M-9 ALUSION W-S ', '', 2, 149, 21, 0, 0, 169900, 0, 0, 169900, 173988, 0, 30, 121792, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(532, NULL, 'NE25550190010', 'NEUMATICO MOMO 255/50R19 107Y XL M-30 TOPRUN W-S  ', 'neumatico-momo-255-50r19-107y-xl-m-30-toprun-w-s-ne25550190010', 'NEUMATICO MOMO 255/50R19 107Y XL M-30 TOPRUN W-S  ', '', 2, 149, 38, 0, 0, 169900, 0, 0, 169900, 175825, 0, 30, 123077, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(533, NULL, 'NE25550190004', 'NEUMATICO PIRELLI 255/50R19 103W SCORP. VERDE (MO)', 'neumatico-pirelli-255-50r19-103w-scorp-verde-mo-ne25550190004', 'NEUMATICO PIRELLI 255/50R19 103W SCORP. VERDE (MO)', '', 2, 129, 13, 0, 0, 269900, 0, 0, 269900, 269900, 0, 20, 215921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(534, NULL, 'NE25550190002', 'NEUMATICO PIRELLI 255/50R19 103W PZERO ROSSO (MO) ', 'neumatico-pirelli-255-50r19-103w-pzero-rosso-mo-ne25550190002', 'NEUMATICO PIRELLI 255/50R19 103W PZERO ROSSO (MO) ', '', 2, 129, 17, 0, 0, 262900, 0, 0, 262900, 262900, 0, 20, 210319, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(535, NULL, 'NE25550190001', 'NEU PIRELLI 255/50ZR19 107Y XL SCORP. ZERO ASIM   ', 'neu-pirelli-255-50zr19-107y-xl-scorp-zero-asim-ne25550190001', 'NEU PIRELLI 255/50ZR19 107Y XL SCORP. ZERO ASIM   ', '', 2, 129, 18, 0, 0, 199900, 0, 0, 199900, 199900, 0, 10, 179910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(536, NULL, 'NE25545200003', 'NEUMATICO PIRELLI 255/45R20 101W SC.VERDE RFT (MO)', 'neumatico-pirelli-255-45r20-101w-sc-verde-rft-mo-ne25545200003', 'NEUMATICO PIRELLI 255/45R20 101W SC.VERDE RFT (MO)', '', 2, 129, 17, 0, 0, 447900, 0, 0, 447900, 447901, 0, 20, 358321, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(537, NULL, 'NE25545200002', 'NEU PIRELLI 255/45R20 105V XL SCORP. ZERO ASIM    ', 'neu-pirelli-255-45r20-105v-xl-scorp-zero-asim-ne25545200002', 'NEU PIRELLI 255/45R20 105V XL SCORP. ZERO ASIM    ', '', 2, 129, 14, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(538, NULL, 'NE25545200001', 'NEUMATICO PIRELLI 255/45R20 101W SCORP. VERDE (MO)', 'neumatico-pirelli-255-45r20-101w-scorp-verde-mo-ne25545200001', 'NEUMATICO PIRELLI 255/45R20 101W SCORP. VERDE (MO)', '', 2, 129, 8, 0, 0, 249900, 0, 0, 249900, 249900, 0, 5, 237405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(539, NULL, 'NE25545190001', 'NEUMATICO PIRELLI 255/45R19 104Y PZERO (AO)       ', 'neumatico-pirelli-255-45r19-104y-pzero-ao-ne25545190001', 'NEUMATICO PIRELLI 255/45R19 104Y PZERO (AO)       ', '', 2, 129, 4, 0, 0, 249900, 0, 0, 249900, 249900, 0, 20, 199920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(540, NULL, 'NE25545180004', 'NEUMATICO PIRELLI 255/45R18 99W P7 CINT. RFT (*)  ', 'neumatico-pirelli-255-45r18-99w-p7-cint-rft-ne25545180004', 'NEUMATICO PIRELLI 255/45R18 99W P7 CINT. RFT (*)  ', '', 2, 129, 4, 0, 0, 349900, 0, 0, 349900, 349900, 0, 20, 279920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(541, NULL, 'NE25545180003', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO (AO)        ', 'neumatico-pirelli-255-45r18-99y-pzero-ao-ne25545180003', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO (AO)        ', '', 2, 129, 14, 0, 0, 219900, 0, 0, 219900, 219900, 0, 20, 175920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(542, NULL, 'NE25545180002', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO             ', 'neumatico-pirelli-255-45r18-99y-pzero-ne25545180002', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO             ', '', 2, 129, 2, 0, 0, 249900, 0, 0, 249900, 249900, 0, 10, 224910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(543, NULL, 'NE25545180001', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO ROSSO (MO)  ', 'neumatico-pirelli-255-45r18-99y-pzero-rosso-mo-ne25545180001', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO ROSSO (MO)  ', '', 2, 129, 16, 0, 0, 229900, 0, 0, 229900, 229900, 0, 20, 183919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(544, NULL, 'NE25540190001', 'NEUMATICO PIRELLI 255/40R19 96H SCORP. VEAS       ', 'neumatico-pirelli-255-40r19-96h-scorp-veas-ne25540190001', 'NEUMATICO PIRELLI 255/40R19 96H SCORP. VEAS       ', '', 2, 129, 1, 0, 0, 124900, 0, 0, 124900, 124915, 0, 0, 124915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(545, NULL, 'NE25540180006', 'NEUMATICO PIRELLI 255/40R18 95Y P7 CINT. RFT      ', 'neumatico-pirelli-255-40r18-95y-p7-cint-rft-ne25540180006', 'NEUMATICO PIRELLI 255/40R18 95Y P7 CINT. RFT      ', '', 2, 129, 5, 0, 0, 349900, 0, 0, 349900, 349900, 0, 5, 332405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(546, NULL, 'NE25540180004', 'NEUMATICO PIRELLI 255/40ZR18 99Y PZERO ROSSO (MO) ', 'neumatico-pirelli-255-40zr18-99y-pzero-rosso-mo-ne25540180004', 'NEUMATICO PIRELLI 255/40ZR18 99Y PZERO ROSSO (MO) ', '', 2, 129, 7, 0, 0, 178900, 0, 0, 178900, 178486, 0, 0, 178486, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(547, NULL, 'NE25540170003', 'NEUMATICO PIRELLI 255/40R17 94W PZERO RFT         ', 'neumatico-pirelli-255-40r17-94w-pzero-rft-ne25540170003', 'NEUMATICO PIRELLI 255/40R17 94W PZERO RFT         ', '', 2, 129, 5, 0, 0, 184900, 0, 0, 184900, 184900, 0, 5, 175655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(548, NULL, 'NE25540170002', 'NEUMATICO PIRELLI 255/40ZR17 PZERO ROSSO (N3)     ', 'neumatico-pirelli-255-40zr17-pzero-rosso-n3-ne25540170002', 'NEUMATICO PIRELLI 255/40ZR17 PZERO ROSSO (N3)     ', '', 2, 129, 3, 0, 0, 114900, 0, 0, 114900, 114153, 0, 0, 114153, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(549, NULL, 'NE25535200003', 'NEUMATICO 255/35ZR20 97Y XL P-ZERO4 (J)           ', 'neumatico-255-35zr20-97y-xl-p-zero4-j-ne25535200003', 'NEUMATICO 255/35ZR20 97Y XL P-ZERO4 (J)           ', '', 2, 129, 1, 0, 0, 255900, 0, 0, 255900, 255900, 0, 10, 230310, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(550, NULL, 'NE25535190010', 'NEUMATICO PIRELLI 255/35ZR19 96Y XL PZERO (MO)    ', 'neumatico-pirelli-255-35zr19-96y-xl-pzero-mo-ne25535190010', 'NEUMATICO PIRELLI 255/35ZR19 96Y XL PZERO (MO)    ', '', 2, 129, 29, 0, 0, 252900, 0, 0, 252900, 252900, 0, 20, 202320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(551, NULL, 'NE25535190007', 'NEUMATICO MOMO 255/35ZR19 96Y XL M-3 OUTRUN W-S   ', 'neumatico-momo-255-35zr19-96y-xl-m-3-outrun-w-s-ne25535190007', 'NEUMATICO MOMO 255/35ZR19 96Y XL M-3 OUTRUN W-S   ', '', 2, 149, 31, 0, 0, 154900, 0, 0, 154900, 159004, 0, 30, 111303, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(552, NULL, 'NE25535190005', 'NEUMATICO PIRELLI 255/35R19 96Y XL PZERO (MO)     ', 'neumatico-pirelli-255-35r19-96y-xl-pzero-mo-ne25535190005', 'NEUMATICO PIRELLI 255/35R19 96Y XL PZERO (MO)     ', '', 2, 129, 1, 0, 0, 259900, 0, 0, 259900, 259900, 0, 10, 233910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(553, NULL, 'NE25535180007', 'NEU CONTINENTAL 255/35R18 94Y CSC5 FR XL          ', 'neu-continental-255-35r18-94y-csc5-fr-xl-ne25535180007', 'NEU CONTINENTAL 255/35R18 94Y CSC5 FR XL          ', '', 2, 150, 11, 0, 0, 236455, 0, 0, 236455, 236455, 1, 30, 165518, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(554, NULL, 'NE25535180006', 'NEUMATICO MOMO 255/35ZR18 94Y XL M-3 OUTRUN W-S   ', 'neumatico-momo-255-35zr18-94y-xl-m-3-outrun-w-s-ne25535180006', 'NEUMATICO MOMO 255/35ZR18 94Y XL M-3 OUTRUN W-S   ', '', 2, 149, 18, 0, 0, 134900, 0, 0, 134900, 131575, 0, 30, 92102, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(555, NULL, 'NE25535180004', 'NEU CONTINENTAL  255/35R18 94Y XL FR SC3 MO       ', 'neu-continental-255-35r18-94y-xl-fr-sc3-mo-ne25535180004', 'NEU CONTINENTAL  255/35R18 94Y XL FR SC3 MO       ', '', 2, 150, 5, 0, 0, 339900, 0, 0, 339900, 339900, 1, 30, 237930, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(556, NULL, 'NE25535180003', 'NEUMATICO PIRELLI 255/35ZR18 94Y XL PZERO (MO)    ', 'neumatico-pirelli-255-35zr18-94y-xl-pzero-mo-ne25535180003', 'NEUMATICO PIRELLI 255/35ZR18 94Y XL PZERO (MO)    ', '', 2, 129, 12, 0, 0, 199900, 0, 0, 199900, 199900, 0, 20, 159919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(557, NULL, 'NE25535180001', 'NEUMATICO PIRELLI 255/35R18 90Y PZERO RFT         ', 'neumatico-pirelli-255-35r18-90y-pzero-rft-ne25535180001', 'NEUMATICO PIRELLI 255/35R18 90Y PZERO RFT         ', '', 2, 129, 25, 0, 0, 299900, 0, 0, 299900, 299900, 0, 3, 290903, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(558, NULL, 'NE25530190002', 'NEU CONTINENTAL 255/30R19 91Y CSC 5P MO FR        ', 'neu-continental-255-30r19-91y-csc-5p-mo-fr-ne25530190002', 'NEU CONTINENTAL 255/30R19 91Y CSC 5P MO FR        ', '', 2, 150, 2, 0, 0, 311505, 0, 0, 311505, 311505, 1, 30, 218053, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(559, NULL, 'NE25530190001', 'NEUMATICO PIRELLI 255/30ZR19 91Y XL PZERO         ', 'neumatico-pirelli-255-30zr19-91y-xl-pzero-ne25530190001', 'NEUMATICO PIRELLI 255/30ZR19 91Y XL PZERO         ', '', 2, 129, 2, 0, 0, 299900, 0, 0, 299900, 299900, 0, 15, 254915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(560, NULL, 'NE24575170001', 'NEUMATICO RYDANZ LT245/75R17 10PR 121/118S R09    ', 'neumatico-rydanz-lt245-75r17-10pr-121-118s-r09-ne24575170001', 'NEUMATICO RYDANZ LT245/75R17 10PR 121/118S R09    ', '', 2, 151, 40, 0, 0, 116490, 0, 0, 116490, 120022, 0, 30, 84015, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(561, NULL, 'NE24575160011', 'NEUMATICO PIRELLI LT245/75/16 120Q SCORP. MTR     ', 'neumatico-pirelli-lt245-75-16-120q-scorp-mtr-ne24575160011', 'NEUMATICO PIRELLI LT245/75/16 120Q SCORP. MTR     ', '', 2, 129, 12, 0, 0, 136900, 0, 0, 136900, 136900, 0, 5, 130055, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(562, NULL, 'NE24575160010', 'NEUMATICO RYDANZ 245/75R16 109S R09               ', 'neumatico-rydanz-245-75r16-109s-r09-ne24575160010', 'NEUMATICO RYDANZ 245/75R16 109S R09               ', '', 2, 151, 269, 0, 0, 89900, 0, 0, 89900, 67711, 0, 30, 47398, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(563, NULL, 'NE24575160009', 'NEUMATICO 245/75 R16 111S UD4S AUTOGUARD          ', 'neumatico-245-75-r16-111s-ud4s-autoguard-ne24575160009', 'NEUMATICO 245/75 R16 111S UD4S AUTOGUARD          ', '', 2, 154, 1, 0, 0, 47514, 0, 0, 47514, 47513, 0, 0, 47513, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(564, NULL, 'NE24575160005', 'NEUMATICO SUNNY 245/75R16 106T SN268C             ', 'neumatico-sunny-245-75r16-106t-sn268c-ne24575160005', 'NEUMATICO SUNNY 245/75R16 106T SN268C             ', '', 2, 152, 2, 0, 0, 50514, 0, 0, 50514, 50513, 0, 0, 50513, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(565, NULL, 'NE24575160004', 'NEUMATICO PIRELLI 245/75R16 120R SCORP. ATR       ', 'neumatico-pirelli-245-75r16-120r-scorp-atr-ne24575160004', 'NEUMATICO PIRELLI 245/75R16 120R SCORP. ATR       ', '', 2, 129, 46, 0, 0, 149900, 0, 0, 149900, 149900, 0, 15, 127414, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(566, NULL, 'NE24570160012', 'NEUMATICO WANLI LT245/70R16 S-2082 113/110S       ', 'neumatico-wanli-lt245-70r16-s-2082-113-110s-ne24570160012', 'NEUMATICO WANLI LT245/70R16 S-2082 113/110S       ', '', 2, 139, 5, 0, 0, 84900, 0, 0, 84900, 84847, 0, 5, 80605, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(567, NULL, 'NE24570160006', 'NEUMATICO SUNNY 245/70R16 SN-3606                 ', 'neumatico-sunny-245-70r16-sn-3606-ne24570160006', 'NEUMATICO SUNNY 245/70R16 SN-3606                 ', '', 2, 152, 1, 0, 0, 42751, 0, 0, 42751, 42751, 0, 0, 42751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(568, NULL, 'NE24570160002', 'NEUMATICO PIRELLI 245/70R16 113T SCORP. ATR       ', 'neumatico-pirelli-245-70r16-113t-scorp-atr-ne24570160002', 'NEUMATICO PIRELLI 245/70R16 113T SCORP. ATR       ', '', 2, 129, 20, 0, 0, 103900, 0, 0, 103900, 103900, 0, 0, 103900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(569, NULL, 'NE24570160001', 'NEUMATICO DUNLOP 245 70 R16 AT3                   ', 'neumatico-dunlop-245-70-r16-at3-ne24570160001', 'NEUMATICO DUNLOP 245 70 R16 AT3                   ', '', 2, 159, 1, 0, 0, 75278, 0, 0, 75278, 75278, 0, 0, 75278, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(570, NULL, 'NE24565170006', 'NEUMATICO RYDANZ 245/65R17 107H R09               ', 'neumatico-rydanz-245-65r17-107h-r09-ne24565170006', 'NEUMATICO RYDANZ 245/65R17 107H R09               ', '', 2, 151, 14, 0, 0, 94490, 0, 0, 94490, 97822, 0, 30, 68475, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(571, NULL, 'NE24565170005', 'NEUMATICO WANLI 245/65R17 107 T - S-1606          ', 'neumatico-wanli-245-65r17-107-t-s-1606-ne24565170005', 'NEUMATICO WANLI 245/65R17 107 T - S-1606          ', '', 2, 139, 26, 0, 0, 83990, 0, 0, 83990, 77350, 0, 5, 73482, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(572, NULL, 'NE24565170004', 'NEUMATICO PIRELLI 245/65R17 111T XL SCORP. ATR    ', 'neumatico-pirelli-245-65r17-111t-xl-scorp-atr-ne24565170004', 'NEUMATICO PIRELLI 245/65R17 111T XL SCORP. ATR    ', '', 2, 129, 15, 0, 0, 148900, 0, 0, 148900, 148900, 0, 10, 134009, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(573, NULL, 'NE24565170003', 'NEUMATICO GOODRIDE 245/65R17 107HSU307            ', 'neumatico-goodride-245-65r17-107hsu307-ne24565170003', 'NEUMATICO GOODRIDE 245/65R17 107HSU307            ', '', 2, 163, 1, 0, 0, 46967, 0, 0, 46967, 46967, 0, 0, 46967, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(574, NULL, 'NE24565170001', 'NEUMATICO SUNNY P245/65R17 SN3606 107T            ', 'neumatico-sunny-p245-65r17-sn3606-107t-ne24565170001', 'NEUMATICO SUNNY P245/65R17 SN3606 107T            ', '', 2, 152, 1, 0, 0, 51235, 0, 0, 51235, 51235, 0, 0, 51235, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(575, NULL, 'NE24555170001', 'NEUMATICO PIRELLI 245/55R17 102W PZERO ROSSO      ', 'neumatico-pirelli-245-55r17-102w-pzero-rosso-ne24555170001', 'NEUMATICO PIRELLI 245/55R17 102W PZERO ROSSO      ', '', 2, 129, 6, 0, 0, 81900, 0, 0, 81900, 81901, 0, 0, 81901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(576, NULL, 'NE24550180006', 'NEU CONTINENTAL 245/50R18 100Y CSC 3 SSR          ', 'neu-continental-245-50r18-100y-csc-3-ssr-ne24550180006', 'NEU CONTINENTAL 245/50R18 100Y CSC 3 SSR          ', '', 2, 150, 7, 0, 0, 299155, 0, 0, 299155, 299155, 1, 30, 209409, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(577, NULL, 'NE24550180005', 'NEUMATICO MOMO 245/50R18 100Y M-30 TOPRUN RFT     ', 'neumatico-momo-245-50r18-100y-m-30-toprun-rft-ne24550180005', 'NEUMATICO MOMO 245/50R18 100Y M-30 TOPRUN RFT     ', '', 2, 149, 16, 0, 0, 249900, 0, 0, 249900, 262929, 0, 30, 184050, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(578, NULL, 'NE24550180001', 'NEUMATICO PIRELLI 245/50R18 100W P7 CINT.RFT      ', 'neumatico-pirelli-245-50r18-100w-p7-cint-rft-ne24550180001', 'NEUMATICO PIRELLI 245/50R18 100W P7 CINT.RFT      ', '', 2, 129, 14, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(579, NULL, 'NE24545200001', 'NEUMATICO PIRELLI 245/45ZR20 103Y PZERO           ', 'neumatico-pirelli-245-45zr20-103y-pzero-ne24545200001', 'NEUMATICO PIRELLI 245/45ZR20 103Y PZERO           ', '', 2, 129, 17, 0, 0, 242900, 0, 0, 242900, 242900, 0, 0, 242900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(580, NULL, 'LL56139MB118', 'LLANTA 15 6X139.7 BK330 MB 15X8  MATTE GUN POLISH ', 'llanta-15-6x139-7-bk330-mb-15x8-matte-gun-polish-ll56139mb118', 'LLANTA 15 6X139.7 BK330 MB 15X8  MATTE GUN POLISH MAXXIS', NULL, 1, 248, 5, 0, 0, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, '6X11391', '6X139', 15, 6, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(581, NULL, 'LL226139TI001', 'LLANTA 22 6X139.7 MOD TIS 22X9.5                  ', 'llanta-22-6x139-7-mod-tis-22x9-5-ll226139ti001', 'LLANTA 22 6X139.7 MOD TIS 22X9.5                  ', NULL, 1, 109, 4, 0, 0, 240830, 0, 0, 240830, 240380, 0, 30, 168266, NULL, '6X139', NULL, 22, 9, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(582, NULL, 'LL206139MT001', 'LLANTAS 20X9,5 6X139 MT ET 13 HUB 110 F6998       ', 'llantas-20x9-5-6x139-mt-et-13-hub-110-f6998-ll206139mt001', 'LLANTAS 20X9,5 6X139 MT ET 13 HUB 110 F6998       ', NULL, 1, 248, 48, 0, 0, 169900, 0, 0, 169900, 169900, 0, 30, 118930, NULL, '6X139', NULL, 20, 9, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(583, NULL, 'LL205150MT001', 'LLANTAS 20X9,5 5X150 MT ET 5 HUB 110  F1998       ', 'llantas-20x9-5-5x150-mt-et-5-hub-110-f1998-ll205150mt001', 'LLANTAS 20X9,5 5X150 MT ET 5 HUB 110  F1998       ', NULL, 1, 248, 48, 0, 0, 169900, 0, 0, 169900, 169900, 0, 30, 118930, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(584, NULL, 'LL205127MT002', 'LLANTAS 20X9,5 5X127 MT ET 0 HUB 110 FF2281       ', 'llantas-20x9-5-5x127-mt-et-0-hub-110-ff2281-ll205127mt002', 'LLANTAS 20X9,5 5X127 MT ET 0 HUB 110 FF2281       ', NULL, 1, 248, 44, 0, 0, 169900, 0, 0, 169900, 169900, 0, 30, 118930, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(585, NULL, 'LL205120MG008', 'LLANTAS 20 5X120 G.M BK588 /POL  BMW 20X10        ', 'llantas-20-5x120-g-m-bk588-pol-bmw-20x10-ll205120mg008', 'LLANTAS 20 5X120 G.M BK588 /POL  BMW 20X10        ', NULL, 1, 248, 34, 0, 0, 149900, 0, 0, 149900, 149900, 0, 30, 104929, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(586, NULL, 'LL205114GM001', 'LLANTAS 20X9,5  5X114.3 GM ET 30 HUB 84 R0021     ', 'llantas-20x9-5-5x114-3-gm-et-30-hub-84-r0021-ll205114gm001', 'LLANTAS 20X9,5  5X114.3 GM ET 30 HUB 84 R0021     ', NULL, 1, 248, 28, 0, 0, 149900, 0, 0, 149900, 149900, 0, 30, 104929, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(587, NULL, 'LL205112MG004', 'LLANTAS 20 5X112  +30 GRAF BK628 GM AUDI 20X7.5   ', 'llantas-20-5x112-30-graf-bk628-gm-audi-20x7-5-ll205112mg004', 'LLANTAS 20 5X112  +30 GRAF BK628 GM AUDI 20X7.5   ', NULL, 1, 248, 48, 0, 0, 149900, 0, 0, 149900, 149900, 1, 50, 74950, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(588, NULL, 'LL205100VC003', 'LLANTAS 22 5X100 CROMADO                          ', 'llantas-22-5x100-cromado-ll205100vc003', 'LLANTAS 22 5X100 CROMADO                          ', NULL, 1, 107, 4, 0, 0, 149900, 0, 0, 149900, 149900, 0, 30, 104929, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(589, NULL, 'LL20004HNE001', 'LLANTAS 20 4X100  20 4X114 BPMOD 3110  20X8.5     ', 'llantas-20-4x100-20-4x114-bpmod-3110-20x8-5-ll20004hne001', 'LLANTAS 20 4X100  20 4X114 BPMOD 3110  20X8.5     ', NULL, 1, 107, 8, 0, 0, 149900, 0, 0, 149900, 149900, 0, 30, 104929, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(590, NULL, 'LL195120SI005', 'LLANTAS 19 5X120 ET+20 BK273 SILVER BMW 19X8.5    ', 'llantas-19-5x120-et-20-bk273-silver-bmw-19x8-5-ll195120si005', 'LLANTAS 19 5X120 ET+20 BK273 SILVER BMW 19X8.5    ', NULL, 1, 248, 41, 0, 0, 139000, 0, 0, 139000, 139000, 1, 50, 69501, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(591, NULL, 'LL195120NM004', 'LLANTAS 19 5X120 +35 BK131 NEG/ MAT  BMW 19X8.5   ', 'llantas-19-5x120-35-bk131-neg-mat-bmw-19x8-5-ll195120nm004', 'LLANTAS 19 5X120 +35 BK131 NEG/ MAT  BMW 19X8.5   ', NULL, 1, 248, 16, 0, 0, 139000, 0, 0, 139000, 139000, 0, 30, 97300, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(592, NULL, 'LL195120NE003', 'LLANTAS 19 5X120 ET+35 BK139 MB BMW 19X8.5        ', 'llantas-19-5x120-et-35-bk139-mb-bmw-19x8-5-ll195120ne003', 'LLANTAS 19 5X120 ET+35 BK139 MB BMW 19X8.5        ', NULL, 1, 248, 41, 0, 0, 139000, 0, 0, 139000, 139000, 1, 50, 69501, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(593, NULL, 'LL195114HS001', 'LLANTA 19X9 5X114.3  X RAY L122HS                 ', 'llanta-19x9-5x114-3-x-ray-l122hs-ll195114hs001', 'LLANTA 19X9 5X114.3  X RAY L122HS                 ', NULL, 1, 248, 12, 0, 0, 139000, 0, 0, 139000, 139000, 0, 30, 97300, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(594, NULL, 'LL195112SI002', 'LLANTAS 19 5X112 ET+35 BK227 SILVER  AUDI 19X8.5  ', 'llantas-19-5x112-et-35-bk227-silver-audi-19x8-5-ll195112si002', 'LLANTAS 19 5X112 ET+35 BK227 SILVER  AUDI 19X8.5  ', NULL, 1, 248, 76, 0, 0, 139000, 0, 0, 139000, 139000, 1, 50, 69501, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(595, NULL, 'LL195112MG001', 'LLANTAS 19 5X112 ET +30BK114 GRAFITO  19X8.5      ', 'llantas-19-5x112-et-30bk114-grafito-19x8-5-ll195112mg001', 'LLANTAS 19 5X112 ET +30BK114 GRAFITO  19X8.5      ', NULL, 1, 248, 45, 0, 0, 139000, 0, 0, 139000, 139000, 0, 30, 97300, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(596, NULL, 'LL188100NE039', 'LLANTAS 18 4X100  18 4X108 BLP-ZMOD 771 18X7.5    ', 'llantas-18-4x100-18-4x108-blp-zmod-771-18x7-5-ll188100ne039', 'LLANTAS 18 4X100  18 4X108 BLP-ZMOD 771 18X7.5    ', NULL, 1, 107, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(597, NULL, 'LL188100MG038', 'LLANTAS 18 4X100  18 4X114 NMBM V007 18X7.5       ', 'llantas-18-4x100-18-4x114-nmbm-v007-18x7-5-ll188100mg038', 'LLANTAS 18 4X100  18 4X114 NMBM V007 18X7.5       ', NULL, 1, 107, 44, 0, 0, 95000, 0, 0, 95000, 95000, 1, 40, 57000, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(598, NULL, 'LL188100MG037', 'LLANTAS 18 4X100  18 4X114 NMG V003               ', 'llantas-18-4x100-18-4x114-nmg-v003-ll188100mg037', 'LLANTAS 18 4X100  18 4X114 NMG V003               ', NULL, 1, 107, 6, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(599, NULL, 'LL188100HB001', 'LLANTA 18X7.5 8X100/120  X RAY  L245HB            ', 'llanta-18x7-5-8x100-120-x-ray-l245hb-ll188100hb001', 'LLANTA 18X7.5 8X100/120  X RAY  L245HB            ', NULL, 1, 248, 8, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(600, NULL, 'LL186139NE001', 'LLANTA 18X8.5 6X139.7 BLACK MACHINED BK717        ', 'llanta-18x8-5-6x139-7-black-machined-bk717-ll186139ne001', 'LLANTA 18X8.5 6X139.7 BLACK MACHINED BK717        ', NULL, 1, 248, 32, 0, 0, 105000, 0, 0, 105000, 105000, 0, 30, 73499, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(601, NULL, 'LL185150VC002', 'LLANTA 18X8.5 5X150 V CROMADO  BK422              ', 'llanta-18x8-5-5x150-v-cromado-bk422-ll185150vc002', 'LLANTA 18X8.5 5X150 V CROMADO  BK422              ', NULL, 1, 248, 4, 0, 0, 105000, 0, 0, 105000, 105000, 0, 30, 73499, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(602, NULL, 'LL185150SL001', 'LLANTA 18 5X150 SILVER L052SIL8 X-RAY             ', 'llanta-18-5x150-silver-l052sil8-x-ray-ll185150sl001', 'LLANTA 18 5X150 SILVER L052SIL8 X-RAY             ', NULL, 1, 248, 4, 0, 0, 105000, 0, 0, 105000, 105000, 0, 30, 73499, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(603, NULL, 'LL185139SI033', 'LLANTAS 18 5X139.7 GRIS 964                       ', 'llantas-18-5x139-7-gris-964-ll185139si033', 'LLANTAS 18 5X139.7 GRIS 964                       ', NULL, 1, 107, 4, 0, 0, 105000, 0, 0, 105000, 105000, 0, 30, 73499, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(604, NULL, 'LL185120NE030', 'LLANTAS 18 5X120 MBM L/ROJA BMLR V010             ', 'llantas-18-5x120-mbm-l-roja-bmlr-v010-ll185120ne030', 'LLANTAS 18 5X120 MBM L/ROJA BMLR V010             ', NULL, 1, 107, 8, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(605, NULL, 'LL185120BG033', 'LLANTA 18 5X120 BK542 BG1 18X8 MATTE BLACK        ', 'llanta-18-5x120-bk542-bg1-18x8-matte-black-ll185120bg033', 'LLANTA 18 5X120 BK542 BG1 18X8 MATTE BLACK        ', NULL, 1, 248, 31, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(606, NULL, 'LL185114SI029', 'LLANTAS 18 5X114 SIL BY550185114 18X8             ', 'llantas-18-5x114-sil-by550185114-18x8-ll185114si029', 'LLANTAS 18 5X114 SIL BY550185114 18X8             ', NULL, 1, 107, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(607, NULL, 'LL185114SI028', 'LLANTAS 18 5X114 ET +35 BK518 SILVER 18X8.0       ', 'llantas-18-5x114-et-35-bk518-silver-18x8-0-ll185114si028', 'LLANTAS 18 5X114 ET +35 BK518 SILVER 18X8.0       ', NULL, 1, 248, 21, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(608, NULL, 'LL185114NM027', 'LLANTAS 18 5X114  MB BK2661851114MB 18X8          ', 'llantas-18-5x114-mb-bk2661851114mb-18x8-ll185114nm027', 'LLANTAS 18 5X114  MB BK2661851114MB 18X8          ', NULL, 1, 248, 16, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(609, NULL, 'LL185114NE026', 'LLANTAS 18 5X114 M/BLP GT03 18X8                  ', 'llantas-18-5x114-m-blp-gt03-18x8-ll185114ne026', 'LLANTAS 18 5X114 M/BLP GT03 18X8                  ', NULL, 1, 107, 20, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(610, NULL, 'LL185114NE025', 'LLANTAS 18 5X114 ET +40 BK531 MB 18X8.0           ', 'llantas-18-5x114-et-40-bk531-mb-18x8-0-ll185114ne025', 'LLANTAS 18 5X114 ET +40 BK531 MB 18X8.0           ', NULL, 1, 248, 5, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(611, NULL, 'LL185114HS023', 'LLANTAS 18 5X114 HSLP GT8 18X7.5                  ', 'llantas-18-5x114-hslp-gt8-18x7-5-ll185114hs023', 'LLANTAS 18 5X114 HSLP GT8 18X7.5                  ', NULL, 1, 107, 6, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(612, NULL, 'LL185112SI021', 'LLANTAS 18 5X112 ET+35 BK432 SILVER  AUDI 18X8.0  ', 'llantas-18-5x112-et-35-bk432-silver-audi-18x8-0-ll185112si021', 'LLANTAS 18 5X112 ET+35 BK432 SILVER  AUDI 18X8.0  ', NULL, 1, 248, 64, 0, 0, 95000, 0, 0, 95000, 95000, 1, 50, 47500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(613, NULL, 'LL185112SI020', 'LLANTAS 18 5X112 ET+35 BK431 SILVER  AUDI 18X8.0  ', 'llantas-18-5x112-et-35-bk431-silver-audi-18x8-0-ll185112si020', 'LLANTAS 18 5X112 ET+35 BK431 SILVER  AUDI 18X8.0  ', NULL, 1, 248, 66, 0, 0, 95000, 0, 0, 95000, 95000, 1, 50, 47500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(614, NULL, 'LL185112SI019', 'LLANTAS 18 5X112 ET+35 BK227 SILVER AUDI 18X8.0   ', 'llantas-18-5x112-et-35-bk227-silver-audi-18x8-0-ll185112si019', 'LLANTAS 18 5X112 ET+35 BK227 SILVER AUDI 18X8.0   ', NULL, 1, 248, 28, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(615, NULL, 'LL185112SI018', 'LLANTAS 18 5X112 ET+35 BK031 SILVER AUDI 18X8.0   ', 'llantas-18-5x112-et-35-bk031-silver-audi-18x8-0-ll185112si018', 'LLANTAS 18 5X112 ET+35 BK031 SILVER AUDI 18X8.0   ', NULL, 1, 248, 56, 0, 0, 95000, 0, 0, 95000, 95000, 1, 50, 47500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(616, NULL, 'LL185112NE017', 'LLANTAS 18 5X112 ET+35 BK633 MB  AUDI 18X8.0      ', 'llantas-18-5x112-et-35-bk633-mb-audi-18x8-0-ll185112ne017', 'LLANTAS 18 5X112 ET+35 BK633 MB  AUDI 18X8.0      ', NULL, 1, 248, 24, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(617, NULL, 'LL185100NE014', 'LLANTAS 18 5X100 NM/BCMLP V008 18X7.5             ', 'llantas-18-5x100-nm-bcmlp-v008-18x7-5-ll185100ne014', 'LLANTAS 18 5X100 NM/BCMLP V008 18X7.5             ', NULL, 1, 107, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(618, NULL, 'LL185100NE012', 'LLANTAS 18 5X100  R)BP-X MOD 3101  18X8           ', 'llantas-18-5x100-r-bp-x-mod-3101-18x8-ll185100ne012', 'LLANTAS 18 5X100  R)BP-X MOD 3101  18X8           ', NULL, 1, 107, 12, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(619, NULL, 'LL184100NE010', 'LLANTA 18 4X100 NEGRO NE004                       ', 'llanta-18-4x100-negro-ne004-ll184100ne010', 'LLANTA 18 4X100 NEGRO NE004                       ', NULL, 1, 109, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(620, NULL, 'LL184100NE006', 'LLANTAS 18 4X100 +45 MR279887516 18X7.5 SX7 MB    ', 'llantas-18-4x100-45-mr279887516-18x7-5-sx7-mb-ll184100ne006', 'LLANTAS 18 4X100 +45 MR279887516 18X7.5 SX7 MB    ', NULL, 1, 248, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(621, NULL, 'LL184100NE002', 'LLANTAS 18 4X100 8* 0  BPMOD 241                  ', 'llantas-18-4x100-8-0-bpmod-241-ll184100ne002', 'LLANTAS 18 4X100 8* 0  BPMOD 241                  ', NULL, 1, 107, 7, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(622, NULL, 'LL184100HB001', 'LLANTAS 18 4X100  18 4X114 7*5B3-ZMOD 355         ', 'llantas-18-4x100-18-4x114-7-5b3-zmod-355-ll184100hb001', 'LLANTAS 18 4X100  18 4X114 7*5B3-ZMOD 355         ', NULL, 1, 107, 4, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(623, NULL, 'LL178100SI085', 'LLANTAS 17 4X100  17 4X114 MBV20 17X7             ', 'llantas-17-4x100-17-4x114-mbv20-17x7-ll178100si085', 'LLANTAS 17 4X100  17 4X114 MBV20 17X7             ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(624, NULL, 'LL178100HB001', 'LLANTA 17 8X100X114 V18 HBCMLB1                   ', 'llanta-17-8x100x114-v18-hbcmlb1-ll178100hb001', 'LLANTA 17 8X100X114 V18 HBCMLB1                   ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(625, NULL, 'LL176139SI080', 'LLANTA 17X8 6X139.7 X RAY L108SIL7                ', 'llanta-17x8-6x139-7-x-ray-l108sil7-ll176139si080', 'LLANTA 17X8 6X139.7 X RAY L108SIL7                ', NULL, 1, 248, 8, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(626, NULL, 'LL176139NE002', 'LLANTA 17X8.5 6X139 BLACK MACHINED BK477          ', 'llanta-17x8-5-6x139-black-machined-bk477-ll176139ne002', 'LLANTA 17X8.5 6X139 BLACK MACHINED BK477          ', NULL, 1, 248, 76, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(627, NULL, 'LL176139NE001', 'LLANTA 17X8.5 6X139.7 BLACK MACHINED BK376        ', 'llanta-17x8-5-6x139-7-black-machined-bk376-ll176139ne001', 'LLANTA 17X8.5 6X139.7 BLACK MACHINED BK376        ', NULL, 1, 248, 20, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(628, NULL, 'LL176139MB081', 'LLANTA 17 6X139.7 BLACK VCHROME 5005 17X9         ', 'llanta-17-6x139-7-black-vchrome-5005-17x9-ll176139mb081', 'LLANTA 17 6X139.7 BLACK VCHROME 5005 17X9         ', NULL, 1, 248, 4, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(629, NULL, 'LL176139MB003', 'LLANTA 17*8 +5 6X139.7 107.3 MB/BC G-14           ', 'llanta-17-8-5-6x139-7-107-3-mb-bc-g-14-ll176139mb003', 'LLANTA 17*8 +5 6X139.7 107.3 MB/BC G-14           ', NULL, 1, 248, 20, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(630, NULL, 'LL176139MB002', 'LLANTA 17X8 6X139.7 BLACK MACHINED F6337          ', 'llanta-17x8-6x139-7-black-machined-f6337-ll176139mb002', 'LLANTA 17X8 6X139.7 BLACK MACHINED F6337          ', NULL, 1, 248, 4, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(631, NULL, 'LL176139MB001', 'LLANTA 17X8 6X139.7 BLACK MACHINED Z7106          ', 'llanta-17x8-6x139-7-black-machined-z7106-ll176139mb001', 'LLANTA 17X8 6X139.7 BLACK MACHINED Z7106          ', NULL, 1, 248, 40, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(632, NULL, 'LL176139HS082', 'LLANTA 17X8 6X139.7 HYPER SILVER RH3002           ', 'llanta-17x8-6x139-7-hyper-silver-rh3002-ll176139hs082', 'LLANTA 17X8 6X139.7 HYPER SILVER RH3002           ', NULL, 1, 248, 16, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(633, NULL, 'LL176139BM002', 'LLANTA 17X9 6X139.7 MATT BLACK MACHINED S0031     ', 'llanta-17x9-6x139-7-matt-black-machined-s0031-ll176139bm002', 'LLANTA 17X9 6X139.7 MATT BLACK MACHINED S0031     ', NULL, 1, 248, 4, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(634, NULL, 'LL176139BL001', 'LLANTA 17X8 6X139.7 BLACK LIP  MACHINED F6589     ', 'llanta-17x8-6x139-7-black-lip-machined-f6589-ll176139bl001', 'LLANTA 17X8 6X139.7 BLACK LIP  MACHINED F6589     ', NULL, 1, 248, 4, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(635, NULL, 'LL176139B4080', 'LLANTA 17 6X139.7 BK349 B4 17X8.5 MB              ', 'llanta-17-6x139-7-bk349-b4-17x8-5-mb-ll176139b4080', 'LLANTA 17 6X139.7 BK349 B4 17X8.5 MB              ', NULL, 1, 248, 66, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(636, NULL, 'LL176135NE001', 'LLANTA 17X8.5 6X135 BLACK MACHINED BK376          ', 'llanta-17x8-5-6x135-black-machined-bk376-ll176135ne001', 'LLANTA 17X8.5 6X135 BLACK MACHINED BK376          ', NULL, 1, 248, 33, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(637, NULL, 'LL175150CB001', 'LLANTA 17 5X150 ET60CB110 SILVE L052SIL6 X-RAY    ', 'llanta-17-5x150-et60cb110-silve-l052sil6-x-ray-ll175150cb001', 'LLANTA 17 5X150 ET60CB110 SILVE L052SIL6 X-RAY    ', NULL, 1, 248, 13, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(638, NULL, 'LL175139SI076', 'LLANTAS 17 5X139 SIL RG2 17X8                     ', 'llantas-17-5x139-sil-rg2-17x8-ll175139si076', 'LLANTAS 17 5X139 SIL RG2 17X8                     ', NULL, 1, 107, 40, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(639, NULL, 'LL175130MB001', 'LLANTA 17 5X130 BK424 M 5B1 17X17.5  HYPER SILVER ', 'llanta-17-5x130-bk424-m-5b1-17x17-5-hyper-silver-ll175130mb001', 'LLANTA 17 5X130 BK424 M 5B1 17X17.5  HYPER SILVER ', NULL, 1, 248, 40, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(640, NULL, 'LL175120MG001', 'LLANTAS 17X7.5 5X120 SILVER MACHINE MGB  17WL7    ', 'llantas-17x7-5-5x120-silver-machine-mgb-17wl7-ll175120mg001', 'LLANTAS 17X7.5 5X120 SILVER MACHINE MGB  17WL7    ', NULL, 1, 248, 12, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(641, NULL, 'LL175114SI073', 'LLANTA 17X7.5 5X114 SILVER BK484                  ', 'llanta-17x7-5-5x114-silver-bk484-ll175114si073', 'LLANTA 17X7.5 5X114 SILVER BK484                  ', NULL, 1, 248, 5, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(642, NULL, 'LL175114SI070', 'LLANTAS 17 5X114 S BK172175114S 17X7.5            ', 'llantas-17-5x114-s-bk172175114s-17x7-5-ll175114si070', 'LLANTAS 17 5X114 S BK172175114S 17X7.5            ', NULL, 1, 248, 11, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(643, NULL, 'LL175114NE069', 'LLANTAS 17 5X114 N/MB V29 RPF1  17X8              ', 'llantas-17-5x114-n-mb-v29-rpf1-17x8-ll175114ne069', 'LLANTAS 17 5X114 N/MB V29 RPF1  17X8              ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(644, NULL, 'LL175114NE067', 'LLANTAS 17 5X114 MBLR2 V005  17X7                 ', 'llantas-17-5x114-mblr2-v005-17x7-ll175114ne067', 'LLANTAS 17 5X114 MBLR2 V005  17X7                 ', NULL, 1, 107, 6, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(645, NULL, 'LL175114GT073', 'LLANTA 17 5X114 GT08 HBLP        LL175114GT073    ', 'llanta-17-5x114-gt08-hblp-ll175114gt073-ll175114gt073', 'LLANTA 17 5X114 GT08 HBLP        LL175114GT073    ', NULL, 1, 248, 15, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(646, NULL, 'LL175112MG062', 'LLANTAS 17 5X112 NMBM ZL18 17X7.5                 ', 'llantas-17-5x112-nmbm-zl18-17x7-5-ll175112mg062', 'LLANTAS 17 5X112 NMBM ZL18 17X7.5                 ', NULL, 1, 107, 24, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(647, NULL, 'LL175112MG001', 'LLANTA 17 5X112 BK217 17X7.5 MATTE GUN POLISH     ', 'llanta-17-5x112-bk217-17x7-5-matte-gun-polish-ll175112mg001', 'LLANTA 17 5X112 BK217 17X7.5 MATTE GUN POLISH     ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(648, NULL, 'LL175105NM060', 'LLANTAS 17 5X105 SM BK366175105 SM 17X7.5  BK366  ', 'llantas-17-5x105-sm-bk366175105-sm-17x7-5-bk366-ll175105nm060', 'LLANTAS 17 5X105 SM BK366175105 SM 17X7.5  BK366  ', NULL, 1, 248, 16, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(649, NULL, 'LL175100SI057', 'LLANTAS 17 5X100 S BK172175100S 17X7.5            ', 'llantas-17-5x100-s-bk172175100s-17x7-5-ll175100si057', 'LLANTAS 17 5X100 S BK172175100S 17X7.5            ', NULL, 1, 248, 7, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(650, NULL, 'LL175100SB060', 'LLANTA 17 5X100 5X115 SILVER/NEGRO MOD 2698       ', 'llanta-17-5x100-5x115-silver-negro-mod-2698-ll175100sb060', 'LLANTA 17 5X100 5X115 SILVER/NEGRO MOD 2698       ', NULL, 1, 109, 5, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(651, NULL, 'LL175100NM056', 'LLANTAS 17 5X100 MTB BK360175100MTB  17X7.5       ', 'llantas-17-5x100-mtb-bk360175100mtb-17x7-5-ll175100nm056', 'LLANTAS 17 5X100 MTB BK360175100MTB  17X7.5       ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(652, NULL, 'LL175100NE056', 'LLANTA 17X7.5 5X100 BLACK MACHINED BK816          ', 'llanta-17x7-5-5x100-black-machined-bk816-ll175100ne056', 'LLANTA 17X7.5 5X100 BLACK MACHINED BK816          ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(653, NULL, 'LL175100NE053', 'LLANTAS 17 5X100 NEGRO L/AZUL MBLB V005           ', 'llantas-17-5x100-negro-l-azul-mblb-v005-ll175100ne053', 'LLANTAS 17 5X100 NEGRO L/AZUL MBLB V005           ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(654, NULL, 'LL175100NE052', 'LLANTAS 17 5X100 NEGRO L/ROJA MBLR V005           ', 'llantas-17-5x100-negro-l-roja-mblr-v005-ll175100ne052', 'LLANTAS 17 5X100 NEGRO L/ROJA MBLR V005           ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(655, NULL, 'LL175100NE049', 'LLANTAS 17 5X100 BY769 MB 17X7.5                  ', 'llantas-17-5x100-by769-mb-17x7-5-ll175100ne049', 'LLANTAS 17 5X100 BY769 MB 17X7.5                  ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(656, NULL, 'LL175100NE001', 'LLANTAS 17 5X100 MB GT01  17X7                    ', 'llantas-17-5x100-mb-gt01-17x7-ll175100ne001', 'LLANTAS 17 5X100 MB GT01  17X7                    ', NULL, 1, 248, 6, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(657, NULL, 'LL175100GO060', 'LLANTA 17 5X100/114.3 ET20 CB73 L247G0M0          ', 'llanta-17-5x100-114-3-et20-cb73-l247g0m0-ll175100go060', 'LLANTA 17 5X100/114.3 ET20 CB73 L247G0M0          ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(658, NULL, 'LL174114NE001', 'LLANTAS 17 4X114 MB GT01  17X7                    ', 'llantas-17-4x114-mb-gt01-17x7-ll174114ne001', 'LLANTAS 17 4X114 MB GT01  17X7                    ', NULL, 1, 248, 33, 0, 0, 54750, 0, 0, 54750, 54750, 1, 40, 32850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(659, NULL, 'LL174108CA064', 'LLANTA 17X7.5 4X108 H-7008 CA-WPB LLH7008174108CA ', 'llanta-17x7-5-4x108-h-7008-ca-wpb-llh7008174108ca-ll174108ca064', 'LLANTA 17X7.5 4X108 H-7008 CA-WPB LLH7008174108CA ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(660, NULL, 'LL174100ZL086', 'LLANTA 17 4X100 ZL60 S    LL174100S               ', 'llanta-17-4x100-zl60-s-ll174100s-ll174100zl086', 'LLANTA 17 4X100 ZL60 S    LL174100S               ', NULL, 1, 248, 40, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(661, NULL, 'LL174100SI041', 'LLANTAS 17 4X100 MS ZL62 17X7                     ', 'llantas-17-4x100-ms-zl62-17x7-ll174100si041', 'LLANTAS 17 4X100 MS ZL62 17X7                     ', NULL, 1, 107, 20, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(662, NULL, 'LL174100SI037', 'LLANTAS 17 4X100 SILVER BY51017SIL  17X7.5        ', 'llantas-17-4x100-silver-by51017sil-17x7-5-ll174100si037', 'LLANTAS 17 4X100 SILVER BY51017SIL  17X7.5        ', NULL, 1, 107, 6, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(663, NULL, 'LL174100SI002', 'LLANTA 17 4X100 S ZL63 17X7                       ', 'llanta-17-4x100-s-zl63-17x7-ll174100si002', 'LLANTA 17 4X100 S ZL63 17X7                       ', NULL, 1, 248, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(664, NULL, 'LL174100SI001', 'LLANTAS 17 4X100 SLP GT01 17X8                    ', 'llantas-17-4x100-slp-gt01-17x8-ll174100si001', 'LLANTAS 17 4X100 SLP GT01 17X8                    ', NULL, 1, 248, 36, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(665, NULL, 'LL174100NE034', 'LLANTAS 17 4X100 MB V007  17X8                    ', 'llantas-17-4x100-mb-v007-17x8-ll174100ne034', 'LLANTAS 17 4X100 MB V007  17X8                    ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(666, NULL, 'LL174100NE028', 'LLANTAS 17 4X100 MOD MJ ANCH 8 MB                 ', 'llantas-17-4x100-mod-mj-anch-8-mb-ll174100ne028', 'LLANTAS 17 4X100 MOD MJ ANCH 8 MB                 ', NULL, 1, 107, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(667, NULL, 'LL174100NE020', 'LLANTAS 17 4X100 MOD 833 MB                       ', 'llantas-17-4x100-mod-833-mb-ll174100ne020', 'LLANTAS 17 4X100 MOD 833 MB                       ', NULL, 1, 107, 7, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(668, NULL, 'LL174100NE001', 'LLANTAS 17 4X100 MB GT01  17X8                    ', 'llantas-17-4x100-mb-gt01-17x8-ll174100ne001', 'LLANTAS 17 4X100 MB GT01  17X8                    ', NULL, 1, 248, 50, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(669, NULL, 'LL174100MC013', 'LLANTAS 17 4X100 MC G7-F 17X7                     ', 'llantas-17-4x100-mc-g7-f-17x7-ll174100mc013', 'LLANTAS 17 4X100 MC G7-F 17X7                     ', NULL, 1, 107, 5, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(670, NULL, 'LL174100HS001', 'LLANTAS 17 4X100 HS MOD. MJ 17X8                  ', 'llantas-17-4x100-hs-mod-mj-17x8-ll174100hs001', 'LLANTAS 17 4X100 HS MOD. MJ 17X8                  ', NULL, 1, 248, 10, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(671, NULL, 'LL174100GT088', 'LLANTA 17 4X100 BLR1 GT01   LL174100GT088         ', 'llanta-17-4x100-blr1-gt01-ll174100gt088-ll174100gt088', 'LLANTA 17 4X100 BLR1 GT01   LL174100GT088         ', NULL, 1, 248, 44, 0, 0, 54750, 0, 0, 54750, 54750, 1, 40, 32850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(672, NULL, 'LL174100GT087', 'LLANTA 17 4X100  GT01 BLKLB1    LL174100GTBLKLB1  ', 'llanta-17-4x100-gt01-blklb1-ll174100gtblklb1-ll174100gt087', 'LLANTA 17 4X100  GT01 BLKLB1    LL174100GTBLKLB1  ', NULL, 1, 248, 101, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(673, NULL, 'LL174100CH088', 'LLANTA 17 4X100 W MOD 333 CH                      ', 'llanta-17-4x100-w-mod-333-ch-ll174100ch088', 'LLANTA 17 4X100 W MOD 333 CH                      ', NULL, 1, 109, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(674, NULL, 'LL174004NE012', 'LLANTA 17 4X4.5 42 MOD 2686  42MM                 ', 'llanta-17-4x4-5-42-mod-2686-42mm-ll174004ne012', 'LLANTA 17 4X4.5 42 MOD 2686  42MM                 ', NULL, 1, 109, 4, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(675, NULL, 'LL17010HSI001', 'LLANTAS  17 5X100  17 5X114 MS GT01 17X7          ', 'llantas-17-5x100-17-5x114-ms-gt01-17x7-ll17010hsi001', 'LLANTAS  17 5X100  17 5X114 MS GT01 17X7          ', NULL, 1, 248, 23, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(676, NULL, 'LL17008HNE002', 'LLANTA 17 8X100114 NM/BM V007  17X8               ', 'llanta-17-8x100114-nm-bm-v007-17x8-ll17008hne002', 'LLANTA 17 8X100114 NM/BM V007  17X8               ', NULL, 1, 248, 16, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(677, NULL, 'LL17008HMG001', 'LLANTAS 17 4X100  17 4X114 NM/G V003              ', 'llantas-17-4x100-17-4x114-nm-g-v003-ll17008hmg001', 'LLANTAS 17 4X100  17 4X114 NM/G V003              ', NULL, 1, 248, 6, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(678, NULL, 'LL17008HHB001', 'LLANTAS 17 4X100 17 4X114 HBLP V008  17X7.5       ', 'llantas-17-4x100-17-4x114-hblp-v008-17x7-5-ll17008hhb001', 'LLANTAS 17 4X100 17 4X114 HBLP V008  17X7.5       ', NULL, 1, 248, 7, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(679, NULL, 'LL17005HHB002', 'LLANTAS 17 5X100  17 5X114  HBLP GT8 17X7         ', 'llantas-17-5x100-17-5x114-hblp-gt8-17x7-ll17005hhb002', 'LLANTAS 17 5X100  17 5X114  HBLP GT8 17X7         ', NULL, 1, 107, 24, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(680, NULL, 'LL168100ZL063', 'LLANTA 16 8X100/114  MB ZL1656                    ', 'llanta-16-8x100-114-mb-zl1656-ll168100zl063', 'LLANTA 16 8X100/114  MB ZL1656                    ', NULL, 1, 248, 33, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(681, NULL, 'LL168100NM001', 'LLANTA 16 8X100X114 GT01 NM/BLP                   ', 'llanta-16-8x100x114-gt01-nm-blp-ll168100nm001', 'LLANTA 16 8X100X114 GT01 NM/BLP                   ', NULL, 1, 248, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(682, NULL, 'LL168100MB001', 'LLANTA 16*7 +35 8X100X114.3 73.1 MBILB1 V161      ', 'llanta-16-7-35-8x100x114-3-73-1-mbilb1-v161-ll168100mb001', 'LLANTA 16*7 +35 8X100X114.3 73.1 MBILB1 V161      ', NULL, 1, 248, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(683, NULL, 'LL168100GP001', 'LLANTAS 16X7.5 8X100/114.3 GREY LIP POLISH        ', 'llantas-16x7-5-8x100-114-3-grey-lip-polish-ll168100gp001', 'LLANTAS 16X7.5 8X100/114.3 GREY LIP POLISH        ', NULL, 1, 248, 8, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(684, NULL, 'LL166139SI059', 'LLANTAS 16 6X139.7 MS ZL1609  16X8                ', 'llantas-16-6x139-7-ms-zl1609-16x8-ll166139si059', 'LLANTAS 16 6X139.7 MS ZL1609  16X8                ', NULL, 1, 107, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(685, NULL, 'LL166139NE044', 'LLANTA 16X8,0 6X139,7 ET-10 CB110 BM BK305        ', 'llanta-16x8-0-6x139-7-et-10-cb110-bm-bk305-ll166139ne044', 'LLANTA 16X8,0 6X139,7 ET-10 CB110 BM BK305        ', NULL, 1, 248, 6, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(686, NULL, 'LL166139MT067', 'LLANTA 16X8,0 6X139,7 ET0 CB110 MT BK315          ', 'llanta-16x8-0-6x139-7-et0-cb110-mt-bk315-ll166139mt067', 'LLANTA 16X8,0 6X139,7 ET0 CB110 MT BK315          ', NULL, 1, 248, 16, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(687, NULL, 'LL166139MS001', 'LLANTA 16X7,0 6X139,7 ET+30 CB106,1 MS FAC ZL1654 ', 'llanta-16x7-0-6x139-7-et-30-cb106-1-ms-fac-zl1654-ll166139ms001', 'LLANTA 16X7,0 6X139,7 ET+30 CB106,1 MS FAC ZL1654 ', NULL, 1, 248, 16, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(688, NULL, 'LL166139MB065', 'LLANTA 16X8,0 6X139,7 ET-10 CB110 MB BK477        ', 'llanta-16x8-0-6x139-7-et-10-cb110-mb-bk477-ll166139mb065', 'LLANTA 16X8,0 6X139,7 ET-10 CB110 MB BK477        ', NULL, 1, 248, 5, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(689, NULL, 'LL166139MB004', 'LLANTA 16X7,0 6X139,7 ET+20 CB110 MB F6601        ', 'llanta-16x7-0-6x139-7-et-20-cb110-mb-f6601-ll166139mb004', 'LLANTA 16X7,0 6X139,7 ET+20 CB110 MB F6601        ', NULL, 1, 248, 9, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(690, NULL, 'LL166139GM001', 'LLANTA 16X7,0 6X139,7 ET0 CB108,1 GM F1902        ', 'llanta-16x7-0-6x139-7-et0-cb108-1-gm-f1902-ll166139gm001', 'LLANTA 16X7,0 6X139,7 ET0 CB108,1 GM F1902        ', NULL, 1, 248, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(691, NULL, 'LL166139BM001', 'LLANTA 16X8 6X139.7 BK740 BLACK MACHINE           ', 'llanta-16x8-6x139-7-bk740-black-machine-ll166139bm001', 'LLANTA 16X8 6X139.7 BK740 BLACK MACHINE           ', NULL, 1, 248, 5, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(692, NULL, 'LL166139BL001', 'LLANTA 16X8,0 6X139,7 ET+10 CB108,1 BL F6589      ', 'llanta-16x8-0-6x139-7-et-10-cb108-1-bl-f6589-ll166139bl001', 'LLANTA 16X8,0 6X139,7 ET+10 CB108,1 BL F6589      ', NULL, 1, 248, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(693, NULL, 'LL165160MB004', 'LLANTA 16X8,0 5X160 MT ET0 CB110 MB F7251         ', 'llanta-16x8-0-5x160-mt-et0-cb110-mb-f7251-ll165160mb004', 'LLANTA 16X8,0 5X160 MT ET0 CB110 MB F7251         ', NULL, 1, 248, 35, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(694, NULL, 'LL165160MB003', 'LLANTA 16X8,0 5X160 ET0 CB110 MB F1910            ', 'llanta-16x8-0-5x160-et0-cb110-mb-f1910-ll165160mb003', 'LLANTA 16X8,0 5X160 ET0 CB110 MB F1910            ', NULL, 1, 248, 100, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(695, NULL, 'LL165160MB002', 'LLANTA 16X7,5 5X160 ET0 CB108,1 MB F1902          ', 'llanta-16x7-5-5x160-et0-cb108-1-mb-f1902-ll165160mb002', 'LLANTA 16X7,5 5X160 ET0 CB108,1 MB F1902          ', NULL, 1, 248, 104, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(696, NULL, 'LL165160MB001', 'LLANTA 16X7 5X160 ET0 CB110 MB ZL37               ', 'llanta-16x7-5x160-et0-cb110-mb-zl37-ll165160mb001', 'LLANTA 16X7 5X160 ET0 CB110 MB ZL37               ', NULL, 1, 248, 56, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(697, NULL, 'LL165150SI040', 'LLANTA 16 5X150 SILVER 16 8.0  ZL1653             ', 'llanta-16-5x150-silver-16-8-0-zl1653-ll165150si040', 'LLANTA 16 5X150 SILVER 16 8.0  ZL1653             ', NULL, 1, 107, 8, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(698, NULL, 'LL165150SI039', 'LLANTA 16 5X150 SILVER 16 8.0                     ', 'llanta-16-5x150-silver-16-8-0-ll165150si039', 'LLANTA 16 5X150 SILVER 16 8.0                     ', NULL, 1, 107, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(699, NULL, 'LL165150MG001', 'LLANTA 16X8 5X150 ET+60 CB110 MG ZL1653           ', 'llanta-16x8-5x150-et-60-cb110-mg-zl1653-ll165150mg001', 'LLANTA 16X8 5X150 ET+60 CB110 MG ZL1653           ', NULL, 1, 248, 17, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(700, NULL, 'LL165139SI038', 'LLANTA 16 5X139.7 F33016139.75H  16X8             ', 'llanta-16-5x139-7-f33016139-75h-16x8-ll165139si038', 'LLANTA 16 5X139.7 F33016139.75H  16X8             ', NULL, 1, 107, 6, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(701, NULL, 'LL165139NM035', 'LLANTA 16 5X139.7 MS BY30616                      ', 'llanta-16-5x139-7-ms-by30616-ll165139nm035', 'LLANTA 16 5X139.7 MS BY30616                      ', NULL, 1, 107, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(702, NULL, 'LL165139NM033', 'LLANTA 16 5X139.7 MB BK314165139MB 16X7           ', 'llanta-16-5x139-7-mb-bk314165139mb-16x7-ll165139nm033', 'LLANTA 16 5X139.7 MB BK314165139MB 16X7           ', NULL, 1, 248, 5, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(703, NULL, 'LL165139NM032', 'LLANTA 16 5X139.7  16X8  MB BK302165139MB         ', 'llanta-16-5x139-7-16x8-mb-bk302165139mb-ll165139nm032', 'LLANTA 16 5X139.7  16X8  MB BK302165139MB         ', NULL, 1, 248, 4, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(704, NULL, 'LL165139MF039', 'LLANTA 16 5X139 ST031 NEGRO MACHINE FACE          ', 'llanta-16-5x139-st031-negro-machine-face-ll165139mf039', 'LLANTA 16 5X139 ST031 NEGRO MACHINE FACE          ', NULL, 1, 248, 12, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(705, NULL, 'LL165130NE001', 'LLANTA 16X7,0 5X130 ET+55 CB84,1 MB BK562         ', 'llanta-16x7-0-5x130-et-55-cb84-1-mb-bk562-ll165130ne001', 'LLANTA 16X7,0 5X130 ET+55 CB84,1 MB BK562         ', NULL, 1, 248, 12, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(706, NULL, 'LL165130MT001', 'LLANTA 16X7,0 5X130 ET+43 CB84,1 MB F7110         ', 'llanta-16x7-0-5x130-et-43-cb84-1-mb-f7110-ll165130mt001', 'LLANTA 16X7,0 5X130 ET+43 CB84,1 MB F7110         ', NULL, 1, 248, 40, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(707, NULL, 'LL165114SI001', 'LLANTA 16X6.5 5X114.3 SILVER BK670                ', 'llanta-16x6-5-5x114-3-silver-bk670-ll165114si001', 'LLANTA 16X6.5 5X114.3 SILVER BK670                ', NULL, 1, 248, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(708, NULL, 'LL165100VC028', 'LLANTA 16 5X100 CROM BY54516  16X7                ', 'llanta-16-5x100-crom-by54516-16x7-ll165100vc028', 'LLANTA 16 5X100 CROM BY54516  16X7                ', NULL, 1, 107, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(709, NULL, 'LL165100NE027', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 NM/BLP GT01      ', 'llanta-16x7-0-5x100-et-38-cb73-1-nm-blp-gt01-ll165100ne027', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 NM/BLP GT01      ', NULL, 1, 107, 32, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(710, NULL, 'LL165100MG029', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 MG ZL1637        ', 'llanta-16x7-0-5x100-et-38-cb73-1-mg-zl1637-ll165100mg029', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 MG ZL1637        ', NULL, 1, 248, 24, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(711, NULL, 'LL165100HB024', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 HBCMLR RA02      ', 'llanta-16x7-0-5x100-et-38-cb73-1-hbcmlr-ra02-ll165100hb024', 'LLANTA 16X7,0 5X100 ET+38 CB73,1 HBCMLR RA02      ', NULL, 1, 107, 61, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(712, NULL, 'LL164114RA006', 'LLANTA 16X7,0 4X114,3 ET+38 CB73,1 HBCMLR1 RA02   ', 'llanta-16x7-0-4x114-3-et-38-cb73-1-hbcmlr1-ra02-ll164114ra006', 'LLANTA 16X7,0 4X114,3 ET+38 CB73,1 HBCMLR1 RA02   ', NULL, 1, 248, 80, 0, 0, 53550, 0, 0, 53550, 53550, 1, 40, 32130, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(713, NULL, 'LL164114NE021', 'LLANTA 16 4X114 M/BLP GT1 16X7                    ', 'llanta-16-4x114-m-blp-gt1-16x7-ll164114ne021', 'LLANTA 16 4X114 M/BLP GT1 16X7                    ', NULL, 1, 107, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(714, NULL, 'LL164114NE020', 'LLANTA 16 4X114 MB BY776164114 16X7               ', 'llanta-16-4x114-mb-by776164114-16x7-ll164114ne020', 'LLANTA 16 4X114 MB BY776164114 16X7               ', NULL, 1, 107, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(715, NULL, 'LL164114NE018', 'LLANTA 16 4X114 MBRL BY303                        ', 'llanta-16-4x114-mbrl-by303-ll164114ne018', 'LLANTA 16 4X114 MBRL BY303                        ', NULL, 1, 107, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(716, NULL, 'LL164114NE017', 'LLANTA 16 4X114 MBYL  BY303                       ', 'llanta-16-4x114-mbyl-by303-ll164114ne017', 'LLANTA 16 4X114 MBYL  BY303                       ', NULL, 1, 107, 8, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(717, NULL, 'LL164114HB016', 'LLANTA 16 4X114  SILVER L/AZUL HBCMLB RA02        ', 'llanta-16-4x114-silver-l-azul-hbcmlb-ra02-ll164114hb016', 'LLANTA 16 4X114  SILVER L/AZUL HBCMLB RA02        ', NULL, 1, 107, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(718, NULL, 'LL164114GT062', 'LLANTA 16X7,0 4X114,3 ET+38 CB73,1 NM/BLP GT01    ', 'llanta-16x7-0-4x114-3-et-38-cb73-1-nm-blp-gt01-ll164114gt062', 'LLANTA 16X7,0 4X114,3 ET+38 CB73,1 NM/BLP GT01    ', NULL, 1, 248, 40, 0, 0, 53550, 0, 0, 53550, 53550, 1, 40, 32130, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(719, NULL, 'LL164100NE015', 'LLANTA 16 4X100 4X108 MOD 2686                    ', 'llanta-16-4x100-4x108-mod-2686-ll164100ne015', 'LLANTA 16 4X100 4X108 MOD 2686                    ', NULL, 1, 109, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(720, NULL, 'LL164100NE007', 'LLANTA 16 4X100 MB RL   BY303                     ', 'llanta-16-4x100-mb-rl-by303-ll164100ne007', 'LLANTA 16 4X100 MB RL   BY303                     ', NULL, 1, 107, 12, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(721, NULL, 'LL164100HB015', 'LLANTA 16 4X100 HBCMLB1 RA02    LL164100HB001     ', 'llanta-16-4x100-hbcmlb1-ra02-ll164100hb001-ll164100hb015', 'LLANTA 16 4X100 HBCMLB1 RA02    LL164100HB001     ', NULL, 1, 248, 20, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(722, NULL, 'LL164100HB006', 'LLANTA 16X7,0 4X100 ET+38 CB73,1 HBCMLR RA02      ', 'llanta-16x7-0-4x100-et-38-cb73-1-hbcmlr-ra02-ll164100hb006', 'LLANTA 16X7,0 4X100 ET+38 CB73,1 HBCMLR RA02      ', NULL, 1, 107, 8, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(723, NULL, 'LL164100GT062', 'LLANTA 16X7,0 4X100 ET+38 CB73,1 NM/BLP GT01      ', 'llanta-16x7-0-4x100-et-38-cb73-1-nm-blp-gt01-ll164100gt062', 'LLANTA 16X7,0 4X100 ET+38 CB73,1 NM/BLP GT01      ', NULL, 1, 248, 140, 0, 0, 53550, 0, 0, 53550, 53550, 1, 40, 32130, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(724, NULL, 'LL1610100NM01', 'LLANTA 16X7,0 10X100X114,3 ET+38 CB73,1 NMBL GT01 ', 'llanta-16x7-0-10x100x114-3-et-38-cb73-1-nmbl-gt01-ll1610100nm01', 'LLANTA 16X7,0 10X100X114,3 ET+38 CB73,1 NMBL GT01 ', NULL, 1, 248, 28, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(725, NULL, 'LL16005HNE004', 'LLANTA 16 5X100  16 5X114 7 NEG/GRIS MOD ZL35     ', 'llanta-16-5x100-16-5x114-7-neg-gris-mod-zl35-ll16005hne004', 'LLANTA 16 5X100  16 5X114 7 NEG/GRIS MOD ZL35     ', NULL, 1, 107, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(726, NULL, 'LL16004HNE002', 'LLANTA 16 8X100/114 NE/GRIS MOD ZL35              ', 'llanta-16-8x100-114-ne-gris-mod-zl35-ll16004hne002', 'LLANTA 16 8X100/114 NE/GRIS MOD ZL35              ', NULL, 1, 107, 4, 0, 0, 53550, 0, 0, 53550, 53550, 0, 30, 37485, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(727, NULL, 'LL158100NM002', 'LLANTA 15X6,5 8X100X114,3 ET+35 CB73,1 NM/BC GW06 ', 'llanta-15x6-5-8x100x114-3-et-35-cb73-1-nm-bc-gw06-ll158100nm002', 'LLANTA 15X6,5 8X100X114,3 ET+35 CB73,1 NM/BC GW06 ', NULL, 1, 248, 5, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(728, NULL, 'LL158100GM124', 'LLANTA 15X8,0 8X100X114,3 ET0 CB73.1 L247WML5     ', 'llanta-15x8-0-8x100x114-3-et0-cb73-1-l247wml5-ll158100gm124', 'LLANTA 15X8,0 8X100X114,3 ET0 CB73.1 L247WML5     ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(729, NULL, 'LL156139SI113', 'LLANTA 15 6X139 MS 60601                          ', 'llanta-15-6x139-ms-60601-ll156139si113', 'LLANTA 15 6X139 MS 60601                          ', NULL, 1, 248, 4, 0, 0, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(730, NULL, 'LL156139SI107', 'LLANTA 15 6X139,7 MS BY101156139MS                ', 'llanta-15-6x139-7-ms-by101156139ms-ll156139si107', 'LLANTA 15 6X139,7 MS BY101156139MS                ', NULL, 1, 107, 8, 0, 0, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(731, NULL, 'LL156139NE106', 'LLANTA 15X8,0 6X139,7 ET10 CB110 NE BK311         ', 'llanta-15x8-0-6x139-7-et10-cb110-ne-bk311-ll156139ne106', 'LLANTA 15X8,0 6X139,7 ET10 CB110 NE BK311         ', NULL, 1, 248, 5, 0, 80, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(732, NULL, 'LL156139BR001', 'LLANTA 15X8,0 6X139,7 ET+0  CB110 BRONZE G-12     ', 'llanta-15x8-0-6x139-7-et-0-cb110-bronze-g-12-ll156139br001', 'LLANTA 15X8,0 6X139,7 ET+0  CB110 BRONZE G-12     ', NULL, 1, 248, 28, 0, 0, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(733, NULL, 'LL155139SI098', 'LLANTA 15 5X139.7 SIL RG2   15X8                  ', 'llanta-15-5x139-7-sil-rg2-15x8-ll155139si098', 'LLANTA 15 5X139.7 SIL RG2   15X8                  ', NULL, 1, 107, 20, 0, 0, 52500, 0, 0, 52500, 52500, 0, 30, 36751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(734, NULL, 'LL155114SI093', 'LLANTAS 15 5X114 BY81015 S                        ', 'llantas-15-5x114-by81015-s-ll155114si093', 'LLANTAS 15 5X114 BY81015 S                        ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(735, NULL, 'LL155114NE094', 'LLANTA 15 5X114 MOD 335                           ', 'llanta-15-5x114-mod-335-ll155114ne094', 'LLANTA 15 5X114 MOD 335                           ', NULL, 1, 109, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(736, NULL, 'LL155114NE087', 'LLANTA 15 5X114 35 73.1 MBBY72015MB               ', 'llanta-15-5x114-35-73-1-mbby72015mb-ll155114ne087', 'LLANTA 15 5X114 35 73.1 MBBY72015MB               ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(737, NULL, 'LL155100SI081', 'LLANTA 15 5X100 GRIS/PLATEADO    BY50415MSG       ', 'llanta-15-5x100-gris-plateado-by50415msg-ll155100si081', 'LLANTA 15 5X100 GRIS/PLATEADO    BY50415MSG       ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(738, NULL, 'LL155100NE079', 'LLANTA 15 5X100 MB BY720155100MB 15X7             ', 'llanta-15-5x100-mb-by720155100mb-15x7-ll155100ne079', 'LLANTA 15 5X100 MB BY720155100MB 15X7             ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(739, NULL, 'LL155100HB074', 'LLANTA 15X6,5 5X100 ET+38 CB73,1 HBCMLR RA02      ', 'llanta-15x6-5-5x100-et-38-cb73-1-hbcmlr-ra02-ll155100hb074', 'LLANTA 15X6,5 5X100 ET+38 CB73,1 HBCMLR RA02      ', NULL, 1, 107, 32, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(740, NULL, 'LL155100HB073', 'LLANTA 15X6,5 5X100 ET+38 CB73,1 HBCMLB RA02      ', 'llanta-15x6-5-5x100-et-38-cb73-1-hbcmlb-ra02-ll155100hb073', 'LLANTA 15X6,5 5X100 ET+38 CB73,1 HBCMLB RA02      ', NULL, 1, 107, 46, 0, 0, 49750, 0, 0, 49750, 49750, 1, 40, 29850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(741, NULL, 'LL155100CR072', 'LLANTA 15 5X100 CROM BY106155100 15X5             ', 'llanta-15-5x100-crom-by106155100-15x5-ll155100cr072', 'LLANTA 15 5X100 CROM BY106155100 15X5             ', NULL, 1, 107, 9, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(742, NULL, 'LL155004TF071', 'LLANTA 15 5X4.5 +42 40T5765 AME SILVERSTONE TEF   ', 'llanta-15-5x4-5-42-40t5765-ame-silverstone-tef-ll155004tf071', 'LLANTA 15 5X4.5 +42 40T5765 AME SILVERSTONE TEF   ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(743, NULL, 'LL154144V0001', 'LLANTA 15 4X114 V008 MC      LL154144V0001        ', 'llanta-15-4x114-v008-mc-ll154144v0001-ll154144v0001', 'LLANTA 15 4X114 V008 MC      LL154144V0001        ', NULL, 1, 248, 40, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(744, NULL, 'LL154114SI069', 'LLANTA 15 4X114 GRIS PLATEADO BY509               ', 'llanta-15-4x114-gris-plateado-by509-ll154114si069', 'LLANTA 15 4X114 GRIS PLATEADO BY509               ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(745, NULL, 'LL154114RA058', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 HBCMLR1 RA02   ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-hbcmlr1-ra02-ll154114ra058', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 HBCMLR1 RA02   ', NULL, 1, 248, 44, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(746, NULL, 'LL154114NE067', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 NM/BM V006     ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-nm-bm-v006-ll154114ne067', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 NM/BM V006     ', NULL, 1, 107, 24, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(747, NULL, 'LL154114NE063', 'LLANTA 15 4X114 MB BY50415114MB 15X7              ', 'llanta-15-4x114-mb-by50415114mb-15x7-ll154114ne063', 'LLANTA 15 4X114 MB BY50415114MB 15X7              ', NULL, 1, 107, 6, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(748, NULL, 'LL154114NE062', 'LLANTA 15 4X114 MB BY503154114MB                  ', 'llanta-15-4x114-mb-by503154114mb-ll154114ne062', 'LLANTA 15 4X114 MB BY503154114MB                  ', NULL, 1, 107, 8, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(749, NULL, 'LL154114NE061', 'LLANTA 15 5X114 ET+35 BK208 MB                    ', 'llanta-15-5x114-et-35-bk208-mb-ll154114ne061', 'LLANTA 15 5X114 ET+35 BK208 MB                    ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(750, NULL, 'LL154114NE001', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 NM/BMLR2 GW02  ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-nm-bmlr2-gw02-ll154114ne001', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 NM/BMLR2 GW02  ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(751, NULL, 'LL154114MG060', 'LLANTA 15 4X114 NMBMLR GW06 ROJA                  ', 'llanta-15-4x114-nmbmlr-gw06-roja-ll154114mg060', 'LLANTA 15 4X114 NMBMLR GW06 ROJA                  ', NULL, 1, 107, 32, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(752, NULL, 'LL154114HB057', 'LLANTA 15 4X114 HBCMLP V12R  15X6,5               ', 'llanta-15-4x114-hbcmlp-v12r-15x6-5-ll154114hb057', 'LLANTA 15 4X114 HBCMLP V12R  15X6,5               ', NULL, 1, 107, 9, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(753, NULL, 'LL154114HB055', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 HBCMLB RA02    ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-hbcmlb-ra02-ll154114hb055', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 HBCMLB RA02    ', NULL, 1, 107, 35, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(754, NULL, 'LL154114GW071', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 MBLB2 GW02     ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-mblb2-gw02-ll154114gw071', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 MBLB2 GW02     ', NULL, 1, 248, 32, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(755, NULL, 'LL154114GW070', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 MBLB2 GW01     ', 'llanta-15x6-5-4x114-3-et-38-cb73-1-mblb2-gw01-ll154114gw070', 'LLANTA 15X6,5 4X114,3 ET+38 CB73,1 MBLB2 GW01     ', NULL, 1, 248, 60, 0, 0, 49750, 0, 0, 49750, 49750, 1, 40, 29850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(756, NULL, 'LL154100WM050', 'LLANTA 15X8,5 4X100 ET+15 CB73,1 WE L483WMLC X-R  ', 'llanta-15x8-5-4x100-et-15-cb73-1-we-l483wmlc-x-r-ll154100wm050', 'LLANTA 15X8,5 4X100 ET+15 CB73,1 WE L483WMLC X-R  ', NULL, 1, 248, 8, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(757, NULL, 'LL154100VC045', 'LLANTA 15 4X100 CROM BY50315VC 15X7               ', 'llanta-15-4x100-crom-by50315vc-15x7-ll154100vc045', 'LLANTA 15 4X100 CROM BY50315VC 15X7               ', NULL, 1, 107, 9, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(758, NULL, 'LL154100SI046', 'LLANTA 15X6,5 4X100 ET+35 CB73,1 SILVER BK479     ', 'llanta-15x6-5-4x100-et-35-cb73-1-silver-bk479-ll154100si046', 'LLANTA 15X6,5 4X100 ET+35 CB73,1 SILVER BK479     ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(759, NULL, 'LL154100SI045', 'LLANTA 15 4X100 SILVER 1593                       ', 'llanta-15-4x100-silver-1593-ll154100si045', 'LLANTA 15 4X100 SILVER 1593                       ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(760, NULL, 'LL154100SI039', 'LLANTA 15 4X100 GRIS PLATEADO 15X7 BY 504         ', 'llanta-15-4x100-gris-plateado-15x7-by-504-ll154100si039', 'LLANTA 15 4X100 GRIS PLATEADO 15X7 BY 504         ', NULL, 1, 107, 5, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(761, NULL, 'LL154100NE039', 'LLANTA 15X6,5 4X100 ET+35 CB73,1 MB BK317         ', 'llanta-15x6-5-4x100-et-35-cb73-1-mb-bk317-ll154100ne039', 'LLANTA 15X6,5 4X100 ET+35 CB73,1 MB BK317         ', NULL, 1, 248, 12, 0, 80, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(762, NULL, 'LL154100NE036', 'LLANTA 15 4X100 NM/BM V007                        ', 'llanta-15-4x100-nm-bm-v007-ll154100ne036', 'LLANTA 15 4X100 NM/BM V007                        ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(763, NULL, 'LL154100NE035', 'LLANTA 15 4X100 NMBMLR GW06 ROJA                  ', 'llanta-15-4x100-nmbmlr-gw06-roja-ll154100ne035', 'LLANTA 15 4X100 NMBMLR GW06 ROJA                  ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(764, NULL, 'LL154100MB007', 'LLANTA 15 4X100 MB/RED BY   305                   ', 'llanta-15-4x100-mb-red-by-305-ll154100mb007', 'LLANTA 15 4X100 MB/RED BY   305                   ', NULL, 1, 107, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(765, NULL, 'LL154100MB001', 'LLANTA 15X6,5 4X100 ET+38 CB73,1 MBLB2 GW01       ', 'llanta-15x6-5-4x100-et-38-cb73-1-mblb2-gw01-ll154100mb001', 'LLANTA 15X6,5 4X100 ET+38 CB73,1 MBLB2 GW01       ', NULL, 1, 248, 5, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(766, NULL, 'LL154100HS002', 'LLANTA 15 4X100 S ZL1593                          ', 'llanta-15-4x100-s-zl1593-ll154100hs002', 'LLANTA 15 4X100 S ZL1593                          ', NULL, 1, 107, 12, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(767, NULL, 'LL154100GTF47', 'LLANTA 15X6,5 4X100 ET+38 CB73,1 HBFM GTF03       ', 'llanta-15x6-5-4x100-et-38-cb73-1-hbfm-gtf03-ll154100gtf47', 'LLANTA 15X6,5 4X100 ET+38 CB73,1 HBFM GTF03       ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(768, NULL, 'LL154100GO051', 'LLANTA 15X8,5 4X100 ET+15 CB73,1 GO L483GML1 XRAY ', 'llanta-15x8-5-4x100-et-15-cb73-1-go-l483gml1-xray-ll154100go051', 'LLANTA 15X8,5 4X100 ET+15 CB73,1 GO L483GML1 XRAY ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(769, NULL, 'LL154100CR013', 'LLANTA 15 4X100 CROM BY106154100                  ', 'llanta-15-4x100-crom-by106154100-ll154100cr013', 'LLANTA 15 4X100 CROM BY106154100                  ', NULL, 1, 107, 9, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(770, NULL, 'LL1510100SL01', 'LLANTA 15X8,0 10X100X108 SILVER L402SIL2 X-RAY    ', 'llanta-15x8-0-10x100x108-silver-l402sil2-x-ray-ll1510100sl01', 'LLANTA 15X8,0 10X100X108 SILVER L402SIL2 X-RAY    ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(771, NULL, 'LL15008HNE005', 'LLANTA 15X6,5 8X100X114,3 BLPILP V15F             ', 'llanta-15x6-5-8x100x114-3-blpilp-v15f-ll15008hne005', 'LLANTA 15X6,5 8X100X114,3 BLPILP V15F             ', NULL, 1, 107, 9, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(772, NULL, 'LL15008HHS119', 'LLANTA 15 4X114 ET +35 HS BK006 HS                ', 'llanta-15-4x114-et-35-hs-bk006-hs-ll15008hhs119', 'LLANTA 15 4X114 ET +35 HS BK006 HS                ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(773, NULL, 'LL148100NE097', 'LLANTA 14X6,0 8X100X114,3 ET+38 CB73,1 MBILR V13  ', 'llanta-14x6-0-8x100x114-3-et-38-cb73-1-mbilr-v13-ll148100ne097', 'LLANTA 14X6,0 8X100X114,3 ET+38 CB73,1 MBILR V13  ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(774, NULL, 'LL145100SI092', 'LLANTA 14 5X100 MS BY50914                        ', 'llanta-14-5x100-ms-by50914-ll145100si092', 'LLANTA 14 5X100 MS BY50914                        ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(775, NULL, 'LL144114SI091', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 GW01 MBLB2     ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-gw01-mblb2-ll144114si091', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 GW01 MBLB2     ', NULL, 1, 248, 61, 0, 0, 40900, 0, 0, 40900, 40900, 1, 40, 24540, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(776, NULL, 'LL144114SI090', 'LLANTA 14 4X114 S ZL1466                          ', 'llanta-14-4x114-s-zl1466-ll144114si090', 'LLANTA 14 4X114 S ZL1466                          ', NULL, 1, 107, 6, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(777, NULL, 'LL144114SI088', 'LLANTA 14 4X114 SILVER ZL1452                     ', 'llanta-14-4x114-silver-zl1452-ll144114si088', 'LLANTA 14 4X114 SILVER ZL1452                     ', NULL, 1, 248, 16, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(778, NULL, 'LL144114SI087', 'LLANTA 14 4X114 MS BY509144114MS                  ', 'llanta-14-4x114-ms-by509144114ms-ll144114si087', 'LLANTA 14 4X114 MS BY509144114MS                  ', NULL, 1, 107, 7, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(779, NULL, 'LL144114NE082', 'LLANTA 14 4X114 MB V72                            ', 'llanta-14-4x114-mb-v72-ll144114ne082', 'LLANTA 14 4X114 MB V72                            ', NULL, 1, 107, 64, 0, 0, 40900, 0, 0, 40900, 40900, 1, 40, 24540, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(780, NULL, 'LL144114NE080', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 NMBM V006      ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-nmbm-v006-ll144114ne080', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 NMBM V006      ', NULL, 1, 107, 35, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(781, NULL, 'LL144114NE079', 'LLANTA 14 4X114 NMBM GW01                         ', 'llanta-14-4x114-nmbm-gw01-ll144114ne079', 'LLANTA 14 4X114 NMBM GW01                         ', NULL, 1, 107, 42, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(782, NULL, 'LL144114NE073', 'LLANTA 14 4X114 MB 503144H MB                     ', 'llanta-14-4x114-mb-503144h-mb-ll144114ne073', 'LLANTA 14 4X114 MB 503144H MB                     ', NULL, 1, 107, 6, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(783, NULL, 'LL144114NE007', 'LLANTA 14 4X114 MB V71                            ', 'llanta-14-4x114-mb-v71-ll144114ne007', 'LLANTA 14 4X114 MB V71                            ', NULL, 1, 107, 64, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(784, NULL, 'LL144114NE006', 'LLANTA 14X6,0 4X114,3 ET+36 CB73,1 BLP ZL1464     ', 'llanta-14x6-0-4x114-3-et-36-cb73-1-blp-zl1464-ll144114ne006', 'LLANTA 14X6,0 4X114,3 ET+36 CB73,1 BLP ZL1464     ', NULL, 1, 107, 64, 0, 0, 40900, 0, 0, 40900, 40900, 1, 40, 24540, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(785, NULL, 'LL144114NE005', 'LLANTA 14X5,5 4X114,3 ET+35 CB73,1 MG GTF03       ', 'llanta-14x5-5-4x114-3-et-35-cb73-1-mg-gtf03-ll144114ne005', 'LLANTA 14X5,5 4X114,3 ET+35 CB73,1 MG GTF03       ', NULL, 1, 107, 36, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(786, NULL, 'LL144114NE003', 'LLANTA 14 4X114 HBCMLP V12R  14X6                 ', 'llanta-14-4x114-hbcmlp-v12r-14x6-ll144114ne003', 'LLANTA 14 4X114 HBCMLP V12R  14X6                 ', NULL, 1, 248, 63, 0, 0, 40900, 0, 0, 40900, 40900, 1, 40, 24540, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(787, NULL, 'LL144114NE002', 'LLANTA 14 4X114 NM/BMLR2 GW08                     ', 'llanta-14-4x114-nm-bmlr2-gw08-ll144114ne002', 'LLANTA 14 4X114 NM/BMLR2 GW08                     ', NULL, 1, 248, 48, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(788, NULL, 'LL144114NE001', 'LLANTA 14X6,0 4X114,3 ET+36 CB73,1 MB V007        ', 'llanta-14x6-0-4x114-3-et-36-cb73-1-mb-v007-ll144114ne001', 'LLANTA 14X6,0 4X114,3 ET+36 CB73,1 MB V007        ', NULL, 1, 248, 34, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(789, NULL, 'LL144114MG072', 'LLANTA 14 4X114 NMG V008B                         ', 'llanta-14-4x114-nmg-v008b-ll144114mg072', 'LLANTA 14 4X114 NMG V008B                         ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(790, NULL, 'LL144114MG071', 'LLANTA 14 4X114 NMG  V007                         ', 'llanta-14-4x114-nmg-v007-ll144114mg071', 'LLANTA 14 4X114 NMG  V007                         ', NULL, 1, 107, 20, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(791, NULL, 'LL144114MG070', 'LLANTA 14 4X114 NMG V006                          ', 'llanta-14-4x114-nmg-v006-ll144114mg070', 'LLANTA 14 4X114 NMG V006                          ', NULL, 1, 107, 8, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(792, NULL, 'LL144114MG068', 'LLANTA 14 4X114 MGLB GW06B                        ', 'llanta-14-4x114-mglb-gw06b-ll144114mg068', 'LLANTA 14 4X114 MGLB GW06B                        ', NULL, 1, 107, 8, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(793, NULL, 'LL144114MG067', 'LLANTA 14 4X114 NM/BMLR2 GW06B                    ', 'llanta-14-4x114-nm-bmlr2-gw06b-ll144114mg067', 'LLANTA 14 4X114 NM/BMLR2 GW06B                    ', NULL, 1, 107, 60, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(794, NULL, 'LL144114MG066', 'LLANTA 14 4X114 NMBMLB GW06B                      ', 'llanta-14-4x114-nmbmlb-gw06b-ll144114mg066', 'LLANTA 14 4X114 NMBMLB GW06B                      ', NULL, 1, 107, 20, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(795, NULL, 'LL144114MG065', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 NMBMLR GW02    ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-nmbmlr-gw02-ll144114mg065', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 NMBMLR GW02    ', NULL, 1, 107, 36, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(796, NULL, 'LL144114MG064', 'LLANTA 14 4X114 MGLR GW01                         ', 'llanta-14-4x114-mglr-gw01-ll144114mg064', 'LLANTA 14 4X114 MGLR GW01                         ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(797, NULL, 'LL144114MG063', 'LLANTA 14 4X114 MGLB GW01                         ', 'llanta-14-4x114-mglb-gw01-ll144114mg063', 'LLANTA 14 4X114 MGLB GW01                         ', NULL, 1, 107, 14, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(798, NULL, 'LL144114HB062', 'LLANTA 14 4X114 HBCMLP V12F                       ', 'llanta-14-4x114-hbcmlp-v12f-ll144114hb062', 'LLANTA 14 4X114 HBCMLP V12F                       ', NULL, 1, 107, 8, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(799, NULL, 'LL144114HB061', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HBCMLR RA02    ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-hbcmlr-ra02-ll144114hb061', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HBCMLR RA02    ', NULL, 1, 107, 44, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(800, NULL, 'LL144114HB060', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HBCMLB RA02    ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-hbcmlb-ra02-ll144114hb060', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HBCMLB RA02    ', NULL, 1, 107, 29, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(801, NULL, 'LL144114HB059', 'LLANTA 14 4X114 HP KR716F                         ', 'llanta-14-4x114-hp-kr716f-ll144114hb059', 'LLANTA 14 4X114 HP KR716F                         ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(802, NULL, 'LL144114HB002', 'LLANTA 14 4X114 HB V71                            ', 'llanta-14-4x114-hb-v71-ll144114hb002', 'LLANTA 14 4X114 HB V71                            ', NULL, 1, 107, 21, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(803, NULL, 'LL144114HB001', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HB V71         ', 'llanta-14x6-0-4x114-3-et-38-cb73-1-hb-v71-ll144114hb001', 'LLANTA 14X6,0 4X114,3 ET+38 CB73,1 HB V71         ', NULL, 1, 248, 44, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(804, NULL, 'LL144100SI053', 'LLANTA 14X6,0 4X100 ET+38 CB57,1 S ZL1425         ', 'llanta-14x6-0-4x100-et-38-cb57-1-s-zl1425-ll144100si053', 'LLANTA 14X6,0 4X100 ET+38 CB57,1 S ZL1425         ', NULL, 1, 248, 52, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(805, NULL, 'LL144100SI001', 'LLANTA 14X5,5 4X100 ET+44 CB56 MS ZL1458          ', 'llanta-14x5-5-4x100-et-44-cb56-ms-zl1458-ll144100si001', 'LLANTA 14X5,5 4X100 ET+44 CB56 MS ZL1458          ', NULL, 1, 248, 8, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(806, NULL, 'LL144100NE041', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 SI BK317       ', 'llanta-14x6-0-4x100-et-35-cb-73-1-si-bk317-ll144100ne041', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 SI BK317       ', NULL, 1, 248, 29, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(807, NULL, 'LL144100NE040', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 BM BK571       ', 'llanta-14x6-0-4x100-et-35-cb-73-1-bm-bk571-ll144100ne040', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 BM BK571       ', NULL, 1, 248, 16, 0, 260, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(808, NULL, 'LL144100NE039', 'LLANTA 14x6,0 4X100 ET +35 CB 73,1 BM BK307       ', 'llanta-14x6-0-4x100-et-35-cb-73-1-bm-bk307-ll144100ne039', 'LLANTA 14x6,0 4X100 ET +35 CB 73,1 BM BK307       ', NULL, 1, 248, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(809, NULL, 'LL144100NE002', 'LLANTA 14X6,0 4X100 ET+35 CB73,1 BM GW01          ', 'llanta-14x6-0-4x100-et-35-cb73-1-bm-gw01-ll144100ne002', 'LLANTA 14X6,0 4X100 ET+35 CB73,1 BM GW01          ', NULL, 1, 248, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(810, NULL, 'LL144100CR017', 'LLANTA 14 4X100 CROM BY50414VC                    ', 'llanta-14-4x100-crom-by50414vc-ll144100cr017', 'LLANTA 14 4X100 CROM BY50414VC                    ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(811, NULL, 'LL144100BR001', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 BR F4264       ', 'llanta-14x6-0-4x100-et-35-cb-73-1-br-f4264-ll144100br001', 'LLANTA 14X6,0 4X100 ET +35 CB 73,1 BR F4264       ', NULL, 1, 248, 16, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(812, NULL, 'LL144100BM023', 'LLANTA 14X5,5 4X100 ET +35 CB 73,1 BM BK370       ', 'llanta-14x5-5-4x100-et-35-cb-73-1-bm-bk370-ll144100bm023', 'LLANTA 14X5,5 4X100 ET +35 CB 73,1 BM BK370       ', NULL, 1, 248, 252, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(813, NULL, 'LL1410100HS02', 'LLANTA 14X5,5 10X100X114,3 ET+38 CB73,1 HS ZL1460 ', 'llanta-14x5-5-10x100x114-3-et-38-cb73-1-hs-zl1460-ll1410100hs02', 'LLANTA 14X5,5 10X100X114,3 ET+38 CB73,1 HS ZL1460 ', NULL, 1, 248, 61, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(814, NULL, 'LL14010HNE001', 'LLANTA 14X5,5 10X100X114,3 ET+35 CB73,1 MG GTF03  ', 'llanta-14x5-5-10x100x114-3-et-35-cb73-1-mg-gtf03-ll14010hne001', 'LLANTA 14X5,5 10X100X114,3 ET+35 CB73,1 MG GTF03  ', NULL, 1, 248, 5, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(815, NULL, 'LL14008HSI006', 'LLANTA 14 8X100/114 114F10514                     ', 'llanta-14-8x100-114-114f10514-ll14008hsi006', 'LLANTA 14 8X100/114 114F10514                     ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(816, NULL, 'LL14008HNE010', 'LLANTA 14X6,0 8X100X114,3 ET+38 CB73,1 MB V71     ', 'llanta-14x6-0-8x100x114-3-et-38-cb73-1-mb-v71-ll14008hne010', 'LLANTA 14X6,0 8X100X114,3 ET+38 CB73,1 MB V71     ', NULL, 1, 107, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(817, NULL, 'LL138100MG064', 'LLANTA 13X5,5 8X100X114,3 ET+38 CB73,1 NMBM V007  ', 'llanta-13x5-5-8x100x114-3-et-38-cb73-1-nmbm-v007-ll138100mg064', 'LLANTA 13X5,5 8X100X114,3 ET+38 CB73,1 NMBM V007  ', NULL, 1, 107, 5, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(818, NULL, 'LL138100MB007', 'LLANTA 13X5,5 8X100X114 ET +35 CB73,1 MB BK319    ', 'llanta-13x5-5-8x100x114-et-35-cb73-1-mb-bk319-ll138100mb007', 'LLANTA 13X5,5 8X100X114 ET +35 CB73,1 MB BK319    ', NULL, 1, 248, 4, 0, 100, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(819, NULL, 'LL134114NE004', 'LLANTA 13X6,0 4X114,3 ET+38 CB73,1 NM/BMLR2 GT08  ', 'llanta-13x6-0-4x114-3-et-38-cb73-1-nm-bmlr2-gt08-ll134114ne004', 'LLANTA 13X6,0 4X114,3 ET+38 CB73,1 NM/BMLR2 GT08  ', NULL, 1, 248, 5, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(820, NULL, 'LL134100SI044', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 SI BK106       ', 'llanta-13x5-5-4x100-et-35-cb-73-1-si-bk106-ll134100si044', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 SI BK106       ', NULL, 1, 248, 136, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(821, NULL, 'LL134100SI043', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 SI BK264       ', 'llanta-13x5-5-4x100-et-35-cb-73-1-si-bk264-ll134100si043', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 SI BK264       ', NULL, 1, 248, 120, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(822, NULL, 'LL134100NE030', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 NE BK3077      ', 'llanta-13x5-5-4x100-et-35-cb-73-1-ne-bk3077-ll134100ne030', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 NE BK3077      ', NULL, 1, 248, 28, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(823, NULL, 'LL134100NE020', 'LLANTA 13 4X100 NEGRO MOD 767                     ', 'llanta-13-4x100-negro-mod-767-ll134100ne020', 'LLANTA 13 4X100 NEGRO MOD 767                     ', NULL, 1, 107, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(824, NULL, 'LL134100NE016', 'LLANTA 13 4X100 SIL/BLK LRED                      ', 'llanta-13-4x100-sil-blk-lred-ll134100ne016', 'LLANTA 13 4X100 SIL/BLK LRED                      ', NULL, 1, 107, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(825, NULL, 'LL134100NE008', 'LLANTA 13X6,0 4X100 ET+38 CB73,1 NMBMLR2 GW06B    ', 'llanta-13x6-0-4x100-et-38-cb73-1-nmbmlr2-gw06b-ll134100ne008', 'LLANTA 13X6,0 4X100 ET+38 CB73,1 NMBMLR2 GW06B    ', NULL, 1, 248, 6, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(826, NULL, 'LL134100NE006', 'LLANTA 13X6,0 4X100 ET+38 CB73,1NM/BCMLR GW03     ', 'llanta-13x6-0-4x100-et-38-cb73-1nm-bcmlr-gw03-ll134100ne006', 'LLANTA 13X6,0 4X100 ET+38 CB73,1NM/BCMLR GW03     ', NULL, 1, 107, 5, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(827, NULL, 'LL134100NE005', 'LLANTA 13X6,0 4X100 ET+38 CB73,1 NM/BCMLP GW03    ', 'llanta-13x6-0-4x100-et-38-cb73-1-nm-bcmlp-gw03-ll134100ne005', 'LLANTA 13X6,0 4X100 ET+38 CB73,1 NM/BCMLP GW03    ', NULL, 1, 107, 5, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(828, NULL, 'LL134100MT003', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 MT F4381       ', 'llanta-13x5-5-4x100-et-35-cb-73-1-mt-f4381-ll134100mt003', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 MT F4381       ', NULL, 1, 248, 11, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(829, NULL, 'LL134100MT002', 'LLANTA 13X5,5 4X100 ET+35 CB73,1 MT F1952         ', 'llanta-13x5-5-4x100-et-35-cb73-1-mt-f1952-ll134100mt002', 'LLANTA 13X5,5 4X100 ET+35 CB73,1 MT F1952         ', NULL, 1, 248, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(830, NULL, 'LL134100MG002', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 NMBMLR2 GW11   ', 'llanta-13x5-5-4x100-et-35-cb-73-1-nmbmlr2-gw11-ll134100mg002', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 NMBMLR2 GW11   ', NULL, 1, 107, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(831, NULL, 'LL134100MB004', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 MBLR2 GW11     ', 'llanta-13x5-5-4x100-et-35-cb-73-1-mblr2-gw11-ll134100mb004', 'LLANTA 13X5,5 4X100 ET +35 CB 73,1 MBLR2 GW11     ', NULL, 1, 248, 8, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(832, NULL, 'LL13008HNE002', 'LLANTA 13X5,5 8X100X114,3 ET+36 CB73,1 MB ZL1327  ', 'llanta-13x5-5-8x100x114-3-et-36-cb73-1-mb-zl1327-ll13008hne002', 'LLANTA 13X5,5 8X100X114,3 ET+36 CB73,1 MB ZL1327  ', NULL, 1, 248, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(833, NULL, 'LL174100GM001', 'LLANTAS 17X7.5 4X100 GUNMETAL B 17WL6             ', 'llantas-17x7-5-4x100-gunmetal-b-17wl6-ll174100gm001', 'LLANTAS 17X7.5 4X100 GUNMETAL B 17WL6             ', NULL, 1, 248, 5, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(834, NULL, 'LL185127BM001', 'LLANTA 18X9   5X127  ET0 CB110 BLACK MACHINE 5261 ', 'llanta-18x9-5x127-et0-cb110-black-machine-5261-ll185127bm001', 'LLANTA 18X9   5X127  ET0 CB110 BLACK MACHINE 5261 ', NULL, 1, 248, 72, 0, 0, 95000, 0, 0, 95000, 95000, 0, 30, 66500, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(835, NULL, 'LL154100SI038', 'LLANTA 15 4X100 MB  701                           ', 'llanta-15-4x100-mb-701-ll154100si038', 'LLANTA 15 4X100 MB  701                           ', NULL, 1, 248, 4, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(836, NULL, 'LL176139BM003', 'LLANTA 17X9  6X139.7  ET-12  CB110 BLA/MA LIP 5080', 'llanta-17x9-6x139-7-et-12-cb110-bla-ma-lip-5080-ll176139bm003', 'LLANTA 17X9  6X139.7  ET-12  CB110 BLA/MA LIP 5080', NULL, 1, 248, 28, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(837, NULL, 'LL174100MS037', 'LLANTA 17X7 4X100 4X114 MSV20                     ', 'llanta-17x7-4x100-4x114-msv20-ll174100ms037', 'LLANTA 17X7 4X100 4X114 MSV20                     ', NULL, 1, 252, 48, 0, 0, 54750, 0, 0, 54750, 54750, 0, 30, 38325, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(838, NULL, 'LL175127MB001', 'LLANTA 17X7.5 5X127 40/71.7 MATT B L1076MB7 X-RAY ', 'llanta-17x7-5-5x127-40-71-7-matt-b-l1076mb7-x-ray-ll175127mb001', 'LLANTA 17X7.5 5X127 40/71.7 MATT B L1076MB7 X-RAY ', NULL, 1, 119, 19, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(839, NULL, 'LL175127BM001', 'LLANTA 17X9 5X127/114.3 ET-12/CB78 L902BMW5  X-RAY', 'llanta-17x9-5x127-114-3-et-12-cb78-l902bmw5-x-ray-ll175127bm001', 'LLANTA 17X9 5X127/114.3 ET-12/CB78 L902BMW5  X-RAY', NULL, 1, 119, 11, 0, 0, 72250, 0, 0, 72250, 72250, 0, 25, 54188, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(840, NULL, 'LL165139MB001', 'LLANTA 16X8,0 5X139,7 ET20 CB95,3 MB L916MB68Y    ', 'llanta-16x8-0-5x139-7-et20-cb95-3-mb-l916mb68y-ll165139mb001', 'LLANTA 16X8,0 5X139,7 ET20 CB95,3 MB L916MB68Y    ', NULL, 1, 119, 12, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(841, NULL, 'LL158100VC001', 'LLANTA 15X8,0 8X100X114,3 ET10 CB73 L436VCO5      ', 'llanta-15x8-0-8x100x114-3-et10-cb73-l436vco5-ll158100vc001', 'LLANTA 15X8,0 8X100X114,3 ET10 CB73 L436VCO5      ', NULL, 1, 119, 4, 0, 0, 91900, 0, 0, 91900, 92701, 0, 30, 64891, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(842, NULL, 'LL156139VC001', 'LLANTA 15X10 6X139 ET-46 CB110 V L087VCB5 X-RAY   ', 'llanta-15x10-6x139-et-46-cb110-v-l087vcb5-x-ray-ll156139vc001', 'LLANTA 15X10 6X139 ET-46 CB110 V L087VCB5 X-RAY   ', NULL, 1, 119, 4, 0, 0, 106900, 0, 0, 106900, 106981, 0, 30, 74887, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(843, NULL, 'LL166139BM005', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1387) SLK      ', 'llanta-16x8-6x139-7-black-machine-1387-slk-ll166139bm005', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1387) SLK      ', NULL, 1, 252, 19, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(844, NULL, 'LL166139BM004', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1383) SLK      ', 'llanta-16x8-6x139-7-black-machine-1383-slk-ll166139bm004', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1383) SLK      ', NULL, 1, 252, 8, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(845, NULL, 'LL166139BM003', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1307) SLK      ', 'llanta-16x8-6x139-7-black-machine-1307-slk-ll166139bm003', 'LLANTA 16X8 6X139.7 BLACK MACHINE (1307) SLK      ', NULL, 1, 252, 11, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(846, NULL, 'LL166139MB005', 'LLANTA 16X8,0 6X139,7 ET0 CB110 MB BK311          ', 'llanta-16x8-0-6x139-7-et0-cb110-mb-bk311-ll166139mb005', 'LLANTA 16X8,0 6X139,7 ET0 CB110 MB BK311          ', NULL, 1, 119, 12, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(847, NULL, 'LL166139SI003', 'LLANTA 16X7 6X139.7 30/106 SILVER L932SIL6 X-RAY  ', 'llanta-16x7-6x139-7-30-106-silver-l932sil6-x-ray-ll166139si003', 'LLANTA 16X7 6X139.7 30/106 SILVER L932SIL6 X-RAY  ', NULL, 1, 119, 12, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(848, NULL, 'LL166139BM006', 'LLANTA 16X8 6X139.7 ET-12 B/M/W L1399BM6 X-RAY    ', 'llanta-16x8-6x139-7-et-12-b-m-w-l1399bm6-x-ray-ll166139bm006', 'LLANTA 16X8 6X139.7 ET-12 B/M/W L1399BM6 X-RAY    ', NULL, 1, 119, 24, 0, 0, 67500, 0, 0, 67500, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(849, NULL, 'LL166114MB001', 'LLANTA 16X7,0 6X114,3 ET+35 CB73,1 MA L1313MB6 X-R', 'llanta-16x7-0-6x114-3-et-35-cb73-1-ma-l1313mb6-x-r-ll166114mb001', 'LLANTA 16X7,0 6X114,3 ET+35 CB73,1 MA L1313MB6 X-R', NULL, 1, 119, 8, 0, 0, 53550, 0, 0, 53550, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(850, NULL, 'LL155114BL001', 'LLANTA 15X6,5 5X114,3 ET0 CB83,6 NE L199BMF5 X-RAY', 'llanta-15x6-5-5x114-3-et0-cb83-6-ne-l199bmf5-x-ray-ll155114bl001', 'LLANTA 15X6,5 5X114,3 ET0 CB83,6 NE L199BMF5 X-RAY', NULL, 1, 119, 8, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(851, NULL, 'LL134100MB007', 'LLANTA 13X7,0 4X100 ET-7 CB73,1 MB L207MBFL       ', 'llanta-13x7-0-4x100-et-7-cb73-1-mb-l207mbfl-ll134100mb007', 'LLANTA 13X7,0 4X100 ET-7 CB73,1 MB L207MBFL       ', NULL, 1, 119, 4, 0, 0, 33900, 0, 0, 33900, 33900, 0, 30, 23730, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(852, NULL, 'LL165105WF001', 'LLANTA 16X7,0 5X105 ET+36 CB56,6 WF L1927 X-RAY   ', 'llanta-16x7-0-5x105-et-36-cb56-6-wf-l1927-x-ray-ll165105wf001', 'LLANTA 16X7,0 5X105 ET+36 CB56,6 WF L1927 X-RAY   ', NULL, 1, 119, 8, 0, 0, 63790, 0, 0, 63790, 67500, 0, 30, 47250, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(853, NULL, 'LL155100BR001', 'LLANTA 15X8 5X100/108 20/67.1 BRONC L403BR15 X-RAY', 'llanta-15x8-5x100-108-20-67-1-bronc-l403br15-x-ray-ll155100br001', 'LLANTA 15X8 5X100/108 20/67.1 BRONC L403BR15 X-RAY', NULL, 1, 119, 8, 0, 0, 49750, 0, 0, 49750, 49750, 0, 30, 34825, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(854, NULL, 'LL144100MB014', 'LLANTA 14X6,5 4X100X114,3 MB L1143MBG X-RAY       ', 'llanta-14x6-5-4x100x114-3-mb-l1143mbg-x-ray-ll144100mb014', 'LLANTA 14X6,5 4X100X114,3 MB L1143MBG X-RAY       ', NULL, 1, 119, 4, 0, 0, 40900, 0, 0, 40900, 40900, 0, 30, 28630, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(855, NULL, 'LL155114MB003', 'LLANTA 15X6 5X114 ET34 CB73 BLACK MACHINED 1517   ', 'llanta-15x6-5x114-et34-cb73-black-machined-1517-ll155114mb003', 'LLANTA 15X6 5X114 ET34 CB73 BLACK MACHINED 1517   ', NULL, 1, 252, 40, 0, 0, 50900, 0, 0, 50900, 51051, 0, 30, 35736, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(856, NULL, 'TNVOLACC00143', 'VOLANTE PVC CUERO 8014                            ', 'volante-pvc-cuero-8014-tnvolacc00143', 'VOLANTE PVC CUERO 8014                            ', NULL, 29, 109, 0, 0, 0, 49740, 0, 0, 49740, 49738, 0, 30, 34817, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(857, NULL, 'TNVOLACC00135', 'VOLANTE NEGRO/MADERA 8102                         ', 'volante-negro-madera-8102-tnvolacc00135', 'VOLANTE NEGRO/MADERA 8102                         ', NULL, 29, 109, 0, 0, 0, 39400, 0, 0, 39400, 39400, 0, 30, 27579, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(858, NULL, 'TNVOLACC00121', 'VOLANTE DEPORTIVO PVC SILVER 143108P-SL           ', 'volante-deportivo-pvc-silver-143108p-sl-tnvolacc00121', 'VOLANTE DEPORTIVO PVC SILVER 143108P-SL           ', NULL, 29, 110, 0, 0, 0, 40210, 0, 0, 40210, 40204, 0, 30, 28144, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(859, NULL, 'TNVOLACC00120', 'VOLANTE DEPORTIVO PVC RED ND003P-RD               ', 'volante-deportivo-pvc-red-nd003p-rd-tnvolacc00120', 'VOLANTE DEPORTIVO PVC RED ND003P-RD               ', NULL, 29, 110, 0, 0, 0, 37030, 0, 0, 37030, 37030, 0, 30, 25922, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(860, NULL, 'TNVOLACC00119', 'VOLANTE DEPORTIVO PVC BLUE ND003P-BU              ', 'volante-deportivo-pvc-blue-nd003p-bu-tnvolacc00119', 'VOLANTE DEPORTIVO PVC BLUE ND003P-BU              ', NULL, 29, 110, 0, 0, 0, 40350, 0, 0, 40350, 40342, 0, 30, 28240, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(861, NULL, 'TNVOLACC00117', 'VOLANTE DEPORTIVO PVC BLACK 123076P               ', 'volante-deportivo-pvc-black-123076p-tnvolacc00117', 'VOLANTE DEPORTIVO PVC BLACK 123076P               ', NULL, 29, 110, 0, 0, 0, 35970, 0, 0, 35970, 35961, 0, 30, 25172, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(862, NULL, 'TNVOLACC00115', 'VOLANTE DEPORTIVO PVC 330mm AZUL 143108P-BU       ', 'volante-deportivo-pvc-330mm-azul-143108p-bu-tnvolacc00115', 'VOLANTE DEPORTIVO PVC 330mm AZUL 143108P-BU       ', NULL, 29, 110, 0, 0, 0, 40210, 0, 0, 40210, 40204, 0, 30, 28144, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(863, NULL, 'TNVOLACC00113', 'VOLANTE DEPORTIVO PVC 110820P                     ', 'volante-deportivo-pvc-110820p-tnvolacc00113', 'VOLANTE DEPORTIVO PVC 110820P                     ', NULL, 29, 110, 0, 0, 0, 40210, 0, 0, 40210, 40204, 0, 30, 28144, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(864, NULL, 'TNVOLACC00108', 'VOLANTE DEPORTIVO NEGRO/AZUL YH6480BLU            ', 'volante-deportivo-negro-azul-yh6480blu-tnvolacc00108', 'VOLANTE DEPORTIVO NEGRO/AZUL YH6480BLU            ', NULL, 29, 109, 0, 0, 0, 39220, 0, 0, 39220, 39214, 0, 30, 27450, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(865, NULL, 'TNVOLACC00104', 'VOLANTE DEPORTIVO CUERINA 110620P                 ', 'volante-deportivo-cuerina-110620p-tnvolacc00104', 'VOLANTE DEPORTIVO CUERINA 110620P                 ', NULL, 29, 110, 0, 0, 0, 42320, 0, 0, 42320, 42320, 0, 30, 29624, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(866, NULL, 'TNVOLACC00103', 'VOLANTE DEPORTIVO 330mm PVC SILVER V143109PSIL    ', 'volante-deportivo-330mm-pvc-silver-v143109psil-tnvolacc00103', 'VOLANTE DEPORTIVO 330mm PVC SILVER V143109PSIL    ', NULL, 29, 110, 0, 0, 0, 16000, 0, 0, 16000, 40204, 0, 30, 28144, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(867, NULL, 'TNVOLACC00102', 'VOLANTE DEPORTIVO 330mm PVC ROJO 143107P-RD       ', 'volante-deportivo-330mm-pvc-rojo-143107p-rd-tnvolacc00102', 'VOLANTE DEPORTIVO 330mm PVC ROJO 143107P-RD       ', NULL, 29, 110, 0, 0, 0, 18500, 0, 0, 18500, 46149, 0, 30, 32305, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(868, NULL, 'TNVOLACC00100', 'VOLANTE DEPORTIVO 330mm PVC AMARILLO 143108P-YL   ', 'volante-deportivo-330mm-pvc-amarillo-143108p-yl-tnvolacc00100', 'VOLANTE DEPORTIVO 330mm PVC AMARILLO 143108P-YL   ', NULL, 29, 110, 0, 0, 0, 40210, 0, 0, 40210, 40204, 0, 30, 28144, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(869, NULL, 'TNVOLACC00096', 'VOLANTE CUERO 123097                              ', 'volante-cuero-123097-tnvolacc00096', 'VOLANTE CUERO 123097                              ', NULL, 29, 109, 0, 0, 0, 62290, 0, 0, 62290, 62285, 0, 30, 43599, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(870, NULL, 'TNVOLACC00092', 'VOLANTE CARBON/AMARILLO CENTRO NEGRO V4117BK      ', 'volante-carbon-amarillo-centro-negro-v4117bk-tnvolacc00092', 'VOLANTE CARBON/AMARILLO CENTRO NEGRO V4117BK      ', NULL, 29, 109, 0, 0, 0, 26270, 0, 0, 26270, 26266, 0, 30, 18386, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(871, NULL, 'TNVOLACC00088', 'VOLANTE AMARILLO/NEGRO P/AUTO 4156F-YEL           ', 'volante-amarillo-negro-p-auto-4156f-yel-tnvolacc00088', 'VOLANTE AMARILLO/NEGRO P/AUTO 4156F-YEL           ', NULL, 29, 109, 0, 0, 0, 9900, 0, 0, 9900, 22517, 0, 30, 15762, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(872, NULL, 'TNVOLACC00086', 'MAZA ADAPTADORA TWINGO NAONIS                     ', 'maza-adaptadora-twingo-naonis-tnvolacc00086', 'MAZA ADAPTADORA TWINGO NAONIS                     ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(873, NULL, 'TNVOLACC00085', 'MAZA ADAPTADORA SUZUKI NAONIS                     ', 'maza-adaptadora-suzuki-naonis-tnvolacc00085', 'MAZA ADAPTADORA SUZUKI NAONIS                     ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(874, NULL, 'TNVOLACC00082', 'MAZA ADAPTADORA OPEL CHEVETTE NAONIS              ', 'maza-adaptadora-opel-chevette-naonis-tnvolacc00082', 'MAZA ADAPTADORA OPEL CHEVETTE NAONIS              ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(875, NULL, 'TNVOLACC00075', 'MAZA ADAPTADORA FIAT 147 ESTRIA GRU.NAONI MFIAT147', 'maza-adaptadora-fiat-147-estria-gru-naoni-mfiat147-tnvolacc00075', 'MAZA ADAPTADORA FIAT 147 ESTRIA GRU.NAONI MFIAT147', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(876, NULL, 'TNVOLACC00073', 'MAZA ADAPTADORA EXPRESS NAONIS                    ', 'maza-adaptadora-express-naonis-tnvolacc00073', 'MAZA ADAPTADORA EXPRESS NAONIS                    ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(877, NULL, 'TNVOLACC00072', 'MAZA ADAPTADORA DAIHATSU NAONIS                   ', 'maza-adaptadora-daihatsu-naonis-tnvolacc00072', 'MAZA ADAPTADORA DAIHATSU NAONIS                   ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(878, NULL, 'TNVOLACC00071', 'MAZA ADAPTADORA DAEWOO NAONIS                     ', 'maza-adaptadora-daewoo-naonis-tnvolacc00071', 'MAZA ADAPTADORA DAEWOO NAONIS                     ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(879, NULL, 'TNVOLACC00068', 'MAZA ADAPTADORA CHEVROLET PICKUP72 NAONIS         ', 'maza-adaptadora-chevrolet-pickup72-naonis-tnvolacc00068', 'MAZA ADAPTADORA CHEVROLET PICKUP72 NAONIS         ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(880, NULL, 'TNVOLACC00063', 'MAZA ADAPT.FIAT147 ESTRIA FINA NAONIS MFIAT147N   ', 'maza-adapt-fiat147-estria-fina-naonis-mfiat147n-tnvolacc00063', 'MAZA ADAPT.FIAT147 ESTRIA FINA NAONIS MFIAT147N   ', NULL, 29, 108, 0, 0, 0, 16930, 0, 0, 16930, 16929, 0, 30, 11850, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(881, NULL, 'TNVOLACC00057', 'MASA VOLANTE VW GOL M/N AB9 - SAVEIRO MA6011      ', 'masa-volante-vw-gol-m-n-ab9-saveiro-ma6011-tnvolacc00057', 'MASA VOLANTE VW GOL M/N AB9 - SAVEIRO MA6011      ', NULL, 29, 108, 0, 0, 0, 11860, 0, 0, 11860, 11857, 0, 30, 8300, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(882, NULL, 'TNVOLACC00054', 'MASA VOLANTE SUZUKI S5                            ', 'masa-volante-suzuki-s5-tnvolacc00054', 'MASA VOLANTE SUZUKI S5                            ', NULL, 29, 109, 0, 0, 0, 15310, 0, 0, 15310, 15307, 0, 30, 10715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(883, NULL, 'TNVOLACC00052', 'MASA VOLANTE SUBARU T2                            ', 'masa-volante-subaru-t2-tnvolacc00052', 'MASA VOLANTE SUBARU T2                            ', NULL, 29, 109, 0, 0, 0, 15310, 0, 0, 15310, 15307, 0, 30, 10715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(884, NULL, 'TNVOLACC00051', 'MASA VOLANTE SAVEIRO/VW GOL/SENDA 0716006         ', 'masa-volante-saveiro-vw-gol-senda-0716006-tnvolacc00051', 'MASA VOLANTE SAVEIRO/VW GOL/SENDA 0716006         ', NULL, 29, 108, 0, 0, 0, 11860, 0, 0, 11860, 11857, 0, 30, 8300, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(885, NULL, 'TNVOLACC00050', 'MASA VOLANTE NISSAN MN5                           ', 'masa-volante-nissan-mn5-tnvolacc00050', 'MASA VOLANTE NISSAN MN5                           ', NULL, 29, 109, 0, 0, 0, 9340, 0, 0, 9340, 9339, 0, 30, 6538, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(886, NULL, 'TNVOLACC00046', 'MASA VOLANTE HONDA ACCORD96/97 CIVIC 96/00 MA4920 ', 'masa-volante-honda-accord96-97-civic-96-00-ma4920-tnvolacc00046', 'MASA VOLANTE HONDA ACCORD96/97 CIVIC 96/00 MA4920 ', NULL, 29, 110, 0, 0, 0, 11640, 0, 0, 11640, 11638, 0, 30, 8147, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(887, NULL, 'TNVOLACC00043', 'MASA VOLANTE CLIO II 200/2004 0616015             ', 'masa-volante-clio-ii-200-2004-0616015-tnvolacc00043', 'MASA VOLANTE CLIO II 200/2004 0616015             ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(888, NULL, 'TNVOLACC00042', 'MASA V.W GOLF 85/88- FOX88/91 AUDI COUPE (VER MA  ', 'masa-v-w-golf-85-88-fox88-91-audi-coupe-ver-ma-tnvolacc00042', 'MASA V.W GOLF 85/88- FOX88/91 AUDI COUPE (VER MA  ', NULL, 29, 110, 0, 0, 0, 11640, 0, 0, 11640, 11638, 0, 30, 8147, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(889, NULL, 'TNVOLACC00041', 'MASA UNO-DUNA 95" 0316013                         ', 'masa-uno-duna-95-0316013-tnvolacc00041', 'MASA UNO-DUNA 95" 0316013                         ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(890, NULL, 'TNVOLACC00040', 'MASA UNO-DUNA 94" 0316012                         ', 'masa-uno-duna-94-0316012-tnvolacc00040', 'MASA UNO-DUNA 94" 0316012                         ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(891, NULL, 'TNVOLACC00038', 'MASA TOYOTA M/N 0216002                           ', 'masa-toyota-m-n-0216002-tnvolacc00038', 'MASA TOYOTA M/N 0216002                           ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(892, NULL, 'TNVOLACC00037', 'MASA TOYOTA 0216001                               ', 'masa-toyota-0216001-tnvolacc00037', 'MASA TOYOTA 0216001                               ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(893, NULL, 'TNVOLACC00034', 'MASA R19-R21- TRAFIC M/V 0616008                  ', 'masa-r19-r21-trafic-m-v-0616008-tnvolacc00034', 'MASA R19-R21- TRAFIC M/V 0616008                  ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(894, NULL, 'TNVOLACC00031', 'MASA NISSAN V16 - SENTRA 5416001                  ', 'masa-nissan-v16-sentra-5416001-tnvolacc00031', 'MASA NISSAN V16 - SENTRA 5416001                  ', NULL, 29, 108, 0, 0, 0, 13460, 0, 0, 13460, 13455, 0, 30, 9419, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(895, NULL, 'TNVOLACC00030', 'MASA MITSUBISHI 5316001                           ', 'masa-mitsubishi-5316001-tnvolacc00030', 'MASA MITSUBISHI 5316001                           ', NULL, 29, 108, 0, 0, 0, 13460, 0, 0, 13460, 13455, 0, 30, 9419, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(896, NULL, 'TNVOLACC00028', 'MASA MEGANE - KANGOO 0616012                      ', 'masa-megane-kangoo-0616012-tnvolacc00028', 'MASA MEGANE - KANGOO 0616012                      ', NULL, 29, 108, 0, 0, 0, 8050, 0, 0, 8050, 8049, 0, 30, 5635, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(897, NULL, 'TNVOLACC00027', 'MASA MAZDA 323 88UP- 626 80/91-929 TO91 MA5702    ', 'masa-mazda-323-88up-626-80-91-929-to91-ma5702-tnvolacc00027', 'MASA MAZDA 323 88UP- 626 80/91-929 TO91 MA5702    ', NULL, 29, 110, 0, 0, 0, 11640, 0, 0, 11640, 11638, 0, 30, 8147, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(898, NULL, 'TNVOLACC00026', 'MASA HYUNDAI 4816001                              ', 'masa-hyundai-4816001-tnvolacc00026', 'MASA HYUNDAI 4816001                              ', NULL, 29, 108, 0, 0, 0, 13460, 0, 0, 13460, 13455, 0, 30, 9419, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(899, NULL, 'TNVOLACC00025', 'MASA FORD KA 1016017                              ', 'masa-ford-ka-1016017-tnvolacc00025', 'MASA FORD KA 1016017                              ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(900, NULL, 'TNVOLACC00022', 'MASA ELANTRA SCOUPE-EXCEL 91/94 TIBURON 97UPMA4703', 'masa-elantra-scoupe-excel-91-94-tiburon-97upma4703-tnvolacc00022', 'MASA ELANTRA SCOUPE-EXCEL 91/94 TIBURON 97UPMA4703', NULL, 29, 110, 0, 0, 0, 11640, 0, 0, 11640, 11638, 0, 30, 8147, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(901, NULL, 'TNVOLACC00020', 'MASA CLIO I 96/99 M/V 0616010                     ', 'masa-clio-i-96-99-m-v-0616010-tnvolacc00020', 'MASA CLIO I 96/99 M/V 0616010                     ', NULL, 29, 108, 0, 0, 0, 10040, 0, 0, 10040, 10039, 0, 30, 7027, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(902, NULL, 'TNVOLACC00017', 'MASA ADAPTADORA NISSAN VOLANTE YZ7350-N6          ', 'masa-adaptadora-nissan-volante-yz7350-n6-tnvolacc00017', 'MASA ADAPTADORA NISSAN VOLANTE YZ7350-N6          ', NULL, 29, 109, 0, 0, 0, 4700, 0, 0, 4700, 4692, 0, 30, 3284, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(903, NULL, 'TNVOLACC00016', 'MASA ADAPTADORA MITSUBISHI VOLANTE YZ7350-M1      ', 'masa-adaptadora-mitsubishi-volante-yz7350-m1-tnvolacc00016', 'MASA ADAPTADORA MITSUBISHI VOLANTE YZ7350-M1      ', NULL, 29, 109, 0, 0, 0, 4700, 0, 0, 4700, 4692, 0, 30, 3284, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(904, NULL, 'TNVOLACC00015', 'MASA ADAPTADORA HYUNDAI VOLANTE YZ7350-H1         ', 'masa-adaptadora-hyundai-volante-yz7350-h1-tnvolacc00015', 'MASA ADAPTADORA HYUNDAI VOLANTE YZ7350-H1         ', NULL, 29, 109, 0, 0, 0, 4700, 0, 0, 4700, 4692, 0, 30, 3284, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(905, NULL, 'TNVOLACC00014', 'MASA ADAPTADORA HONDA VOLANTE YZ7350-OH90         ', 'masa-adaptadora-honda-volante-yz7350-oh90-tnvolacc00014', 'MASA ADAPTADORA HONDA VOLANTE YZ7350-OH90         ', NULL, 29, 109, 0, 0, 0, 4700, 0, 0, 4700, 4692, 0, 30, 3284, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_regiones`
--

CREATE TABLE `sitio_regiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_regiones`
--

INSERT INTO `sitio_regiones` (`id`, `nombre`, `numero`) VALUES
(1, 'Región de Tarapacá', 1),
(2, 'Región de Antofagasta', 2),
(3, 'Región de Atacama', 3),
(4, 'Región de Coquimbo', 4),
(5, 'Región de Valparaiso', 5),
(6, 'Región del Libertador General Bernardo O Higgins', 6),
(7, 'Región del Maule', 7),
(8, 'Región del Bío-Bío', 8),
(9, 'Región de la Araucanía', 9),
(10, 'Región de Los Lagos', 10),
(11, 'Región de Aysén del General Carlos Ibáñez del Campo', 11),
(12, 'Región de Magallanes y la Antártica Chilena', 12),
(13, 'Región Metropolitana', 13),
(14, 'Región de Los Ríos', 14),
(15, 'Región de Arica y Parinacota', 15);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_servicios`
--

CREATE TABLE `sitio_servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descripcion_corta` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_servicios_sucursales`
--

CREATE TABLE `sitio_servicios_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_sucursales`
--

CREATE TABLE `sitio_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hr_semana` varchar(60) DEFAULT NULL,
  `hr_sabado` varchar(60) DEFAULT NULL,
  `hr_domingo` varchar(60) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `retiro_sucursal` tinyint(1) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_direcciones`
--

CREATE TABLE `sitio_tipo_direcciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_tipo_direcciones`
--

INSERT INTO `sitio_tipo_direcciones` (`id`, `nombre`) VALUES
(3, 'Otra'),
(1, 'Particular'),
(2, 'Trabajo');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_sucursales`
--

CREATE TABLE `sitio_tipo_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_usuarios`
--

CREATE TABLE `sitio_tipo_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `usuario_count` int(11) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_tipo_usuarios`
--

INSERT INTO `sitio_tipo_usuarios` (`id`, `nombre`, `usuario_count`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 'Cliente Normal', NULL, 1, 0, NULL, NULL),
(2, 'Cliente Mayorista', NULL, 1, 0, NULL, NULL),
(3, 'Vendedor Minorista', NULL, 0, 0, NULL, NULL),
(4, 'Vendedor Mayorista', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_usuarios`
--

CREATE TABLE `sitio_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_paterno` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(60) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `codigo_expiracion` datetime DEFAULT NULL,
  `direccion_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_usuarios`
--

INSERT INTO `sitio_usuarios` (`id`, `tipo_usuario_id`, `rut`, `dv`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `email`, `clave`, `telefono`, `fecha_nacimiento`, `codigo`, `codigo_expiracion`, `direccion_count`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 1, 25561884, '9', 'Stephanie', 'Piñero', 'G', '1', 'stephanie.pinero@reach-latam.com', 'c19f17d736a9a685e60f68ec490b1578f4efe06d', '12312312', '1990-12-19', NULL, NULL, 0, 1, 0, NULL, '2017-11-22 17:03:52'),
(2, 1, 25561884, '9', 'Transbank', 'Transbank', 'Transbank', '1', 'transbank@reach-latam.com', 'c19f17d736a9a685e60f68ec490b1578f4efe06d', '12312312', '1990-12-19', NULL, NULL, 0, 1, 0, NULL, '2017-11-22 17:03:52'),
(3, 2, 25561884, '9', 'Mayorista', 'Mayorista', 'Mayorista', '1', 'mayorista@zsmotor.cl', 'c19f17d736a9a685e60f68ec490b1578f4efe06d', '12312312', '1990-12-19', NULL, NULL, 0, 1, 0, NULL, '2017-11-22 17:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_vehiculos`
--

CREATE TABLE `sitio_vehiculos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `modelo` varchar(80) NOT NULL,
  `version` varchar(80) NOT NULL,
  `apernadura` varchar(80) DEFAULT NULL,
  `aro` varchar(80) NOT NULL,
  `ancho` varchar(80) DEFAULT NULL,
  `perfil` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_EMAIL` (`email`),
  ADD KEY `IX_FK_PERFIL_ADMINISTRADOR` (`perfil_id`);

--
-- Indexes for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_BANNER` (`administrador_id`);

--
-- Indexes for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`identificador`),
  ADD UNIQUE KEY `UN_SLUG` (`valor`),
  ADD KEY `IX_FK_PAGINA_CAMPOPAGINA` (`pagina_id`);

--
-- Indexes for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_CARGA` (`administrador_id`);

--
-- Indexes for table `sitio_categorias`
--
ALTER TABLE `sitio_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitio_categoria_paginas`
--
ALTER TABLE `sitio_categoria_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD UNIQUE KEY `UN_SLUG` (`slug`);

--
-- Indexes for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_ADMINISTRADOR_CLIENTE` (`administrador_id`);

--
-- Indexes for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_USUARIO_COMPRA` (`usuario_id`),
  ADD KEY `IX_FK_ESTADOCOMPRA_COMPRA` (`estado_compra_id`),
  ADD KEY `IX_FK_DIRECCION_COMPRA` (`direccion_id`),
  ADD KEY `IX_FK_SUCURSAL_COMPRA` (`sucursal_id`);

--
-- Indexes for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_REGION_COMUNA` (`region_id`);

--
-- Indexes for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_CONFIGURACION` (`administrador_id`);

--
-- Indexes for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_CARGA_DETALLECARGA` (`carga_id`);

--
-- Indexes for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_COMPRA_DETALLECOMPRA` (`compra_id`),
  ADD KEY `IX_FK_PRODUCTO_DETALLECOMPRA` (`producto_id`);

--
-- Indexes for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_USUARIO_DIRECCION` (`usuario_id`),
  ADD KEY `IX_FK_COMUNA_DIRECCION` (`comuna_id`),
  ADD KEY `IX_FK_TIPODIRECCION_DIRECCION` (`tipo_direccion_id`);

--
-- Indexes for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_COMPRA_EMAIL` (`compra_id`);

--
-- Indexes for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_SUCURSAL_ENCARGADOSUCURSAL` (`sucursal_id`);

--
-- Indexes for table `sitio_estado_compras`
--
ALTER TABLE `sitio_estado_compras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_marcas`
--
ALTER TABLE `sitio_marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_NOTICIA` (`administrador_id`);

--
-- Indexes for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_ADMINISTRADOR_PAGINA` (`administrador_id`),
  ADD KEY `IX_FK_CATEGORIAPAGINA_PAGINA` (`categoria_pagina_id`);

--
-- Indexes for table `sitio_perfiles`
--
ALTER TABLE `sitio_perfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_SKU` (`sku`),
  ADD UNIQUE KEY `UN_ID_ERP` (`id_erp`),
  ADD KEY `IX_FK_CATEGORIA_PRODUCTO` (`categoria_id`),
  ADD KEY `IX_FK_MARCA_PRODUCTO` (`marca_id`),
  ADD KEY `IX_SKU` (`sku`),
  ADD KEY `IX_ARO` (`aro`),
  ADD KEY `IX_PERFIL` (`perfil`),
  ADD KEY `IX_ANCHO` (`ancho`),
  ADD KEY `IX_APERNADURAS` (`apernaduras`),
  ADD KEY `IX_APERNADURA1` (`apernadura1`),
  ADD KEY `IX_APERNADURA2` (`apernadura2`);

--
-- Indexes for table `sitio_regiones`
--
ALTER TABLE `sitio_regiones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_servicios`
--
ALTER TABLE `sitio_servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_SERVICIO_SERVICIOSUCURSAL` (`servicio_id`),
  ADD KEY `IX_FK_SUCURSAL_SERVICIOSUCURSAL` (`sucursal_id`);

--
-- Indexes for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD UNIQUE KEY `UN_SLUG` (`slug`),
  ADD KEY `IX_FK_TIPOSUCURSAL_SUCURSAL` (`tipo_sucursal_id`),
  ADD KEY `IX_FK_ADMINISTRADOR_SUCURSAL` (`administrador_id`);

--
-- Indexes for table `sitio_tipo_direcciones`
--
ALTER TABLE `sitio_tipo_direcciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_tipo_sucursales`
--
ALTER TABLE `sitio_tipo_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_tipo_usuarios`
--
ALTER TABLE `sitio_tipo_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_EMAIL` (`email`),
  ADD KEY `IX_FK_TIPOUSUARIO_USUARIO` (`tipo_usuario_id`);

--
-- Indexes for table `sitio_vehiculos`
--
ALTER TABLE `sitio_vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_MARCA` (`marca`),
  ADD KEY `IX_MODELO` (`modelo`),
  ADD KEY `IX_VERSION` (`version`),
  ADD KEY `IX_APERNADURA` (`apernadura`),
  ADD KEY `IX_ARO` (`aro`),
  ADD KEY `IX_ANCHO` (`ancho`),
  ADD KEY `IX_PERFIL` (`perfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_categorias`
--
ALTER TABLE `sitio_categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sitio_categoria_paginas`
--
ALTER TABLE `sitio_categoria_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
--
-- AUTO_INCREMENT for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_estado_compras`
--
ALTER TABLE `sitio_estado_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sitio_marcas`
--
ALTER TABLE `sitio_marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_perfiles`
--
ALTER TABLE `sitio_perfiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=906;
--
-- AUTO_INCREMENT for table `sitio_regiones`
--
ALTER TABLE `sitio_regiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sitio_servicios`
--
ALTER TABLE `sitio_servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_tipo_direcciones`
--
ALTER TABLE `sitio_tipo_direcciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sitio_tipo_sucursales`
--
ALTER TABLE `sitio_tipo_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_tipo_usuarios`
--
ALTER TABLE `sitio_tipo_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sitio_vehiculos`
--
ALTER TABLE `sitio_vehiculos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  ADD CONSTRAINT `FK_PERFIL_ADMINISTRADOR` FOREIGN KEY (`perfil_id`) REFERENCES `sitio_perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  ADD CONSTRAINT `FK_ADMINISTRADOR_BANNER` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  ADD CONSTRAINT `FK_PAGINA_CAMPOPAGINA` FOREIGN KEY (`pagina_id`) REFERENCES `sitio_paginas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CARGA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CLIENTE` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  ADD CONSTRAINT `FK_DIRECCION_COMPRA` FOREIGN KEY (`direccion_id`) REFERENCES `sitio_direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ESTADOCOMPRA_COMPRA` FOREIGN KEY (`estado_compra_id`) REFERENCES `sitio_estado_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SUCURSAL_COMPRA` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIO_COMPRA` FOREIGN KEY (`usuario_id`) REFERENCES `sitio_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  ADD CONSTRAINT `FK_REGION_COMUNA` FOREIGN KEY (`region_id`) REFERENCES `sitio_regiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CONFIGURACION` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  ADD CONSTRAINT `FK_CARGA_DETALLECARGA` FOREIGN KEY (`carga_id`) REFERENCES `sitio_cargas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  ADD CONSTRAINT `FK_COMPRA_DETALLECOMPRA` FOREIGN KEY (`compra_id`) REFERENCES `sitio_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRODUCTO_DETALLECOMPRA` FOREIGN KEY (`producto_id`) REFERENCES `sitio_productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  ADD CONSTRAINT `FK_COMUNA_DIRECCION` FOREIGN KEY (`comuna_id`) REFERENCES `sitio_comunas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TIPODIRECCION_DIRECCION` FOREIGN KEY (`tipo_direccion_id`) REFERENCES `sitio_tipo_direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIO_DIRECCION` FOREIGN KEY (`usuario_id`) REFERENCES `sitio_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  ADD CONSTRAINT `FK_COMPRA_EMAIL` FOREIGN KEY (`compra_id`) REFERENCES `sitio_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  ADD CONSTRAINT `FK_SUCURSAL_ENCARGADOSUCURSAL` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  ADD CONSTRAINT `FK_ADMINISTRADOR_NOTICIA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  ADD CONSTRAINT `FK_ADMINISTRADOR_PAGINA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CATEGORIAPAGINA_PAGINA` FOREIGN KEY (`categoria_pagina_id`) REFERENCES `sitio_categoria_paginas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  ADD CONSTRAINT `FK_CATEGORIA_PRODUCTO` FOREIGN KEY (`categoria_id`) REFERENCES `sitio_categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MARCA_PRODUCTO` FOREIGN KEY (`marca_id`) REFERENCES `sitio_marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  ADD CONSTRAINT `FK_SERVICIO_SERVICIOSUCURSAL` FOREIGN KEY (`servicio_id`) REFERENCES `sitio_servicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SUCURSAL_SERVICIOSUCURSAL` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  ADD CONSTRAINT `FK_ADMINISTRADOR_SUCURSAL` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TIPOSUCURSAL_SUCURSAL` FOREIGN KEY (`tipo_sucursal_id`) REFERENCES `sitio_tipo_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  ADD CONSTRAINT `FK_TIPOUSUARIO_USUARIO` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `sitio_tipo_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
