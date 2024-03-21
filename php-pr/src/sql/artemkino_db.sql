-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.4.32-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных artemkino
CREATE DATABASE IF NOT EXISTS `artemkino` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `artemkino`;

-- Дамп структуры для таблица artemkino.biletes
CREATE TABLE IF NOT EXISTS `biletes` (
  `ticket_ID` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `seansi_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_ID`),
  KEY `FK_biletes_lietotaji` (`user_ID`),
  KEY `FK_biletes_seansi` (`seansi_ID`),
  CONSTRAINT `FK_biletes_lietotaji` FOREIGN KEY (`user_ID`) REFERENCES `lietotaji` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_biletes_seansi` FOREIGN KEY (`seansi_ID`) REFERENCES `seansi` (`seansi_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы artemkino.biletes: ~0 rows (приблизительно)

-- Дамп структуры для таблица artemkino.ekrani
CREATE TABLE IF NOT EXISTS `ekrani` (
  `screen_ID` int(11) NOT NULL AUTO_INCREMENT,
  `capacity` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`screen_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы artemkino.ekrani: ~0 rows (приблизительно)

-- Дамп структуры для таблица artemkino.filmas
CREATE TABLE IF NOT EXISTS `filmas` (
  `movie_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `img` blob DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`movie_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы artemkino.filmas: ~0 rows (приблизительно)

-- Дамп структуры для таблица artemkino.lietotaji
CREATE TABLE IF NOT EXISTS `lietotaji` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы artemkino.lietotaji: ~0 rows (приблизительно)

-- Дамп структуры для таблица artemkino.seansi
CREATE TABLE IF NOT EXISTS `seansi` (
  `seansi_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `screen_ID` int(11) DEFAULT NULL,
  `movie_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`seansi_ID`),
  KEY `FK_seansi_ekrani` (`screen_ID`),
  KEY `FK_seansi_filmas` (`movie_ID`),
  CONSTRAINT `FK_seansi_ekrani` FOREIGN KEY (`screen_ID`) REFERENCES `ekrani` (`screen_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_seansi_filmas` FOREIGN KEY (`movie_ID`) REFERENCES `filmas` (`movie_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы artemkino.seansi: ~0 rows (приблизительно)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
