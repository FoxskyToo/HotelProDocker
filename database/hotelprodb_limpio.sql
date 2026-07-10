-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para hotelpro
CREATE DATABASE IF NOT EXISTS `hotelpro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotelpro`;

-- Volcando estructura para tabla hotelpro.auth_tokens
CREATE TABLE IF NOT EXISTS `auth_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `token` varchar(500) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_auth_usuario` (`usuario_id`),
  CONSTRAINT `fk_auth_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.auth_tokens: ~3 rows (aproximadamente)
INSERT INTO `auth_tokens` (`id`, `usuario_id`, `token`, `fecha_creacion`) VALUES
	(1, 1, 'e4e5547b-3fb9-4fbc-83b4-c4565b83592f', '2026-05-24 20:51:18'),
	(2, 1, 'f079086c-5dd6-4d2a-a780-578a96acbb49', '2026-07-02 21:01:09'),
	(3, 1, '67028d57-2812-455d-b644-1f8180921bc6', '2026-07-02 21:01:24');

-- Volcando estructura para tabla hotelpro.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.clientes: ~3 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nombre`, `correo`, `telefono`, `fecha_registro`) VALUES
	(2, 'Juan Pérez', 'juan@test.com', '912345678', '2026-07-02 21:16:25'),
	(3, 'María González', 'maria@test.com', '923456789', '2026-07-02 21:16:25'),
	(4, 'Pedro Rojas', 'pedro@test.com', '934567890', '2026-07-02 21:16:25'),
	(5, 'Cliente Prueba', 'cliente.prueba@test.com', '912345678', '2026-07-02 22:37:24');

-- Volcando estructura para tabla hotelpro.consumos
CREATE TABLE IF NOT EXISTS `consumos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint NOT NULL,
  `servicio_id` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consumo_reserva` (`reserva_id`),
  KEY `fk_consumo_servicio` (`servicio_id`),
  CONSTRAINT `fk_consumo_reserva` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`),
  CONSTRAINT `fk_consumo_servicio` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.consumos: ~2 rows (aproximadamente)
INSERT INTO `consumos` (`id`, `reserva_id`, `servicio_id`, `cantidad`, `total`) VALUES
	(4, 11, 1, 2, 24000.00),
	(5, 11, 1, 2, 24000.00);

-- Volcando estructura para tabla hotelpro.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cargo` varchar(80) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.empleados: ~3 rows (aproximadamente)
INSERT INTO `empleados` (`id`, `nombre`, `cargo`, `correo`, `telefono`, `activo`) VALUES
	(1, 'Carlos Soto', 'Recepcionista', 'carlos@hotel.cl', '911111111', 1),
	(2, 'Ana Muñoz', 'Mucama', 'ana@hotel.cl', '922222222', 1),
	(3, 'Luis Díaz', 'Mantención', 'luis@hotel.cl', '933333333', 1),
	(4, 'Empleado Prueba', 'Mantencion', 'empleado.prueba@hotel.cl', '911111111', 1);

-- Volcando estructura para tabla hotelpro.habitaciones
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.habitaciones: ~3 rows (aproximadamente)
INSERT INTO `habitaciones` (`id`, `numero`, `tipo`, `precio`, `disponible`) VALUES
	(2, '101', 'Simple', 45000.00, 1),
	(3, '102', 'Doble', 65000.00, 1),
	(4, '201', 'Suite', 120000.00, 1),
	(5, '301', 'Doble', 70000.00, 1);

-- Volcando estructura para tabla hotelpro.mantenimientos
CREATE TABLE IF NOT EXISTS `mantenimientos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `habitacion_id` bigint NOT NULL,
  `empleado_id` bigint NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `estado` varchar(30) DEFAULT 'PENDIENTE',
  `fecha_mantenimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mantenimiento_habitacion` (`habitacion_id`),
  KEY `fk_mantenimiento_empleado` (`empleado_id`),
  CONSTRAINT `fk_mantenimiento_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `fk_mantenimiento_habitacion` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.mantenimientos: ~3 rows (aproximadamente)
INSERT INTO `mantenimientos` (`id`, `habitacion_id`, `empleado_id`, `descripcion`, `estado`, `fecha_mantenimiento`) VALUES
	(3, 2, 3, 'Cambio de ampolletas', 'FINALIZADO', '2026-06-20'),
	(4, 3, 3, 'Revisión aire acondicionado', 'PENDIENTE', '2026-07-05'),
	(6, 2, 3, 'Cambio de cerradura', 'PENDIENTE', '2026-07-10'),
	(7, 2, 3, 'Cambio de cerradura', 'PENDIENTE', '2026-07-10');

-- Volcando estructura para tabla hotelpro.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reserva_id` bigint NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `estado` varchar(30) DEFAULT 'PENDIENTE',
  `fecha_pago` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pago_reserva` (`reserva_id`),
  CONSTRAINT `fk_pago_reserva` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.pagos: ~3 rows (aproximadamente)
INSERT INTO `pagos` (`id`, `reserva_id`, `monto`, `metodo_pago`, `estado`, `fecha_pago`) VALUES
	(7, 11, 225000.00, 'TARJETA', 'PAGADO', '2026-07-02'),
	(8, 12, 195000.00, 'TRANSFERENCIA', 'PAGADO', '2026-07-02'),
	(10, 11, 150000.00, 'TARJETA', 'PAGADO', '2026-07-02');

-- Volcando estructura para tabla hotelpro.reservas
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint NOT NULL,
  `habitacion_id` bigint NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `estado` varchar(30) DEFAULT 'ACTIVA',
  PRIMARY KEY (`id`),
  KEY `fk_reserva_cliente` (`cliente_id`),
  KEY `fk_reserva_habitacion` (`habitacion_id`),
  CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_reserva_habitacion` FOREIGN KEY (`habitacion_id`) REFERENCES `habitaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.reservas: ~5 rows (aproximadamente)
INSERT INTO `reservas` (`id`, `cliente_id`, `habitacion_id`, `fecha_ingreso`, `fecha_salida`, `estado`) VALUES
	(11, 2, 2, '2026-07-10', '2026-07-15', 'ACTIVA'),
	(12, 3, 3, '2026-07-20', '2026-07-23', 'ACTIVA'),
	(13, 4, 4, '2026-08-01', '2026-08-05', 'PENDIENTE'),
	(14, 2, 2, '2026-08-10', '2026-08-15', 'ACTIVA'),
	(15, 2, 2, '2026-08-10', '2026-08-15', 'ACTIVA');

-- Volcando estructura para tabla hotelpro.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.servicios: ~4 rows (aproximadamente)
INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `precio`, `activo`) VALUES
	(1, 'Desayuno', 'Buffet desayuno', 12000.00, 1),
	(2, 'Spa', 'Acceso al spa', 35000.00, 1),
	(3, 'Lavandería', 'Servicio lavandería', 8000.00, 1),
	(4, 'Estacionamiento', 'Uso estacionamiento', 5000.00, 1),
	(5, 'Gimnasio', 'Acceso diario al gimnasio', 10000.00, 1);

-- Volcando estructura para tabla hotelpro.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(30) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla hotelpro.usuarios: ~3 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `username`, `password`, `rol`, `activo`) VALUES
	(1, 'admin', '1234', 'ADMIN', 1),
	(2, 'recepcion', '1234', 'RECEPCION', 1),
	(3, 'gerente', '1234', 'GERENTE', 1),
	(4, 'usuario_test', '1234', 'RECEPCION', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
