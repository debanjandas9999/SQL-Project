-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: das17202833
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applicant_details`
--

DROP TABLE IF EXISTS `applicant_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applicant_details` (
  `Applicantcode` int(11) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` double DEFAULT NULL,
  `interviews_received` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Applicantcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_details`
--

LOCK TABLES `applicant_details` WRITE;
/*!40000 ALTER TABLE `applicant_details` DISABLE KEYS */;
INSERT INTO `applicant_details` VALUES (1,'Ben','Murphy','1 Clonskeagh Rd',899743144,'2'),(2,'Alfie','Hitler','Belfield, D4',843828383,'1'),(3,'Deb','Das','Burlington Road',833773723,'1'),(4,'Jay','Singh','Dundrum',864727471,'1'),(5,'Adam','Conway','Port Laoise',884427471,'2'),(6,'Ankish','Raj','Burlington',828382821,'2'),(7,'Mythreyi','Sudevan','Burlington ',894723327,'1'),(8,'Sukrat','kashyap','Burlington',839372883,'2'),(9,'Soumya','Bhatt','Roebuck Road',892828382,'1'),(10,'Chris','Lynn','Still Organ',839939239,'1');
/*!40000 ALTER TABLE `applicant_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_details`
--

DROP TABLE IF EXISTS `interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `interview_details` (
  `Applicant_ID` int(11) NOT NULL,
  `InterviewDate` varchar(45) DEFAULT NULL,
  `Jobcode` int(11) DEFAULT NULL,
  `JobOffered` varchar(45) DEFAULT NULL,
  KEY `Applicant_ID` (`Applicant_ID`),
  KEY `Jobcode` (`Jobcode`),
  CONSTRAINT `interview_details_ibfk_1` FOREIGN KEY (`Applicant_ID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `interview_details_ibfk_2` FOREIGN KEY (`Jobcode`) REFERENCES `job_details` (`jobcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_details`
--

LOCK TABLES `interview_details` WRITE;
/*!40000 ALTER TABLE `interview_details` DISABLE KEYS */;
INSERT INTO `interview_details` VALUES (1,'11/10/2018',1,'Yes'),(1,'12/10/2018',4,'No'),(2,'10/10/2018',3,'No'),(3,'19/10/2018',2,'No'),(4,'16/10/2018',5,'No'),(5,'15/10/2018',1,'No'),(5,'14/10/2018',2,'Yes'),(6,'21/10/2018',3,'Yes'),(7,'21/10/2018',7,'Yes'),(8,'13/11/2018',6,'No'),(8,'14/11/2018',8,'Yes'),(10,'21/10/2018',10,'Yes'),(9,'12/10/2018',9,'Yes');
/*!40000 ALTER TABLE `interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_details`
--

DROP TABLE IF EXISTS `job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_details` (
  `jobcode` int(11) NOT NULL,
  `jobtype` varchar(45) DEFAULT NULL,
  `uni` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobcode`),
  KEY `uni` (`uni`),
  CONSTRAINT `job_details_ibfk_1` FOREIGN KEY (`uni`) REFERENCES `university_details` (`uni_code`),
  CONSTRAINT `job_details_ibfk_2` FOREIGN KEY (`uni`) REFERENCES `university_details` (`uni_code`),
  CONSTRAINT `job_details_ibfk_3` FOREIGN KEY (`uni`) REFERENCES `university_details` (`uni_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_details`
--

LOCK TABLES `job_details` WRITE;
/*!40000 ALTER TABLE `job_details` DISABLE KEYS */;
INSERT INTO `job_details` VALUES (1,'Sales',1),(2,'Software Engineer',2),(3,'HR',4),(4,'Store Manager',5),(5,'Events Organizer',3),(6,'Accountant',6),(7,'Proffesor',7),(8,'Online Blogging',8),(9,'Cashier',9),(10,'Chef',10);
/*!40000 ALTER TABLE `job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_skills`
--

DROP TABLE IF EXISTS `job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_skills` (
  `JobID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  KEY `JobID` (`JobID`),
  KEY `SkillID` (`SkillID`),
  CONSTRAINT `job_skills_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `job_details` (`jobcode`),
  CONSTRAINT `job_skills_ibfk_2` FOREIGN KEY (`JobID`) REFERENCES `job_details` (`jobcode`),
  CONSTRAINT `job_skills_ibfk_3` FOREIGN KEY (`JobID`) REFERENCES `job_details` (`jobcode`),
  CONSTRAINT `job_skills_ibfk_4` FOREIGN KEY (`JobID`) REFERENCES `job_details` (`jobcode`),
  CONSTRAINT `job_skills_ibfk_5` FOREIGN KEY (`SkillID`) REFERENCES `skillset` (`skillid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_skills`
--

LOCK TABLES `job_skills` WRITE;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
INSERT INTO `job_skills` VALUES (1,1),(1,8),(2,3),(2,7),(3,1),(3,2),(4,1),(4,2),(4,9),(4,10),(5,1),(5,9),(5,10),(6,11),(6,9),(6,10),(7,4),(7,5),(8,6),(8,7),(9,8),(9,1),(9,11),(10,12);
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobappliedbyapplicant`
--

DROP TABLE IF EXISTS `jobappliedbyapplicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobappliedbyapplicant` (
  `ApplicantID` int(11) NOT NULL,
  `JobID` int(11) NOT NULL,
  `Joboffered` varchar(45) NOT NULL,
  KEY `ApplicantID` (`ApplicantID`),
  KEY `jobid_idx` (`JobID`),
  CONSTRAINT `jobappliedbyapplicant_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `jobappliedbyapplicant_ibfk_2` FOREIGN KEY (`ApplicantID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `jobappliedbyapplicant_ibfk_3` FOREIGN KEY (`JobID`) REFERENCES `job_details` (`jobcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobappliedbyapplicant`
--

LOCK TABLES `jobappliedbyapplicant` WRITE;
/*!40000 ALTER TABLE `jobappliedbyapplicant` DISABLE KEYS */;
INSERT INTO `jobappliedbyapplicant` VALUES (1,1,'Yes'),(1,1,'No'),(1,4,'No'),(2,3,'No'),(3,2,'No'),(4,5,'No'),(5,1,'No'),(5,2,'Yes'),(6,3,'Yes'),(7,7,'Yes'),(8,6,'No'),(8,8,'Yes'),(9,9,'Yes'),(10,10,'YES');
/*!40000 ALTER TABLE `jobappliedbyapplicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_skills`
--

DROP TABLE IF EXISTS `person_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person_skills` (
  `PersonID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  KEY `PersonID` (`PersonID`),
  KEY `SkillID` (`SkillID`),
  CONSTRAINT `person_skills_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `person_skills_ibfk_2` FOREIGN KEY (`PersonID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `person_skills_ibfk_3` FOREIGN KEY (`PersonID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `person_skills_ibfk_4` FOREIGN KEY (`PersonID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `person_skills_ibfk_5` FOREIGN KEY (`SkillID`) REFERENCES `skillset` (`skillid`),
  CONSTRAINT `person_skills_ibfk_6` FOREIGN KEY (`PersonID`) REFERENCES `applicant_details` (`applicantcode`),
  CONSTRAINT `person_skills_ibfk_7` FOREIGN KEY (`SkillID`) REFERENCES `skillset` (`skillid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_skills`
--

LOCK TABLES `person_skills` WRITE;
/*!40000 ALTER TABLE `person_skills` DISABLE KEYS */;
INSERT INTO `person_skills` VALUES (1,2),(1,4),(1,1),(2,3),(2,8),(2,2),(3,1),(4,4),(4,5),(5,7),(5,3),(5,6),(6,1),(6,2),(6,4),(7,5),(7,4),(8,6),(8,7),(8,6),(8,7),(9,8),(9,1),(9,11),(10,12);
/*!40000 ALTER TABLE `person_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillset`
--

DROP TABLE IF EXISTS `skillset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `skillset` (
  `SkillID` int(11) NOT NULL,
  `Skillname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillset`
--

LOCK TABLES `skillset` WRITE;
/*!40000 ALTER TABLE `skillset` DISABLE KEYS */;
INSERT INTO `skillset` VALUES (1,'Customer Service'),(2,'Administrative'),(3,'Programming'),(4,'Teaching'),(5,'Research'),(6,'Writing'),(7,'Tech Geek'),(8,'Cashier'),(9,'Organizational'),(10,'Time Management'),(11,'Numeracy '),(12,'Cooking with experience ');
/*!40000 ALTER TABLE `skillset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_details`
--

DROP TABLE IF EXISTS `university_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university_details` (
  `Uni_Code` int(11) NOT NULL,
  `UniName` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Telephone` double NOT NULL,
  PRIMARY KEY (`Uni_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_details`
--

LOCK TABLES `university_details` WRITE;
/*!40000 ALTER TABLE `university_details` DISABLE KEYS */;
INSERT INTO `university_details` VALUES (1,'UCD','Belfield',899743144),(2,'TCD','City Centre, Dublin',836227721),(3,'UCC','Cork',864726627),(4,'DCU','Dublin',836273717),(5,'UL','Limerick',836353526),(6,'NCI','Ireland',899743144),(7,'UM','Maynooth',899742844),(8,'DBS','Dublin',89934833),(9,'THS','Kolkata,India.',899372372),(10,'UniMelb','Melbourne',893892939);
/*!40000 ALTER TABLE `university_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'das17202833'
--
/*!50003 DROP PROCEDURE IF EXISTS `applicant-given-applicantcode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant-given-applicantcode`(in p_code int)
BEGIN
SELECT * FROM applicant_details 
WHERE applicant_details.Applicantcode = p_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant-given-surname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant-given-surname`(in p_surname varchar(45))
BEGIN
SELECT *
FROM applicant_details
WHERE applicant_details.Surname = p_surname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicants-given-jobid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicants-given-jobid`(in p_jobid int)
BEGIN
SELECT * from applicant_details s INNER JOIN person_skills sc ON
s.Applicantcode = sc.PersonID
WHERE sc.SkillID IN( SELECT jbs.SkillID from job_details jb INNER JOIN
job_skills jbs on jb.jobcode = jbs.JobID
WHERE jb.jobcode = p_jobid );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicants-interviewed-twice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicants-interviewed-twice`()
BEGIN
Select Applicantcode, Firstname, surname
FROM applicant_details s , interview_details sc
WHERE sc.Applicant_ID = s.Applicantcode and s.interviews_received >= '2';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_details_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_details_newrow`(in p_code int, p_firstname varchar(45), p_lastname varchar(45), p_address varchar(45), p_tel double, p_interviews int)
BEGIN
INSERT INTO applicant_details(Applicantcode, Firstname, Surname, Address, Telephone, interviews_received)
Values(p_code, p_firstname, p_lastname, p_address, p_tel, p_interviews);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `interviews-occured-on-a-date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `interviews-occured-on-a-date`(in p_date varchar(45))
BEGIN
SELECT * FROM interview_details
WHERE interview_details.InterviewDate = p_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `interview_details_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `interview_details_newrow`(in p_id int, p_date varchar(45), p_code int, p_offered varchar(45))
BEGIN
INSERT INTO interview_details (Applicant_ID, InterviewDate, Jobcode, JobOffered)
values (p_id, p_date, p_code, p_offered); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job-given-skillname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job-given-skillname`(in p_skillname varchar(45))
BEGIN
Select * FROM job_details INNER JOIN job_skills 
ON job_skills.JobID = job_details.jobcode INNER JOIN
skillset ON skillset.SkillID = job_skills.SkillID
WHERE skillset.Skillname = p_skillname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jobappliedbyapplicant_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobappliedbyapplicant_newrow`(in p_applicantid int, p_jobid int, p_joboffered varchar(45))
BEGIN
INSERT INTO `das17202833`.`jobappliedbyapplicant`
(`ApplicantID`,
`JobID`,
`Joboffered`)
VALUES (p_applicantid, p_jobid, p_joboffered);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jobskills-newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobskills-newrow`(in p_jobid int, p_skillid int)
BEGIN
INSERT INTO `das17202833`.`job_skills`
(`JobID`,
`SkillID`)
VALUES(p_jobid, p_skillid);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jobsortedbyuni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jobsortedbyuni`()
BEGIN
SELECT * from job_details Inner Join job_skills ON  
job_skills.JobID = job_details.jobcode Inner Join 
skillset ON skillset.SkillID = job_skills.SkillID Inner Join university_details ON
university_details.Uni_Code = job_details.uni
order by UniName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_details_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_details_newrow`(in p_jobcode int, p_jobtype varchar(45), p_unicode int)
BEGIN
INSERT INTO `das17202833`.`job_details`
(`jobcode`,
`jobtype`,
`uni`)
VALUES (p_jobcode, p_jobtype, p_unicode);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `no.ofapplicants-offeredajob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `no.ofapplicants-offeredajob`()
BEGIN
Select count(*) 
FROM jobappliedbyapplicant 
WHERE jobappliedbyapplicant.Joboffered = 'Yes'; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `no.ofjobdescriptions-research skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `no.ofjobdescriptions-research skills`()
BEGIN
SELECT count(*)
FROM job_skills
WHERE job_skills.SkillID = '5';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `person_skills_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `person_skills_newrow`(in p_appid int, p_skillid int)
BEGIN
INSERT INTO person_skills(PersonID, SkillID)
VALUES (p_appid, p_skillid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skillset-newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `skillset-newrow`(in p_id int, p_name varchar(45))
BEGIN
INSERT INTO skillset(SkillID, Skillname)
VALUES (p_id, p_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni-given-name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni-given-name`(in pname varchar(45))
BEGIN
SELECT *  
FROM university_details 
WHERE university_details.UniName = pname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uni-given-unicode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uni-given-unicode`(in p_code int)
BEGIN
SELECT * from university_details
WHERE university_details.UniCode = p_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `university_details_newrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `university_details_newrow`(in p_code int, p_name varchar(45) ,p_address varchar(45), p_tel double)
BEGIN
INSERT INTO university_details (Uni_Code, UniName, Address , Telephone)
VALUES (p_code, p_name, p_address, p_tel);
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

-- Dump completed on 2018-11-16 21:37:10
