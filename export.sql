CREATE DATABASE  IF NOT EXISTS `spacetransportdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `spacetransportdb`;
-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: spacetransportdb
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_company_contact1` FOREIGN KEY (`id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('co1','SpaceX','	HD 102956','Space Exploration Technologies Corp.'),('co2','Blue Origin','Ophiuchi','Private aerospace manufacturer and spaceflight services company'),('co3','Virgin Galactic','HAT-P-15','Space tourism company'),('co4','Boeing','Pegasi','Aerospace company and manufacturer of space vehicles'),('co5','Roscosmos','Arietis','Russian space agency'),('co6','ESA',' Cassiopeiae A','European Space Agency'),('co7','SpaceY','Arietis','European');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_company_delete
BEFORE DELETE
ON company FOR EACH ROW
BEGIN
    SET @contact_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_company_delete
AFTER DELETE
ON company FOR EACH ROW
BEGIN
    DELETE FROM contact WHERE id = @contact_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` varchar(10) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `channel` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('co1','company@spacex.com','email','+1-800-123-4567'),('co2','company@esa.int','lamail','+33-1-234-5678'),('co3','company@blueorigin.com','amail','+1-800-987-6543'),('co4','company@virgingalactic.com','gmail','+1-800-555-1234'),('co5','company@boeing.com','camail','+1-800-789-0123'),('co6','company@roscosmos.ru','cmail','+7-495-123-4567'),('co7','company@boeing.com','lamail','+1-800-123-4567'),('crew01','john@crewmate.com','Email','1234567890'),('crew02','mary@crewmate.com','Email','9876543210'),('crew03','alex@crewmate.com','Email','4567890123'),('crew04','sara@crewmate.com','Email','7890123456'),('crew05','david@crewmate.com','Email','2345678901'),('crew06','emily@crewmate.com','Email','9012345678'),('crew07','michael@crewmate.com','Email','3456789012'),('crew08','olivia@crewmate.com','Email','6789012345'),('crew09','james@crewmate.com','Email','0123456789'),('crew10','emma@crewmate.com','Email','5678901234'),('crew11','emma@crewmate.com','Email','5678901234'),('p1','alexander@passenger.com','Email','1234567890'),('p2','victoria@passenger.com','Email','9876543210'),('p3','nathan@passenger.com','Email','4567890123'),('p4','isabella@passenger.com','Email','7890123456'),('p5','jacob@passenger.com','petMail','2345678901'),('p6','olivia@passenger.com','JH55842','9012345678'),('p7','oval@her.com','HF8957','-888-55-866'),('p8','recta@her.com','56LOK','95-628-85'),('ss1','contact@blueorigin.com','lamail','+1-800-234-5678'),('ss2','contact@virgingalactic.com','email','+1-800-567-8901'),('ss3','contact@boeing.com','amail','+1-800-890-1234'),('ss4','contact@roscosmos.ru','gmail','+7-495-123-4567'),('ss5','contact@esa.int','cmail','+33-1-456-7890'),('ss6','contact@nasa.gov','lamail','+1-800-901-2345'),('ss7','P@','Termomiter','+33-1-456-7890');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crewmate`
--

DROP TABLE IF EXISTS `crewmate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crewmate` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `starship_id` varchar(10) NOT NULL,
  `company_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_crewmate_starship1_idx` (`starship_id`),
  KEY `fk_crewmate_company1_idx` (`company_id`),
  CONSTRAINT `fk_crewmate_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crewmate_contact1` FOREIGN KEY (`id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crewmate_starship1` FOREIGN KEY (`starship_id`) REFERENCES `starship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crewmate`
--

LOCK TABLES `crewmate` WRITE;
/*!40000 ALTER TABLE `crewmate` DISABLE KEYS */;
INSERT INTO `crewmate` VALUES ('crew01','John Doe','Captain','ss1','co1'),('crew02','Jane Smith','Engineer','ss2','co1'),('crew03','David Johnson','Astronaut','ss1','co2'),('crew04','Sarah Davis','Navigator','ss3','co2'),('crew05','Michael Wilson','Technician','ss2','co3'),('crew06','Emily Brown','Scientist','ss3','co3'),('crew07','Robert Thompson','Captain','ss1','co4'),('crew08','Olivia Lee','Engineer','ss2','co4'),('crew09','Daniel Clark','Astronaut','ss1','co5'),('crew10','Sophia Rodriguez','Navigator','ss3','co5'),('crew11','Steve Roger','Captain','ss4','co6');
/*!40000 ALTER TABLE `crewmate` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_crewmate_delete
BEFORE DELETE
ON crewmate FOR EACH ROW
BEGIN
    SET @contact_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_crewmate_delete
AFTER DELETE
ON crewmate FOR EACH ROW
BEGIN
    DELETE FROM contact WHERE id = @contact_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `species` varchar(50) DEFAULT NULL,
  `mass` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_passenger_contact1` FOREIGN KEY (`id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES ('p1','Amy Johnson','123 Main St, Anytown','Human',70),('p2','Robert Williams','456 Oak Ave, Anycity','Human',80),('p3','Emma Davis','789 Elm Rd, Anyville','Human',65),('p4','William Brown','321 Pine Blvd, Anystate','Human',75),('p5','Alex Johnson','123 Main St, Anytown, USA','cat',70),('p6','Sarah Davis','456 Elm St, Othertown, USA','Alien',60),('p7','Lucus','LOS Angel','Alien',76),('p8','Jolin','joestar','Alien',67);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_passenger_delete
BEFORE DELETE
ON passenger FOR EACH ROW
BEGIN
    SET @contact_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_passenger_delete
AFTER DELETE
ON passenger FOR EACH ROW
BEGIN
    DELETE FROM contact WHERE id = @contact_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` varchar(10) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `reservation_id` varchar(10) NOT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_id_UNIQUE` (`reservation_id`),
  KEY `fk_payment_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_payment_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('pay1','2023-06-01','Paid','r1',1000),('pay2','2023-06-02','Pending','r2',750),('pay3','2023-06-03','Paid','r3',500),('pay4','2023-06-04','Pending','r4',1200),('pay5','2023-06-05','Paid','r5',800),('pay6','2023-06-06','Pending','r6',1500),('pay7','2023-06-22','Cancelled','r7',680);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` varchar(10) NOT NULL,
  `seat_amount` int(11) DEFAULT NULL,
  `spaceport` varchar(100) DEFAULT NULL,
  `passenger_id` varchar(10) NOT NULL,
  `spaceflights_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_passenger1_idx` (`passenger_id`),
  KEY `fk_reservation_spaceflights1_idx` (`spaceflights_id`),
  CONSTRAINT `fk_reservation_passenger1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_spaceflights1` FOREIGN KEY (`spaceflights_id`) REFERENCES `spaceflights` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('r1',2,'Spaceport A','p1','f1'),('r2',1,'Spaceport B','p2','f2'),('r3',4,'Spaceport C','p3','f3'),('r4',3,'Spaceport D','p4','f1'),('r5',2,'Spaceport E','p5','f2'),('r6',1,'Spaceport F','p6','f3'),('r7',4,'Spaceport G','p5','f7');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaceflights`
--

DROP TABLE IF EXISTS `spaceflights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spaceflights` (
  `id` varchar(10) NOT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaceflights`
--

LOCK TABLES `spaceflights` WRITE;
/*!40000 ALTER TABLE `spaceflights` DISABLE KEYS */;
INSERT INTO `spaceflights` VALUES ('f1','Mars','2023-07-01','2023-07-10',2250000),('f2','Moon','2023-08-15','2023-08-22',384400),('f3','Jupiter','2023-09-30','2023-10-20',6287300),('f4','Saturn','2024-01-05','2024-02-10',1275000),('f5','Venus','2024-03-20','2024-03-30',414000),('f6','Neptune','2024-06-10','2024-08-20',4495000),('f7','Puto','2024-06-05','2024-08-22',465165),('f8','Em458','2024-06-18','2024-08-31',54636);
/*!40000 ALTER TABLE `spaceflights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starship`
--

DROP TABLE IF EXISTS `starship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starship` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type_id` varchar(10) NOT NULL,
  `company_id` varchar(10) NOT NULL,
  `spaceflights_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_starship_starship_type1_idx` (`type_id`),
  KEY `fk_starship_company1_idx` (`company_id`),
  KEY `fk_starship_spaceflights1_idx` (`spaceflights_id`),
  CONSTRAINT `fk_starship_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_starship_contact1` FOREIGN KEY (`id`) REFERENCES `contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_starship_spaceflights1` FOREIGN KEY (`spaceflights_id`) REFERENCES `spaceflights` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_starship_starship_type1` FOREIGN KEY (`type_id`) REFERENCES `starship_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starship`
--

LOCK TABLES `starship` WRITE;
/*!40000 ALTER TABLE `starship` DISABLE KEYS */;
INSERT INTO `starship` VALUES ('ss1','Falcon 9','t1','co1','f1'),('ss2','Starship SN15','t2','co2','f2'),('ss3','Dragon','t1','co1','f3'),('ss4','Saturn V','t3','co3','f4'),('ss5','Soyuz','t4','co4','f5'),('ss6','Apollo','t3','co3','f6'),('ss7','Apollo','t1','co3','f3');
/*!40000 ALTER TABLE `starship` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_starship_delete
BEFORE DELETE
ON starship FOR EACH ROW
BEGIN
    SET @contact_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_starship_delete
AFTER DELETE
ON starship FOR EACH ROW
BEGIN
    DELETE FROM contact WHERE id = @contact_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `starship_type`
--

DROP TABLE IF EXISTS `starship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starship_type` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `speed` float DEFAULT NULL,
  `range` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starship_type`
--

LOCK TABLES `starship_type` WRITE;
/*!40000 ALTER TABLE `starship_type` DISABLE KEYS */;
INSERT INTO `starship_type` VALUES ('t1','Cargo',100,1000,500000),('t2','Crewed',10,25000,400000),('t3','Shuttle',8,30000,600000),('t4','Shuttle 2',6,20000,300000),('t5','Tourist',50,22000,450000),('t6','Exploration',4,28000,550000),('t7','Exploration 2',8,14000,550000),('t8','Crewed 2',18,12500,400000),('t9','Shuttle 3',14,20000,300000);
/*!40000 ALTER TABLE `starship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'spacetransportdb'
--

--
-- Dumping routines for database 'spacetransportdb'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handle_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handle_company`(in in_mode varchar(10),
in in_id varchar(10),in in_name varchar(50),in in_location varchar(50),in in_description varchar(100),
in in_mail varchar(50),in in_channel varchar(50),in in_tel varchar(20))
BEGIN	
	if (in_mode = "UPDATE") then
		UPDATE contact as c
		SET c.mail = in_mail ,c.channel = in_channel, c.tel=in_tel
		WHERE c.id = in_id;
		UPDATE company as a
		SET a.name = in_name, a.location=in_location, a.description = in_description
		WHERE a.id = in_id;
	elseif (in_mode = "INSERT") then
		INSERT INTO contact VALUES(in_id,in_mail,in_channel,in_tel);
		INSERT INTO company VALUES(in_id,in_name,in_location,in_description);
    end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handle_crewmate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handle_crewmate`(in in_mode varchar(10),
in in_id varchar(10),in in_name varchar(50),in in_position varchar(50),in in_starship_id varchar(10),in in_company_id varchar(10),
in in_mail varchar(50),in in_channel varchar(50),in in_tel varchar(20))
BEGIN	
	if (in_mode = "UPDATE") then
		UPDATE contact as c
		SET c.mail = in_mail ,c.channel = in_channel, c.tel=in_tel
		WHERE c.id = in_id;
		UPDATE crewmate as a
		SET a.name = in_name, a.position = in_position, a.starship_id = in_starship_id, a.company_id = in_company_id
		WHERE a.id = in_id;
	elseif (in_mode = "INSERT") then
		INSERT INTO contact VALUES(in_id,in_mail,in_channel,in_tel);
		INSERT INTO crewmate VALUES(in_id,in_name,in_position,in_starship_id,in_company_id);
    end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handle_passenger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handle_passenger`(in in_mode varchar(10),
in in_id varchar(10),in in_name varchar(50),in in_address tinytext ,in in_species varchar(50),in in_mass float,
in in_mail varchar(50),in in_channel varchar(50),in in_tel varchar(20))
BEGIN	
	if (in_mode = "UPDATE") then
		UPDATE contact as c
		SET c.mail = in_mail ,c.channel = in_channel, c.tel=in_tel
		WHERE c.id = in_id;
		UPDATE passenger as a
		SET a.name = in_name, a.address=in_address, a.species = in_species,a.mass =in_mass
		WHERE a.id = in_id;
	elseif (in_mode = "INSERT") then
		INSERT INTO contact VALUES(in_id,in_mail,in_channel,in_tel);
		INSERT INTO passenger VALUES(in_id,in_name,in_address, in_species,in_mass);
    end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `handle_starship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `handle_starship`(in in_mode varchar(10),
in in_id varchar(10),in in_name varchar(50),in in_type_id varchar(10),in in_company_id varchar(10),in in_spaceflights_id varchar(10),
in in_mail varchar(50),in in_channel varchar(50),in in_tel varchar(20))
BEGIN	
	if (in_mode = "UPDATE") then
		UPDATE contact as c
		SET c.mail = in_mail ,c.channel = in_channel, c.tel=in_tel
		WHERE c.id = in_id;
		UPDATE starship as a
		SET a.name = in_name, a.type_id=in_type_id, a.company_id=in_company_id, a.spaceflights_id= in_spaceflights_id
		WHERE a.id = in_id;
	elseif (in_mode = "INSERT") then
		INSERT INTO contact VALUES(in_id,in_mail,in_channel,in_tel);
		INSERT INTO starship VALUES(in_id,in_name,in_type_id, in_company_id,in_spaceflights_id);
    end if;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-18 17:47:27
