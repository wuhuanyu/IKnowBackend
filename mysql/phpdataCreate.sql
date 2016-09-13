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
-- Table structure for table `GameInvitation`
--

DROP TABLE IF EXISTS `GameInvitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GameInvitation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` int(11) NOT NULL,
  `Receiver` int(11) NOT NULL,
  `Room` varchar(255) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '-1',
  `ActionId` int(11) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GameInvitation`
--

LOCK TABLES `GameInvitation` WRITE;
/*!40000 ALTER TABLE `GameInvitation` DISABLE KEYS */;
INSERT INTO `GameInvitation` VALUES (78,2,1,'f308ec756dfe4ad49c813dcdc89cd8f3',0,2,'2016-09-13 11:24:42'),(79,2,1,'dcf846aa533ae0013210491546b64566',0,2,'2016-09-13 11:24:44'),(80,2,1,'4ced7612fd184aaac075fd86aef39e7f',0,2,'2016-09-13 11:25:32'),(81,2,1,'a0f59892dbb16ea702ed00b4bfebafca',0,2,'2016-09-13 11:28:29'),(82,2,1,'6444465829d6846ab7152022d88ea624',0,2,'2016-09-13 11:28:55'),(83,2,1,'62ee5d4b44463471b93018ed3483fa61',0,2,'2016-09-13 11:28:58'),(84,2,1,'1479c5e52bfbaea1424f592c6517de85',0,2,'2016-09-13 11:28:59'),(85,2,1,'1479c5e52bfbaea1424f592c6517de85',0,2,'2016-09-13 11:28:59'),(86,2,1,'a1eb3dbbd76a00583e8b4a21e63828f6',0,2,'2016-09-13 11:29:01'),(87,2,1,'93ef240eae7d2868c8dc56f269bb66a2',0,2,'2016-09-13 11:29:05'),(88,2,1,'ff1eb08a174416b951ff576f872b5072',0,2,'2016-09-13 11:29:08'),(89,2,1,'39c98d25935355cc90a58001922afba6',0,2,'2016-09-13 11:29:16'),(90,2,1,'3c45e86d359df5b81ac6293711385eb2',0,2,'2016-09-13 11:29:18'),(91,2,1,'aa2dd1357daa37990b748e0b4a18ec69',0,2,'2016-09-13 11:29:39'),(92,2,1,'05bfb2bb2b0bc8a285fc3f649d64141d',0,2,'2016-09-13 11:29:40'),(93,2,1,'4cfad17be6d4d2cb7306ae12b42fe4a4',0,2,'2016-09-13 11:29:42'),(94,2,1,'fcbc72f5f3da4a550720c5e428654359',0,2,'2016-09-13 11:29:43'),(95,2,1,'fcbc72f5f3da4a550720c5e428654359',0,2,'2016-09-13 11:29:43'),(96,2,1,'00ae840cb80d9f974c3c6c4ceebe4fa7',0,2,'2016-09-13 11:29:44'),(97,2,1,'00ae840cb80d9f974c3c6c4ceebe4fa7',0,2,'2016-09-13 11:29:44'),(98,2,1,'8ef0fae3a3a6d32b93b6b6040910ad21',0,2,'2016-09-13 11:29:45'),(99,2,1,'83235d73281724485068f5a91eb5a2fc',0,2,'2016-09-13 11:29:46'),(100,2,1,'71eebb70808e7f103eae55070398de36',0,2,'2016-09-13 11:29:47'),(101,2,1,'c086f8de7a5e8d4a70068d9022a4837a',0,2,'2016-09-13 11:29:53'),(102,2,1,'ed451672ce519bdb9c779ed9b457ec54',0,2,'2016-09-13 11:29:54'),(103,2,1,'a18d0885ac8b749648c5768833f892a5',0,2,'2016-09-13 11:29:55'),(104,2,1,'d683004f78bcaa1b5997b42de9b9c8c1',0,2,'2016-09-13 11:29:56'),(105,2,1,'30f0f3b16c1e519a497511d18f5a11d1',0,2,'2016-09-13 11:29:57'),(106,2,1,'30f0f3b16c1e519a497511d18f5a11d1',0,2,'2016-09-13 11:29:57'),(107,2,1,'d16ad0e2c65cec0dff7a0fcc3aed1f36',0,2,'2016-09-13 11:29:58'),(108,2,1,'d16ad0e2c65cec0dff7a0fcc3aed1f36',0,2,'2016-09-13 11:29:58'),(109,2,1,'be39c65e6d18d70077abaf3b41a2ae8f',0,2,'2016-09-13 11:29:59'),(110,2,1,'be39c65e6d18d70077abaf3b41a2ae8f',0,2,'2016-09-13 11:29:59'),(111,2,1,'0faf2f129ee08ae7e1c3512ed257e526',0,2,'2016-09-13 11:30:44'),(112,2,1,'5b89472045756ad30f2126996ae613cf',0,2,'2016-09-13 11:30:49'),(113,2,1,'96f80ef869a4e7eed9bee140f36b82e2',0,2,'2016-09-13 11:30:51'),(114,2,1,'9d71599ce489f8a28ad73dab309d0c0f',0,2,'2016-09-13 11:33:33'),(115,2,1,'ad25f6bd9e7fd123919fcc9120214130',0,2,'2016-09-13 11:33:41'),(116,2,1,'ff6f8ece8ddbed69509195616acd3daf',0,2,'2016-09-13 11:37:31'),(117,2,1,'24d769f700b34dfe373632f2b2c41b56',0,2,'2016-09-13 11:37:33'),(118,2,1,'e9e8f7ef1be00536cd96db39b89161c3',0,2,'2016-09-13 11:37:35');
/*!40000 ALTER TABLE `GameInvitation` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `relationshiptest` VALUES (1,2,1,1,'2016-09-09 11:48:30'),(1,3,3,3,'2016-08-26 04:57:38'),(1,4,2,4,'2016-08-26 04:58:06'),(1,5,0,5,'2016-08-26 05:39:26'),(1,6,0,1,'2016-08-26 05:42:17'),(1,7,1,1,'2016-08-26 05:42:23'),(1,8,2,1,'2016-08-26 05:42:31'),(1,9,3,1,'2016-08-26 05:42:39'),(1,10,0,1,'2016-08-26 09:03:17');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13 20:40:33
