-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: stu
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grades` (
  `EntryID` varchar(255) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `TotalMarks` int(11) DEFAULT NULL,
  `Grades` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EntryID`,`SubjectID`),
  CONSTRAINT `Grades_ibfk_1` FOREIGN KEY (`EntryID`) REFERENCES `login` (`EntryID`) ON DELETE CASCADE,
  CONSTRAINT `Grades_ibfk_2` FOREIGN KEY (`EntryID`, `SubjectID`) REFERENCES `subject` (`EntryID`, `SubjectID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES ('dush',1,246,'A'),('shaivi',1,224,'A');
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `EntryID` varchar(255) NOT NULL,
  `Pass` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('dush','dush','Student'),('shaivi','shaivi','Student'),('ta','ta','TA');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `EntryID` varchar(255) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `AssignID` int(11) NOT NULL,
  `Marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`EntryID`,`SubjectID`,`AssignID`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`EntryID`) REFERENCES `login` (`EntryID`) ON DELETE CASCADE,
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`EntryID`, `SubjectID`) REFERENCES `subject` (`EntryID`, `SubjectID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES ('dush',1,34,45),('dush',1,76,78),('shaivi',1,56,67),('shaivi',1,87,45);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `EntryID` varchar(255) NOT NULL,
  `Stu_name` varchar(255) DEFAULT NULL,
  `Dept` varchar(255) DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  `DOB` varchar(255) DEFAULT NULL,
  KEY `EntryID` (`EntryID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`EntryID`) REFERENCES `login` (`EntryID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('shaivi','shaivi','Computers','btech','19/10/1993'),('dush','dush','Electrical','11/11/1993','11/11/1993');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `EntryID` varchar(255) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `Subject_name` varchar(255) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`EntryID`,`SubjectID`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`EntryID`) REFERENCES `login` (`EntryID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('dush',1,'digital',4),('shaivi',1,'digital',4);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-10 23:59:33
