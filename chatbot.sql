-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.39-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para chatbot
CREATE DATABASE IF NOT EXISTS `chatbot` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `chatbot`;

-- Volcando estructura para tabla chatbot.estudiante
CREATE TABLE IF NOT EXISTS `estudiante` (
  `Cod_E` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `semestre` int(11) NOT NULL,
  PRIMARY KEY (`Cod_E`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla chatbot.estudiante: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` (`Cod_E`, `nombre`, `numero`, `correo`, `semestre`) VALUES
	(2, 'Miguel Arjona', '300004654', 'miguel@gmail.com', 5),
	(3, 'Carlos Magallanes', '300023457', 'carlos@gmail.com', 4),
	(4, 'Adrian Pretelt', '3045604654', 'adrian@gmail.com', 6);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;

-- Volcando estructura para tabla chatbot.pregunta
CREATE TABLE IF NOT EXISTS `pregunta` (
  `Cod_P` int(11) NOT NULL,
  `nombre_pregunta` varchar(100) NOT NULL,
  `respuesta` varchar(100) NOT NULL,
  `medio_envio` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_P`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla chatbot.pregunta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`Cod_P`, `nombre_pregunta`, `respuesta`, `medio_envio`) VALUES
	(1, 'hora en que cierra biblioteca', '8:00PM', 'chat'),
	(2, 'link de savio', 'savio.utbvirtual.edu.co', 'chat');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla chatbot.universidad
CREATE TABLE IF NOT EXISTS `universidad` (
  `cod_C` int(11) NOT NULL,
  `cod_E` int(11) NOT NULL,
  `cod_P` int(11) NOT NULL,
  PRIMARY KEY (`cod_C`),
  KEY `FK_Universidad_estudiante` (`cod_E`),
  KEY `FK_Universidad_pregunta` (`cod_P`),
  CONSTRAINT `FK_Universidad_estudiante` FOREIGN KEY (`cod_E`) REFERENCES `estudiante` (`Cod_E`),
  CONSTRAINT `FK_Universidad_pregunta` FOREIGN KEY (`cod_P`) REFERENCES `pregunta` (`Cod_P`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla chatbot.universidad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `universidad` DISABLE KEYS */;
INSERT INTO `universidad` (`cod_C`, `cod_E`, `cod_P`) VALUES
	(1, 2, 1),
	(2, 4, 2);
/*!40000 ALTER TABLE `universidad` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
