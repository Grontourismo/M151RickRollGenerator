-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.4.12-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für rickrollgeneratorm151
CREATE DATABASE IF NOT EXISTS `rickrollgeneratorm151` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `rickrollgeneratorm151`;

-- Exportiere Struktur von Prozedur rickrollgeneratorm151.CheckExpiration
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckExpiration`()
BEGIN
	update pranks set active = 0 where active = 1 AND Date_Add(createDate, interval 10 hour) < current_timestamp();
END//
DELIMITER ;

-- Exportiere Struktur von Tabelle rickrollgeneratorm151.countrystats
CREATE TABLE IF NOT EXISTS `countrystats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `prank_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prank_fk` (`prank_fk`),
  CONSTRAINT `prank_fk` FOREIGN KEY (`prank_fk`) REFERENCES `pranks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Prozedur rickrollgeneratorm151.IncreaseCount
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `IncreaseCount`(
	IN `UID_param` VARCHAR(255)
)
BEGIN
	UPDATE Pranks

	SET count = count + 1

	WHERE uid = UID_param;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur rickrollgeneratorm151.IncreaseCountryCount
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `IncreaseCountryCount`(
	IN `prank_id_param` INT,
	IN `country_param` VARCHAR(255),
	IN `count_param` INT

)
BEGIN
	if (select COUNT(country) from CountryStats where country = country_param AND prank_fk = prank_id_param) = 0 THEN
		Insert into CountryStats (country, count, prank_fk) VALUES (country_param, count_param, prank_id_param);
	else
		Update CountryStats
		Set count = count + 1
		Where prank_fk = prank_id_param AND country = country_param;
	END IF;
END//
DELIMITER ;

-- Exportiere Struktur von Tabelle rickrollgeneratorm151.pranks
CREATE TABLE IF NOT EXISTS `pranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(155) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `active` tinyint(4) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
