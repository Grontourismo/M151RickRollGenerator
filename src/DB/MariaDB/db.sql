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

-- Exportiere Struktur von Tabelle rickrollgeneratorm151.countrystats
CREATE TABLE IF NOT EXISTS `countrystats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `prank_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prank_fk` (`prank_fk`),
  CONSTRAINT `prank_fk` FOREIGN KEY (`prank_fk`) REFERENCES `pranks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle rickrollgeneratorm151.countrystats: ~2 rows (ungefähr)
/*!40000 ALTER TABLE `countrystats` DISABLE KEYS */;
INSERT INTO `countrystats` (`id`, `country`, `count`, `prank_fk`) VALUES
	(1, 'Schweiz', 3, 3),
	(2, 'ALbanien', 1, 3),
	(3, 'Schweiz', 2, 50),
	(4, 'Switzerland', 630, 3);
/*!40000 ALTER TABLE `countrystats` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle rickrollgeneratorm151.pranks: ~48 rows (ungefähr)
/*!40000 ALTER TABLE `pranks` DISABLE KEYS */;
INSERT INTO `pranks` (`id`, `uid`, `title`, `description`, `imageURL`, `createDate`, `active`, `count`) VALUES
	(1, 'dsjfssjdifiejsd', 'VinentHeftig', 'Vincent isch zuuuu heftig', '', '2010-03-27 13:13:25', 1, 0),
	(2, '85944106-ad5f-44a8-9d4e-51103d16eb74', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:16:05', 1, 0),
	(3, '0337bbde-7354-4ef1-b066-73cbb887f1c0', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:18:18', 1, 2748),
	(4, '69bb3da5-d2b4-4f81-b7f1-bfe950a7814f', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:21:58', 1, 0),
	(5, 'd8d6c301-0307-47af-979d-9f953a86b419', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:05', 1, 0),
	(6, '207d5476-5d03-4ce5-9311-0cbb70dfed85', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:07', 1, 0),
	(7, '0d45e0e3-6ab6-4bf6-93cc-1d05e758a9fe', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:07', 1, 0),
	(8, '37f857c5-5625-4bfc-9d11-de2d9418b575', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:08', 1, 0),
	(9, 'e801e234-0a1e-4f60-9152-ac173b1ffc80', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:08', 1, 0),
	(10, '32dd8c14-a07d-4fed-a3ef-587be36544e8', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:08', 1, 0),
	(11, 'f7e226af-76d0-41b0-ab8c-b560e6e370ba', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:08', 1, 0),
	(12, 'c4eef64e-51d8-44e7-929f-84bfc1c31941', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:09', 1, 0),
	(13, 'a834dbf6-0384-4e50-afb9-bb8b0871230c', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:09', 1, 0),
	(14, 'e3b91e37-eaba-4cc1-bc17-20930d926342', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:09', 1, 0),
	(15, '7c0b236c-a116-4474-b5fe-9e9d9a2c4d3c', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:09', 1, 0),
	(16, '500f6949-a1a0-40d5-b1dd-2dc0143277e8', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:10', 1, 0),
	(17, '4c480872-b250-4b0e-8747-0e7c5e00bd55', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:10', 1, 0),
	(18, '9422d011-5160-4661-a38e-df8b7e48c8be', 'null', 'sadhfslfdhsaldfhlkdsf', '', '2021-11-08 10:39:10', 1, 0),
	(19, 'e8adcdc2-2181-4377-b1bb-c8922472cf6b', 'null', 'sadfsadf', '', '2021-11-08 10:39:58', 1, 0),
	(20, '0e38a53c-6efc-4882-92fb-a432ea25091d', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:40:06', 1, 0),
	(21, 'd7e03961-2eb0-4745-ac05-13e705e750d4', 'null', 'fsadfsadf', '', '2021-11-08 10:40:28', 1, 0),
	(22, '75f673b7-0bd0-4279-8bdb-bcbc3ae6a750', 'null', 'lsflflkdsfjldsajf', '', '2021-11-08 10:43:19', 1, 0),
	(23, 'a99917ca-ad06-441c-9b69-a76b1953d122', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:43:25', 1, 0),
	(24, 'c7a808fd-0871-4068-a905-c34028d25a9b', 'null', 'jskdjkfjdskf', '', '2021-11-08 10:45:42', 1, 0),
	(25, '93faf618-fefe-4ac8-8dda-4a952805a686', 'null', 'fasdfsdfsadf', '', '2021-11-08 10:49:49', 1, 0),
	(26, '017a9604-41d8-4f50-9564-6e910269b2b6', 'null', 'sdkfjkdsfksdf', '', '2021-11-08 10:52:49', 1, 0),
	(27, 'c31f19fa-ef88-4113-877e-13aab4e09e2e', 'null', 'sdjkfjdskfjskdf', '', '2021-11-08 10:53:54', 1, 0),
	(28, 'cd44a299-dcf4-4127-a8db-7b0ab1d08a7d', 'null', 'dfdsfds', '', '2021-11-08 10:56:13', 1, 0),
	(29, 'dd1cd144-e527-458a-8546-112fe9f22936', 'TestVincentHeftig', 'vincent isch zuuuuuuuu heftig', '', '2021-11-08 10:56:24', 1, 0),
	(30, '5e03dcf3-a0d9-42a7-a675-51f4893b2ff1', 'null', 'kjkjdskfjsdkjfs', '', '2021-11-08 10:56:58', 1, 0),
	(31, 'a9ed9db1-cdee-4fe2-9083-bf46c16c4a52', 'null', 'jkjkdjfksdjf', '', '2021-11-08 10:57:27', 1, 0),
	(32, '861a1253-eb2f-4635-b48e-6a99fcd28995', 'null', 'kjkdsjfkjdskfjk', '', '2021-11-08 10:57:45', 1, 0),
	(33, '9ee04f0f-da8e-4652-a9ff-a7e088afe63b', 'null', 'jkdskjfkdsf', '', '2021-11-08 10:58:12', 1, 0),
	(34, '3ba5987e-1143-4a86-8e73-d772bd91662f', 'null', 'jkjdskfjkdsf', '', '2021-11-08 10:58:32', 1, 0),
	(35, 'd9220592-03af-4075-80b4-0282461e4fd9', 'null', 'kjdksjfkdsf', '', '2021-11-08 10:59:02', 1, 0),
	(36, 'c67cae4c-e132-4afb-a7d1-ad0ab891de2a', 'null', 'kjkdsjfkdsjkfjk', '', '2021-11-08 11:00:13', 1, 0),
	(37, 'a5ae22d9-42fd-4389-bbaa-e589f35ae6e8', 'null', 'jdsjfkjdskf', '', '2021-11-08 11:00:31', 1, 0),
	(38, 'e9b15362-fc83-452c-95ad-4f218a063eff', 'null', 'kjkdsjfkjsdkfjksdfj', '', '2021-11-08 11:01:12', 1, 0),
	(39, 'caa11ec8-061f-4443-a49b-fac3606d8f34', 'null', 'kdsjkfjsdkjfkdsf', '', '2021-11-08 11:01:42', 1, 0),
	(40, '374f8e7b-b7e2-4dfd-999c-d6779bd0090c', 'null', 'kjdskfjksdjfdsf', '', '2021-11-08 11:01:57', 1, 0),
	(41, '49c3ebeb-9ca9-4444-9106-75e23bcf4dfc', 'null', 'kjkdskfjsd', '', '2021-11-08 11:02:10', 1, 0),
	(42, 'acbefd30-727e-4e1c-b946-46b87b7043ee', 'null', 'jkjdskjfkdsfkj', '', '2021-11-08 11:04:19', 1, 0),
	(43, 'afdf2e55-2ab2-40c6-948b-1eadcc9b9afc', 'null', 'kjksdjfkdskfjds', '', '2021-11-08 11:04:34', 1, 0),
	(44, '426d48a6-469e-49cb-8717-5ccca432b3a7', 'null', 'kjksdjfkdskfjds', '', '2021-11-08 11:07:12', 1, 0),
	(45, '58a26e95-8967-4861-8696-5b0e4b32c1e7', 'null', 'dskjfksdjfkdsjkfjdskf', '', '2021-11-08 11:26:41', 1, 0),
	(46, '6b74cdec-0f28-4449-985c-fd7965ce9494', 'null', 'sdfjisafesjdkfjdskfdsf', '', '2021-11-08 11:35:48', 1, 0),
	(47, '36a86d4f-10ca-4ef5-b47c-17eb1a8135dd', 'null', 'testdescription', '', '2021-11-08 11:36:17', 1, 0),
	(48, '1824bbad-28cd-44d1-9ccd-f35e71442331', 'null', 'jkjdskfjksdjkfjdsf', '', '2021-11-08 11:37:13', 1, 0),
	(49, '914b6232-3fcc-47e7-8dfe-59f0dcf972a8', 'null', 'djsfjkdsfksdjkfjsdkf', '', '2021-11-08 11:53:42', 1, 0),
	(50, 'faf00502-b93e-4144-830c-a040e4408815', 'dasIstEinTestlink', 'dis momi isch homo', 'https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg', '2021-11-14 16:16:04', 1, 2);
/*!40000 ALTER TABLE `pranks` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
