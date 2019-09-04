-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: BugTest
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `ath_bugs`
--

DROP TABLE IF EXISTS `ath_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ath_bugs` (
  `id` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `created` bigint(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `asignee` varchar(20) DEFAULT NULL,
  `reportee` varchar(20) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugs_un` (`name`),
  KEY `bugs_fk` (`asignee`),
  KEY `bugs_fk_1` (`reportee`),
  KEY `bugs_fk_2` (`team`),
  CONSTRAINT `bugs_fk` FOREIGN KEY (`asignee`) REFERENCES `ath_members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bugs_fk_1` FOREIGN KEY (`reportee`) REFERENCES `ath_members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bugs_fk_2` FOREIGN KEY (`team`) REFERENCES `ath_team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ath_bugs`
--

LOCK TABLES `ath_bugs` WRITE;
/*!40000 ALTER TABLE `ath_bugs` DISABLE KEYS */;
INSERT INTO `ath_bugs` VALUES ('bg1','Test Bug',0,'Test Bug for Testing',0,'a1b2c3','a1b2c3d4','a1avsv11saav'),('bg2','Test_Bug',0,'Test Bug for Testing',0,'a1b2c3d4','a1b2c3','a1avsv11saav');
/*!40000 ALTER TABLE `ath_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ath_members`
--

DROP TABLE IF EXISTS `ath_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ath_members` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` bigint(20) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `team` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ath_members_un` (`name`),
  KEY `ath_members_fk` (`team`),
  CONSTRAINT `ath_members_fk` FOREIGN KEY (`team`) REFERENCES `ath_team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ath_members`
--

LOCK TABLES `ath_members` WRITE;
/*!40000 ALTER TABLE `ath_members` DISABLE KEYS */;
INSERT INTO `ath_members` VALUES ('a1b2c3','ATest',0,0,'a1avsv11saav','Active'),('a1b2c3d4','BTest',0,0,NULL,'Active');
/*!40000 ALTER TABLE `ath_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ath_team`
--

DROP TABLE IF EXISTS `ath_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ath_team` (
  `id` varchar(32) NOT NULL,
  `created` bigint(20) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ath_team_un` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ath_team`
--

LOCK TABLES `ath_team` WRITE;
/*!40000 ALTER TABLE `ath_team` DISABLE KEYS */;
INSERT INTO `ath_team` VALUES ('a1avsv11saav',0,0,'TestTeam');
/*!40000 ALTER TABLE `ath_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BugTest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-04 16:41:28
