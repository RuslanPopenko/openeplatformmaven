-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: sarimner.imcode.com    Database: oep-imcode_dev
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Table structure for table `checkbox_queries`
--

DROP TABLE IF EXISTS `checkbox_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkbox_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `minChecked` int(10) unsigned DEFAULT NULL,
  `maxChecked` int(10) unsigned DEFAULT NULL,
  `freeTextAlternative` varchar(255) DEFAULT NULL,
  `helpText` text,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkbox_queries`
--

LOCK TABLES `checkbox_queries` WRITE;
/*!40000 ALTER TABLE `checkbox_queries` DISABLE KEYS */;
INSERT INTO `checkbox_queries` VALUES (3837,NULL,NULL,NULL,'Om annan',NULL),(3861,'<p>Kryssa i ett eller flera alternativ som g&auml;ller f&ouml;r din planerade verksamhet</p>',NULL,NULL,'Annat',NULL),(3863,'<p>F&ouml;r att&nbsp; kunna placera er livsmedelsanl&auml;ggning i r&auml;tt riskklass och d&auml;refter besluta om den &aring;rliga kontrollavgiften beh&ouml;ver vi veta vad du planerar att g&ouml;ra i din verksamhet. Kryssa i ett eller fler av de alternativ som passar dig.</p>',1,NULL,'Annat',NULL),(3879,NULL,NULL,NULL,NULL,'<p>Om det inte &auml;r firmans/f&ouml;retagets &auml;gare som ska vara kontaktperson mot kontrollmyndigheten s&aring;&nbsp;kryssa i &quot;Ja&quot;.</p>'),(3919,'<p>Please tick one or more options that apply to your planned activities</p>',NULL,NULL,'Other',NULL),(3921,'<p>In order to place your food establishment in the correct class and then decide on the annual inspection fee, we need to know what you plan to do in your business. Mark one or more of the options that suit you.</p>',1,NULL,'Other',NULL),(3937,NULL,NULL,NULL,NULL,'<p>If it is not the firm / company owners who will be the contact person on the inspection, please check &quot;Yes&quot;.</p>'),(3953,'<p>Brukar du motionera? Vad &auml;r i s&aring; fall vanligaste s&auml;ttet?</p>',NULL,NULL,'Annat',NULL);
/*!40000 ALTER TABLE `checkbox_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkbox_query_alternatives`
--

DROP TABLE IF EXISTS `checkbox_query_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkbox_query_alternatives` (
  `alternativeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alternativeID`),
  KEY `FK_checkbox_query_alternatives_1` (`queryID`),
  CONSTRAINT `FK_checkbox_query_alternatives_1` FOREIGN KEY (`queryID`) REFERENCES `checkbox_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1426 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkbox_query_alternatives`
--

LOCK TABLES `checkbox_query_alternatives` WRITE;
/*!40000 ALTER TABLE `checkbox_query_alternatives` DISABLE KEYS */;
INSERT INTO `checkbox_query_alternatives` VALUES (1319,3837,'F√∂retag',0),(1321,3837,'Privatperson',1),(1323,3861,'Restaurang',0),(1325,3861,'Pizzeria',1),(1327,3861,'Gatuk√∂k',2),(1329,3861,'Kiosk',3),(1331,3861,'Caf√©/konditori',4),(1333,3861,'Bageri',5),(1335,3861,'Mottagningsk√∂k',6),(1337,3861,'Catering',7),(1339,3861,'Transport√∂r',8),(1341,3861,'Tillverkare',9),(1343,3861,'Grossist',10),(1345,3861,'Butik med f√∂rpackade varor',11),(1347,3861,'Butik med of√∂rpackade varor',12),(1349,3863,'Hantering av r√•tt k√∂tt/fisk',0),(1351,3863,'Hantering av r√•a gr√∂nsaker',1),(1353,3863,'Kokning/grillning av korv',2),(1355,3863,'Tillagning av halvfabrikat',3),(1357,3863,'Varmh√•llning/√Öteruppv√§rmning',4),(1359,3863,'Nedkylning',5),(1361,3863,'Bakning',6),(1363,3863,'Hantering endast av f√∂rpackade livsmedel',7),(1365,3863,'Hantering av of√∂rpackad glass',8),(1367,3863,'F√∂rpacka och/eller m√§rka livsmedel',9),(1369,3879,'Ja',0),(1371,3919,'Restaurant',0),(1373,3919,'Pizzeria',1),(1375,3919,'Snack bar / street food',2),(1377,3919,'Kiosk',3),(1379,3919,'Caf√©',4),(1381,3919,'Bakery',5),(1385,3919,'Catering',6),(1387,3919,'Transporter',7),(1389,3919,'Manufacturer',8),(1391,3919,'Wholesale',9),(1393,3919,'Shop with packaged goods',10),(1395,3919,'Shop with unpackaged (open) goods',11),(1397,3921,'Handling of raw meat / fish',0),(1399,3921,'Handling of raw vegetables',1),(1401,3921,'Cooking / grilling sausages',2),(1403,3921,'Cooking semi-processed food',3),(1405,3921,'Keep warm / Reheat',4),(1407,3921,'Cooling',5),(1409,3921,'Baking',6),(1411,3921,'Handling of packaged foods only',7),(1413,3921,'Handling of non packaged ice cream',8),(1415,3921,'Packing and / or labeling of food',9),(1417,3937,'Yes',0),(1419,3953,'Gym',0),(1421,3953,'L√∂pning',1),(1423,3953,'Lagsport',2),(1425,3953,'Simmning',3);
/*!40000 ALTER TABLE `checkbox_query_alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkbox_query_instance_alternatives`
--

DROP TABLE IF EXISTS `checkbox_query_instance_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkbox_query_instance_alternatives` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `alternativeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`queryInstanceID`,`alternativeID`),
  KEY `FK_checkbox_query_instance_alternatives_2` (`alternativeID`),
  CONSTRAINT `FK_checkbox_query_instance_alternatives_1` FOREIGN KEY (`queryInstanceID`) REFERENCES `checkbox_query_instances` (`queryInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_checkbox_query_instance_alternatives_2` FOREIGN KEY (`alternativeID`) REFERENCES `checkbox_query_alternatives` (`alternativeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkbox_query_instance_alternatives`
--

LOCK TABLES `checkbox_query_instance_alternatives` WRITE;
/*!40000 ALTER TABLE `checkbox_query_instance_alternatives` DISABLE KEYS */;
INSERT INTO `checkbox_query_instance_alternatives` VALUES (23,1323),(79,1329),(25,1349),(81,1361),(195,1371),(251,1371),(307,1371),(363,1371),(531,1371),(195,1373),(251,1373),(195,1375),(197,1397),(253,1397),(309,1397),(365,1397),(197,1399),(253,1399),(197,1401),(253,1411);
/*!40000 ALTER TABLE `checkbox_query_instance_alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkbox_query_instances`
--

DROP TABLE IF EXISTS `checkbox_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkbox_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  `freeTextAlternativeValue` varchar(255) DEFAULT NULL,
  `minChecked` int(10) unsigned DEFAULT NULL,
  `maxChecked` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_checkbox_query_instances_1` (`queryID`),
  CONSTRAINT `FK_checkbox_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `checkbox_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkbox_query_instances`
--

LOCK TABLES `checkbox_query_instances` WRITE;
/*!40000 ALTER TABLE `checkbox_query_instances` DISABLE KEYS */;
INSERT INTO `checkbox_query_instances` VALUES (23,3861,NULL,NULL,NULL),(25,3863,NULL,1,NULL),(41,3879,NULL,NULL,NULL),(79,3861,NULL,NULL,NULL),(81,3863,NULL,1,NULL),(97,3879,NULL,NULL,NULL),(139,3919,'√•√§√∂',NULL,NULL),(141,3921,'test1 √•√§√∂',1,NULL),(157,3937,NULL,NULL,NULL),(195,3919,NULL,NULL,NULL),(197,3921,NULL,1,NULL),(213,3937,NULL,NULL,NULL),(251,3919,NULL,NULL,NULL),(253,3921,NULL,1,NULL),(269,3937,NULL,NULL,NULL),(307,3919,NULL,NULL,NULL),(309,3921,NULL,1,NULL),(325,3937,NULL,NULL,NULL),(363,3919,NULL,NULL,NULL),(365,3921,NULL,1,NULL),(381,3937,NULL,NULL,NULL),(531,3919,NULL,NULL,NULL),(533,3921,'&#269;',1,NULL),(549,3937,NULL,NULL,NULL);
/*!40000 ALTER TABLE `checkbox_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_detail_queries`
--

DROP TABLE IF EXISTS `contact_detail_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_detail_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `helpText` text,
  `allowSMS` tinyint(1) unsigned NOT NULL,
  `requireAddress` tinyint(1) NOT NULL,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_detail_queries`
--

LOCK TABLES `contact_detail_queries` WRITE;
/*!40000 ALTER TABLE `contact_detail_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_detail_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_detail_query_instances`
--

DROP TABLE IF EXISTS `contact_detail_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_detail_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryID` int(10) unsigned NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  `contactBySMS` tinyint(1) unsigned DEFAULT NULL,
  `persistUserProfile` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_contact_detail_query_instances_1` (`queryID`),
  CONSTRAINT `FK_contact_detail_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `contact_detail_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_detail_query_instances`
--

LOCK TABLES `contact_detail_query_instances` WRITE;
/*!40000 ALTER TABLE `contact_detail_query_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_detail_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drop_down_queries`
--

DROP TABLE IF EXISTS `drop_down_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drop_down_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `shortDescription` varchar(255) DEFAULT NULL,
  `freeTextAlternative` varchar(255) DEFAULT NULL,
  `helpText` text,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drop_down_queries`
--

LOCK TABLES `drop_down_queries` WRITE;
/*!40000 ALTER TABLE `drop_down_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `drop_down_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drop_down_query_alternatives`
--

DROP TABLE IF EXISTS `drop_down_query_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drop_down_query_alternatives` (
  `alternativeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alternativeID`),
  KEY `FK_drop_down_query_alternatives_1` (`queryID`),
  CONSTRAINT `FK_drop_down_query_alternatives_1` FOREIGN KEY (`queryID`) REFERENCES `drop_down_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drop_down_query_alternatives`
--

LOCK TABLES `drop_down_query_alternatives` WRITE;
/*!40000 ALTER TABLE `drop_down_query_alternatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `drop_down_query_alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drop_down_query_instances`
--

DROP TABLE IF EXISTS `drop_down_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drop_down_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  `alternativeID` int(10) unsigned DEFAULT NULL,
  `freeTextAlternativeValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_drop_down_query_instances_1` (`queryID`),
  KEY `FK_drop_down_query_instances_2` (`alternativeID`),
  CONSTRAINT `FK_drop_down_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `drop_down_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_drop_down_query_instances_2` FOREIGN KEY (`alternativeID`) REFERENCES `drop_down_query_alternatives` (`alternativeID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drop_down_query_instances`
--

LOCK TABLES `drop_down_query_instances` WRITE;
/*!40000 ALTER TABLE `drop_down_query_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `drop_down_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_flow_submit_surveys`
--

DROP TABLE IF EXISTS `feedback_flow_submit_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_flow_submit_surveys` (
  `feedbackSurveyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flowID` int(10) unsigned NOT NULL,
  `flowInstanceID` int(10) unsigned NOT NULL,
  `added` datetime NOT NULL,
  `answer` varchar(45) NOT NULL,
  `comment` mediumtext,
  PRIMARY KEY (`feedbackSurveyID`),
  UNIQUE KEY `Index_3` (`flowID`,`flowInstanceID`),
  CONSTRAINT `FK_feedback_flow_submit_surveys_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_flow_submit_surveys`
--

LOCK TABLES `feedback_flow_submit_surveys` WRITE;
/*!40000 ALTER TABLE `feedback_flow_submit_surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_flow_submit_surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload_files`
--

DROP TABLE IF EXISTS `file_upload_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload_files` (
  `fileID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `queryInstanceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `FK_file_upload_files_1` (`queryInstanceID`),
  CONSTRAINT `FK_file_upload_files_1` FOREIGN KEY (`queryInstanceID`) REFERENCES `file_upload_query_instances` (`queryInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload_files`
--

LOCK TABLES `file_upload_files` WRITE;
/*!40000 ALTER TABLE `file_upload_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload_queries`
--

DROP TABLE IF EXISTS `file_upload_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `helpText` text,
  `maxFileCount` int(10) unsigned DEFAULT NULL,
  `maxFileSize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload_queries`
--

LOCK TABLES `file_upload_queries` WRITE;
/*!40000 ALTER TABLE `file_upload_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload_query_extensions`
--

DROP TABLE IF EXISTS `file_upload_query_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload_query_extensions` (
  `queryID` int(10) unsigned NOT NULL,
  `extension` varchar(12) NOT NULL,
  PRIMARY KEY (`queryID`,`extension`),
  CONSTRAINT `FK_file_upload_query_extensions_1` FOREIGN KEY (`queryID`) REFERENCES `file_upload_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload_query_extensions`
--

LOCK TABLES `file_upload_query_extensions` WRITE;
/*!40000 ALTER TABLE `file_upload_query_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload_query_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_upload_query_instances`
--

DROP TABLE IF EXISTS `file_upload_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_upload_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`queryInstanceID`) USING BTREE,
  KEY `FK_file_upload_query_instances_1` (`queryID`),
  CONSTRAINT `FK_file_upload_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `file_upload_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_upload_query_instances`
--

LOCK TABLES `file_upload_query_instances` WRITE;
/*!40000 ALTER TABLE `file_upload_query_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_upload_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_familiy_notification_settings`
--

DROP TABLE IF EXISTS `flow_familiy_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_familiy_notification_settings` (
  `flowFamilyID` int(10) unsigned NOT NULL,
  `sendStatusChangedUserSMS` tinyint(1) NOT NULL,
  `sendExternalMessageReceivedUserSMS` tinyint(1) NOT NULL,
  `sendFlowInstanceSubmittedUserSMS` tinyint(1) NOT NULL,
  `sendFlowInstanceArchivedUserSMS` tinyint(1) NOT NULL,
  `sendStatusChangedUserEmail` tinyint(1) NOT NULL,
  `sendExternalMessageReceivedUserEmail` tinyint(1) NOT NULL,
  `sendFlowInstanceSubmittedUserEmail` tinyint(1) NOT NULL,
  `sendFlowInstanceArchivedUserEmail` tinyint(1) NOT NULL,
  `flowInstanceSubmittedUserEmailSubject` varchar(255) DEFAULT NULL,
  `flowInstanceSubmittedUserEmailMessage` text,
  `flowInstanceArchivedUserEmailSubject` varchar(255) DEFAULT NULL,
  `flowInstanceArchivedUserEmailMessage` text,
  `sendExternalMessageReceivedManagerEmail` tinyint(1) NOT NULL,
  `sendFlowInstanceAssignedManagerEmail` tinyint(1) NOT NULL,
  `sendStatusChangedManagerEmail` tinyint(1) NOT NULL,
  `sendFlowInstanceSubmittedManagerEmail` tinyint(1) NOT NULL,
  `sendFlowInstanceSubmittedGlobalEmail` tinyint(1) NOT NULL,
  `flowInstanceSubmittedGlobalEmailAddress` varchar(255) DEFAULT NULL,
  `flowInstanceSubmittedGlobalEmailAttachPDF` tinyint(1) NOT NULL,
  PRIMARY KEY (`flowFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_familiy_notification_settings`
--

LOCK TABLES `flow_familiy_notification_settings` WRITE;
/*!40000 ALTER TABLE `flow_familiy_notification_settings` DISABLE KEYS */;
INSERT INTO `flow_familiy_notification_settings` VALUES (43,0,0,0,0,1,0,0,0,NULL,'<p>Hej $contact.firstname,</p>\r\n<p>H&auml;r kommer en bekr&auml;ftelse p&aring; att &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har skickats in.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>',NULL,'<p>Hej $contact.firstname,</p>\r\n<p>Handl&auml;ggningen av &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har slutf&ouml;rts.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>',1,0,0,0,0,'Hillar.loor@imcode.com',1);
/*!40000 ALTER TABLE `flow_familiy_notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_aborted_flow_instances`
--

DROP TABLE IF EXISTS `flowengine_aborted_flow_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_aborted_flow_instances` (
  `abortID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flowFamilyID` int(10) unsigned NOT NULL,
  `flowID` int(10) unsigned NOT NULL,
  `stepID` int(10) unsigned NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`abortID`),
  KEY `FK_flowengine_aborted_flow_instances_1` (`flowID`),
  CONSTRAINT `FK_flowengine_aborted_flow_instances_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_aborted_flow_instances`
--

LOCK TABLES `flowengine_aborted_flow_instances` WRITE;
/*!40000 ALTER TABLE `flowengine_aborted_flow_instances` DISABLE KEYS */;
INSERT INTO `flowengine_aborted_flow_instances` VALUES (167,37,177,717,'2015-06-16 13:51:34'),(169,39,179,719,'2015-06-16 15:10:45'),(171,39,179,719,'2015-06-16 17:01:45'),(173,41,181,729,'2015-06-17 12:24:47'),(175,39,179,719,'2015-06-19 21:06:53'),(177,39,179,719,'2015-06-24 12:42:04'),(179,39,179,723,'2015-09-01 10:14:57'),(181,39,179,719,'2015-09-03 11:23:03'),(183,37,177,717,'2015-09-03 11:23:03'),(185,37,177,741,'2015-09-03 12:05:03'),(187,39,183,731,'2015-09-08 14:35:15'),(189,37,177,717,'2015-09-09 11:26:17'),(191,39,179,719,'2015-09-09 14:40:17'),(193,39,179,719,'2015-11-23 11:20:21'),(195,39,179,721,'2016-01-13 11:50:05'),(197,39,179,719,'2016-01-13 12:54:23'),(199,37,177,717,'2016-01-13 14:58:23'),(201,39,183,731,'2016-01-13 14:58:23'),(203,43,185,745,'2016-02-03 15:56:18'),(205,39,179,721,'2016-02-03 15:56:18'),(207,39,183,731,'2016-02-04 14:57:20'),(209,39,179,719,'2016-03-23 16:11:27'),(211,43,185,747,'2016-03-23 16:54:27'),(213,39,179,719,'2016-05-16 16:21:37'),(215,39,183,731,'2016-07-13 12:44:34'),(217,39,183,739,'2016-08-31 13:57:51'),(219,39,183,731,'2016-09-01 09:23:54');
/*!40000 ALTER TABLE `flowengine_aborted_flow_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_default_flow_statuses`
--

DROP TABLE IF EXISTS `flowengine_default_flow_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_default_flow_statuses` (
  `actionID` varchar(255) NOT NULL,
  `flowID` int(10) unsigned NOT NULL,
  `statusID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`actionID`,`flowID`),
  KEY `FK_flowengine_default_flow_states_2` (`flowID`),
  KEY `FK_flowengine_default_flow_states_3` (`statusID`) USING BTREE,
  CONSTRAINT `FK_flowengine_default_flow_states_1` FOREIGN KEY (`actionID`) REFERENCES `flowengine_flow_actions` (`actionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flowengine_default_flow_states_2` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flowengine_default_flow_statuses_3` FOREIGN KEY (`statusID`) REFERENCES `flowengine_flow_statuses` (`statusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_default_flow_statuses`
--

LOCK TABLES `flowengine_default_flow_statuses` WRITE;
/*!40000 ALTER TABLE `flowengine_default_flow_statuses` DISABLE KEYS */;
INSERT INTO `flowengine_default_flow_statuses` VALUES ('com.nordicpeak.flowengine.FlowBrowserModule.submit',179,333),('com.nordicpeak.flowengine.FlowBrowserModule.save',179,335),('com.nordicpeak.flowengine.FlowBrowserModule.submit',181,341),('com.nordicpeak.flowengine.FlowBrowserModule.save',181,343),('com.nordicpeak.flowengine.FlowBrowserModule.submit',183,345),('com.nordicpeak.flowengine.FlowBrowserModule.save',183,347),('com.nordicpeak.flowengine.FlowBrowserModule.submit',185,353),('com.nordicpeak.flowengine.FlowBrowserModule.save',185,355),('com.nordicpeak.flowengine.FlowBrowserModule.submit',187,361),('com.nordicpeak.flowengine.FlowBrowserModule.save',187,363);
/*!40000 ALTER TABLE `flowengine_default_flow_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_default_standard_statuses`
--

DROP TABLE IF EXISTS `flowengine_default_standard_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_default_standard_statuses` (
  `actionID` varchar(255) NOT NULL,
  `statusID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`actionID`,`statusID`),
  KEY `FK_flowengine_default_standard_statuses_2` (`statusID`),
  CONSTRAINT `FK_flowengine_default_standard_statuses_1` FOREIGN KEY (`actionID`) REFERENCES `flowengine_flow_actions` (`actionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flowengine_default_standard_statuses_2` FOREIGN KEY (`statusID`) REFERENCES `flowengine_standard_statuses` (`statusID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_default_standard_statuses`
--

LOCK TABLES `flowengine_default_standard_statuses` WRITE;
/*!40000 ALTER TABLE `flowengine_default_standard_statuses` DISABLE KEYS */;
INSERT INTO `flowengine_default_standard_statuses` VALUES ('com.nordicpeak.flowengine.FlowBrowserModule.submit',5),('com.nordicpeak.flowengine.FlowBrowserModule.save',7);
/*!40000 ALTER TABLE `flowengine_default_standard_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_evaluator_descriptors`
--

DROP TABLE IF EXISTS `flowengine_evaluator_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_evaluator_descriptors` (
  `evaluatorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `evaluatorTypeID` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`evaluatorID`),
  KEY `FK_flowengine_evaluator_descriptors_1` (`queryID`),
  CONSTRAINT `FK_flowengine_evaluator_descriptors_1` FOREIGN KEY (`queryID`) REFERENCES `flowengine_query_descriptors` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1682 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_evaluator_descriptors`
--

LOCK TABLES `flowengine_evaluator_descriptors` WRITE;
/*!40000 ALTER TABLE `flowengine_evaluator_descriptors` DISABLE KEYS */;
INSERT INTO `flowengine_evaluator_descriptors` VALUES (1617,'Regel 1',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',0,3837),(1619,'om mobil',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3839),(1621,'om fast',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3839),(1623,'Om fast d√∂lj regnummer',3,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3839),(1625,'om fordon',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3841),(1627,'om reg.nr',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3843),(1629,'Om tillsvidare',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3847),(1631,'Om tidsbegr√§nsad',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3847),(1633,'om huvudsaklig uppst√§llningsplats',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3853),(1635,'Om ytterligare lokal',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3857),(1637,'om eget',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3865),(1639,'om portioner',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3869),(1641,'Om antal personer',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3869),(1643,'Om kontaktperson',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3879),(1645,'Om ej lika',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3883),(1647,'Om annan fakturaadress',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3887),(1649,'om annan',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3891),(1651,'om mobil',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3897),(1653,'om fast',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3897),(1655,'Om fast d√∂lj regnummer',3,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3897),(1657,'om fordon',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3899),(1659,'om reg.nr',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3901),(1661,'Om tillsvidare',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3905),(1663,'Om tidsbegr√§nsad',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3905),(1665,'om huvudsaklig uppst√§llningsplats',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3911),(1667,'Om ytterligare lokal',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3915),(1669,'om eget',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3923),(1671,'om portioner',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3927),(1673,'Om antal personer',2,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3927),(1675,'Om kontaktperson',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3937),(1677,'Om ej lika',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3941),(1679,'Om annan fakturaadress',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3945),(1681,'om annan',1,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',1,3949);
/*!40000 ALTER TABLE `flowengine_evaluator_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_evaluators_target_queries`
--

DROP TABLE IF EXISTS `flowengine_evaluators_target_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_evaluators_target_queries` (
  `evaluatorID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`evaluatorID`,`queryID`),
  CONSTRAINT `FK_flowengine_evaluators_target_queries_1` FOREIGN KEY (`evaluatorID`) REFERENCES `flowengine_evaluator_descriptors` (`evaluatorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_evaluators_target_queries`
--

LOCK TABLES `flowengine_evaluators_target_queries` WRITE;
/*!40000 ALTER TABLE `flowengine_evaluators_target_queries` DISABLE KEYS */;
INSERT INTO `flowengine_evaluators_target_queries` VALUES (1619,3841),(1619,3853),(1621,3855),(1623,3843),(1623,3845),(1625,3843),(1627,3845),(1629,3849),(1631,3851),(1633,3855),(1635,3859),(1637,3867),(1639,3871),(1641,3873),(1643,3881),(1645,3885),(1647,3889),(1649,3893),(1651,3899),(1651,3911),(1653,3913),(1655,3901),(1655,3903),(1657,3901),(1659,3903),(1661,3907),(1663,3909),(1665,3913),(1667,3917),(1669,3925),(1671,3929),(1673,3931),(1675,3939),(1677,3943),(1679,3947),(1681,3951);
/*!40000 ALTER TABLE `flowengine_evaluators_target_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_external_message_attachments`
--

DROP TABLE IF EXISTS `flowengine_external_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_external_message_attachments` (
  `attachmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longblob NOT NULL,
  `messageID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attachmentID`),
  KEY `FK_flowengine_external_message_attachments_1` (`messageID`),
  CONSTRAINT `FK_flowengine_external_message_attachments_1` FOREIGN KEY (`messageID`) REFERENCES `flowengine_external_messages` (`messageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_external_message_attachments`
--

LOCK TABLES `flowengine_external_message_attachments` WRITE;
/*!40000 ALTER TABLE `flowengine_external_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_external_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_external_message_read_receipts`
--

DROP TABLE IF EXISTS `flowengine_external_message_read_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_external_message_read_receipts` (
  `userID` int(10) unsigned NOT NULL,
  `messageID` int(10) unsigned NOT NULL,
  `read` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`,`messageID`),
  KEY `FK_flowengine_external_message_read_receipts_1` (`messageID`),
  CONSTRAINT `FK_flowengine_external_message_read_receipts_1` FOREIGN KEY (`messageID`) REFERENCES `flowengine_external_messages` (`messageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_external_message_read_receipts`
--

LOCK TABLES `flowengine_external_message_read_receipts` WRITE;
/*!40000 ALTER TABLE `flowengine_external_message_read_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_external_message_read_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_external_messages`
--

DROP TABLE IF EXISTS `flowengine_external_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_external_messages` (
  `messageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editor` int(10) unsigned DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `flowInstanceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`messageID`),
  KEY `FK_flowengine_external_messages_1` (`flowInstanceID`),
  CONSTRAINT `FK_flowengine_external_messages_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_external_messages`
--

LOCK TABLES `flowengine_external_messages` WRITE;
/*!40000 ALTER TABLE `flowengine_external_messages` DISABLE KEYS */;
INSERT INTO `flowengine_external_messages` VALUES (1,3,'2016-04-11 09:35:17',NULL,NULL,'Nu skriver jag till den som skickade in √§rendet\r\nEn fr√•ga....',1),(3,3,'2016-04-11 09:43:04',NULL,NULL,'Meddelande till √§rendesn√§mnare',5),(5,3,'2016-04-11 14:13:14',NULL,NULL,'Nu skriver jag ett meddelande',5),(7,3,'2016-04-11 14:36:00',NULL,NULL,'TESTMEDDELANDE',7);
/*!40000 ALTER TABLE `flowengine_external_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_actions`
--

DROP TABLE IF EXISTS `flowengine_flow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_actions` (
  `actionID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`actionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_actions`
--

LOCK TABLES `flowengine_flow_actions` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_actions` DISABLE KEYS */;
INSERT INTO `flowengine_flow_actions` VALUES ('com.nordicpeak.flowengine.FlowBrowserModule.save','Anv√§ndare sparar en ans√∂kan utan att skicka den',1),('com.nordicpeak.flowengine.FlowBrowserModule.submit','Anv√§ndare skickar in ans√∂kan',1),('com.nordicpeak.flowengine.UserFlowInstanceModule.submitcompletion','Anv√§ndare skickar in komplettering',0);
/*!40000 ALTER TABLE `flowengine_flow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_categories`
--

DROP TABLE IF EXISTS `flowengine_flow_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_categories` (
  `categoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flowTypeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`categoryID`) USING BTREE,
  KEY `FK_flowengine_flow_categories_1` (`flowTypeID`),
  CONSTRAINT `FK_flowengine_flow_categories_1` FOREIGN KEY (`flowTypeID`) REFERENCES `flowengine_flow_types` (`flowTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_categories`
--

LOCK TABLES `flowengine_flow_categories` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_flow_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_checks`
--

DROP TABLE IF EXISTS `flowengine_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_checks` (
  `flowID` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`flowID`,`value`) USING BTREE,
  CONSTRAINT `FK_flowengine_flow_checks_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_checks`
--

LOCK TABLES `flowengine_flow_checks` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_checks` DISABLE KEYS */;
INSERT INTO `flowengine_flow_checks` VALUES (179,'e-legitimation'),(179,'Uppgifter om den planerade verksamheten'),(179,'Uppgifter om f√∂retaget'),(183,'e-legitimation'),(183,'Uppgifter om den planerade verksamheten'),(183,'Uppgifter om f√∂retaget'),(185,'eLegitimation');
/*!40000 ALTER TABLE `flowengine_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_families`
--

DROP TABLE IF EXISTS `flowengine_flow_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_families` (
  `flowFamilyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `versionCount` int(10) unsigned NOT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `contactEmail` varchar(255) DEFAULT NULL,
  `contactPhone` varchar(255) DEFAULT NULL,
  `ownerName` varchar(255) DEFAULT NULL,
  `ownerEmail` varchar(255) DEFAULT NULL,
  `statisticsMode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`flowFamilyID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_families`
--

LOCK TABLES `flowengine_flow_families` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_families` DISABLE KEYS */;
INSERT INTO `flowengine_flow_families` VALUES (37,1,NULL,NULL,NULL,NULL,NULL,NULL),(39,2,NULL,NULL,NULL,NULL,NULL,NULL),(41,1,'marcus','marcus@imcode.com','0498200312',NULL,NULL,'INTERNAL'),(43,1,'Hillar Loor','hillar@imcode.com','0498 200 302','Crister Karl√©n','crister@imcode.com',NULL),(45,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `flowengine_flow_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_family_favourites`
--

DROP TABLE IF EXISTS `flowengine_flow_family_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_family_favourites` (
  `flowFamilyID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowFamilyID`,`userID`),
  CONSTRAINT `FK_flowengine_flow_family_favourites_1` FOREIGN KEY (`flowFamilyID`) REFERENCES `flowengine_flow_families` (`flowFamilyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_family_favourites`
--

LOCK TABLES `flowengine_flow_family_favourites` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_family_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_flow_family_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_family_manager_groups`
--

DROP TABLE IF EXISTS `flowengine_flow_family_manager_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_family_manager_groups` (
  `flowFamilyID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowFamilyID`,`groupID`),
  CONSTRAINT `FK_flowengine_flow_family_manager_groups_1` FOREIGN KEY (`flowFamilyID`) REFERENCES `flowengine_flow_families` (`flowFamilyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_family_manager_groups`
--

LOCK TABLES `flowengine_flow_family_manager_groups` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_family_manager_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_flow_family_manager_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_family_manager_users`
--

DROP TABLE IF EXISTS `flowengine_flow_family_manager_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_family_manager_users` (
  `flowFamilyID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowFamilyID`,`userID`),
  CONSTRAINT `FK_flowengine_flow_family_manager_users_1` FOREIGN KEY (`flowFamilyID`) REFERENCES `flowengine_flow_families` (`flowFamilyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_family_manager_users`
--

LOCK TABLES `flowengine_flow_family_manager_users` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_family_manager_users` DISABLE KEYS */;
INSERT INTO `flowengine_flow_family_manager_users` VALUES (39,3),(43,3);
/*!40000 ALTER TABLE `flowengine_flow_family_manager_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instance_attributes`
--

DROP TABLE IF EXISTS `flowengine_flow_instance_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instance_attributes` (
  `flowInstanceID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`flowInstanceID`,`name`),
  CONSTRAINT `FK_flowengine_flow_instance_attributes_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instance_attributes`
--

LOCK TABLES `flowengine_flow_instance_attributes` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instance_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_flow_instance_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instance_bookmarks`
--

DROP TABLE IF EXISTS `flowengine_flow_instance_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instance_bookmarks` (
  `userID` int(10) unsigned NOT NULL,
  `flowInstanceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userID`,`flowInstanceID`),
  KEY `FK_flowengine_flow_instance_bookmarks_1` (`flowInstanceID`),
  CONSTRAINT `FK_flowengine_flow_instance_bookmarks_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instance_bookmarks`
--

LOCK TABLES `flowengine_flow_instance_bookmarks` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instance_bookmarks` DISABLE KEYS */;
INSERT INTO `flowengine_flow_instance_bookmarks` VALUES (3,1);
/*!40000 ALTER TABLE `flowengine_flow_instance_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instance_event_attributes`
--

DROP TABLE IF EXISTS `flowengine_flow_instance_event_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instance_event_attributes` (
  `eventID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`eventID`,`name`),
  CONSTRAINT `FK_flowengine_flow_instance_event_attributes_1` FOREIGN KEY (`eventID`) REFERENCES `flowengine_flow_instance_events` (`eventID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instance_event_attributes`
--

LOCK TABLES `flowengine_flow_instance_event_attributes` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instance_event_attributes` DISABLE KEYS */;
INSERT INTO `flowengine_flow_instance_event_attributes` VALUES (1,'pdf','true'),(1,'xml','true'),(3,'pdf','true'),(3,'xml','true'),(9,'pdf','true'),(9,'xml','true'),(21,'pdf','true'),(21,'xml','true'),(29,'pdf','true'),(29,'xml','true'),(31,'pdf','true'),(31,'xml','true'),(33,'pdf','true'),(33,'xml','true'),(35,'pdf','true'),(35,'xml','true'),(37,'pdf','true'),(37,'xml','true'),(39,'pdf','true'),(39,'xml','true');
/*!40000 ALTER TABLE `flowengine_flow_instance_event_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instance_events`
--

DROP TABLE IF EXISTS `flowengine_flow_instance_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instance_events` (
  `eventID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flowInstanceID` int(10) unsigned NOT NULL,
  `eventType` varchar(45) NOT NULL,
  `status` varchar(255) NOT NULL,
  `statusDescription` text,
  `details` varchar(255) DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `poster` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  KEY `FK_flowengine_flow_instance_events_1` (`flowInstanceID`),
  CONSTRAINT `FK_flowengine_flow_instance_events_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instance_events`
--

LOCK TABLES `flowengine_flow_instance_events` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instance_events` DISABLE KEYS */;
INSERT INTO `flowengine_flow_instance_events` VALUES (1,1,'SUBMITTED','Inskickad',NULL,NULL,'2016-01-13 12:51:04',3),(3,3,'SUBMITTED','Inskickad',NULL,NULL,'2016-04-11 09:27:55',1),(5,1,'MANAGERS_UPDATED','Inskickad',NULL,'Hillar Loor','2016-04-11 09:32:46',3),(7,1,'MANAGER_MESSAGE_SENT','Inskickad',NULL,NULL,'2016-04-11 09:35:17',3),(9,5,'SUBMITTED','Inskickad',NULL,NULL,'2016-04-11 09:41:55',3),(11,5,'MANAGERS_UPDATED','Inskickad',NULL,'Hillar Loor','2016-04-11 09:42:37',3),(13,5,'MANAGER_MESSAGE_SENT','Inskickad',NULL,NULL,'2016-04-11 09:43:04',3),(15,5,'STATUS_UPDATED','Hanteras av handl√§ggare',NULL,NULL,'2016-04-11 14:12:54',3),(17,5,'MANAGER_MESSAGE_SENT','Hanteras av handl√§ggare',NULL,NULL,'2016-04-11 14:13:14',3),(19,5,'STATUS_UPDATED','Hanterat, beslut √§r fattat',NULL,NULL,'2016-04-11 14:24:31',3),(21,7,'SUBMITTED','Inskickad',NULL,NULL,'2016-04-11 14:35:14',3),(23,7,'STATUS_UPDATED','Hanteras av handl√§ggare',NULL,NULL,'2016-04-11 14:35:43',3),(25,7,'MANAGER_MESSAGE_SENT','Hanteras av handl√§ggare',NULL,NULL,'2016-04-11 14:36:00',3),(27,7,'STATUS_UPDATED','Inskickad',NULL,NULL,'2016-04-11 14:41:36',3),(29,9,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-30 07:49:22',1),(31,11,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-30 13:19:24',NULL),(33,13,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-30 13:24:44',NULL),(35,15,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-31 09:15:25',NULL),(37,17,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-31 09:17:30',NULL),(39,23,'SUBMITTED','Inskickad',NULL,NULL,'2016-08-31 10:19:54',NULL);
/*!40000 ALTER TABLE `flowengine_flow_instance_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instance_managers`
--

DROP TABLE IF EXISTS `flowengine_flow_instance_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instance_managers` (
  `flowInstanceID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowInstanceID`,`userID`),
  CONSTRAINT `FK_flowengine_flow_instance_managers_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instance_managers`
--

LOCK TABLES `flowengine_flow_instance_managers` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instance_managers` DISABLE KEYS */;
INSERT INTO `flowengine_flow_instance_managers` VALUES (1,3),(5,3);
/*!40000 ALTER TABLE `flowengine_flow_instance_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_instances`
--

DROP TABLE IF EXISTS `flowengine_flow_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_instances` (
  `flowInstanceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` int(10) unsigned DEFAULT NULL,
  `added` timestamp NULL DEFAULT NULL,
  `editor` int(10) unsigned DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `fullyPopulated` tinyint(1) NOT NULL,
  `flowID` int(10) unsigned NOT NULL,
  `stepID` int(10) unsigned NOT NULL,
  `statusID` int(10) unsigned NOT NULL,
  `lastStatusChange` timestamp NULL DEFAULT NULL,
  `profileID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`flowInstanceID`),
  KEY `FK_flowengine_flow_instances_1` (`flowID`),
  KEY `FK_flowengine_flow_instances_2` (`stepID`),
  KEY `FK_flowengine_flow_instances_3` (`statusID`) USING BTREE,
  CONSTRAINT `FK_flowengine_flow_instances_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`),
  CONSTRAINT `FK_flowengine_flow_instances_2` FOREIGN KEY (`stepID`) REFERENCES `flowengine_steps` (`stepID`),
  CONSTRAINT `FK_flowengine_flow_instances_3` FOREIGN KEY (`statusID`) REFERENCES `flowengine_flow_statuses` (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_instances`
--

LOCK TABLES `flowengine_flow_instances` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_instances` DISABLE KEYS */;
INSERT INTO `flowengine_flow_instances` VALUES (1,3,'2016-01-13 12:51:04',NULL,NULL,1,179,727,333,'2016-01-13 12:51:04',NULL),(3,1,'2016-04-11 09:27:54',NULL,NULL,1,179,727,333,'2016-04-11 09:27:54',NULL),(5,3,'2016-04-11 09:41:55',NULL,NULL,1,185,745,351,'2016-04-11 14:24:31',NULL),(7,3,'2016-04-11 14:35:14',NULL,NULL,1,185,745,353,'2016-04-11 14:41:36',NULL),(9,1,'2016-08-30 07:49:21',NULL,NULL,1,183,739,345,'2016-08-30 07:49:21',NULL),(11,NULL,'2016-08-30 13:19:24',NULL,NULL,1,183,739,345,'2016-08-30 13:19:24',NULL),(13,NULL,'2016-08-30 13:24:44',NULL,NULL,1,183,739,345,'2016-08-30 13:24:44',NULL),(15,NULL,'2016-08-31 09:15:25',NULL,NULL,1,183,739,345,'2016-08-31 09:15:25',NULL),(17,NULL,'2016-08-31 09:17:30',NULL,NULL,1,183,739,345,'2016-08-31 09:17:30',NULL),(23,NULL,'2016-08-31 10:19:54',NULL,NULL,1,183,739,345,'2016-08-31 10:18:43',NULL);
/*!40000 ALTER TABLE `flowengine_flow_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_statuses`
--

DROP TABLE IF EXISTS `flowengine_flow_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_statuses` (
  `statusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `managingTime` int(10) unsigned DEFAULT NULL,
  `isUserMutable` tinyint(1) NOT NULL,
  `isAdminMutable` tinyint(1) NOT NULL,
  `contentType` varchar(45) NOT NULL,
  `flowID` int(10) unsigned NOT NULL,
  `isUserDeletable` tinyint(1) NOT NULL,
  `isAdminDeletable` tinyint(1) NOT NULL,
  PRIMARY KEY (`statusID`) USING BTREE,
  KEY `FK_flowengine_flow_states_1` (`flowID`),
  CONSTRAINT `FK_flowengine_flow_statuses_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_statuses`
--

LOCK TABLES `flowengine_flow_statuses` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_statuses` DISABLE KEYS */;
INSERT INTO `flowengine_flow_statuses` VALUES (333,'Inskickad',NULL,NULL,0,1,'SUBMITTED',179,0,1),(335,'P√•b√∂rjad',NULL,NULL,1,0,'NEW',179,1,0),(337,'Hanteras av handl√§ggare',NULL,NULL,0,1,'IN_PROGRESS',181,0,1),(339,'Hanterat, beslut √§r fattat',NULL,NULL,0,0,'ARCHIVED',181,0,0),(341,'Inskickad',NULL,NULL,1,1,'SUBMITTED',181,1,1),(343,'Sparad, ej inskickad',NULL,NULL,1,1,'NEW',181,1,1),(345,'Inskickad',NULL,NULL,0,1,'SUBMITTED',183,0,1),(347,'P√•b√∂rjad',NULL,NULL,1,0,'NEW',183,1,0),(349,'Hanteras av handl√§ggare',NULL,NULL,0,1,'IN_PROGRESS',185,0,1),(351,'Hanterat, beslut √§r fattat',NULL,NULL,0,0,'ARCHIVED',185,0,0),(353,'Inskickad',NULL,NULL,1,1,'SUBMITTED',185,1,1),(355,'Sparad, ej inskickad',NULL,NULL,1,1,'NEW',185,1,1),(357,'Hanteras av handl√§ggare',NULL,NULL,0,1,'IN_PROGRESS',187,0,1),(359,'Hanterat, beslut √§r fattat',NULL,NULL,0,0,'ARCHIVED',187,0,0),(361,'Inskickad',NULL,NULL,1,1,'SUBMITTED',187,1,1),(363,'Sparad, ej inskickad',NULL,NULL,1,1,'NEW',187,1,1);
/*!40000 ALTER TABLE `flowengine_flow_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_tags`
--

DROP TABLE IF EXISTS `flowengine_flow_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_tags` (
  `flowID` int(10) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`flowID`,`tag`),
  CONSTRAINT `FK_flowengine_flow_tags_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_tags`
--

LOCK TABLES `flowengine_flow_tags` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_tags` DISABLE KEYS */;
INSERT INTO `flowengine_flow_tags` VALUES (179,'livsmedel'),(183,'livsmedel');
/*!40000 ALTER TABLE `flowengine_flow_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_type_admin_groups`
--

DROP TABLE IF EXISTS `flowengine_flow_type_admin_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_type_admin_groups` (
  `flowTypeID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowTypeID`,`groupID`),
  CONSTRAINT `FK_flowengine_flow_type_admin_groups_1` FOREIGN KEY (`flowTypeID`) REFERENCES `flowengine_flow_types` (`flowTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_type_admin_groups`
--

LOCK TABLES `flowengine_flow_type_admin_groups` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_type_admin_groups` DISABLE KEYS */;
INSERT INTO `flowengine_flow_type_admin_groups` VALUES (4,10);
/*!40000 ALTER TABLE `flowengine_flow_type_admin_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_type_admin_users`
--

DROP TABLE IF EXISTS `flowengine_flow_type_admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_type_admin_users` (
  `flowTypeID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`flowTypeID`,`userID`),
  CONSTRAINT `FK_flowengine_flow_type_admin_users_1` FOREIGN KEY (`flowTypeID`) REFERENCES `flowengine_flow_types` (`flowTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_type_admin_users`
--

LOCK TABLES `flowengine_flow_type_admin_users` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_type_admin_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_flow_type_admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_type_allowed_queries`
--

DROP TABLE IF EXISTS `flowengine_flow_type_allowed_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_type_allowed_queries` (
  `flowTypeID` int(10) unsigned NOT NULL,
  `queryTypeID` varchar(255) NOT NULL,
  PRIMARY KEY (`flowTypeID`,`queryTypeID`),
  CONSTRAINT `FK_flowengine_flow_type_allowed_queries_1` FOREIGN KEY (`flowTypeID`) REFERENCES `flowengine_flow_types` (`flowTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_type_allowed_queries`
--

LOCK TABLES `flowengine_flow_type_allowed_queries` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_type_allowed_queries` DISABLE KEYS */;
INSERT INTO `flowengine_flow_type_allowed_queries` VALUES (4,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.contactdetailquery.ContactDetailQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.dropdownquery.DropDownQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.fileuploadquery.FileUploadQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.organizationdetailquery.OrganizationDetailQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.textareaquery.TextAreaQueryProviderModule'),(4,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule');
/*!40000 ALTER TABLE `flowengine_flow_type_allowed_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flow_types`
--

DROP TABLE IF EXISTS `flowengine_flow_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flow_types` (
  `flowTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`flowTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flow_types`
--

LOCK TABLES `flowengine_flow_types` WRITE;
/*!40000 ALTER TABLE `flowengine_flow_types` DISABLE KEYS */;
INSERT INTO `flowengine_flow_types` VALUES (4,'Test');
/*!40000 ALTER TABLE `flowengine_flow_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_flows`
--

DROP TABLE IF EXISTS `flowengine_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_flows` (
  `flowID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `shortDescription` text NOT NULL,
  `longDescription` longtext,
  `submittedMessage` longtext,
  `iconFileName` varchar(255) DEFAULT NULL,
  `icon` blob,
  `publishDate` date DEFAULT NULL,
  `unPublishDate` date DEFAULT NULL,
  `flowTypeID` int(10) unsigned NOT NULL,
  `categoryID` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `usePreview` tinyint(1) NOT NULL,
  `flowFamilyID` int(10) unsigned NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `requireAuthentication` tinyint(1) NOT NULL,
  `requireSigning` tinyint(1) unsigned NOT NULL,
  `externalLink` varchar(255) DEFAULT NULL,
  `showSubmitSurvey` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`flowID`),
  KEY `FK_flowengine_flows_1` (`flowTypeID`),
  KEY `FK_flowengine_flows_2` (`categoryID`) USING BTREE,
  KEY `FK_flowengine_flows_3` (`flowFamilyID`),
  CONSTRAINT `FK_flowengine_flows_1` FOREIGN KEY (`flowTypeID`) REFERENCES `flowengine_flow_types` (`flowTypeID`),
  CONSTRAINT `FK_flowengine_flows_2` FOREIGN KEY (`categoryID`) REFERENCES `flowengine_flow_categories` (`categoryID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_flowengine_flows_3` FOREIGN KEY (`flowFamilyID`) REFERENCES `flowengine_flow_families` (`flowFamilyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_flows`
--

LOCK TABLES `flowengine_flows` WRITE;
/*!40000 ALTER TABLE `flowengine_flows` DISABLE KEYS */;
INSERT INTO `flowengine_flows` VALUES (177,'Daniels test','<p>Lorem ipsum</p>','<p>Lorem ipsum</p>','<p>Lorem ipsum</p>',NULL,NULL,NULL,NULL,4,NULL,0,0,37,1,0,0,NULL,0),(179,'Livsmedelsverksamhet - anm√§lan om registrering','<p>Ska du starta en livsmedelsverksamhet? Registrera den h&auml;r!</p>','<p>Innan du startar din livsmedelsverksamhet&nbsp; ska den registreras hos kommunen. Om verksamheten ska godk&auml;nnas i st&auml;llet f&ouml;r att bara registreras (g&auml;ller st&ouml;rre slakterier, charkfabriker, &auml;ggproducenter, mejerier m.m.), kontakta&nbsp;Livsmedelsverket.</p>','<p>${Livsmedel tack for din ansokan}</p>','IKON.png','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0A\0\0\0A\0\0\0é˜…E\0\0”IDATx⁄ÌZ˜[Wıﬂâ-&&—ƒc¢1˘T5hDcãö¯Y÷XÇ%ˆF‘`è%÷l±∆ãîñ∂Ù∂ÀãÏ\nX∞óõw˚^fÃ‚.¨a~x03ofﬁô{œ=˜<:’RuÙ—È’SG\Z\Z\Z\Z\Z\Z\Z\Zˇ+ ü[;6ñµ4Ÿ∏¥cÉK˘.Í|c0ï<´|=A®|a£‹«eî˙ è≤ëÈyçOÛ„Ó•S∑∏z„∆ ∫‹êÙ˙Äê˛0üVïÔ¶aÈ3©á.î/@,hÄ˛;ö_¥â/™ÜÍöMÉ/Sß π€+è?∆«•4=o%uâ‚¥pÑ≥Î1å!i”Èl]º«˚≠(€·tÌèÎÇÑÿ€◊ËΩÑ0˘¬_∞ØΩ∆¥ó.‘\'Pˆ£*}VE˘OLt„n\Zˇ¢£3Á:Q∞ñÃäTπ~7ï∫:¿ƒΩ`A¬Åö≥ÚÖ?N\ZG«j/íıÂÌÁ%5f”¯úE§O¡3Uº∏EıS¯±·ÜYtéE\n~Ô S$Ë@∏XS◊®ÃH*zZ·”|p¬ÓÍì‘=~(øGˇî…4õE~3~•4\ZŸ=-2jíÓgeœ™˘óo˙b≥}f~Â¯ªNG=u#ù8 ⁄ÚáÍì§o˘±É∑Œ®ﬂx±wæ¶ú«%¸re±5˜(A¯>o\'[úõò≥Ñ[Z∫-x@@Óˆ‘ç‡/∂≈ràã©:¡∏!Ñ>M/_ﬁó±ã•Ök%¡36U§e•øÒø«dÕñó≈óÍì8F≤:ÿ[º¸>ÎiüÓW¸¥íﬁø9öœ]XºôéŸ.…¸ÄüΩŸ5Õiã6•Óm›p˛R[-G‰q‰0æbüƒpVã}∫\'ƒS”\"G1@,¸8fe˘N	ÄàëzÌ\n¬œ•€Â]iHv:ó˜§úó8Ô’¿˝ÿQVRE\n %<)–	äRzäiív·L]úF®›–	jâ¥_ÚæhqÏO€˘•°öıX˚U˙,e\"≠7ˇú`xX@_•Nì_gZÓ2÷ πß@⁄É|Z\\≤ï_û5_^?ßpè(C”g ¢¶≠ær\'9xJd˘Ûjﬁ+àÖAÃÃ_ÕzÅ8ñœM&»\\∂Xú[TMÖLHMÀ]Ó÷?åÕZ‡◊6π]dÛq€e¶ Ö!ƒ!}{;EŸNy}ÑC\"ï@¶’*$v–ÄPı“ŒI*ùÖ∂´ ¬π√µÁ˘WÌÆ`s1¿‚⁄≠ïGd\n®y.*–I˚?Ì»*¶Í8}¿4ÅX‘;	#ô∆_C˙π˝¿À¨jÏ±∆J•áà¿Bê*}ìõÍ?REÕÛ£-á9∞“‹n y, ¢R—Å÷òˆ∞ê∂{Qñ&˙(i¨[d`Q’EÇ#r ––ù¢=ái3Øh#ˇyæ^ß™km5–Û]‚öY∏û[eêÃ(ãÆœÿÏº°Út,vãD7Z8Kô‰∆ØœÑ÷@˜(Ó∑÷¥ó?äRYë0˙2â>.{!˝ƒà7` ¿Â≈√FfD∏°]ı“∆øÑpí‡4WÊ@Äﬁ\"Áˆ≤ÙôäHCãëjòÂIHG|k+IU5Xê πXªwïÒ#¸\048\0«W>:sé”\"=Yt —ã…ÎÖ≈[xTêò(eï-8:(ì‚≈óñ®owaΩâÚä˘Ë!ê*¯\0x˛†¥ö£õ+zçÄÄ∞Ö’paq©π~£˘Äc1ÉU©∫¬ßfÓ$â°ƒzRàP£‚\Z@J∏üA;XÎéPñ_øÉ∞®‰W˛`®B5◊#?√2\"%?4Ø9l4 ë¬üøx”\'Br£ΩV˙å‡òÃGEÅA(ªEõUﬂ\\w/C€µ;˙˝§\0új4O∞◊PºŸ˘HKÃ9nª‘v:AÄÄ<ıÂ#|ﬁJÖTVl∫˛! aSêSs£ºvísÛ9ÀJc⁄Ñ≈>¶É¬\nõd\\‚1«˚Îõx ,3“©o\0¡!ù é<›wä1 o>£j¢ƒ™í%°V‚Û∞¡‚znÉyø¨8h≥›˜.k)äÅËÍ*ó≥HÜZˇ¬Ô%“óM!≥!t\\ÕYàú[Õ§6R¿õx∑\\eú\"RCD%úm5æÉﬂ@¿K\n◊«2Çåı§ƒﬁ\"ÃY¯\r®&ÿxiIıÌØ9#…÷[™¥Å¶	Í±öh0≤ﬁB®«”∑ØÀ„p§{›s⁄T¡àøg‡›®ŸÀ∆\r§tW«˙´üºü@He≠≤êŒ3ÚWµhÄÃ _-˜$´°~àÂ∏ËB]•.ˆ+–3\\lHt™ˇQ\n˚\rö¬¸\n;\\Ø‹J√Kä\r°û„ac_y.Æs%/î>q\\„:ùy_0ãA√&Æ«‹ÊÏ6sñ÷öˆ…ØÚñn8◊`S,‰∑WÂ.ërõ]YÎa≥ò.”ÍV5<iÑæ“´Äí8÷\0ÿo≠∂◊˛≤_e≤uú◊f=BÿïÒa≈uv\\Õøçëõ“v«\"è‘^†˙ˇ˙4UÆ{\ZAc¥ÇÍ.xQatÃg“:Ò~ñØ¿.∑ÔE*Ä`—√:˚<eíìAIÌœ¸öˇ^Éœ 6XGfÛM·X5Ö~\'^ÉJÀÌµAﬂhÙË5‚bF-æ›ˇè¨]€ë\"•ê>˛ÿa÷˛∑YAAAAAAAAAA!P„_¥º ú‡J∆\0\0\0\0IENDÆB`Ç','2015-06-15',NULL,4,NULL,1,1,39,1,0,0,NULL,0),(181,'Marcus Test','<p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>','<p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>','<p>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>',NULL,NULL,NULL,NULL,4,NULL,0,1,41,1,0,0,NULL,1),(183,'Food services - application for registration','<p>Will you start a food business? Please register here!</p>','<p>Before you launch your food business must be registered with the municipality. If the business will be accepted in lieu of simply register (for larger slaughterhouses, meat factories, egg producers, dairies, etc.), contact NFA.</p>','<p>${Livsmedel tack for din ansokan}</p>','IKON.png','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0A\0\0\0A\0\0\0é˜…E\0\0”IDATx⁄ÌZ˜[Wıﬂâ-&&—ƒc¢1˘T5hDcãö¯Y÷XÇ%ˆF‘`è%÷l±∆ãîñ∂Ù∂ÀãÏ\nX∞óõw˚^fÃ‚.¨a~x03ofﬁô{œ=˜<:’RuÙ—È’SG\Z\Z\Z\Z\Z\Z\Z\Zˇ+ ü[;6ñµ4Ÿ∏¥cÉK˘.Í|c0ï<´|=A®|a£‹«eî˙ è≤ëÈyçOÛ„Ó•S∑∏z„∆ ∫‹êÙ˙Äê˛0üVïÔ¶aÈ3©á.î/@,hÄ˛;ö_¥â/™ÜÍöMÉ/Sß π€+è?∆«•4=o%uâ‚¥pÑ≥Î1å!i”Èl]º«˚≠(€·tÌèÎÇÑÿ€◊ËΩÑ0˘¬_∞ØΩ∆¥ó.‘\'Pˆ£*}VE˘OLt„n\Zˇ¢£3Á:Q∞ñÃäTπ~7ï∫:¿ƒΩ`A¬Åö≥ÚÖ?N\ZG«j/íıÂÌÁ%5f”¯úE§O¡3Uº∏EıS¯±·ÜYtéE\n~Ô S$Ë@∏XS◊®ÃH*zZ·”|p¬ÓÍì‘=~(øGˇî…4õE~3~•4\ZŸ=-2jíÓgeœ™˘óo˙b≥}f~Â¯ªNG=u#ù8 ⁄ÚáÍì§o˘±É∑Œ®ﬂx±wæ¶ú«%¸re±5˜(A¯>o\'[úõò≥Ñ[Z∫-x@@Óˆ‘ç‡/∂≈ràã©:¡∏!Ñ>M/_ﬁó±ã•Ök%¡36U§e•øÒø«dÕñó≈óÍì8F≤:ÿ[º¸>ÎiüÓW¸¥íﬁø9öœ]XºôéŸ.…¸ÄüΩŸ5Õiã6•Óm›p˛R[-G‰q‰0æbüƒpVã}∫\'ƒS”\"G1@,¸8fe˘N	ÄàëzÌ\n¬œ•€Â]iHv:ó˜§úó8Ô’¿˝ÿQVRE\n %<)–	äRzäiív·L]úF®›–	jâ¥_ÚæhqÏO€˘•°öıX˚U˙,e\"≠7ˇú`xX@_•Nì_gZÓ2÷ πß@⁄É|Z\\≤ï_û5_^?ßpè(C”g ¢¶≠ær\'9xJd˘Ûjﬁ+àÖAÃÃ_ÕzÅ8ñœM&»\\∂Xú[TMÖLHMÀ]Ó÷?åÕZ‡◊6π]dÛq€e¶ Ö!ƒ!}{;EŸNy}ÑC\"ï@¶’*$v–ÄPı“ŒI*ùÖ∂´ ¬π√µÁ˘WÌÆ`s1¿‚⁄≠ïGd\n®y.*–I˚?Ì»*¶Í8}¿4ÅX‘;	#ô∆_C˙π˝¿À¨jÏ±∆J•áà¿Bê*}ìõÍ?REÕÛ£-á9∞“‹n y, ¢R—Å÷òˆ∞ê∂{Qñ&˙(i¨[d`Q’EÇ#r ––ù¢=ái3Øh#ˇyæ^ß™km5–Û]‚öY∏û[eêÃ(ãÆœÿÏº°Út,vãD7Z8Kô‰∆ØœÑ÷@˜(Ó∑÷¥ó?äRYë0˙2â>.{!˝ƒà7` ¿Â≈√FfD∏°]ı“∆øÑpí‡4WÊ@Äﬁ\"Áˆ≤ÙôäHCãëjòÂIHG|k+IU5Xê πXªwïÒ#¸\048\0«W>:sé”\"=Yt —ã…ÎÖ≈[xTêò(eï-8:(ì‚≈óñ®owaΩâÚä˘Ë!ê*¯\0x˛†¥ö£õ+zçÄÄ∞Ö’paq©π~£˘Äc1ÉU©∫¬ßfÓ$â°ƒzRàP£‚\Z@J∏üA;XÎéPñ_øÉ∞®‰W˛`®B5◊#?√2\"%?4Ø9l4 ë¬üøx”\'Br£ΩV˙å‡òÃGEÅA(ªEõUﬂ\\w/C€µ;˙˝§\0új4O∞◊PºŸ˘HKÃ9nª‘v:AÄÄ<ıÂ#|ﬁJÖTVl∫˛! aSêSs£ºvísÛ9ÀJc⁄Ñ≈>¶É¬\nõd\\‚1«˚Îõx ,3“©o\0¡!ù é<›wä1 o>£j¢ƒ™í%°V‚Û∞¡‚znÉyø¨8h≥›˜.k)äÅËÍ*ó≥HÜZˇ¬Ô%“óM!≥!t\\ÕYàú[Õ§6R¿õx∑\\eú\"RCD%úm5æÉﬂ@¿K\n◊«2Çåı§ƒﬁ\"ÃY¯\r®&ÿxiIıÌØ9#…÷[™¥Å¶	Í±öh0≤ﬁB®«”∑ØÀ„p§{›s⁄T¡àøg‡›®ŸÀ∆\r§tW«˙´üºü@He≠≤êŒ3ÚWµhÄÃ _-˜$´°~àÂ∏ËB]•.ˆ+–3\\lHt™ˇQ\n˚\rö¬¸\n;\\Ø‹J√Kä\r°û„ac_y.Æs%/î>q\\„:ùy_0ãA√&Æ«‹ÊÏ6sñ÷öˆ…ØÚñn8◊`S,‰∑WÂ.ërõ]YÎa≥ò.”ÍV5<iÑæ“´Äí8÷\0ÿo≠∂◊˛≤_e≤uú◊f=BÿïÒa≈uv\\Õøçëõ“v«\"è‘^†˙ˇ˙4UÆ{\ZAc¥ÇÍ.xQatÃg“:Ò~ñØ¿.∑ÔE*Ä`—√:˚<eíìAIÌœ¸öˇ^Éœ 6XGfÛM·X5Ö~\'^ÉJÀÌµAﬂhÙË5‚bF-æ›ˇè¨]€ë\"•ê>˛ÿa÷˛∑YAAAAAAAAAA!P„_¥º ú‡J∆\0\0\0\0IENDÆB`Ç','2016-07-13',NULL,4,NULL,1,1,39,2,0,0,NULL,0),(185,'Test form','<p>This is a testform for administrative purposes only</p>','<p>Detta &auml;r en testtj&auml;nst</p>','<p>Din ans&ouml;kan &auml;r nu inskickad!</p>',NULL,NULL,'2016-04-11',NULL,4,NULL,0,1,43,1,0,0,NULL,0),(187,'Testtj√§nst','<p>Detta &auml;r en test</p>','<p>Testtj&auml;nst</p>','<p>Testmeddelande</p>',NULL,NULL,NULL,NULL,4,NULL,0,1,45,1,0,0,NULL,0);
/*!40000 ALTER TABLE `flowengine_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_internal_message_attachments`
--

DROP TABLE IF EXISTS `flowengine_internal_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_internal_message_attachments` (
  `attachmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longblob NOT NULL,
  `messageID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attachmentID`),
  KEY `FK_flowengine_internal_message_attachments_1` (`messageID`),
  CONSTRAINT `FK_flowengine_internal_message_attachments_1` FOREIGN KEY (`messageID`) REFERENCES `flowengine_internal_messages` (`messageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_internal_message_attachments`
--

LOCK TABLES `flowengine_internal_message_attachments` WRITE;
/*!40000 ALTER TABLE `flowengine_internal_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_internal_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_internal_message_read_receipts`
--

DROP TABLE IF EXISTS `flowengine_internal_message_read_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_internal_message_read_receipts` (
  `userID` int(10) unsigned NOT NULL,
  `messageID` int(10) unsigned NOT NULL,
  `read` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`,`messageID`),
  KEY `FK_flowengine_internal_message_read_receipts_1` (`messageID`),
  CONSTRAINT `FK_flowengine_internal_message_read_receipts_1` FOREIGN KEY (`messageID`) REFERENCES `flowengine_internal_messages` (`messageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_internal_message_read_receipts`
--

LOCK TABLES `flowengine_internal_message_read_receipts` WRITE;
/*!40000 ALTER TABLE `flowengine_internal_message_read_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_internal_message_read_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_internal_messages`
--

DROP TABLE IF EXISTS `flowengine_internal_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_internal_messages` (
  `messageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poster` int(10) unsigned NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `editor` int(10) unsigned DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `flowInstanceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`messageID`),
  KEY `FK_flowengine_internal_messages_1` (`flowInstanceID`),
  CONSTRAINT `FK_flowengine_internal_messages_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_internal_messages`
--

LOCK TABLES `flowengine_internal_messages` WRITE;
/*!40000 ALTER TABLE `flowengine_internal_messages` DISABLE KEYS */;
INSERT INTO `flowengine_internal_messages` VALUES (1,3,'2016-04-11 09:34:31',NULL,NULL,'Detta √§r en testnotering',1);
/*!40000 ALTER TABLE `flowengine_internal_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_operating_message_flowfamilies`
--

DROP TABLE IF EXISTS `flowengine_operating_message_flowfamilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_operating_message_flowfamilies` (
  `messageID` int(10) unsigned NOT NULL,
  `flowFamilyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`messageID`,`flowFamilyID`),
  KEY `FK_flowengine_operating_message_flowfamilies_2` (`flowFamilyID`),
  CONSTRAINT `FK_flowengine_operating_message_flowfamilies_1` FOREIGN KEY (`messageID`) REFERENCES `flowengine_operating_messages` (`messageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flowengine_operating_message_flowfamilies_2` FOREIGN KEY (`flowFamilyID`) REFERENCES `flowengine_flow_families` (`flowFamilyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_operating_message_flowfamilies`
--

LOCK TABLES `flowengine_operating_message_flowfamilies` WRITE;
/*!40000 ALTER TABLE `flowengine_operating_message_flowfamilies` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_operating_message_flowfamilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_operating_messages`
--

DROP TABLE IF EXISTS `flowengine_operating_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_operating_messages` (
  `messageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `disableFlows` tinyint(1) unsigned NOT NULL,
  `global` tinyint(1) unsigned NOT NULL,
  `posted` datetime NOT NULL,
  `poster` int(10) unsigned NOT NULL,
  `updated` datetime DEFAULT NULL,
  `editor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_operating_messages`
--

LOCK TABLES `flowengine_operating_messages` WRITE;
/*!40000 ALTER TABLE `flowengine_operating_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_operating_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_query_descriptors`
--

DROP TABLE IF EXISTS `flowengine_query_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_query_descriptors` (
  `queryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `defaultQueryState` varchar(45) NOT NULL,
  `stepID` int(10) unsigned NOT NULL,
  `queryTypeID` varchar(255) NOT NULL,
  `exported` tinyint(1) NOT NULL,
  `xsdElementName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`queryID`),
  KEY `FK_flowengine_query_descriptors_1` (`stepID`),
  CONSTRAINT `FK_flowengine_query_descriptors_1` FOREIGN KEY (`stepID`) REFERENCES `flowengine_steps` (`stepID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3969 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_query_descriptors`
--

LOCK TABLES `flowengine_query_descriptors` WRITE;
/*!40000 ALTER TABLE `flowengine_query_descriptors` DISABLE KEYS */;
INSERT INTO `flowengine_query_descriptors` VALUES (3835,'Adressuppgifter',0,'VISIBLE_REQUIRED',717,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3837,'Adresstyp',1,'VISIBLE',717,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3839,'√Ñr din verksamhet fast eller mobil?',0,'VISIBLE',719,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3841,'Typ av mobil anl√§ggning?',1,'HIDDEN',719,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3843,'Har fordonet ett registreringsnummer?',2,'HIDDEN',719,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3845,'Ange registreringsnummer',3,'HIDDEN',719,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3847,'√Ñr din verksamhet tillsvidare eller tidsbegr√§nsad?',4,'VISIBLE_REQUIRED',719,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3849,'Ange planerad start f√∂r verksamheten',5,'HIDDEN',719,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3851,'Ange start- och slutdatum',6,'HIDDEN',719,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3853,'Har din mobila verksamhet en huvusaklig uppst√§llningsplats?',0,'HIDDEN',721,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3855,'Ange den adress d√§r verksamheten ska p√•g√•',1,'HIDDEN',721,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3857,'Har du ytterligare lokaler, som h√∂r till verksamheten, d√§r livsmedel hanteras/lagras?',2,'VISIBLE',721,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3859,'Ange hanterings-/lagringslokalens adress',3,'HIDDEN',721,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3861,'Typ av verksamhet?',0,'VISIBLE_REQUIRED',723,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3863,'Vad ska du g√∂ra i din verksamhet?',1,'VISIBLE_REQUIRED',723,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3865,'Kommunalt eller eget vatten?',2,'VISIBLE',723,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3867,'Vem ansvarar f√∂r vattnet?',3,'HIDDEN',723,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3869,'Ange verksamhetens storlek',0,'VISIBLE_REQUIRED',725,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3871,'Ange antalet portioner som serveras per dag (√•rsbasis)',1,'HIDDEN',725,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3873,'Ange antalet personer som jobbar med livsmedel (√•rsarbetskrafter)',4,'HIDDEN',725,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3875,'K√§nsliga konsumenter',5,'VISIBLE',725,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3877,'F√∂retagsuppgifter',0,'VISIBLE_REQUIRED',727,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3879,'Vill du ange en annan kontaktperson √§n firmatecknaren?',1,'VISIBLE',727,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3881,'Kontaktperson',2,'HIDDEN',727,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3883,'Har din verksamhet samma namn som ditt f√∂retag/firma?',3,'VISIBLE',727,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3885,'Ange verksamhetens namn',4,'HIDDEN',727,'com.nordicpeak.flowengine.queries.textareaquery.TextAreaQueryProviderModule',0,NULL),(3887,'Till vilken adress ska fakturor skickas?',5,'VISIBLE',727,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3889,'Fakturaadress',6,'HIDDEN',727,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3891,'Till vilken adress ska kommunen skicka protokoll, beslut, information m.m?',7,'VISIBLE',727,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3893,'Ange adress',8,'HIDDEN',727,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3895,'Personuppgifter text',1,'VISIBLE_REQUIRED',729,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3897,'Is your business on a fixed address or mobile?',0,'VISIBLE',731,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3899,'Type of mobile plant?',1,'HIDDEN',731,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3901,'Does the vehicle have a registration number?',2,'HIDDEN',731,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3903,'Enter registration number',3,'HIDDEN',731,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3905,'Is your business continuous or time-limited?',4,'VISIBLE_REQUIRED',731,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3907,'Enter the planned start date',5,'HIDDEN',731,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3909,'Enter start and end dates',6,'HIDDEN',731,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3911,'Does your mobile business have a main location?',0,'HIDDEN',733,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3913,'Enter the address where the activity will take place',1,'HIDDEN',733,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3915,'Do you have additional premises that belong to the business, where food is handled / stored?',2,'VISIBLE',733,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3917,'Enter the address of the management and/or storage premises',3,'HIDDEN',733,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3919,'Type of business?',0,'VISIBLE_REQUIRED',735,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3921,'What will you do in your business?',1,'VISIBLE_REQUIRED',735,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3923,'Municipal or own water?',2,'VISIBLE',735,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3925,'Who is responsible for the water?',3,'HIDDEN',735,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3927,'Enter the size of the business',0,'VISIBLE_REQUIRED',737,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3929,'Enter the number of portions served per day (annualized)',1,'HIDDEN',737,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3931,'Enter the number of persons who work with food (AWU)',2,'HIDDEN',737,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3933,'Sensitive consumers',3,'VISIBLE',737,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3935,'Company data',0,'VISIBLE_REQUIRED',739,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3937,'Do you wish to specify a different contact than the authorized signatory?',1,'VISIBLE',739,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3939,'Contact person',2,'HIDDEN',739,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3941,'Does your business have the same name as your company?',3,'VISIBLE',739,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3943,'Please enter the business name',4,'HIDDEN',739,'com.nordicpeak.flowengine.queries.textareaquery.TextAreaQueryProviderModule',0,NULL),(3945,'To what address should invoices be sent?',5,'VISIBLE',739,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3947,'Invoicing address',6,'HIDDEN',739,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3949,'What address should the municipality you to send protocols, decisions, information etc?',7,'VISIBLE',739,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',0,NULL),(3951,'Enter address',8,'HIDDEN',739,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',0,NULL),(3953,'Motion',2,'VISIBLE',717,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',0,NULL),(3965,'JA eller NEJ',1,'VISIBLE',745,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',1,'JA');
/*!40000 ALTER TABLE `flowengine_query_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_query_instance_descriptors`
--

DROP TABLE IF EXISTS `flowengine_query_instance_descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_query_instance_descriptors` (
  `queryInstanceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryState` varchar(45) NOT NULL,
  `populated` tinyint(1) NOT NULL,
  `flowInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_flowengine_query_instance_descriptors_1` (`flowInstanceID`),
  KEY `FK_flowengine_query_instance_descriptors_2` (`queryID`),
  CONSTRAINT `FK_flowengine_query_instance_descriptors_1` FOREIGN KEY (`flowInstanceID`) REFERENCES `flowengine_flow_instances` (`flowInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_flowengine_query_instance_descriptors_2` FOREIGN KEY (`queryID`) REFERENCES `flowengine_query_descriptors` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_query_instance_descriptors`
--

LOCK TABLES `flowengine_query_instance_descriptors` WRITE;
/*!40000 ALTER TABLE `flowengine_query_instance_descriptors` DISABLE KEYS */;
INSERT INTO `flowengine_query_instance_descriptors` VALUES (1,'VISIBLE',1,1,3839),(3,'HIDDEN',0,1,3841),(5,'HIDDEN',0,1,3843),(7,'HIDDEN',0,1,3845),(9,'VISIBLE_REQUIRED',1,1,3847),(11,'VISIBLE_REQUIRED',1,1,3849),(13,'HIDDEN',0,1,3851),(15,'HIDDEN',0,1,3853),(17,'HIDDEN',0,1,3855),(19,'VISIBLE',1,1,3857),(21,'HIDDEN',0,1,3859),(23,'VISIBLE_REQUIRED',1,1,3861),(25,'VISIBLE_REQUIRED',1,1,3863),(27,'VISIBLE',1,1,3865),(29,'HIDDEN',0,1,3867),(31,'VISIBLE_REQUIRED',1,1,3869),(33,'VISIBLE_REQUIRED',1,1,3871),(35,'HIDDEN',0,1,3873),(37,'VISIBLE',1,1,3875),(39,'VISIBLE_REQUIRED',1,1,3877),(41,'VISIBLE',0,1,3879),(43,'HIDDEN',0,1,3881),(45,'VISIBLE',1,1,3883),(47,'HIDDEN',0,1,3885),(49,'VISIBLE',1,1,3887),(51,'HIDDEN',0,1,3889),(53,'VISIBLE',1,1,3891),(55,'HIDDEN',0,1,3893),(57,'VISIBLE',1,3,3839),(59,'HIDDEN',0,3,3841),(61,'HIDDEN',0,3,3843),(63,'HIDDEN',0,3,3845),(65,'VISIBLE_REQUIRED',1,3,3847),(67,'VISIBLE_REQUIRED',1,3,3849),(69,'HIDDEN',0,3,3851),(71,'HIDDEN',0,3,3853),(73,'HIDDEN',0,3,3855),(75,'VISIBLE',1,3,3857),(77,'HIDDEN',0,3,3859),(79,'VISIBLE_REQUIRED',1,3,3861),(81,'VISIBLE_REQUIRED',1,3,3863),(83,'VISIBLE',1,3,3865),(85,'HIDDEN',0,3,3867),(87,'VISIBLE_REQUIRED',1,3,3869),(89,'VISIBLE_REQUIRED',1,3,3871),(91,'HIDDEN',0,3,3873),(93,'VISIBLE',1,3,3875),(95,'VISIBLE_REQUIRED',1,3,3877),(97,'VISIBLE',0,3,3879),(99,'HIDDEN',0,3,3881),(101,'VISIBLE',1,3,3883),(103,'HIDDEN',0,3,3885),(105,'VISIBLE',1,3,3887),(107,'HIDDEN',0,3,3889),(109,'VISIBLE',1,3,3891),(111,'HIDDEN',0,3,3893),(113,'VISIBLE',1,5,3965),(115,'VISIBLE',1,7,3965),(117,'VISIBLE',0,9,3897),(119,'HIDDEN',0,9,3899),(121,'HIDDEN',0,9,3901),(123,'HIDDEN',0,9,3903),(125,'VISIBLE_REQUIRED',1,9,3905),(127,'VISIBLE_REQUIRED',1,9,3907),(129,'HIDDEN',0,9,3909),(131,'HIDDEN',0,9,3911),(133,'HIDDEN',0,9,3913),(135,'VISIBLE',1,9,3915),(137,'HIDDEN',0,9,3917),(139,'VISIBLE_REQUIRED',0,9,3919),(141,'VISIBLE_REQUIRED',0,9,3921),(143,'VISIBLE',1,9,3923),(145,'HIDDEN',0,9,3925),(147,'VISIBLE_REQUIRED',1,9,3927),(149,'HIDDEN',0,9,3929),(151,'VISIBLE_REQUIRED',1,9,3931),(153,'VISIBLE',1,9,3933),(155,'VISIBLE_REQUIRED',1,9,3935),(157,'VISIBLE',0,9,3937),(159,'HIDDEN',0,9,3939),(161,'VISIBLE',0,9,3941),(163,'HIDDEN',0,9,3943),(165,'VISIBLE',0,9,3945),(167,'HIDDEN',0,9,3947),(169,'VISIBLE',0,9,3949),(171,'HIDDEN',0,9,3951),(173,'VISIBLE',1,11,3897),(175,'HIDDEN',0,11,3899),(177,'HIDDEN',0,11,3901),(179,'HIDDEN',0,11,3903),(181,'VISIBLE_REQUIRED',1,11,3905),(183,'VISIBLE_REQUIRED',1,11,3907),(185,'HIDDEN',0,11,3909),(187,'HIDDEN',0,11,3911),(189,'HIDDEN',0,11,3913),(191,'VISIBLE',0,11,3915),(193,'HIDDEN',0,11,3917),(195,'VISIBLE_REQUIRED',1,11,3919),(197,'VISIBLE_REQUIRED',1,11,3921),(199,'VISIBLE',1,11,3923),(201,'HIDDEN',0,11,3925),(203,'VISIBLE_REQUIRED',1,11,3927),(205,'VISIBLE_REQUIRED',1,11,3929),(207,'HIDDEN',0,11,3931),(209,'VISIBLE',1,11,3933),(211,'VISIBLE_REQUIRED',1,11,3935),(213,'VISIBLE',0,11,3937),(215,'HIDDEN',0,11,3939),(217,'VISIBLE',0,11,3941),(219,'HIDDEN',0,11,3943),(221,'VISIBLE',0,11,3945),(223,'HIDDEN',0,11,3947),(225,'VISIBLE',0,11,3949),(227,'HIDDEN',0,11,3951),(229,'VISIBLE',1,13,3897),(231,'HIDDEN',0,13,3899),(233,'HIDDEN',0,13,3901),(235,'HIDDEN',0,13,3903),(237,'VISIBLE_REQUIRED',1,13,3905),(239,'VISIBLE_REQUIRED',1,13,3907),(241,'HIDDEN',0,13,3909),(243,'HIDDEN',0,13,3911),(245,'HIDDEN',0,13,3913),(247,'VISIBLE',0,13,3915),(249,'HIDDEN',0,13,3917),(251,'VISIBLE_REQUIRED',1,13,3919),(253,'VISIBLE_REQUIRED',1,13,3921),(255,'VISIBLE',1,13,3923),(257,'HIDDEN',0,13,3925),(259,'VISIBLE_REQUIRED',1,13,3927),(261,'HIDDEN',0,13,3929),(263,'VISIBLE_REQUIRED',1,13,3931),(265,'VISIBLE',1,13,3933),(267,'VISIBLE_REQUIRED',1,13,3935),(269,'VISIBLE',0,13,3937),(271,'HIDDEN',0,13,3939),(273,'VISIBLE',0,13,3941),(275,'HIDDEN',0,13,3943),(277,'VISIBLE',0,13,3945),(279,'HIDDEN',0,13,3947),(281,'VISIBLE',0,13,3949),(283,'HIDDEN',0,13,3951),(285,'VISIBLE',1,15,3897),(287,'HIDDEN',0,15,3899),(289,'HIDDEN',0,15,3901),(291,'HIDDEN',0,15,3903),(293,'VISIBLE_REQUIRED',1,15,3905),(295,'VISIBLE_REQUIRED',1,15,3907),(297,'HIDDEN',0,15,3909),(299,'HIDDEN',0,15,3911),(301,'HIDDEN',0,15,3913),(303,'VISIBLE',0,15,3915),(305,'HIDDEN',0,15,3917),(307,'VISIBLE_REQUIRED',1,15,3919),(309,'VISIBLE_REQUIRED',1,15,3921),(311,'VISIBLE',0,15,3923),(313,'HIDDEN',0,15,3925),(315,'VISIBLE_REQUIRED',1,15,3927),(317,'VISIBLE_REQUIRED',1,15,3929),(319,'HIDDEN',0,15,3931),(321,'VISIBLE',1,15,3933),(323,'VISIBLE_REQUIRED',1,15,3935),(325,'VISIBLE',0,15,3937),(327,'HIDDEN',0,15,3939),(329,'VISIBLE',0,15,3941),(331,'HIDDEN',0,15,3943),(333,'VISIBLE',0,15,3945),(335,'HIDDEN',0,15,3947),(337,'VISIBLE',0,15,3949),(339,'HIDDEN',0,15,3951),(341,'VISIBLE',1,17,3897),(343,'HIDDEN',0,17,3899),(345,'HIDDEN',0,17,3901),(347,'HIDDEN',0,17,3903),(349,'VISIBLE_REQUIRED',1,17,3905),(351,'VISIBLE_REQUIRED',1,17,3907),(353,'HIDDEN',0,17,3909),(355,'HIDDEN',0,17,3911),(357,'HIDDEN',0,17,3913),(359,'VISIBLE',1,17,3915),(361,'HIDDEN',0,17,3917),(363,'VISIBLE_REQUIRED',1,17,3919),(365,'VISIBLE_REQUIRED',1,17,3921),(367,'VISIBLE',1,17,3923),(369,'HIDDEN',0,17,3925),(371,'VISIBLE_REQUIRED',1,17,3927),(373,'VISIBLE_REQUIRED',1,17,3929),(375,'HIDDEN',0,17,3931),(377,'VISIBLE',1,17,3933),(379,'VISIBLE_REQUIRED',1,17,3935),(381,'VISIBLE',0,17,3937),(383,'HIDDEN',0,17,3939),(385,'VISIBLE',0,17,3941),(387,'HIDDEN',0,17,3943),(389,'VISIBLE',0,17,3945),(391,'HIDDEN',0,17,3947),(393,'VISIBLE',0,17,3949),(395,'HIDDEN',0,17,3951),(509,'VISIBLE',1,23,3897),(511,'HIDDEN',0,23,3899),(513,'HIDDEN',0,23,3901),(515,'HIDDEN',0,23,3903),(517,'VISIBLE_REQUIRED',1,23,3905),(519,'VISIBLE_REQUIRED',1,23,3907),(521,'HIDDEN',0,23,3909),(523,'HIDDEN',0,23,3911),(525,'HIDDEN',0,23,3913),(527,'VISIBLE',1,23,3915),(529,'HIDDEN',0,23,3917),(531,'VISIBLE_REQUIRED',1,23,3919),(533,'VISIBLE_REQUIRED',0,23,3921),(535,'VISIBLE',1,23,3923),(537,'HIDDEN',0,23,3925),(539,'VISIBLE_REQUIRED',1,23,3927),(541,'VISIBLE_REQUIRED',1,23,3929),(543,'HIDDEN',0,23,3931),(545,'VISIBLE',1,23,3933),(547,'VISIBLE_REQUIRED',1,23,3935),(549,'VISIBLE',0,23,3937),(551,'HIDDEN',0,23,3939),(553,'VISIBLE',0,23,3941),(555,'HIDDEN',0,23,3943),(557,'VISIBLE',0,23,3945),(559,'HIDDEN',0,23,3947),(561,'VISIBLE',0,23,3949),(563,'HIDDEN',0,23,3951);
/*!40000 ALTER TABLE `flowengine_query_instance_descriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_standard_statuses`
--

DROP TABLE IF EXISTS `flowengine_standard_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_standard_statuses` (
  `statusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `managingTime` int(10) unsigned DEFAULT NULL,
  `isUserMutable` tinyint(1) NOT NULL,
  `isUserDeletable` tinyint(1) NOT NULL,
  `isAdminMutable` tinyint(1) NOT NULL,
  `isAdminDeletable` tinyint(1) NOT NULL,
  `contentType` varchar(45) NOT NULL,
  PRIMARY KEY (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_standard_statuses`
--

LOCK TABLES `flowengine_standard_statuses` WRITE;
/*!40000 ALTER TABLE `flowengine_standard_statuses` DISABLE KEYS */;
INSERT INTO `flowengine_standard_statuses` VALUES (1,'Hanteras av handl√§ggare',NULL,NULL,0,0,1,1,'IN_PROGRESS'),(3,'Hanterat, beslut √§r fattat',NULL,NULL,0,0,0,0,'ARCHIVED'),(5,'Inskickad',NULL,NULL,1,1,1,1,'SUBMITTED'),(7,'Sparad, ej inskickad',NULL,NULL,1,1,1,1,'NEW');
/*!40000 ALTER TABLE `flowengine_standard_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_steps`
--

DROP TABLE IF EXISTS `flowengine_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_steps` (
  `stepID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `flowID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stepID`),
  KEY `FK_flowengine_steps_1` (`flowID`),
  CONSTRAINT `FK_flowengine_steps_1` FOREIGN KEY (`flowID`) REFERENCES `flowengine_flows` (`flowID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_steps`
--

LOCK TABLES `flowengine_steps` WRITE;
/*!40000 ALTER TABLE `flowengine_steps` DISABLE KEYS */;
INSERT INTO `flowengine_steps` VALUES (717,'Steg 1',0,177),(719,'Typ av registrering',0,179),(721,'Verksamhetens/anl√§ggningens placering',1,179),(723,'Vad ska du g√∂ra?',2,179),(725,'Verksamhetens storlek',3,179),(727,'Kontaktuppgifter',4,179),(729,'Personuppgifter',1,181),(731,'Type of registration',0,183),(733,'Operations / facility location',1,183),(735,'What will you do?',2,183),(737,'The size of the business',3,183),(739,'Contact',5,183),(741,'Intressen',1,177),(745,'Dina uppgifter',0,185);
/*!40000 ALTER TABLE `flowengine_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_text_tags`
--

DROP TABLE IF EXISTS `flowengine_text_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_text_tags` (
  `textTagID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `defaultValue` text,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`textTagID`),
  UNIQUE KEY `Index_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_text_tags`
--

LOCK TABLES `flowengine_text_tags` WRITE;
/*!40000 ALTER TABLE `flowengine_text_tags` DISABLE KEYS */;
INSERT INTO `flowengine_text_tags` VALUES (1,'Test','testtag','hej hej hej','TEXTFIELD');
/*!40000 ALTER TABLE `flowengine_text_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowengine_user_organizations`
--

DROP TABLE IF EXISTS `flowengine_user_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowengine_user_organizations` (
  `organizationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `organizationNumber` varchar(16) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactBySMS` tinyint(1) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`organizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowengine_user_organizations`
--

LOCK TABLES `flowengine_user_organizations` WRITE;
/*!40000 ALTER TABLE `flowengine_user_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowengine_user_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_aliases`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_aliases` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `listIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`alias`),
  CONSTRAINT `FK_backgroundmodulealiases_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_aliases`
--

LOCK TABLES `openhierarchy_background_module_aliases` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_aliases` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_module_aliases` VALUES (10,'*',0),(12,'*',10),(12,'exclude:administration*',0),(12,'exclude:flowadmin*',5),(12,'exclude:flowinstanceadmin*',6),(12,'exclude:minasidor*',2),(12,'exclude:myorganizations*',8),(12,'exclude:mysettings*',7),(12,'exclude:oversikt/flow*',3),(12,'exclude:oversikt/overview*',1),(12,'exclude:oversikt/submitted*',4),(12,'exclude:statistik*',9),(13,'*',0),(14,'*',10),(14,'exclude:administration*',0),(14,'exclude:flowadmin*',5),(14,'exclude:flowinstanceadmin*',6),(14,'exclude:minasidor*',2),(14,'exclude:myorganizations*',8),(14,'exclude:mysettings*',7),(14,'exclude:oversikt/flow*',3),(14,'exclude:oversikt/overview*',1),(14,'exclude:oversikt/submitted*',4),(14,'exclude:statistik*',9),(15,'exclude:minasidor*',3),(15,'exclude:minasidor/flowinstance*',0),(15,'exclude:minasidor/overview*',1),(15,'exclude:minasidor/preview*',2),(15,'exclude:statistik*',4),(16,'*',8),(16,'exclude:administration*',0),(16,'exclude:flowadmin*',5),(16,'exclude:flowinstanceadmin*',6),(16,'exclude:minasidor*',2),(16,'exclude:mysettings*',4),(16,'exclude:oversikt/flow*',3),(16,'exclude:oversikt/overview*',1),(16,'exclude:statistik*',7),(17,'*',0),(18,'*',0),(19,'exclude:minasidor/flowinstance*',0),(19,'exclude:minasidor/overview*',1),(19,'exclude:minasidor/preview*',2),(19,'minasidor*',5),(19,'myorganizations*',4),(19,'mysettings*',3),(20,'mysettings*',0);
/*!40000 ALTER TABLE `openhierarchy_background_module_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_background_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_attributes`
--

LOCK TABLES `openhierarchy_background_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_backgroundmodulegroups_2` (`groupID`),
  CONSTRAINT `FK_backgroundmodulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_groups`
--

LOCK TABLES `openhierarchy_background_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_backgroundmodulesettings_1` (`moduleID`),
  CONSTRAINT `FK_backgroundmodulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_settings`
--

LOCK TABLES `openhierarchy_background_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_settings` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_module_settings` VALUES (277,18,'nrOfEvents','5'),(311,10,'profileSettingDescription','Page heading for the profile'),(313,10,'profileSettingID','bgmodule-4'),(315,10,'profileSettingName','Page Heading'),(317,17,'editFavouritesAlias','/mysettings'),(319,17,'mode','SHOW'),(321,15,'mode','SHOW'),(325,20,'mode','EDIT'),(327,19,'sectionID','5'),(331,16,'mode','SHOW'),(333,14,'flowCount','5'),(335,14,'interval','72'),(337,12,'adminGroups','10'),(339,12,'adminGroups','6'),(341,12,'cssClass','htmloutputmodule'),(343,12,'html','<section class=\"clearboth\">\r\n	<div class=\"center\">id: admin</div>\r\n	<div class=\"center\">pw: openeplatform</div>\r\n	<div class=\"current blue\">About</div>\r\n</section>\r\n'),(345,12,'htmlRequired','true');
/*!40000 ALTER TABLE `openhierarchy_background_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_slots`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_slots` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slot` varchar(255) NOT NULL,
  PRIMARY KEY (`moduleID`,`slot`),
  CONSTRAINT `FK_backgroundmoduleslots_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_slots`
--

LOCK TABLES `openhierarchy_background_module_slots` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_slots` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_module_slots` VALUES (10,'header.logotype'),(12,'right-content-container.news'),(13,'top-content-container.info'),(14,'right-content-container.popular'),(15,'left-content-container.favourites'),(16,'right-content-container.favourites'),(17,'#menu-container.favourites'),(18,'sectionmenu-content-container.newevents'),(19,'top-content-container.mypagesmenu'),(20,'right-content-container.favourites');
/*!40000 ALTER TABLE `openhierarchy_background_module_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_background_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_backgroundmoduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_background_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_module_users`
--

LOCK TABLES `openhierarchy_background_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_module_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_background_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_background_modules`
--

DROP TABLE IF EXISTS `openhierarchy_background_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_background_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `xslPath` text,
  `xslPathType` varchar(255) DEFAULT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `staticContentPackage` varchar(255) DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `FK_backgroundmodules_1` (`sectionID`),
  KEY `FK_backgroundmodules_2` (`dataSourceID`),
  CONSTRAINT `FK_backgroundmodules_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_backgroundmodules_2` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_background_modules`
--

LOCK TABLES `openhierarchy_background_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_background_modules` DISABLE KEYS */;
INSERT INTO `openhierarchy_background_modules` VALUES (10,'se.unlogic.openhierarchy.foregroundmodules.siteprofile.SiteProfileHTMLBackgroundModule','Sidhuvud','',NULL,1,1,1,1,1,NULL,'',1),(12,'se.unlogic.hierarchy.backgroundmodules.htmloutput.HTMLOutputModule','News','HTMLOutputModule.sv.xsl','Classpath',1,1,1,1,1,NULL,'staticcontent',0),(13,'com.nordicpeak.flowengine.OperatingMessageBackgroundModule','Server messages (global)','OperatingMessageBackgroundModuleTemplates.xsl','Classpath',1,1,1,1,1,NULL,NULL,0),(14,'com.nordicpeak.flowengine.PopularFlowFamiliesModule','Most used','PopularFlowFamiliesModule.sv.xsl','Classpath',1,1,1,1,1,NULL,'staticcontent',2),(15,'com.nordicpeak.flowengine.UserFavouriteBackgroundModule','My favourites','UserFavouriteBackgroundModule.sv.xsl','Classpath',0,1,1,1,1,NULL,'staticcontent',1),(16,'com.nordicpeak.flowengine.UserFavouriteBackgroundModule','My favourites','UserFavouriteBackgroundModule.sv.xsl','Classpath',0,1,1,1,1,NULL,'staticcontent',1),(17,'com.nordicpeak.flowengine.UserFavouriteBackgroundModule','My favourites','UserFavouriteMenuModule.sv.xsl','Classpath',0,1,1,1,1,NULL,'staticcontent',0),(18,'com.nordicpeak.flowengine.NewEventsBackgroundModule','Mina meddelanden (bakgrund)','NewEventsBackgroundModule.sv.xsl','Classpath',0,1,1,1,1,NULL,'staticcontent',0),(19,'com.nordicpeak.flowengine.UserFlowInstanceMenuModule','My applications (Meny)','UserFlowInstanceMenuModuleTemplates.xsl','Classpath',0,1,1,1,1,NULL,NULL,0),(20,'com.nordicpeak.flowengine.UserFavouriteBackgroundModule','Edit favourites','UserFavouriteBackgroundModule.sv.xsl','Classpath',0,1,1,1,1,NULL,'staticcontent',1);
/*!40000 ALTER TABLE `openhierarchy_background_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_data_sources`
--

DROP TABLE IF EXISTS `openhierarchy_data_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_data_sources` (
  `dataSourceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `driver` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `logAbandoned` tinyint(1) DEFAULT '0',
  `removeAbandoned` tinyint(1) DEFAULT '0',
  `removeTimeout` int(10) unsigned DEFAULT '30',
  `testOnBorrow` tinyint(1) DEFAULT '0',
  `validationQuery` varchar(255) DEFAULT 'SELECT 1',
  `maxActive` int(10) unsigned DEFAULT '30',
  `maxIdle` int(10) unsigned DEFAULT '8',
  `minIdle` int(10) unsigned DEFAULT '0',
  `maxWait` int(10) unsigned DEFAULT '0',
  `defaultCatalog` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataSourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_data_sources`
--

LOCK TABLES `openhierarchy_data_sources` WRITE;
/*!40000 ALTER TABLE `openhierarchy_data_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_data_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_aliases`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_aliases` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `listIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`alias`),
  CONSTRAINT `FK_filtermodulealiases_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_aliases`
--

LOCK TABLES `openhierarchy_filter_module_aliases` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_aliases` DISABLE KEYS */;
INSERT INTO `openhierarchy_filter_module_aliases` VALUES (2,'*',0);
/*!40000 ALTER TABLE `openhierarchy_filter_module_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_filter_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_attributes`
--

LOCK TABLES `openhierarchy_filter_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_filtermodulegroups_2` (`groupID`),
  CONSTRAINT `FK_filtermodulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_groups`
--

LOCK TABLES `openhierarchy_filter_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_filtermodulesettings_1` (`moduleID`),
  CONSTRAINT `FK_filtermodulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_settings`
--

LOCK TABLES `openhierarchy_filter_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_filter_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_filtermoduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_filter_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_module_users`
--

LOCK TABLES `openhierarchy_filter_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_module_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_filter_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_filter_modules`
--

DROP TABLE IF EXISTS `openhierarchy_filter_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_filter_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`),
  KEY `FK_filtermodules_1` (`dataSourceID`),
  CONSTRAINT `FK_filtermodules_1` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_filter_modules`
--

LOCK TABLES `openhierarchy_filter_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_filter_modules` DISABLE KEYS */;
INSERT INTO `openhierarchy_filter_modules` VALUES (2,'se.unlogic.hierarchy.filtermodules.login.LoginTriggerModule','LoginTriggerModule',1,0,0,1,NULL,0);
/*!40000 ALTER TABLE `openhierarchy_filter_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_attributes` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`moduleID`,`name`),
  CONSTRAINT `FK_openhierarchy_foreground_module_attributes_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_attributes`
--

LOCK TABLES `openhierarchy_foreground_module_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_groups`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_groups` (
  `moduleID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`moduleID`,`groupID`),
  KEY `FK_modulegroups_2` (`groupID`),
  CONSTRAINT `FK_modulegroups_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_groups`
--

LOCK TABLES `openhierarchy_foreground_module_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_groups` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_module_groups` VALUES (37,6),(39,6),(69,6),(70,6),(71,6),(95,6),(102,6),(109,6),(112,6),(123,6),(133,6),(150,6),(160,6),(165,6),(176,6),(186,6),(39,10),(112,10),(123,10),(150,10),(160,10),(165,10),(133,11);
/*!40000 ALTER TABLE `openhierarchy_foreground_module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_settings`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_settings` (
  `counter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleID` int(10) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `FK_modulesettings_1` (`moduleID`),
  CONSTRAINT `FK_modulesettings_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11031 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_settings`
--

LOCK TABLES `openhierarchy_foreground_module_settings` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_settings` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_module_settings` VALUES (842,84,'menuItemType','MENUITEM'),(864,64,'menuItemType','MENUITEM'),(998,70,'menuItemType','MENUITEM'),(1002,37,'menuItemType','MENUITEM'),(1320,102,'cssPath','/css/fck.css'),(1321,102,'menuItemType','MENUITEM'),(3102,9,'menuItemType','SECTION'),(3103,9,'redirectURL','/'),(4089,146,'diskThreshold','100'),(4091,146,'menuItemType','MENUITEM'),(4092,146,'ramThreshold','500'),(5638,113,'ckConnectorModuleAlias','/fileconnector'),(5639,113,'cssPath','/css/fck.css'),(5640,113,'includeDebugData','false'),(5641,113,'menuItemType','MENUITEM'),(5642,113,'pdfStyleSheet','CheckboxQueryPDF.sv.xsl'),(5643,113,'queryStyleSheet','CheckboxQuery.sv.xsl'),(5644,113,'useCKEditorForDescription','true'),(5683,115,'ckConnectorModuleAlias','/fileconnector'),(5684,115,'cssPath','/css/fck.css'),(5685,115,'includeDebugData','false'),(5686,115,'menuItemType','MENUITEM'),(5687,115,'pdfStyleSheet','RadioButtonQueryPDF.sv.xsl'),(5688,115,'queryStyleSheet','RadioButtonQuery.sv.xsl'),(5689,115,'useCKEditorForDescription','true'),(5726,69,'menuItemType','MENUITEM'),(5727,160,'cssPath','/css/fck.css'),(5728,160,'menuItemType','MENUITEM'),(5729,150,'menuItemType','MENUITEM'),(6162,165,'cssPath','/css/style.css'),(6163,165,'diskThreshold','100'),(6165,165,'menuItemType','MENUITEM'),(6166,165,'ramThreshold','500'),(6215,61,'maxFileSize','1'),(6216,61,'maxRequestSize','5'),(6217,61,'menuItemType','MENUITEM'),(6218,61,'ramThreshold','500'),(6219,161,'defaultLogotype','classpath://com/nordicpeak/flowengine/pdf/staticcontent/pics/logo.png'),(6220,161,'includedFonts','/com/nordicpeak/flowengine/pdf/fonts/SourceSansPro-Bold.ttf\r\n/com/nordicpeak/flowengine/pdf/fonts/SourceSansPro-It.ttf\r\n/com/nordicpeak/flowengine/pdf/fonts/SourceSansPro-Regular.ttf\r\n/com/nordicpeak/flowengine/pdf/fonts/SourceSansPro-Semibold.ttf'),(6221,161,'menuItemType','MENUITEM'),(6223,161,'pdfStyleSheet','FlowInstancePDF.sv.xsl'),(6224,161,'supportedActionIDs','com.nordicpeak.flowengine.FlowBrowserModule.submit'),(6226,161,'xhtmlDebug','false'),(6228,161,'xmlDebug','false'),(6230,116,'ckConnectorModuleAlias','/fileconnector'),(6231,116,'cssPath','/css/fck.css'),(6232,116,'includeDebugData','false'),(6233,116,'menuItemType','MENUITEM'),(6234,116,'pdfStyleSheet','DropDownQueryPDF.sv.xsl'),(6235,116,'queryStyleSheet','DropDownQuery.sv.xsl'),(6236,116,'useCKEditorForDescription','true'),(6371,131,'ckConnectorModuleAlias','/fileconnector'),(6372,131,'cssPath','/css/fck.css'),(6373,131,'includeDebugData','false'),(6374,131,'menuItemType','MENUITEM'),(6375,131,'pdfStyleSheet','ContactDetailQueryPDF.sv.xsl'),(6376,131,'queryStyleSheet','ContactDetailQuery.sv.xsl'),(6377,131,'useCKEditorForDescription','true'),(6510,117,'ckConnectorModuleAlias','/fileconnector'),(6511,117,'cssPath','/css/style.css'),(6512,117,'includeDebugData','false'),(6513,117,'menuItemType','MENUITEM'),(6514,117,'pdfStyleSheet','TextAreaQueryPDF.sv.xsl'),(6515,117,'queryStyleSheet','TextAreaQuery.sv.xsl'),(6516,117,'useCKEditorForDescription','true'),(6523,118,'ckConnectorModuleAlias','/fileconnector'),(6524,118,'cssPath','/css/style.css'),(6525,118,'includeDebugData','false'),(6526,118,'menuItemType','MENUITEM'),(6527,118,'pdfStyleSheet','TextFieldQueryPDF.sv.xsl'),(6528,118,'queryStyleSheet','TextFieldQuery.sv.xsl'),(6529,118,'useCKEditorForDescription','true'),(6956,119,'ckConnectorModuleAlias','/fileconnector'),(6957,119,'cleanupInterval','10'),(6958,119,'cssPath','/css/style.css'),(6960,119,'includeDebugData','true'),(6961,119,'maxAllowedFileSize','50'),(6962,119,'menuItemType','MENUITEM'),(6963,119,'pdfStyleSheet','FileUploadQueryPDF.sv.xsl'),(6964,119,'queryStyleSheet','FileUploadQuery.sv.xsl'),(6966,119,'useCKEditorForDescription','true'),(8870,180,'menuItemType','MENUITEM'),(8871,180,'supportedActionIDs','com.nordicpeak.flowengine.FlowBrowserModule.submit'),(9564,71,'formStyleSheet','SimpleUserProviderForm.sv.xsl'),(9565,71,'includeDebugData','false'),(9566,71,'listAsAddableType','true'),(9567,71,'menuItemType','MENUITEM'),(9568,71,'passwordAlgorithm','SHA-1'),(9569,71,'priority','0'),(9570,71,'supportedAttributes','citizenIdentifier:Personnummer\r\nsmexID!:SMEX ID\r\nphone!:Telefon\r\norganizationID!:Organisations ID\r\norganization!:Organisation'),(9571,71,'userTypeName','Anv√§ndare med separat f√§lt f√∂r anv√§ndarnamn och l√∂senord'),(9572,56,'menuItemType','MENUITEM'),(10306,8,'adminTimeout','60'),(10307,8,'default','true'),(10308,8,'loginLockoutActivated','true'),(10309,8,'loginLockoutTime','1800'),(10310,8,'loginRetries','10'),(10311,8,'loginRetryInterval','600'),(10312,8,'logoutModuleAliases','/logout\r\n/logout/logout'),(10313,8,'menuItemType','SECTION'),(10314,8,'priority','100'),(10315,8,'userTimeout','30'),(10388,95,'allowAdminAdministration','true'),(10389,95,'allowGroupAdministration','true'),(10390,95,'allowUserSwitching','false'),(10391,95,'filteringField','FIRSTNAME'),(10392,95,'menuItemType','MENUITEM'),(10481,108,'menuItemType','MENUITEM'),(10483,179,'debugFragmententXML','false'),(10485,179,'emailSenderAddress','noreply@imcode.com'),(10487,179,'emailSenderName','Svara inte'),(10489,179,'externalMessageReceivedManagerEmailMessage','<p>Hej $manager.firstname,</p>\r\n<p>Du har f&aring;tt ett nytt meddelande kopplat till &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID).</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10491,179,'externalMessageReceivedManagerEmailSubject','Nytt meddelande kopplat till √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10493,179,'externalMessageReceivedUserEmailMessage','<p>Hej $contact.firstname,</p>\r\n<p>Du har f&aring;tt ett nytt meddelande kopplat till &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID).</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10495,179,'externalMessageReceivedUserEmailSubject','Nytt meddelande kopplat till √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10497,179,'externalMessageReceivedUserSMS','Du har f√•tt ett nytt meddelande kopplat till √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10499,179,'flowInstanceAdminModuleAlias','not set'),(10501,179,'flowInstanceArchivedUserEmailMessage','<p>Hej $contact.firstname,</p>\r\n<p>Handl&auml;ggningen av &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har slutf&ouml;rts.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10503,179,'flowInstanceArchivedUserEmailSubject','Handl√§ggningen av √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har slutf√∂rts.'),(10505,179,'flowInstanceArchivedUserSMS','Handl√§ggningen av √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har slutf√∂rts.'),(10507,179,'flowInstanceAssignedManagerEmailMessage','<p>Hej $manager.firstname,</p>\r\n<p>Du har tilldelats &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID).</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10509,179,'flowInstanceAssignedManagerEmailSubject','Tilldelad √§rende $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10511,179,'flowInstanceSubmittedGlobalEmailAttachPDF','false'),(10513,179,'flowInstanceSubmittedGlobalEmailMessage','<p>Hej,</p>\r\n<p>Ett nytt &auml;rende, $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har skickats in av $poster.firstname $poster.lastname</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10515,179,'flowInstanceSubmittedGlobalEmailSubject','Nytt √§rende $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10517,179,'flowInstanceSubmittedManagerEmailMessage','<p>Hej,</p>\r\n<p>Ett nytt &auml;rende, $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har skickats in av $poster.firstname $poster.lastname</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10519,179,'flowInstanceSubmittedManagerEmailSubject','Nytt √§rende $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10521,179,'flowInstanceSubmittedUserEmailMessage','<p>Hej $contact.firstname,</p>\r\n<p>H&auml;r kommer en bekr&auml;ftelse p&aring; att &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har skickats in.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10523,179,'flowInstanceSubmittedUserEmailSubject','√Ñrendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har skickats in'),(10525,179,'flowInstanceSubmittedUserSMS','√Ñrendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har skickats in.'),(10527,179,'menuItemType','MENUITEM'),(10529,179,'pdfFilename','$flow.name, $flowInstance.flowInstanceID'),(10531,179,'sendExternalMessageReceivedManagerEmail','false'),(10533,179,'sendExternalMessageReceivedUserEmail','true'),(10535,179,'sendExternalMessageReceivedUserSMS','false'),(10537,179,'sendFlowInstanceArchivedUserEmail','false'),(10539,179,'sendFlowInstanceArchivedUserSMS','false'),(10541,179,'sendFlowInstanceAssignedManagerEmail','true'),(10543,179,'sendFlowInstanceSubmittedGlobalEmail','false'),(10545,179,'sendFlowInstanceSubmittedManagerEmail','false'),(10547,179,'sendFlowInstanceSubmittedUserEmail','true'),(10549,179,'sendFlowInstanceSubmittedUserSMS','false'),(10551,179,'sendStatusChangedManagerEmail','false'),(10553,179,'sendStatusChangedUserEmail','true'),(10555,179,'sendStatusChangedUserSMS','false'),(10557,179,'smsSenderName','Not set'),(10559,179,'statusChangedManagerEmailMessage','<p>Hej $manager.firstname,</p>\r\n<p>Statusen p&aring; &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) som du &auml;r tilldelad har &auml;ndrats till $status.name.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10561,179,'statusChangedManagerEmailSubject','Statusen f√∂r √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har √§ndrats till $status.name'),(10563,179,'statusChangedUserEmailMessage','<p>Hej $contact.firstname,</p>\r\n<p>Statusen p&aring; &auml;rendet $flow.name (&auml;rende nr. $flowInstance.flowInstanceID) har &auml;ndrats till $status.name.</p>\r\n<p>Klicka p&aring; l&auml;nken nedan f&ouml;r att visa &auml;rendet:</p>\r\n<p><a src=\"$flowInstance.url\">$flowInstance.url</a></p>\r\n'),(10565,179,'statusChangedUserEmailSubject','Ny status f√∂r √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID)'),(10567,179,'statusChangedUserSMS','Statusen f√∂r √§rendet $flow.name (√§rende nr. $flowInstance.flowInstanceID) har √§ndrats till $status.name'),(10569,179,'userFlowInstanceModuleAlias','not set'),(10637,186,'connectionTimeout','10000'),(10639,186,'host','localhost'),(10641,186,'menuItemType','MENUITEM'),(10643,186,'password','j5htl2011'),(10645,186,'port','25'),(10647,186,'priority','1'),(10649,186,'secure','false'),(10651,186,'socketTimeout','10000'),(10653,186,'startTLS','false'),(10655,186,'useAuth','false'),(10657,186,'username','hilloo'),(10689,168,'flowTypeIDs','4'),(10691,168,'listAllFlowTypes','true'),(10693,168,'maxHitCount','10'),(10695,168,'maxRequestSize','1000'),(10697,168,'menuItemType','SECTION'),(10699,168,'openExternalFlowsInNewWindow','true'),(10701,168,'popularFlowCount','5'),(10703,168,'popularInterval','72'),(10705,168,'ramThreshold','500'),(10707,168,'showRelatedFlows','false'),(10709,168,'useCategoryFilter','false'),(10711,168,'userFavouriteModuleAlias','/myfavourites'),(10713,172,'maxRequestSize','1000'),(10715,172,'menuItemType','SECTION'),(10717,172,'ramThreshold','500'),(10721,170,'menuItemType','MENUITEM'),(10739,133,'enableSiteProfileSupport','false'),(10741,133,'highPriorityThreshold','90'),(10743,133,'logFlowInstanceIndexing','false'),(10745,133,'maxHitCount','20'),(10747,133,'maxRequestSize','1000'),(10749,133,'maxUnfilteredHitCount','100'),(10751,133,'mediumPriorityThreshold','60'),(10753,133,'menuItemType','SECTION'),(10755,133,'ramThreshold','500'),(10757,123,'adminGroupIDs','6'),(10759,123,'adminUserIDs','1'),(10761,123,'maxFlowIconHeight','65'),(10763,123,'maxFlowIconWidth','65'),(10765,123,'maxRequestSize','1000'),(10767,123,'menuItemType','SECTION'),(10769,123,'ramThreshold','500'),(10771,173,'allowPasswordChanging','false'),(10773,173,'cancelRedirectURI','flowinstances'),(10775,173,'emailFieldMode','REQUIRED'),(10777,173,'firstnameFieldMode','DISABLED'),(10779,173,'lastnameFieldMode','DISABLED'),(10781,173,'menuItemType','MENUITEM'),(10783,173,'supportedAttributes','address:Adress:50\r\n\r\n\r\n\r\nzipCode:Postnummer:5\r\n\r\n\r\n\r\npostalAddress:Ort:50\r\n\r\n\r\n\r\nmobilePhone:Mobiltelefon:15\r\n\r\n\r\n\r\nphone:Telefonnummer:15\r\n\r\n\r\n\r\ncontactByLetter\r\n\r\n\r\n\r\ncontactByEmail\r\n\r\n\r\n\r\ncontactBySMS\r\n\r\n\r\n\r\ncontactByPhone'),(10785,173,'usernameFieldMode','HIDDEN'),(10803,174,'changeCheckInterval','*/5 * * * *'),(10805,174,'enableExportSupport','true'),(10807,174,'flowStatisticsMessage','<h1>$family.name</h1>\r\n<p>Below are statistics for the e-service $family.name.</p>\r\n'),(10809,174,'globalStatisticsMessage','<h1>Statistics for all e-services</h1>\r\n<p>Here you can see statistics on the use of our e-services. Select an email service in the menu to the left to view statistics about a specific e-service.</p>\r\n'),(10811,174,'internalGroups','6'),(10813,174,'menuItemType','SECTION'),(10815,174,'slot','left-content-container.favourites'),(10817,174,'weeksBackInTime','20'),(10971,109,'adminUserIDs','1'),(10973,109,'allowedSettings','menuItemType'),(10975,109,'cssPath','/css/fck.css'),(10977,109,'menuItemType','MENUITEM'),(10979,109,'moduleID','109'),(10981,109,'moduleType','FOREGROUND'),(10983,185,'menuItemType','MENUITEM'),(10985,149,'ckConnectorModuleAlias','/fileconnector'),(10987,149,'cssPath','/css/fck.css'),(10989,149,'includeDebugData','false'),(10991,149,'menuItemType','MENUITEM'),(10993,149,'pdfStyleSheet','OrganizationDetailQueryPDF.sv.xsl'),(10995,149,'queryStyleSheet','OrganizationDetailQuery.sv.xsl'),(10997,149,'queryTypeID','com.nordicpeak.flowengine.queries.organizationdetailquery.OrganizationDetailQueryProviderModule'),(10999,149,'useCKEditorForDescription','true'),(11001,171,'menuItemType','MENUITEM'),(11003,112,'menuItemType','MENUITEM'),(11005,39,'csspath','/css/fck.css'),(11007,39,'disablePreview','true'),(11009,39,'diskThreshold','100'),(11011,39,'menuItemType','MENUITEM'),(11013,39,'pageViewModuleAlias','page'),(11015,39,'pageViewModuleName','Sidvisare'),(11017,39,'pageViewModuleXSLPath','PageViewModule.sv.xsl'),(11019,39,'pageViewModuleXSLPathType','Classpath'),(11021,39,'ramThreshold','500'),(11027,125,'evaluatorTypeID','com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule'),(11029,125,'menuItemType','MENUITEM');
/*!40000 ALTER TABLE `openhierarchy_foreground_module_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_module_users`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_module_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_module_users` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`moduleID`,`userID`),
  CONSTRAINT `FK_moduleusers_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_module_users`
--

LOCK TABLES `openhierarchy_foreground_module_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_module_users` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_module_users` VALUES (61,3),(69,8),(123,1);
/*!40000 ALTER TABLE `openhierarchy_foreground_module_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_foreground_modules`
--

DROP TABLE IF EXISTS `openhierarchy_foreground_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_foreground_modules` (
  `moduleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `alias` varchar(45) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `xslPath` text,
  `xslPathType` varchar(255) DEFAULT NULL,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `dataSourceID` int(10) unsigned DEFAULT NULL,
  `staticContentPackage` varchar(255) DEFAULT NULL,
  `requiredProtocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`moduleID`),
  UNIQUE KEY `Index_3` (`sectionID`,`alias`),
  KEY `FK_modules_1` (`sectionID`),
  KEY `FK_modules_2` (`dataSourceID`),
  CONSTRAINT `FK_modules_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_modules_2` FOREIGN KEY (`dataSourceID`) REFERENCES `openhierarchy_data_sources` (`dataSourceID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_foreground_modules`
--

LOCK TABLES `openhierarchy_foreground_modules` WRITE;
/*!40000 ALTER TABLE `openhierarchy_foreground_modules` DISABLE KEYS */;
INSERT INTO `openhierarchy_foreground_modules` VALUES (8,'se.unlogic.hierarchy.foregroundmodules.login.UserProviderLoginModule','Logga in','login','Logga in','LoginModule.sv.xsl','Classpath',1,0,0,1,0,1,NULL,NULL,NULL),(9,'se.unlogic.hierarchy.foregroundmodules.logout.LogoutModule','Logga ut','logout','Logga ut','LogoutModule.sv.xsl','Classpath',0,1,1,1,0,1,NULL,NULL,NULL),(17,'se.unlogic.hierarchy.foregroundmodules.userprofile.UserProfileModule','Mina inst√§llningar','userprofile','Modul f√∂r √§ndring av anv√§ndaruppgifter','userprofile.xsl','Classpath',0,1,1,1,1,0,NULL,NULL,NULL),(37,'se.unlogic.hierarchy.foregroundmodules.menuadmin.MenuAdminModule','Menyer','menuadmin','Menyer','MenuAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(39,'se.unlogic.hierarchy.foregroundmodules.pagemodules.PageAdminModule','Sidor','pageadmin','Sidor','PageAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontentadmin',NULL),(56,'se.unlogic.hierarchy.foregroundmodules.runtimeinfo.RuntimeInfoModule','Systeminfo','runtimeinfo','Systeminfo','RuntimeInfoModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(61,'se.unlogic.hierarchy.foregroundmodules.systemadmin.SystemAdminModule','Moduler och sektioner','systemadmin','Moduler och sektioner','SystemAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(64,'se.unlogic.hierarchy.foregroundmodules.threadinfo.ThreadInfoModule','Tr√•dinfo','threadinfo','Tr√•dinfo','ThreadInfoModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(67,'se.unlogic.hierarchy.foregroundmodules.staticcontent.StaticContentModule','Statiskt inneh√•ll','static','Statiskt inneh√•ll',NULL,NULL,1,1,1,1,0,1,NULL,NULL,NULL),(69,'se.unlogic.hierarchy.foregroundmodules.usersessionadmin.UserSessionAdminModule','Inloggade anv√§ndare','sessionadmin','Inloggade anv√§ndare','UserSessionAdminModule.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(70,'se.unlogic.hierarchy.foregroundmodules.groupadmin.GroupAdminModule','Grupper','groupadmin','Grupper','GroupAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(71,'se.unlogic.hierarchy.foregroundmodules.userproviders.SimpleUserProviderModule','SimpleUserProviderModule','userprovider','SimpleUserProviderModule',NULL,NULL,0,0,0,1,0,1,NULL,'/se/unlogic/hierarchy/foregroundmodules/useradmin/staticcontent',NULL),(84,'se.unlogic.hierarchy.foregroundmodules.datasourceadmin.DataSourceAdminModule','Datak√§llor','datasourceadmin','Datak√§llor','DataSourceAdminModule.en.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(95,'se.unlogic.hierarchy.foregroundmodules.useradmin.UserAdminModule','Anv√§ndare','useradmin','Anv√§ndare','UserAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(102,'se.unlogic.hierarchy.foregroundmodules.htmloutput.HTMLOutputAdminModule','H√∂gerkolumn - Admin','htmloutputadmin','H√∂gerkolumn - Admin','HTMLOutputAdminModule.sv.xsl','Classpath',0,0,1,1,0,4,NULL,'staticcontent',NULL),(108,'se.unlogic.hierarchy.foregroundmodules.test.EmailMailTestModule','E-post test modul','mailtest','Skickar ett test meddelande till den som klickar p√• l√§nken',NULL,NULL,0,0,1,1,1,4,NULL,NULL,NULL),(109,'se.unlogic.hierarchy.foregroundmodules.modulesettings.ModuleSettingUpdateModule','Inst√§llningar - S√∂k','settings','Inst√§llningar - Rekommenderade s√∂kningar','ModuleSettingUpdateModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(111,'se.unlogic.hierarchy.foregroundmodules.test.XSLReload','Ladda om stilmall','reloadxsl','Ladda om stilmall',NULL,NULL,0,0,1,1,0,4,NULL,NULL,NULL),(112,'com.nordicpeak.flowengine.QueryHandlerModule','QueryHandler','queryhandler','QueryHandler',NULL,NULL,0,0,1,1,0,1,NULL,NULL,NULL),(113,'com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule','CheckBoxQueryProvider','checkboxquery','CheckBoxQueryProvider','CheckboxQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(115,'com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule','RadioButtonQueryProvider','radiobuttonquery','RadioButtonQueryProvider','RadioButtonQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(116,'com.nordicpeak.flowengine.queries.dropdownquery.DropDownQueryProviderModule','DropDownQueryProvider','dropdown','DropDownQueryProvider','DropDownQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(117,'com.nordicpeak.flowengine.queries.textareaquery.TextAreaQueryProviderModule','TextAreaQueryProvider','textarea','TextAreaQueryProvider','TextAreaQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(118,'com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule','TextFieldQueryProvider','textfieldprovider','TextFieldQueryProvider','TextFieldQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(119,'com.nordicpeak.flowengine.queries.fileuploadquery.FileUploadQueryProviderModule','FileUploadQueryProvider','fileuploadquery','FileUploadQueryProvider','FileUploadQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(123,'com.nordicpeak.flowengine.FlowAdminModule','Adm. e-services','flowadmin','Administer e-services','FlowAdminModule.sv.xsl','Classpath',0,0,1,1,1,1,NULL,'staticcontent',NULL),(124,'com.nordicpeak.flowengine.EvaluationHandlerModule','EvaluationHandler','evaluationhandler','EvaluationHandler',NULL,NULL,1,1,1,1,0,1,NULL,NULL,NULL),(125,'com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule','QueryStateEvaluationProvider','querystateevaluationprovider','QueryStateEvaluationProvider','QueryStateEvaluationProviderModule.sv.xsl','Classpath',1,1,1,1,0,1,NULL,NULL,NULL),(131,'com.nordicpeak.flowengine.queries.contactdetailquery.ContactDetailQueryProviderModule','Kontaktv√§gar','contactdetails','Kontaktv√§gar','ContactDetailQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(133,'com.nordicpeak.flowengine.FlowInstanceAdminModule','Adm. applications','flowinstanceadmin','Adm. applications','FlowInstanceAdminModule.sv.xsl','Classpath',0,0,1,1,1,1,NULL,'staticcontent',NULL),(144,'se.unlogic.hierarchy.foregroundmodules.groupproviders.SimpleGroupProviderModule','SimpleGroupProvider','simplegroupprovider','A group provider for simple groups',NULL,NULL,0,0,0,1,0,1,NULL,NULL,NULL),(146,'com.nordicpeak.flowengine.CKConnectorModule','CKConnector','fileconnector','CKConnector',NULL,NULL,1,1,1,1,0,1,NULL,'staticcontent',NULL),(149,'com.nordicpeak.flowengine.queries.organizationdetailquery.OrganizationDetailQueryProviderModule','Contact request (business)','organizationdetails','Contact request (business)','OrganizationDetailQueryAdmin.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(150,'se.unlogic.openhierarchy.foregroundmodules.siteprofile.SiteProfilesAdminModule','Profiler','profiler','Profiler','SiteProfilesAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(160,'com.nordicpeak.flowengine.TextTagAdminModule','Taggar','tagadmin','Administrera taggar','TextTagAdminModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(161,'com.nordicpeak.flowengine.pdf.PDFGeneratorModule','PDFGeneratorModule','pdfgen','PDFGeneratorModule',NULL,NULL,0,0,0,1,0,1,NULL,NULL,NULL),(165,'se.unlogic.hierarchy.foregroundmodules.htmloutput.HTMLOutputAdminModule','Administrera widget','widgetadmin','Administrera widget','HTMLOutputAdminModule.sv.xsl','Classpath',0,0,1,1,0,4,NULL,'staticcontent',NULL),(168,'com.nordicpeak.flowengine.FlowBrowserModule','E-services','oversikt','E-services','FlowInstanceBrowserModule.sv.xsl','Classpath',1,1,1,1,1,1,NULL,'staticcontent',NULL),(169,'com.nordicpeak.flowengine.flowsubmitsurveys.FeedbackFlowSubmitSurvey','Feedback','flowfeedback','Feedback','FeedbackFlowSubmitSurvey.sv.xsl','Classpath',1,1,1,1,0,1,NULL,'staticcontent',NULL),(170,'com.nordicpeak.flowengine.UserFavouriteForegroundModule','My favourites','myfavourites','My favourites',NULL,NULL,0,1,1,1,0,1,NULL,'staticcontent',NULL),(171,'com.nordicpeak.flowengine.UserOrganizationsModule','My companies','myorganizations','My companies','UserOrganizationsModule.sv.xsl','Classpath',0,1,1,1,0,1,NULL,'staticcontent',NULL),(172,'com.nordicpeak.flowengine.UserFlowInstanceModule','My pages','minasidor','My pages','UserFlowInstanceModule.sv.xsl','Classpath',0,1,1,1,1,1,NULL,'staticcontent',NULL),(173,'com.nordicpeak.flowengine.UserProfileModule','My settings','mysettings','My setting','UserProfileModule.sv.xsl','Classpath',0,1,0,1,0,1,NULL,'/com/nordicpeak/flowengine/staticcontent',NULL),(174,'com.nordicpeak.flowengine.statistics.StatisticsModule','Statistics','statistik','Statistics','StatisticsModule.sv.xsl','Classpath',1,1,1,1,1,1,NULL,'staticcontent',NULL),(175,'com.nordicpeak.flowengine.AbortedFlowInstanceListenerModule','AbortedFlowInstanceListenerModule','abortlistener','AbortedFlowInstanceListenerModule','',NULL,0,0,0,1,0,4,NULL,'',NULL),(176,'com.nordicpeak.flowengine.OperatingMessageModule','Driftmeddelanden','operatingmessages','Driftmeddelanden','OperatingMessageModule.sv.xsl','Classpath',0,0,1,1,1,4,NULL,'staticcontent',NULL),(179,'com.nordicpeak.flowengine.notifications.StandardFlowNotificationHandler','StandardFlowNotificationHandler','notificationhandler','StandardFlowNotificationHandler','StandardFlowNotificationHandler.sv.xsl','Classpath',0,1,1,1,0,4,NULL,'staticcontent',NULL),(180,'com.nordicpeak.flowengine.XMLProviderModule','XMLProviderModule','xml','XMLProviderModule','',NULL,0,0,0,1,0,4,NULL,'',NULL),(185,'com.nordicpeak.flowengine.signingproviders.DummySigningProvider','Dummy signing','dummy-signing','Dummy signing',NULL,NULL,1,1,1,1,0,1,NULL,'/com/nordicpeak/authifyclient/staticcontent',NULL),(186,'se.unlogic.hierarchy.foregroundmodules.mailsenders.direct.DirectMailSender','E-post s√§ndare','mailsender','E-post s√§ndare',NULL,NULL,0,1,1,1,1,4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `openhierarchy_foreground_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_menu_index`
--

DROP TABLE IF EXISTS `openhierarchy_menu_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_menu_index` (
  `menuIndexID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `menuIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `moduleID` int(10) unsigned DEFAULT NULL,
  `uniqueID` varchar(255) DEFAULT NULL,
  `subSectionID` int(10) unsigned DEFAULT NULL,
  `menuItemID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`menuIndexID`),
  UNIQUE KEY `UniqueID / ModuleID` (`moduleID`,`uniqueID`,`sectionID`),
  UNIQUE KEY `Index_5` (`sectionID`,`subSectionID`),
  KEY `FK_menuindex_3` (`subSectionID`),
  KEY `FK_menuindex_4` (`menuItemID`),
  CONSTRAINT `FK_menuindex_1` FOREIGN KEY (`moduleID`) REFERENCES `openhierarchy_foreground_modules` (`moduleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_2` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_3` FOREIGN KEY (`subSectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menuindex_4` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 206848 kB; (`sectionID`) REFER `foraldramotet-o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_menu_index`
--

LOCK TABLES `openhierarchy_menu_index` WRITE;
/*!40000 ALTER TABLE `openhierarchy_menu_index` DISABLE KEYS */;
INSERT INTO `openhierarchy_menu_index` VALUES (186,4,6,37,'se.unlogic.hierarchy.modules.menuadmin.MenuAdminModule',NULL,NULL),(188,4,26,39,'39',NULL,NULL),(190,1,53,NULL,NULL,4,NULL),(214,4,33,56,'56',NULL,NULL),(222,4,41,61,'61',NULL,NULL),(226,4,34,64,'64',NULL,NULL),(230,1,18,64,'64',NULL,NULL),(235,4,27,37,'37',NULL,NULL),(249,1,24,8,'8',NULL,NULL),(250,1,34,9,'9',NULL,NULL),(251,4,32,69,'69',NULL,NULL),(252,4,19,70,'70',NULL,NULL),(324,4,40,84,'84',NULL,NULL),(331,4,3,NULL,NULL,NULL,10),(346,4,10,95,'95',NULL,NULL),(347,1,37,39,'18',NULL,NULL),(348,1,38,39,'19',NULL,NULL),(373,4,25,109,'109',NULL,NULL),(375,1,43,116,'116',NULL,NULL),(377,1,52,123,'123',NULL,NULL),(382,1,47,NULL,NULL,NULL,14),(383,5,4,NULL,NULL,NULL,15),(386,1,51,133,'133',NULL,NULL),(387,4,43,150,'150',NULL,NULL),(389,4,44,160,'160',NULL,NULL),(391,5,5,NULL,NULL,NULL,18),(392,5,1,NULL,NULL,NULL,19),(393,1,49,39,'20',NULL,NULL),(400,1,45,168,'168',NULL,NULL),(401,1,46,172,'172',NULL,NULL),(402,1,48,174,'174',NULL,NULL),(403,4,18,176,'176',NULL,NULL),(405,1,54,39,'1',NULL,NULL),(407,5,6,39,'1',NULL,NULL),(409,1,55,39,'3',NULL,NULL),(411,4,45,186,'186',NULL,NULL),(413,4,46,108,'108',NULL,NULL),(415,1,56,125,'125',NULL,NULL);
/*!40000 ALTER TABLE `openhierarchy_menu_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_attributes`
--

DROP TABLE IF EXISTS `openhierarchy_section_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_attributes` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`sectionID`,`name`),
  CONSTRAINT `FK_openhierarchy_section_attributes_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_attributes`
--

LOCK TABLES `openhierarchy_section_attributes` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_section_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_groups`
--

DROP TABLE IF EXISTS `openhierarchy_section_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_groups` (
  `sectionID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`sectionID`,`groupID`),
  CONSTRAINT `FK_sectiongroups_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_groups`
--

LOCK TABLES `openhierarchy_section_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_groups` DISABLE KEYS */;
INSERT INTO `openhierarchy_section_groups` VALUES (4,6),(4,10);
/*!40000 ALTER TABLE `openhierarchy_section_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_section_users`
--

DROP TABLE IF EXISTS `openhierarchy_section_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_section_users` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sectionID`,`userID`),
  CONSTRAINT `FK_sectionusers_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_section_users`
--

LOCK TABLES `openhierarchy_section_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_section_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_section_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_sections`
--

DROP TABLE IF EXISTS `openhierarchy_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_sections` (
  `sectionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentSectionID` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `breadCrumb` tinyint(1) DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `anonymousDefaultURI` varchar(255) DEFAULT NULL,
  `userDefaultURI` varchar(255) DEFAULT NULL,
  `requiredProtocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sectionID`),
  UNIQUE KEY `Index_2` (`parentSectionID`,`alias`),
  CONSTRAINT `FK_sections_1` FOREIGN KEY (`parentSectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_sections`
--

LOCK TABLES `openhierarchy_sections` WRITE;
/*!40000 ALTER TABLE `openhierarchy_sections` DISABLE KEYS */;
INSERT INTO `openhierarchy_sections` VALUES (1,NULL,'home',1,1,1,1,0,1,'Home','Home section','/oversikt','/oversikt','HTTPS'),(4,1,'administration',1,0,0,1,1,1,'Systemadm.','Systemadministration och √∂vervakning','/sessionadmin','/sessionadmin',NULL),(5,1,'mypages',1,0,1,1,0,1,'Mina √§renden','Mina √§renden','/notset','/notset',NULL);
/*!40000 ALTER TABLE `openhierarchy_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_item_groups`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_item_groups` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`menuItemID`,`groupID`),
  CONSTRAINT `FK_virtualmenuitemgroups_1` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_item_groups`
--

LOCK TABLES `openhierarchy_virtual_menu_item_groups` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_item_users`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_item_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_item_users` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`menuItemID`,`userID`),
  CONSTRAINT `FK_virtualmenuitemusers_1` FOREIGN KEY (`menuItemID`) REFERENCES `openhierarchy_virtual_menu_items` (`menuItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_item_users`
--

LOCK TABLES `openhierarchy_virtual_menu_item_users` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_item_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openhierarchy_virtual_menu_items`
--

DROP TABLE IF EXISTS `openhierarchy_virtual_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openhierarchy_virtual_menu_items` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `url` text,
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuItemID`),
  KEY `FK_menuadmin_1` (`sectionID`),
  CONSTRAINT `FK_virtualmenuitems_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openhierarchy_virtual_menu_items`
--

LOCK TABLES `openhierarchy_virtual_menu_items` WRITE;
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_items` DISABLE KEYS */;
INSERT INTO `openhierarchy_virtual_menu_items` VALUES (10,'TITLE','Administration','Administration',NULL,0,0,0,4),(14,'SECTION','My favourites','My favourites','#menu-container.favourites',0,1,0,1),(15,'MENUITEM','My tasks','My tasks','/mysettings',0,1,1,5),(18,'MENUITEM','My companies','My companies','/myorganizations',0,1,1,5),(19,'MENUITEM','My applications','My applications','/flowinstances',0,1,1,5);
/*!40000 ALTER TABLE `openhierarchy_virtual_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_detail_queries`
--

DROP TABLE IF EXISTS `organization_detail_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_detail_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `helpText` text,
  `allowSMS` tinyint(1) unsigned NOT NULL,
  `requireAddress` tinyint(1) NOT NULL,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_detail_queries`
--

LOCK TABLES `organization_detail_queries` WRITE;
/*!40000 ALTER TABLE `organization_detail_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_detail_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_detail_query_instances`
--

DROP TABLE IF EXISTS `organization_detail_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_detail_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organizationNumber` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilePhone` varchar(255) DEFAULT NULL,
  `contactBySMS` tinyint(1) unsigned DEFAULT NULL,
  `organizationID` int(10) unsigned DEFAULT NULL,
  `persistOrganization` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_organization_detail_query_instances_1` (`queryID`),
  CONSTRAINT `FK_organization_detail_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `organization_detail_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_detail_query_instances`
--

LOCK TABLES `organization_detail_query_instances` WRITE;
/*!40000 ALTER TABLE `organization_detail_query_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization_detail_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_groups`
--

DROP TABLE IF EXISTS `page_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_groups` (
  `pageID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`pageID`,`groupID`),
  CONSTRAINT `FK_pagegroups_1` FOREIGN KEY (`pageID`) REFERENCES `pages` (`pageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_groups`
--

LOCK TABLES `page_groups` WRITE;
/*!40000 ALTER TABLE `page_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_users`
--

DROP TABLE IF EXISTS `page_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_users` (
  `pageID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pageID`,`userID`),
  CONSTRAINT `FK_pageusers_1` FOREIGN KEY (`pageID`) REFERENCES `pages` (`pageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_users`
--

LOCK TABLES `page_users` WRITE;
/*!40000 ALTER TABLE `page_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `pageID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `enabled` varchar(45) NOT NULL DEFAULT '',
  `visibleInMenu` tinyint(1) NOT NULL DEFAULT '0',
  `anonymousAccess` tinyint(1) NOT NULL DEFAULT '0',
  `userAccess` tinyint(1) NOT NULL DEFAULT '0',
  `adminAccess` tinyint(1) NOT NULL DEFAULT '0',
  `sectionID` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `breadCrumb` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pageID`),
  UNIQUE KEY `Index_3` (`sectionID`,`alias`),
  KEY `FK_pages_1` (`sectionID`),
  CONSTRAINT `FK_pages_1` FOREIGN KEY (`sectionID`) REFERENCES `openhierarchy_sections` (`sectionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 191488 kB; (`sectionID`) REFER `fkdb-system/sec';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (3,'Start page','This is a start page','<p>Welcome to the test environment of Open ePlatform!</p>\r\n','1',1,1,0,0,1,'/start',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_state_evaluator_alternatives`
--

DROP TABLE IF EXISTS `query_state_evaluator_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_state_evaluator_alternatives` (
  `evaluatorID` int(10) unsigned NOT NULL,
  `alternativeID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`evaluatorID`,`alternativeID`),
  CONSTRAINT `FK_query_state_evaluator_alternatives_1` FOREIGN KEY (`evaluatorID`) REFERENCES `query_state_evaluators` (`evaluatorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_state_evaluator_alternatives`
--

LOCK TABLES `query_state_evaluator_alternatives` WRITE;
/*!40000 ALTER TABLE `query_state_evaluator_alternatives` DISABLE KEYS */;
INSERT INTO `query_state_evaluator_alternatives` VALUES (1619,3061),(1621,3059),(1623,3059),(1625,3065),(1627,3067),(1629,3071),(1631,3073),(1633,3075),(1635,3079),(1637,3085),(1639,3087),(1641,3089),(1643,1369),(1645,3121),(1647,3127),(1649,3133),(1651,3137),(1653,3135),(1655,3135),(1657,3141),(1659,3143),(1661,3147),(1663,3149),(1665,3151),(1667,3155),(1669,3161),(1671,3163),(1673,3165),(1675,1417),(1677,3197),(1679,3203),(1681,3209);
/*!40000 ALTER TABLE `query_state_evaluator_alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_state_evaluators`
--

DROP TABLE IF EXISTS `query_state_evaluators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_state_evaluators` (
  `evaluatorID` int(10) unsigned NOT NULL,
  `selectionMode` varchar(45) NOT NULL,
  `queryState` varchar(45) NOT NULL,
  `doNotResetQueryState` tinyint(1) NOT NULL,
  PRIMARY KEY (`evaluatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_state_evaluators`
--

LOCK TABLES `query_state_evaluators` WRITE;
/*!40000 ALTER TABLE `query_state_evaluators` DISABLE KEYS */;
INSERT INTO `query_state_evaluators` VALUES (1617,'ANY','VISIBLE',0),(1619,'ANY','VISIBLE',0),(1621,'ANY','VISIBLE',0),(1623,'ANY','HIDDEN',0),(1625,'ANY','VISIBLE',0),(1627,'ANY','VISIBLE',0),(1629,'ANY','VISIBLE_REQUIRED',0),(1631,'ANY','VISIBLE_REQUIRED',0),(1633,'ANY','VISIBLE_REQUIRED',0),(1635,'ANY','VISIBLE_REQUIRED',0),(1637,'ANY','VISIBLE',0),(1639,'ANY','VISIBLE_REQUIRED',0),(1641,'ANY','VISIBLE_REQUIRED',0),(1643,'ANY','VISIBLE',0),(1645,'ANY','VISIBLE',0),(1647,'ANY','VISIBLE',0),(1649,'ANY','VISIBLE',0),(1651,'ANY','VISIBLE',0),(1653,'ANY','VISIBLE',0),(1655,'ANY','HIDDEN',0),(1657,'ANY','VISIBLE',0),(1659,'ANY','VISIBLE',0),(1661,'ANY','VISIBLE_REQUIRED',0),(1663,'ANY','VISIBLE_REQUIRED',0),(1665,'ANY','VISIBLE_REQUIRED',0),(1667,'ANY','VISIBLE_REQUIRED',0),(1669,'ANY','VISIBLE',0),(1671,'ANY','VISIBLE_REQUIRED',0),(1673,'ANY','VISIBLE_REQUIRED',0),(1675,'ANY','VISIBLE',0),(1677,'ANY','VISIBLE',0),(1679,'ANY','VISIBLE',0),(1681,'ANY','VISIBLE',0);
/*!40000 ALTER TABLE `query_state_evaluators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radio_button_queries`
--

DROP TABLE IF EXISTS `radio_button_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_button_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `freeTextAlternative` varchar(255) DEFAULT NULL,
  `helpText` text,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_button_queries`
--

LOCK TABLES `radio_button_queries` WRITE;
/*!40000 ALTER TABLE `radio_button_queries` DISABLE KEYS */;
INSERT INTO `radio_button_queries` VALUES (3839,'<p>H&auml;r anger du om din verksamhet har en fast adress eller kommer att flytta omkring!</p>',NULL,NULL),(3841,NULL,'Annat','<p>Som fordon r&auml;knas en anl&auml;ggning som f&auml;rdas p&aring; hjul, registrerad eller ej.</p>'),(3843,NULL,NULL,NULL),(3847,NULL,NULL,'<p>Observera att &auml;ven om din verksamhet bedrivs under kortare delar av &aring;ret s&aring; kan den bed&ouml;mas vara tillsvidare om den &aring;terkommer &aring;r efter &aring;r.</p>'),(3853,'<p>Med uppst&auml;llningsplats menas den plats d&auml;r du kommer att ha f&ouml;rs&auml;ljning t. ex. en torgplats.</p>',NULL,NULL),(3857,NULL,NULL,NULL),(3865,'<p>Kommer du i din verksamhet anv&auml;nda kommunalt eller eget vatten?</p>',NULL,NULL),(3869,'<p>Ange verksamhetens storlek, antingen antalet portioner som serveras per dag eller antalet personer som arbetar med livsmedel.</p>',NULL,NULL),(3871,NULL,NULL,'<p>Produktionens storlek per dag ber&auml;knas p&aring; &aring;rsbasis. Exempel: vid servering av 250 portioner per dag i en restaurang som har verksamhet under 3 m&aring;nader (ca 90 dagar) p&aring; ett &aring;r motsvarar (250 portioner per dag x 90 dagar ) / 365 dagar p&aring; ett &aring;r = 62 portioner per dag.</p>'),(3873,NULL,NULL,NULL),(3875,'<p>V&auml;nder sig din verksamhet <strong>huvudsakligen </strong>till k&auml;nsliga konsumenter som barn under 5 &aring;r, personer med nedsatt immunf&ouml;rsvar t ex gravida, patienter p&aring; sjukhus, &auml;ldreboende m.m. eller personer med livsmedelsrelaterad allergi.</p>',NULL,NULL),(3883,NULL,NULL,NULL),(3887,NULL,NULL,NULL),(3891,NULL,NULL,NULL),(3897,'<p>Please indicate whether your business has a permanent address or will be moving around !</p>',NULL,NULL),(3899,NULL,'Other','<p>A facility that travels on wheels, registered or not, is considered a &quot;vehicle&quot;</p>'),(3901,NULL,NULL,NULL),(3905,NULL,NULL,'<p>Please note that even if your business is conducted in shorter periods of the year it can be deemed permanent if it recurs year after year.</p>'),(3911,'<p>Location is the place where you will be selling e g a market place.</p>',NULL,NULL),(3915,NULL,NULL,NULL),(3923,'<p>Will you in your business use municipal or private water?</p>',NULL,NULL),(3927,'<p>Enter the size, either the number of portions served per day or the number of people working with food.</p>',NULL,NULL),(3929,NULL,NULL,'<p>Production size per day is calculated on an annual basis. Example: when serving 250 portions a day in a restaurant that has been operating for 3 months (about 90 days) in a year is equivalent to (250 servings per day x 90 days) / 365 days in a year = 62 servings per day.</p>'),(3931,NULL,NULL,NULL),(3933,'<p>Is your business mainly addressing sensitive consumers such as children under 5 years old, people with compromised immune systems such as pregnant women, patients in hospitals, nursing homes, etc. or people with food-related allergy.</p>',NULL,NULL),(3941,NULL,NULL,NULL),(3945,NULL,NULL,NULL),(3949,NULL,NULL,NULL),(3965,NULL,NULL,NULL);
/*!40000 ALTER TABLE `radio_button_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radio_button_query_alternatives`
--

DROP TABLE IF EXISTS `radio_button_query_alternatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_button_query_alternatives` (
  `alternativeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alternativeID`),
  KEY `FK_radio_button_query_alternatives_1` (`queryID`),
  CONSTRAINT `FK_radio_button_query_alternatives_1` FOREIGN KEY (`queryID`) REFERENCES `radio_button_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_button_query_alternatives`
--

LOCK TABLES `radio_button_query_alternatives` WRITE;
/*!40000 ALTER TABLE `radio_button_query_alternatives` DISABLE KEYS */;
INSERT INTO `radio_button_query_alternatives` VALUES (3059,3839,'Fast',0),(3061,3839,'Mobil (ex.marknadsst√•nd)',1),(3063,3841,'T√§lt/marknadsst√•nd',0),(3065,3841,'Fordon',1),(3067,3843,'Ja',0),(3069,3843,'Nej',1),(3071,3847,'Tillsvidare',0),(3073,3847,'Tidsbegr√§nsad',1),(3075,3853,'Ja',0),(3077,3853,'Nej',1),(3079,3857,'Ja',0),(3081,3857,'Nej',1),(3083,3865,'Kommunalt',0),(3085,3865,'Eget',1),(3087,3869,'Antal portioner som serveras per dag',0),(3089,3869,'Antal personer som arbetar med livsmedel',1),(3091,3871,'< 25',0),(3093,3871,'25 - 80',1),(3095,3871,'80 - 250',2),(3097,3871,'250 - 2 500',3),(3099,3871,'2 500 - 25 000',4),(3101,3871,'25 000 - 250 000',5),(3103,3873,'< 1',0),(3105,3873,'1 - 2',1),(3107,3873,'2 - 3',2),(3109,3873,'3 - 10',3),(3111,3873,'10 - 30',4),(3113,3873,'> 30',5),(3115,3875,'Ja',0),(3117,3875,'Nej',1),(3119,3883,'Ja',0),(3121,3883,'Nej',1),(3123,3887,'F√∂retagets adress',0),(3125,3887,'Verksamhetens adress',1),(3127,3887,'Annan adress',2),(3129,3891,'Verksamhetens adress',0),(3131,3891,'F√∂retagets adress',1),(3133,3891,'Annan adress',2),(3135,3897,'Fixed',0),(3137,3897,'Mobile service (eg market stalls)',1),(3139,3899,'Tent / Market stalls',0),(3141,3899,'Vehicle',1),(3143,3901,'Yes',0),(3145,3901,'No',1),(3147,3905,'Continuous',0),(3149,3905,'Time limited',1),(3151,3911,'Yes',0),(3153,3911,'No',1),(3155,3915,'Yes',0),(3157,3915,'No',1),(3159,3923,'Municipal',0),(3161,3923,'Private',1),(3163,3927,'Number of portions served per day',0),(3165,3927,'Number of people who work with food',1),(3167,3929,'< 25',0),(3169,3929,'25 - 80',1),(3171,3929,'80 - 250',2),(3173,3929,'250 - 2 500',3),(3175,3929,'2 500 - 25 000',4),(3177,3929,'25 000 - 250 000',5),(3179,3931,'< 1',0),(3181,3931,'1 - 2',1),(3183,3931,'2 - 3',2),(3185,3931,'3 - 10',3),(3187,3931,'10 - 30',4),(3189,3931,'> 30',5),(3191,3933,'Yes',0),(3193,3933,'No',1),(3195,3941,'Yes',0),(3197,3941,'No',1),(3199,3945,'Company address',0),(3201,3945,'Business address',1),(3203,3945,'Other address',2),(3205,3949,'Business address',0),(3207,3949,'Company address',1),(3209,3949,'Other address',2),(3217,3897,'None',2),(3219,3965,'Ja',0),(3221,3965,'nej',1);
/*!40000 ALTER TABLE `radio_button_query_alternatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radio_button_query_instances`
--

DROP TABLE IF EXISTS `radio_button_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_button_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  `alternativeID` int(10) unsigned DEFAULT NULL,
  `freeTextAlternativeValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_radio_button_query_instances_1` (`queryID`),
  KEY `FK_radio_button_query_instances_2` (`alternativeID`),
  CONSTRAINT `FK_radio_button_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `radio_button_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_radio_button_query_instances_2` FOREIGN KEY (`alternativeID`) REFERENCES `radio_button_query_alternatives` (`alternativeID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_button_query_instances`
--

LOCK TABLES `radio_button_query_instances` WRITE;
/*!40000 ALTER TABLE `radio_button_query_instances` DISABLE KEYS */;
INSERT INTO `radio_button_query_instances` VALUES (1,3839,3059,NULL),(3,3841,NULL,NULL),(5,3843,NULL,NULL),(9,3847,3071,NULL),(15,3853,NULL,NULL),(19,3857,3081,NULL),(27,3865,3083,NULL),(31,3869,3087,NULL),(33,3871,3091,NULL),(35,3873,NULL,NULL),(37,3875,3117,NULL),(45,3883,3119,NULL),(49,3887,3123,NULL),(53,3891,3129,NULL),(57,3839,3059,NULL),(59,3841,NULL,NULL),(61,3843,NULL,NULL),(65,3847,3071,NULL),(71,3853,NULL,NULL),(75,3857,3081,NULL),(83,3865,3083,NULL),(87,3869,3087,NULL),(89,3871,3093,NULL),(91,3873,NULL,NULL),(93,3875,3117,NULL),(101,3883,3119,NULL),(105,3887,3123,NULL),(109,3891,3131,NULL),(113,3965,3219,NULL),(115,3965,3221,NULL),(117,3897,NULL,NULL),(119,3899,NULL,NULL),(121,3901,NULL,NULL),(125,3905,3147,NULL),(131,3911,NULL,NULL),(135,3915,3157,NULL),(143,3923,3159,NULL),(147,3927,3165,NULL),(149,3929,NULL,NULL),(151,3931,3181,NULL),(153,3933,3193,NULL),(161,3941,NULL,NULL),(165,3945,NULL,NULL),(169,3949,NULL,NULL),(173,3897,3135,NULL),(175,3899,NULL,NULL),(177,3901,NULL,NULL),(181,3905,3147,NULL),(187,3911,NULL,NULL),(191,3915,NULL,NULL),(199,3923,3159,NULL),(203,3927,3163,NULL),(205,3929,3169,NULL),(207,3931,NULL,NULL),(209,3933,3191,NULL),(217,3941,NULL,NULL),(221,3945,NULL,NULL),(225,3949,NULL,NULL),(229,3897,3135,NULL),(231,3899,NULL,NULL),(233,3901,NULL,NULL),(237,3905,3147,NULL),(243,3911,NULL,NULL),(247,3915,NULL,NULL),(255,3923,3159,NULL),(259,3927,3165,NULL),(261,3929,NULL,NULL),(263,3931,3181,NULL),(265,3933,3193,NULL),(273,3941,NULL,NULL),(277,3945,NULL,NULL),(281,3949,NULL,NULL),(285,3897,3135,NULL),(287,3899,NULL,NULL),(289,3901,NULL,NULL),(293,3905,3147,NULL),(299,3911,NULL,NULL),(303,3915,NULL,NULL),(311,3923,NULL,NULL),(315,3927,3163,NULL),(317,3929,3171,NULL),(319,3931,NULL,NULL),(321,3933,3191,NULL),(329,3941,NULL,NULL),(333,3945,NULL,NULL),(337,3949,NULL,NULL),(341,3897,3135,NULL),(343,3899,NULL,NULL),(345,3901,NULL,NULL),(349,3905,3147,NULL),(355,3911,NULL,NULL),(359,3915,3157,NULL),(367,3923,3159,NULL),(371,3927,3163,NULL),(373,3929,3169,NULL),(375,3931,NULL,NULL),(377,3933,3193,NULL),(385,3941,NULL,NULL),(389,3945,NULL,NULL),(393,3949,NULL,NULL),(509,3897,3135,NULL),(511,3899,NULL,NULL),(513,3901,NULL,NULL),(517,3905,3147,NULL),(523,3911,NULL,NULL),(527,3915,3157,NULL),(535,3923,3159,NULL),(539,3927,3163,NULL),(541,3929,3169,NULL),(543,3931,NULL,NULL),(545,3933,3193,NULL),(553,3941,NULL,NULL),(557,3945,NULL,NULL),(561,3949,NULL,NULL);
/*!40000 ALTER TABLE `radio_button_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_group_attributes`
--

DROP TABLE IF EXISTS `simple_group_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_group_attributes` (
  `groupID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`groupID`,`name`),
  CONSTRAINT `FK_simple_group_attributes_1` FOREIGN KEY (`groupID`) REFERENCES `simple_groups` (`groupID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_group_attributes`
--

LOCK TABLES `simple_group_attributes` WRITE;
/*!40000 ALTER TABLE `simple_group_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_group_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_groups`
--

DROP TABLE IF EXISTS `simple_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_groups`
--

LOCK TABLES `simple_groups` WRITE;
/*!40000 ALTER TABLE `simple_groups` DISABLE KEYS */;
INSERT INTO `simple_groups` VALUES (6,'Systemadministrat√∂rer','Administrat√∂rer',1),(9,'Medborgare','Grupp f√∂r medborgare',1),(10,'E-tj√§nst administrat√∂rer','Grupp f√∂r anv√§ndare som ska f√• bygga e-tj√§nster',1),(11,'Handl√§ggare','Handl√§ggare',1);
/*!40000 ALTER TABLE `simple_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_user_attributes`
--

DROP TABLE IF EXISTS `simple_user_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_user_attributes` (
  `userID` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`userID`,`name`) USING BTREE,
  KEY `Index_2` (`name`),
  CONSTRAINT `FK_simple_user_attributes_1` FOREIGN KEY (`userID`) REFERENCES `simple_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_user_attributes`
--

LOCK TABLES `simple_user_attributes` WRITE;
/*!40000 ALTER TABLE `simple_user_attributes` DISABLE KEYS */;
INSERT INTO `simple_user_attributes` VALUES (3,'citizenIdentifier','19550206-1111');
/*!40000 ALTER TABLE `simple_user_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_user_groups`
--

DROP TABLE IF EXISTS `simple_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_user_groups` (
  `userID` int(10) unsigned NOT NULL,
  `groupID` int(10) NOT NULL,
  PRIMARY KEY (`userID`,`groupID`),
  KEY `FK_usergroups_2` (`groupID`),
  CONSTRAINT `FK_usergroups_1` FOREIGN KEY (`userID`) REFERENCES `simple_users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_user_groups`
--

LOCK TABLES `simple_user_groups` WRITE;
/*!40000 ALTER TABLE `simple_user_groups` DISABLE KEYS */;
INSERT INTO `simple_user_groups` VALUES (1,6),(3,6),(1,10),(3,10),(1,11),(3,11);
/*!40000 ALTER TABLE `simple_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_users`
--

DROP TABLE IF EXISTS `simple_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_users` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `language` varchar(76) DEFAULT NULL,
  `preferedDesign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_users`
--

LOCK TABLES `simple_users` WRITE;
/*!40000 ALTER TABLE `simple_users` DISABLE KEYS */;
INSERT INTO `simple_users` VALUES (1,'admin','6e2b592b196249838b312cfa026ebe2146dfa6dc','John','Doe','john.doe@oeplatform.org',1,1,'2008-01-27 19:43:42','2016-09-02 15:57:32',NULL,NULL),(3,'hilloo','003C9C95FCF2A1B02B8925AF5BD3BDBBD371AF20','Hillar','Loor','hillar@imcode.com',1,1,'2016-01-13 10:49:59','2016-04-26 07:47:26',NULL,NULL);
/*!40000 ALTER TABLE `simple_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_profile_domains`
--

DROP TABLE IF EXISTS `site_profile_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_profile_domains` (
  `profileID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  PRIMARY KEY (`profileID`,`domain`),
  CONSTRAINT `FK_site_profile_domains_1` FOREIGN KEY (`profileID`) REFERENCES `site_profiles` (`profileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_profile_domains`
--

LOCK TABLES `site_profile_domains` WRITE;
/*!40000 ALTER TABLE `site_profile_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_profile_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_profile_global_settings`
--

DROP TABLE IF EXISTS `site_profile_global_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_profile_global_settings` (
  `settingID` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `value` varchar(4096) NOT NULL,
  PRIMARY KEY (`settingID`,`sortIndex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_profile_global_settings`
--

LOCK TABLES `site_profile_global_settings` WRITE;
/*!40000 ALTER TABLE `site_profile_global_settings` DISABLE KEYS */;
INSERT INTO `site_profile_global_settings` VALUES ('bgmodule-4',1,'<p><img alt=\"\" height=\"68\" src=\"http://imcode.com/images/Hiemstra.png\" style=\"width: 362px; height: 68px;\" width=\"362\" ></p>\r\n<hr style=\"border-width: 4px; color:red;\" >\r\n<p>&nbsp;</p>\r\n'),('pdf.flowinstance.logo',1,'classpath://com/nordicpeak/flowengine/pdf/staticcontent/pics/logo.png'),('Test',1,'Profile');
/*!40000 ALTER TABLE `site_profile_global_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_profile_settings`
--

DROP TABLE IF EXISTS `site_profile_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_profile_settings` (
  `settingID` varchar(255) NOT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `value` varchar(4096) NOT NULL,
  `profileID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`settingID`,`sortIndex`,`profileID`) USING BTREE,
  KEY `FK_site_profile_settings_1` (`profileID`),
  CONSTRAINT `FK_site_profile_settings_1` FOREIGN KEY (`profileID`) REFERENCES `site_profiles` (`profileID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_profile_settings`
--

LOCK TABLES `site_profile_settings` WRITE;
/*!40000 ALTER TABLE `site_profile_settings` DISABLE KEYS */;
INSERT INTO `site_profile_settings` VALUES ('bgmodule-4',1,'<div><img alt=\"Logotyp\" height=\"68\" src=\"http://imcode.com/images/Hiemstra.png\" style=\"width: 362px; height: 68px;\" width=\"362\" ></div>\r\n<hr style=\"border-width: 4px; color:red;\" >\r\n<p>&nbsp;</p>\r\n',1),('pdf.flowinstance.logo',1,'classpath://com/nordicpeak/flowengine/pdf/staticcontent/pics/logo.png',1),('Test',1,'Hiemstra',1);
/*!40000 ALTER TABLE `site_profile_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_profiles`
--

DROP TABLE IF EXISTS `site_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_profiles` (
  `profileID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `design` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`profileID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_profiles`
--

LOCK TABLES `site_profiles` WRITE;
/*!40000 ALTER TABLE `site_profiles` DISABLE KEYS */;
INSERT INTO `site_profiles` VALUES (1,'HiemstraLogotyp','default (xsl/design.xsl)');
/*!40000 ALTER TABLE `site_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_versions`
--

DROP TABLE IF EXISTS `table_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_versions` (
  `tableGroupName` varchar(255) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tableGroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_versions`
--

LOCK TABLES `table_versions` WRITE;
/*!40000 ALTER TABLE `table_versions` DISABLE KEYS */;
INSERT INTO `table_versions` VALUES ('com.nordicpeak.flowengine.dao.FlowEngineDAOFactory',52),('com.nordicpeak.flowengine.evaluators.querystateevaluator.QueryStateEvaluationProviderModule',4),('com.nordicpeak.flowengine.flowsubmitsurveys.FeedbackFlowSubmitSurvey',2),('com.nordicpeak.flowengine.notifications.StandardFlowNotificationHandler',3),('com.nordicpeak.flowengine.queries.checkboxquery.CheckboxQueryProviderModule',7),('com.nordicpeak.flowengine.queries.contactdetailquery.ContactDetailQueryProviderModule',5),('com.nordicpeak.flowengine.queries.dropdownquery.DropDownQueryProviderModule',5),('com.nordicpeak.flowengine.queries.fileuploadquery.FileUploadQueryProviderModule',1),('com.nordicpeak.flowengine.queries.organizationdetailquery.OrganizationDetailQueryProviderModule',4),('com.nordicpeak.flowengine.queries.radiobuttonquery.RadioButtonQueryProviderModule',4),('com.nordicpeak.flowengine.queries.textareaquery.TextAreaQueryProviderModule',1),('com.nordicpeak.flowengine.queries.textfieldquery.TextFieldQueryProviderModule',3),('se.unlogic.hierarchy.core.daos.implementations.mysql.MySQLCoreDAOFactory',34),('se.unlogic.hierarchy.foregroundmodules.groupproviders.SimpleGroupProviderModule',3),('se.unlogic.hierarchy.foregroundmodules.pagemodules.daos.annotated.AnnotatedPageDAOFactory',3),('se.unlogic.hierarchy.foregroundmodules.userproviders.SimpleUserProviderModule',5),('se.unlogic.openhierarchy.foregroundmodules.siteprofile.SiteProfilesAdminModule',4);
/*!40000 ALTER TABLE `table_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_area_queries`
--

DROP TABLE IF EXISTS `text_area_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_area_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `helpText` text,
  `maxLength` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_area_queries`
--

LOCK TABLES `text_area_queries` WRITE;
/*!40000 ALTER TABLE `text_area_queries` DISABLE KEYS */;
INSERT INTO `text_area_queries` VALUES (3885,NULL,NULL,30),(3943,NULL,NULL,30);
/*!40000 ALTER TABLE `text_area_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_area_query_instances`
--

DROP TABLE IF EXISTS `text_area_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_area_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  `value` text,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_text_area_query_instances_1` (`queryID`),
  CONSTRAINT `FK_text_area_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `text_area_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_area_query_instances`
--

LOCK TABLES `text_area_query_instances` WRITE;
/*!40000 ALTER TABLE `text_area_query_instances` DISABLE KEYS */;
INSERT INTO `text_area_query_instances` VALUES (47,3885,NULL),(103,3885,NULL),(163,3943,NULL),(219,3943,NULL),(275,3943,NULL),(331,3943,NULL),(387,3943,NULL),(555,3943,NULL);
/*!40000 ALTER TABLE `text_area_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_field_queries`
--

DROP TABLE IF EXISTS `text_field_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_field_queries` (
  `queryID` int(10) unsigned NOT NULL,
  `description` text,
  `helpText` text,
  `layout` varchar(45) NOT NULL,
  PRIMARY KEY (`queryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_field_queries`
--

LOCK TABLES `text_field_queries` WRITE;
/*!40000 ALTER TABLE `text_field_queries` DISABLE KEYS */;
INSERT INTO `text_field_queries` VALUES (3835,NULL,NULL,'FLOAT'),(3845,NULL,NULL,'FLOAT'),(3849,NULL,NULL,'FLOAT'),(3851,NULL,NULL,'FLOAT'),(3855,NULL,NULL,'FLOAT'),(3859,NULL,NULL,'FLOAT'),(3867,'Det √§r den som √§ger och sk√∂ter om vattnet/vattent√§kten/brunnen som √§r ansvarig.',NULL,'FLOAT'),(3877,NULL,'<p>Det &auml;r f&ouml;retagets/firmans namn som ska registreras, inte namnet p&aring; verksamheten (Om det inte &auml;r samma namn). Fr&aring;ga om annat verksamhetsnamn kommer senare.</p>','FLOAT'),(3881,NULL,NULL,'FLOAT'),(3889,NULL,NULL,'FLOAT'),(3893,NULL,NULL,'FLOAT'),(3895,NULL,NULL,'FLOAT'),(3903,NULL,NULL,'FLOAT'),(3907,NULL,NULL,'FLOAT'),(3909,NULL,NULL,'FLOAT'),(3913,NULL,NULL,'FLOAT'),(3917,NULL,NULL,'FLOAT'),(3925,'<p>The person that owns and manages the water / aquifer / well is responsible.</p>',NULL,'FLOAT'),(3935,NULL,'<p>It is the company / firm&#39;s name that must be registered, not the name of the business (if it is not the same name). Questions about alternative business names will come later.</p>','FLOAT'),(3939,NULL,NULL,'FLOAT'),(3947,NULL,NULL,'FLOAT'),(3951,NULL,NULL,'FLOAT');
/*!40000 ALTER TABLE `text_field_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_field_query_instance_values`
--

DROP TABLE IF EXISTS `text_field_query_instance_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_field_query_instance_values` (
  `textFieldValueID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queryInstanceID` int(10) unsigned NOT NULL,
  `textFieldID` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`textFieldValueID`),
  KEY `FK_text_field_query_instance_values_1` (`queryInstanceID`),
  KEY `FK_text_field_query_instance_values_2` (`textFieldID`),
  CONSTRAINT `FK_text_field_query_instance_values_1` FOREIGN KEY (`queryInstanceID`) REFERENCES `text_field_query_instances` (`queryInstanceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_text_field_query_instance_values_2` FOREIGN KEY (`textFieldID`) REFERENCES `text_fields` (`textFieldID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_field_query_instance_values`
--

LOCK TABLES `text_field_query_instance_values` WRITE;
/*!40000 ALTER TABLE `text_field_query_instance_values` DISABLE KEYS */;
INSERT INTO `text_field_query_instance_values` VALUES (1,11,2763,'2016-01-01'),(3,39,2785,'asas'),(5,39,2787,'5502061111'),(7,39,2789,'12qwq'),(9,39,2791,'11122'),(11,39,2793,'visby'),(13,67,2763,'2016-05-01'),(15,95,2785,'TEst'),(17,95,2787,'550206-1111'),(19,95,2789,'12121'),(21,95,2791,'123465'),(23,95,2793,'VISBY'),(25,95,2795,'hillar'),(27,95,2797,'123456'),(29,95,2801,'hillar@loor.se'),(31,127,2841,'√•√§√∂'),(33,155,2863,'test1'),(35,155,2865,'1212'),(37,155,2867,'test1√•√§√∂'),(39,155,2869,'12'),(41,155,2871,'test1'),(43,183,2841,'3'),(45,211,2863,'company'),(47,211,2865,'company'),(49,211,2867,'Address'),(51,211,2869,'Address'),(53,211,2871,'City'),(55,239,2841,'day'),(57,267,2863,'√•√§√∂'),(59,267,2865,'√•√§√∂'),(61,267,2867,'√•√§√∂'),(63,267,2869,'√•√§√∂'),(65,267,2871,'√•√§√∂'),(67,295,2841,'Start date'),(69,323,2863,'√É¬•√É¬§√É¬∂'),(71,323,2865,'√É¬•√É¬§√É¬∂'),(73,323,2867,'√É¬•√É¬§√É¬∂'),(75,323,2869,'√É¬•√É¬§√É¬∂'),(77,323,2871,'√É¬•√É¬§√É¬∂'),(79,351,2841,'65'),(81,379,2863,'test2√É¬•'),(83,379,2865,'54'),(85,379,2867,'√É¬•√É¬§√É¬∂'),(87,379,2869,'43'),(89,379,2871,'pi√É¬∂√É¬§√É¬•'),(91,519,2841,'87'),(93,547,2863,'test'),(95,547,2865,'98'),(97,547,2867,'√•√§√∂test5'),(99,547,2869,'98'),(101,547,2871,'test5');
/*!40000 ALTER TABLE `text_field_query_instance_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_field_query_instances`
--

DROP TABLE IF EXISTS `text_field_query_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_field_query_instances` (
  `queryInstanceID` int(10) unsigned NOT NULL,
  `queryID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`queryInstanceID`),
  KEY `FK_text_field_query_instances_1` (`queryID`),
  CONSTRAINT `FK_text_field_query_instances_1` FOREIGN KEY (`queryID`) REFERENCES `text_field_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_field_query_instances`
--

LOCK TABLES `text_field_query_instances` WRITE;
/*!40000 ALTER TABLE `text_field_query_instances` DISABLE KEYS */;
INSERT INTO `text_field_query_instances` VALUES (7,3845),(63,3845),(11,3849),(67,3849),(13,3851),(69,3851),(17,3855),(73,3855),(21,3859),(77,3859),(29,3867),(85,3867),(39,3877),(95,3877),(43,3881),(99,3881),(51,3889),(107,3889),(55,3893),(111,3893),(123,3903),(179,3903),(235,3903),(291,3903),(347,3903),(515,3903),(127,3907),(183,3907),(239,3907),(295,3907),(351,3907),(519,3907),(129,3909),(185,3909),(241,3909),(297,3909),(353,3909),(521,3909),(133,3913),(189,3913),(245,3913),(301,3913),(357,3913),(525,3913),(137,3917),(193,3917),(249,3917),(305,3917),(361,3917),(529,3917),(145,3925),(201,3925),(257,3925),(313,3925),(369,3925),(537,3925),(155,3935),(211,3935),(267,3935),(323,3935),(379,3935),(547,3935),(159,3939),(215,3939),(271,3939),(327,3939),(383,3939),(551,3939),(167,3947),(223,3947),(279,3947),(335,3947),(391,3947),(559,3947),(171,3951),(227,3951),(283,3951),(339,3951),(395,3951),(563,3951);
/*!40000 ALTER TABLE `text_field_query_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_fields`
--

DROP TABLE IF EXISTS `text_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_fields` (
  `textFieldID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `sortIndex` int(10) unsigned NOT NULL,
  `formatValidator` varchar(255) DEFAULT NULL,
  `queryID` int(10) unsigned NOT NULL,
  `maxContentLength` int(10) unsigned DEFAULT NULL,
  `invalidFormatMessage` varchar(255) DEFAULT NULL,
  `setAsAttribute` tinyint(1) NOT NULL,
  `attributeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`textFieldID`),
  KEY `FK_text_fields_1` (`queryID`),
  CONSTRAINT `FK_text_fields_1` FOREIGN KEY (`queryID`) REFERENCES `text_field_queries` (`queryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2910 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_fields`
--

LOCK TABLES `text_fields` WRITE;
/*!40000 ALTER TABLE `text_fields` DISABLE KEYS */;
INSERT INTO `text_fields` VALUES (2757,'Gata',1,NULL,1,NULL,3835,NULL,NULL,0,NULL),(2759,'Postnummer',0,NULL,2,NULL,3835,NULL,NULL,0,NULL),(2761,'Registreringsnummer',0,NULL,1,NULL,3845,8,NULL,0,NULL),(2763,'Startdatum',1,NULL,1,NULL,3849,15,NULL,0,NULL),(2765,'Startdatum',1,NULL,1,NULL,3851,15,NULL,0,NULL),(2767,'Slutdatum',1,NULL,2,NULL,3851,15,NULL,0,NULL),(2769,'Adress',0,NULL,1,NULL,3855,NULL,NULL,0,NULL),(2771,'Postnummer',0,NULL,2,NULL,3855,NULL,NULL,0,NULL),(2773,'Postort',0,NULL,3,NULL,3855,NULL,NULL,0,NULL),(2775,'Adress',0,NULL,1,NULL,3859,NULL,NULL,0,NULL),(2777,'Postnummer',0,NULL,2,NULL,3859,NULL,NULL,0,NULL),(2779,'Postort',0,NULL,3,NULL,3859,NULL,NULL,0,NULL),(2781,'Namn',0,NULL,0,NULL,3867,NULL,NULL,0,NULL),(2783,'Telefonnummer',0,NULL,2,NULL,3867,NULL,NULL,0,NULL),(2785,'F√∂retagets namn',1,NULL,1,NULL,3877,NULL,NULL,0,NULL),(2787,'Organisationsnummer (personnummer vid enskild firma)',1,NULL,2,NULL,3877,NULL,NULL,0,NULL),(2789,'Adress',1,NULL,3,NULL,3877,NULL,NULL,0,NULL),(2791,'Postnummer',1,NULL,4,NULL,3877,NULL,NULL,0,NULL),(2793,'Postort',1,NULL,5,NULL,3877,NULL,NULL,0,NULL),(2795,'Firmatecknare',0,NULL,6,NULL,3877,NULL,NULL,0,NULL),(2797,'Telefonnummer',0,NULL,7,NULL,3877,NULL,NULL,0,NULL),(2799,'Mobilnummer',0,NULL,8,NULL,3877,NULL,NULL,0,NULL),(2801,'e-post',0,NULL,9,NULL,3877,NULL,NULL,0,NULL),(2803,'F√∂rnamn',0,NULL,1,NULL,3881,NULL,NULL,0,NULL),(2805,'Efternamn',0,NULL,2,NULL,3881,NULL,NULL,0,NULL),(2807,'Telefon-/mobilnummer',0,NULL,3,NULL,3881,NULL,NULL,0,NULL),(2809,'e-post',0,NULL,4,NULL,3881,NULL,NULL,0,NULL),(2811,'Namn',0,NULL,1,NULL,3889,NULL,NULL,0,NULL),(2813,'Adress',0,NULL,2,NULL,3889,NULL,NULL,0,NULL),(2815,'Postnummer',0,NULL,3,NULL,3889,NULL,NULL,0,NULL),(2817,'Postort',0,NULL,4,NULL,3889,NULL,NULL,0,NULL),(2819,'M√§rkning av faktura/referensnummer',0,NULL,5,NULL,3889,NULL,NULL,0,NULL),(2821,'Namn',0,NULL,1,NULL,3893,NULL,NULL,0,NULL),(2823,'Adress',0,NULL,2,NULL,3893,NULL,NULL,0,NULL),(2825,'Postnummer',0,NULL,3,NULL,3893,NULL,NULL,0,NULL),(2827,'Postort',0,NULL,4,NULL,3893,NULL,NULL,0,NULL),(2829,'F√∂rnamn',1,NULL,1,NULL,3895,NULL,NULL,0,NULL),(2831,'Efternamn',1,NULL,2,NULL,3895,NULL,NULL,0,NULL),(2833,'Adress',0,NULL,3,NULL,3895,NULL,NULL,0,NULL),(2835,'Postnummer',0,NULL,4,NULL,3895,NULL,NULL,0,NULL),(2837,'Stad',1,NULL,5,NULL,3895,NULL,NULL,0,NULL),(2839,'Registration number',0,NULL,1,NULL,3903,12,NULL,0,NULL),(2841,'Start date',1,NULL,1,NULL,3907,15,NULL,0,NULL),(2843,'Start date',1,NULL,1,NULL,3909,15,NULL,0,NULL),(2845,'End date',1,NULL,2,NULL,3909,15,NULL,0,NULL),(2847,'Address',0,NULL,0,NULL,3913,NULL,NULL,0,NULL),(2849,'Zip code',0,NULL,2,NULL,3913,NULL,NULL,0,NULL),(2851,'City',0,NULL,3,NULL,3913,NULL,NULL,0,NULL),(2853,'Address',0,NULL,1,NULL,3917,NULL,NULL,0,NULL),(2855,'Zip code',0,NULL,2,NULL,3917,NULL,NULL,0,NULL),(2857,'City',0,NULL,3,NULL,3917,NULL,NULL,0,NULL),(2859,'Name',0,NULL,0,NULL,3925,NULL,NULL,0,NULL),(2861,'Phone number',0,NULL,2,NULL,3925,NULL,NULL,0,NULL),(2863,'Company name',1,NULL,1,NULL,3935,NULL,NULL,0,NULL),(2865,'Reg no',1,NULL,2,NULL,3935,NULL,NULL,0,NULL),(2867,'Address',1,NULL,3,NULL,3935,NULL,NULL,0,NULL),(2869,'Zip code',1,NULL,4,NULL,3935,NULL,NULL,0,NULL),(2871,'City',1,NULL,5,NULL,3935,NULL,NULL,0,NULL),(2873,'Authorized signer',0,NULL,6,NULL,3935,NULL,NULL,0,NULL),(2875,'Phone number',0,NULL,7,NULL,3935,NULL,NULL,0,NULL),(2877,'Mobile phone number',0,NULL,8,NULL,3935,NULL,NULL,0,NULL),(2879,'E-mail',0,NULL,9,NULL,3935,NULL,NULL,0,NULL),(2881,'First name',0,NULL,1,NULL,3939,NULL,NULL,0,NULL),(2883,'Last name',0,NULL,2,NULL,3939,NULL,NULL,0,NULL),(2885,'Phone / mobile phone number',0,NULL,3,NULL,3939,NULL,NULL,0,NULL),(2887,'E-mail',0,NULL,4,NULL,3939,NULL,NULL,0,NULL),(2889,'Name',0,NULL,1,NULL,3947,NULL,NULL,0,NULL),(2891,'Address',0,NULL,2,NULL,3947,NULL,NULL,0,NULL),(2893,'Zip code',0,NULL,3,NULL,3947,NULL,NULL,0,NULL),(2895,'City',0,NULL,4,NULL,3947,NULL,NULL,0,NULL),(2897,'Invoice mark or reference number',0,NULL,5,NULL,3947,NULL,NULL,0,NULL),(2899,'Name',0,NULL,1,NULL,3951,NULL,NULL,0,NULL),(2901,'Address',0,NULL,2,NULL,3951,NULL,NULL,0,NULL),(2903,'Zip code',0,NULL,3,NULL,3951,NULL,NULL,0,NULL),(2905,'City',0,NULL,4,NULL,3951,NULL,NULL,0,NULL),(2907,'Postadree',1,NULL,3,NULL,3835,NULL,NULL,0,NULL),(2909,'c/o address',0,NULL,1,NULL,3913,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `text_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-05 11:15:04
