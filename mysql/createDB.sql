-- MySQL dump 10.13  Distrib 5.7.14, for Linux (x86_64)
--
-- Host: localhost    Database: phpdata
-- ------------------------------------------------------
-- Server version	5.7.14-1+deb.sury.org~trusty+0

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
-- Current Database: `phpdata`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phpdata` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `phpdata`;

--
-- Table structure for table `Relationship`
--

DROP TABLE IF EXISTS `Relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relationship` (
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '-1',
  `action_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_one_id` (`user_one_id`,`user_two_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relationship`
--

LOCK TABLES `Relationship` WRITE;
/*!40000 ALTER TABLE `Relationship` DISABLE KEYS */;
INSERT INTO `Relationship` VALUES (1,2,0,1,'2016-08-20 13:44:44');
/*!40000 ALTER TABLE `Relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) NOT NULL,
  `Password` varchar(35) NOT NULL,
  `Login` tinyint(1) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'mike','why',0,'2016-08-20 07:18:09'),(2,'mike1','why',1,'2016-08-20 07:18:09'),(3,'mikewe','why',1,'2016-08-20 07:18:09');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationshiptest`
--

DROP TABLE IF EXISTS `relationshiptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationshiptest` (
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '-1',
  `action_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_one_id` (`user_one_id`,`user_two_id`),
  KEY `user_two_id` (`user_two_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `fk_relationship` FOREIGN KEY (`user_one_id`) REFERENCES `usertest` (`id`),
  CONSTRAINT `relationshiptest_ibfk_1` FOREIGN KEY (`user_one_id`) REFERENCES `usertest` (`id`),
  CONSTRAINT `relationshiptest_ibfk_2` FOREIGN KEY (`user_two_id`) REFERENCES `usertest` (`id`),
  CONSTRAINT `relationshiptest_ibfk_3` FOREIGN KEY (`action_id`) REFERENCES `usertest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationshiptest`
--

LOCK TABLES `relationshiptest` WRITE;
/*!40000 ALTER TABLE `relationshiptest` DISABLE KEYS */;
INSERT INTO `relationshiptest` VALUES (1,2,1,2,'2016-08-25 09:32:03'),(1,3,3,3,'2016-08-26 04:57:38'),(1,4,2,4,'2016-08-26 04:58:06'),(1,5,0,5,'2016-08-26 05:39:26'),(1,6,0,1,'2016-08-26 05:42:17'),(1,7,1,1,'2016-08-26 05:42:23'),(1,8,2,1,'2016-08-26 05:42:31'),(1,9,3,1,'2016-08-26 05:42:39'),(1,10,0,1,'2016-08-26 09:03:17');
/*!40000 ALTER TABLE `relationshiptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertest`
--

DROP TABLE IF EXISTS `usertest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) NOT NULL,
  `Password` varchar(35) NOT NULL,
  `Login` tinyint(1) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Info` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_similarity` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertest`
--

LOCK TABLES `usertest` WRITE;
/*!40000 ALTER TABLE `usertest` DISABLE KEYS */;
INSERT INTO `usertest` VALUES (1,'mike','why',0,'2016-08-20 07:18:09',''),(2,'mike1','why',0,'2016-08-25 01:08:17',''),(3,'mikewe','why',1,'2016-08-20 07:18:09',''),(4,'m','why',0,'2016-08-22 08:33:48',''),(5,'kitty','why',0,'2016-08-26 04:59:13',''),(6,'hellen','why',0,'2016-08-26 05:12:42',''),(7,'Robin','why',0,'2016-08-26 05:13:16',''),(8,'Jack','why',0,'2016-08-26 05:40:08',''),(9,'Kate','why',0,'2016-08-26 05:40:25',''),(10,'Jackson','why',0,'2016-08-26 05:40:35','');
/*!40000 ALTER TABLE `usertest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `backup`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `backup` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `backup`;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(255) NOT NULL,
  `A` varchar(30) NOT NULL,
  `B` varchar(30) NOT NULL,
  `C` varchar(30) NOT NULL,
  `D` varchar(30) NOT NULL,
  `RightIndex` int(11) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (1,'The Republic of China is claimed to be found in which year?','1995','1996','1949','1997',3,'2016-08-18 05:25:42'),(2,'What is the right answer to 1+1?','2','3','8','9',1,'2016-08-18 05:25:42');
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `Intro` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `id_fr_key` FOREIGN KEY (`Id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `user_one_id` int(11) NOT NULL,
  `user_two_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '-1',
  `action_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `id_fr_key1` (`user_one_id`),
  CONSTRAINT `id_fr_key1` FOREIGN KEY (`user_one_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (1,2,1,2,'2016-08-25 09:32:03'),(1,3,3,3,'2016-08-26 04:57:38'),(1,4,2,4,'2016-08-26 04:58:06'),(1,5,0,5,'2016-08-26 05:39:26'),(1,6,0,1,'2016-08-26 05:42:17'),(1,7,1,1,'2016-08-26 05:42:23'),(1,8,2,1,'2016-08-26 05:42:31'),(1,9,3,1,'2016-08-26 05:42:39'),(1,10,0,1,'2016-08-26 09:03:17');
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(35) NOT NULL,
  `Password` varchar(35) NOT NULL,
  `Login` tinyint(1) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Info` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'mike1','why',0,'2016-08-25 01:08:17',''),(3,'mikewe','why',1,'2016-08-20 07:18:09',''),(4,'m','why',0,'2016-08-22 08:33:48',''),(5,'kitty','why',0,'2016-08-26 04:59:13',''),(6,'hellen','why',0,'2016-08-26 05:12:42',''),(7,'Robin','why',0,'2016-08-26 05:13:16',''),(8,'Jack','why',0,'2016-08-26 05:40:08',''),(9,'Kate','why',0,'2016-08-26 05:40:25',''),(11,'mike','why',0,'2016-08-28 02:43:15','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(255) NOT NULL,
  `A` varchar(30) NOT NULL,
  `B` varchar(30) NOT NULL,
  `C` varchar(30) NOT NULL,
  `D` varchar(30) NOT NULL,
  `RightIndex` int(11) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (1,'The Republic of China is claimed to be found in which year?','1995','1996','1949','1997',3,'2016-08-18 05:25:42'),(2,'What is the right answer to 1+1?','2','3','8','9',1,'2016-08-18 05:25:42');
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relationship`
--

DROP TABLE IF EXISTS `Relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relationship` (
  `user_id_1` int(11) NOT NULL,
  `user_id_2` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '-1',
  `action_id` int(11) NOT NULL,
  UNIQUE KEY `user_id_1` (`user_id_1`,`user_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relationship`
--

LOCK TABLES `Relationship` WRITE;
/*!40000 ALTER TABLE `Relationship` DISABLE KEYS */;
INSERT INTO `Relationship` VALUES (1,2,-1,1);
/*!40000 ALTER TABLE `Relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserTest`
--

DROP TABLE IF EXISTS `UserTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserTest` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Login` tinyint(4) NOT NULL DEFAULT '0',
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserTest`
--

LOCK TABLES `UserTest` WRITE;
/*!40000 ALTER TABLE `UserTest` DISABLE KEYS */;
INSERT INTO `UserTest` VALUES (1,'mike','why',0,'2016-08-20 07:18:09'),(2,'mike1','why',1,'2016-08-20 07:18:09'),(3,'mikewe','why',1,'2016-08-20 07:18:09');
/*!40000 ALTER TABLE `UserTest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-31 19:11:26
