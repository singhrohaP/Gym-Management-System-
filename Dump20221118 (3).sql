CREATE DATABASE  IF NOT EXISTS `gym_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym_management`;
-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: localhost    Database: gym_management
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `cheapgyms`
--

DROP TABLE IF EXISTS `cheapgyms`;
/*!50001 DROP VIEW IF EXISTS `cheapgyms`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cheapgyms` AS SELECT 
 1 AS `gName`,
 1 AS `signupfees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `experiencesinstructors`
--

DROP TABLE IF EXISTS `experiencesinstructors`;
/*!50001 DROP VIEW IF EXISTS `experiencesinstructors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `experiencesinstructors` AS SELECT 
 1 AS `iName`,
 1 AS `expInYears`,
 1 AS `gymID`,
 1 AS `gender`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `femaleinstructors`
--

DROP TABLE IF EXISTS `femaleinstructors`;
/*!50001 DROP VIEW IF EXISTS `femaleinstructors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `femaleinstructors` AS SELECT 
 1 AS `iName`,
 1 AS `expInYears`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gym`
--

DROP TABLE IF EXISTS `gym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym` (
  `gymID` int NOT NULL AUTO_INCREMENT,
  `gName` varchar(10) NOT NULL,
  `location` varchar(20) DEFAULT 'Dublin',
  `contact` int NOT NULL,
  `signupFees` varchar(5) NOT NULL,
  `openHours` time NOT NULL,
  `mName` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`gymID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym`
--

LOCK TABLES `gym` WRITE;
/*!40000 ALTER TABLE `gym` DISABLE KEYS */;
INSERT INTO `gym` VALUES (1,'Herculus','Dublin',18352992,'50','00:00:11','Luke','luke.herculus@fitness101.org'),(2,'Viribus','Mayo',18357792,'40','00:00:10','David','david.viribus@fitness101.org'),(3,'Spencer','Cork',18432992,'35','00:00:10','Harry','harry.spencer@fitness101.org'),(4,'1escape','Dublin',32432992,'35','00:00:10','Mathew','mathew.1escape@fitness101.org'),(5,'Power','Dublin',32432992,'35','00:00:10','Ryan','ryan.power@fitness101.org'),(6,'Rythm','Limrick',32432992,'35','00:00:10','Ross','ross.rythm@fitness101.org'),(7,'Star','dublin',32772992,'100','00:00:10','Lucy','lucy.star@fitness101.org'),(8,'PumpHouse','Dublin',86432992,'90','00:00:09','Jen','jen.pumphouse@fitness101.org'),(9,'24Hour','mayo',62432662,'40','00:00:00','Henry','henry.24hour@fitness101.org'),(10,'Nourish','Cork',78432692,'20','00:00:10','Patrick','patrick.nourish@fitness101.org');
/*!40000 ALTER TABLE `gym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gymMembership`
--

DROP TABLE IF EXISTS `gymMembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gymMembership` (
  `membershipID` int NOT NULL,
  `gymID` int NOT NULL,
  KEY `membershipID` (`membershipID`),
  KEY `gymID` (`gymID`),
  CONSTRAINT `gymmembership_ibfk_1` FOREIGN KEY (`membershipID`) REFERENCES `membershipPlan` (`membershipID`),
  CONSTRAINT `gymmembership_ibfk_2` FOREIGN KEY (`gymID`) REFERENCES `gym` (`gymID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gymMembership`
--

LOCK TABLES `gymMembership` WRITE;
/*!40000 ALTER TABLE `gymMembership` DISABLE KEYS */;
INSERT INTO `gymMembership` VALUES (1,1),(1,2),(1,3),(2,2),(2,2),(2,4),(3,4),(3,5),(3,6),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(5,2),(5,4),(5,6),(6,1),(6,2),(6,3),(7,1),(7,3),(7,5),(7,2),(7,4),(7,6),(8,4),(8,5),(8,6),(9,2),(9,4),(9,6),(10,5),(10,6),(10,1);
/*!40000 ALTER TABLE `gymMembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructorID` int NOT NULL AUTO_INCREMENT,
  `iName` varchar(10) NOT NULL,
  `expInYears` int NOT NULL,
  `gymID` int NOT NULL,
  `gender` varchar(1) NOT NULL,
  PRIMARY KEY (`instructorID`),
  KEY `gymID` (`gymID`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`gymID`) REFERENCES `gym` (`gymID`),
  CONSTRAINT `genderConstraintInstructor` CHECK ((`gender` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Adam',3,1,'M'),(2,'Linda',5,1,'F'),(3,'Lisa',3,2,'F'),(4,'Myth',1,4,'M'),(5,'Neha',2,3,'F'),(6,'Mohammad',6,6,'M'),(7,'Sam',4,5,'M'),(8,'Jenna',8,4,'f'),(9,'Pier',7,10,'m'),(10,'Lana',3,9,'f'),(11,'Jake',10,7,'m'),(12,'Edward',2,9,'m'),(13,'Ivor',3,8,'m');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `memberID` int NOT NULL AUTO_INCREMENT,
  `memberName` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `contact` int NOT NULL,
  `joiningDate` date NOT NULL,
  `membershipID` int NOT NULL,
  `planID` int NOT NULL,
  PRIMARY KEY (`memberID`),
  KEY `membershipID` (`membershipID`),
  KEY `planID` (`planID`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`membershipID`) REFERENCES `membershipPlan` (`membershipID`),
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`planID`) REFERENCES `workoutPlan` (`planID`),
  CONSTRAINT `genderConstraintMember` CHECK ((`gender` in (_utf8mb4'F',_utf8mb4'M')))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'David','M',971654524,'2022-08-01',1,1),(2,'David','M',971699587,'2022-08-01',1,1),(3,'Eve','F',771654567,'2022-09-15',2,3),(4,'Luke','M',871654523,'2022-05-01',3,5),(5,'Sally','F',876654524,'2022-07-18',6,6),(6,'Rachel','F',865454524,'2022-11-01',4,2),(7,'Charlie','M',785454529,'2022-10-02',4,2),(8,'Steven','M',785467542,'2022-12-01',6,9),(9,'Aurthur','M',585467594,'2022-12-01',7,3);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_joindate` BEFORE INSERT ON `members` FOR EACH ROW if NEW.joiningDate < @date then
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Person should join today or later in the month!';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `membershipPlan`
--

DROP TABLE IF EXISTS `membershipPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membershipPlan` (
  `membershipID` int NOT NULL AUTO_INCREMENT,
  `mPName` varchar(10) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `durationInMonths` int NOT NULL,
  PRIMARY KEY (`membershipID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershipPlan`
--

LOCK TABLES `membershipPlan` WRITE;
/*!40000 ALTER TABLE `membershipPlan` DISABLE KEYS */;
INSERT INTO `membershipPlan` VALUES (1,'Basic','70',1),(2,'Basic+','140',3),(3,'Advanced','200',4),(4,'Advanced+','320',6),(5,'Delux','400',8),(6,'Delux+','450',12);
/*!40000 ALTER TABLE `membershipPlan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_duration_membership` BEFORE INSERT ON `membershipplan` FOR EACH ROW if NEW.durationInMonths > 12 then
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Membership plans can not be longer than 12 months!';
END IF */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `amount_check` BEFORE INSERT ON `membershipplan` FOR EACH ROW if NEW.amount > @value then
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Membership plans can not cost more than 200 euros!';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `planID` int NOT NULL,
  `workoutID` int NOT NULL,
  PRIMARY KEY (`workoutID`,`planID`),
  KEY `planID` (`planID`),
  CONSTRAINT `plan_ibfk_1` FOREIGN KEY (`workoutID`) REFERENCES `workout` (`workoutID`),
  CONSTRAINT `plan_ibfk_2` FOREIGN KEY (`planID`) REFERENCES `workoutPlan` (`planID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,1),(2,2),(3,1),(4,5),(5,1),(5,2),(6,1);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotionalMaterial`
--

DROP TABLE IF EXISTS `promotionalMaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotionalMaterial` (
  `promotionID` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(20) NOT NULL,
  `durInWeeks` int NOT NULL,
  `gymID` int NOT NULL,
  PRIMARY KEY (`promotionID`),
  KEY `gymID` (`gymID`),
  CONSTRAINT `promotionalmaterial_ibfk_1` FOREIGN KEY (`gymID`) REFERENCES `gym` (`gymID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotionalMaterial`
--

LOCK TABLES `promotionalMaterial` WRITE;
/*!40000 ALTER TABLE `promotionalMaterial` DISABLE KEYS */;
INSERT INTO `promotionalMaterial` VALUES (1,'ChritmasOff',2,1),(2,'FallDiscount',1,1),(3,'StartNow',5,2),(4,'BlueWeek',1,3),(5,'NewWork',2,6),(6,'EOFSeason',1,9),(7,'CouplesSpl',4,10),(8,'25%off',2,7);
/*!40000 ALTER TABLE `promotionalMaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout`
--

DROP TABLE IF EXISTS `workout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout` (
  `workoutID` int NOT NULL AUTO_INCREMENT,
  `wName` varchar(10) NOT NULL,
  `wType` varchar(15) NOT NULL,
  PRIMARY KEY (`workoutID`),
  CONSTRAINT `workoutType` CHECK ((`wType` in (_utf8mb4'B',_utf8mb4'I',_utf8mb4'A')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout`
--

LOCK TABLES `workout` WRITE;
/*!40000 ALTER TABLE `workout` DISABLE KEYS */;
INSERT INTO `workout` VALUES (1,'Curler','B'),(2,'Extender','B'),(3,'Push','I'),(4,'Pull','I'),(5,'XTRM','A'),(6,'Press','A');
/*!40000 ALTER TABLE `workout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workoutFocus`
--

DROP TABLE IF EXISTS `workoutFocus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workoutFocus` (
  `workoutID` int NOT NULL,
  `focusArea` varchar(15) NOT NULL,
  PRIMARY KEY (`workoutID`,`focusArea`),
  CONSTRAINT `workoutfocus_ibfk_1` FOREIGN KEY (`workoutID`) REFERENCES `workout` (`workoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workoutFocus`
--

LOCK TABLES `workoutFocus` WRITE;
/*!40000 ALTER TABLE `workoutFocus` DISABLE KEYS */;
INSERT INTO `workoutFocus` VALUES (1,'Bicep'),(2,'Tricep'),(3,'Shoulder'),(4,'Back'),(4,'Shoulder'),(5,'Calf'),(5,'Hamstring'),(6,'Hamstring'),(6,'Thighs');
/*!40000 ALTER TABLE `workoutFocus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workoutPLAn`
--

DROP TABLE IF EXISTS `workoutPLAn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workoutPLAn` (
  `planID` int NOT NULL AUTO_INCREMENT,
  `durInWeeks` int NOT NULL,
  `instructorID` int NOT NULL,
  PRIMARY KEY (`planID`),
  KEY `instructorID` (`instructorID`),
  CONSTRAINT `workoutplan_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workoutPLAn`
--

LOCK TABLES `workoutPLAn` WRITE;
/*!40000 ALTER TABLE `workoutPLAn` DISABLE KEYS */;
INSERT INTO `workoutPLAn` VALUES (1,5,1),(2,2,2),(3,3,1),(4,4,5),(5,5,6),(6,1,1),(7,5,2),(8,6,13),(9,1,10),(10,2,11),(11,3,9),(12,1,4),(13,6,8);
/*!40000 ALTER TABLE `workoutPLAn` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_duration` BEFORE INSERT ON `workoutplan` FOR EACH ROW if NEW.durInWeeks > 8 then
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'WorkoutPlans can not be longer than 8 weeks!';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'gym_management'
--

--
-- Dumping routines for database 'gym_management'
--

--
-- Final view structure for view `cheapgyms`
--

/*!50001 DROP VIEW IF EXISTS `cheapgyms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cheapgyms` AS select `gym`.`gName` AS `gName`,`gym`.`signupFees` AS `signupfees` from `gym` where (`gym`.`signupFees` < 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `experiencesinstructors`
--

/*!50001 DROP VIEW IF EXISTS `experiencesinstructors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `experiencesinstructors` AS select `instructor`.`iName` AS `iName`,`instructor`.`expInYears` AS `expInYears`,`instructor`.`gymID` AS `gymID`,`instructor`.`gender` AS `gender` from `instructor` where (`instructor`.`expInYears` > 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `femaleinstructors`
--

/*!50001 DROP VIEW IF EXISTS `femaleinstructors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `femaleinstructors` AS select `instructor`.`iName` AS `iName`,`instructor`.`expInYears` AS `expInYears` from `instructor` where (`instructor`.`gender` = 'F') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 20:49:07
