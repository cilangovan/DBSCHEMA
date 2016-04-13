CREATE DATABASE  IF NOT EXISTS `sample` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sample`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sample
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `boxplot`
--

DROP TABLE IF EXISTS `boxplot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxplot` (
  `category` varchar(40) DEFAULT NULL,
  `median` int(11) DEFAULT NULL,
  `p25` int(11) DEFAULT NULL,
  `p75` int(11) DEFAULT NULL,
  `p5` int(11) DEFAULT NULL,
  `p95` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxplot`
--

LOCK TABLES `boxplot` WRITE;
/*!40000 ALTER TABLE `boxplot` DISABLE KEYS */;
INSERT INTO `boxplot` VALUES ('Mechanical',50,40,60,30,70),('Electrical',80,65,95,45,97),('Engine',50,45,56,20,63),('Signaling',35,25,42,18,54);
/*!40000 ALTER TABLE `boxplot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kmeansout`
--

DROP TABLE IF EXISTS `kmeansout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kmeansout` (
  `cluster` int(11) DEFAULT NULL,
  `tweet_content` varchar(780) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kmeansout`
--

LOCK TABLES `kmeansout` WRITE;
/*!40000 ALTER TABLE `kmeansout` DISABLE KEYS */;
INSERT INTO `kmeansout` VALUES (1,'8 Strategies To Future-Proof Your Technology via @forbes https://t.co/iBYphmDAGp @jamespentaho shares #3 to allow plug-ins &amp; extensions'),(1,'RT @Pentaho: .@HDScorp CEO Jack Domme taking the stage during today’s Women at Hitachi event! https://t.co/1vz7oJba2Q'),(1,'RT @SaschaOehl: .HDScorp\'s HSP is a building block for infrastructure says BizCloudNews. https://t.co/4pZxdgK2Kg #BigData #IoT https://t.co…'),(1,'.HDScorp\'s HSP is a building block for infrastructure says BizCloudNews. https://t.co/4pZxdgK2Kg #BigData #IoT https://t.co/bFAI3he5uj'),(1,'#Dashboarding #BI: Learn how can you create amazing charts with @FusionCharts Plugin for @Pentaho [Free Download] https://t.co/vhSHEpOy8d'),(3,'RT @CorinOConnell: Congrats on being recognized as the leaders you are, to my friends @Pentaho #BigData #Analytics  https://t.co/YaY0iKjAPJ'),(3,'RT @CorinOConnell: Congrats on being recognized as the leaders you are, to my friends @Pentaho #BigData #Analytics  https://t.co/t51UwRqkaG'),(3,'RT @CorinOConnell: Congrats on being recognized as the leaders you are, to my friends @Pentaho #BigData #Analytics  https://t.co/t51UwRqkaG'),(4,'.@Pentaho recognized as #GartnerMQ Visionary for #businessintelligence and analytics https://t.co/Krzfitjr7S https://t.co/yZQLRuzTSC'),(1,'RT @Pentaho: .@HDScorp CEO Jack Domme taking the stage during today’s Women at Hitachi event! https://t.co/1vz7oJba2Q'),(3,'RT @ErgoRenova: Pentaho Named a Visionary in 2016 Gartner Magic Quadrant for Business Intelligence and Analytics Platforms: https://t.co/D5…'),(1,'RT @Pentaho: RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.c…'),(3,'Pentaho Named a Visionary in 2016 Gartner Magic Quadrant for Business Intelligence and Analytics Platforms: https://t.co/D5QhpFeVmS'),(1,'RT @Pentaho: RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.c…'),(1,'RT @Pentaho: RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.c…'),(5,'RT @diethardsteiner: A first look at @mattcasters efforts to bring Unit Testing functionality to #pentaho Data Integration: https://t.co/2g…'),(1,'RT @Pentaho: 5, 4, 3, 2, 1 - very cool! RT @pmalves: New #Pentaho #Ctools releases: Commencing Countdown, Engines on - https://t.co/IyaZtpj…'),(1,'@HDScorp delivers platform for #big data, powered by @Pentaho -https://t.co/CusMZXjN2r'),(1,'RT @Pentaho: RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.c…'),(1,'How are people capitalizing on #BigData? Enter Hyper Scale-out Platform (#HSP) + @Pentaho https://t.co/7UBUMRV38P https://t.co/W2p7I8WvW6'),(1,'RT @Pentaho: RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.c…'),(4,'.@Pentaho recognized as #GartnerMQ Visionary for #businessintelligence and analytics https://t.co/2hGkE8Ztql'),(1,'RT @jmartinter: Great Kappa Architecture talk in #pentaho #madrid meetup. I really enjoyed it! Kudos @juantomas'),(1,'RT CorinOConnell: Why does Gartner call Pentaho #Visionary in #MagicQuadrant? EddieWhite1 shares at #HDSGSI2016 https://t.co/HyTf3ByJGz'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 shares at #HDSGSI2016 https://t.co/VYcHhEbT6z'),(1,'RT @Pentaho: 5, 4, 3, 2, 1 - very cool! RT @pmalves: New #Pentaho #Ctools releases: Commencing Countdown, Engines on - https://t.co/IyaZtpj…'),(1,'RT @Pentaho: 5, 4, 3, 2, 1 - very cool! RT @pmalves: New #Pentaho #Ctools releases: Commencing Countdown, Engines on - https://t.co/IyaZtpj…'),(1,'RT @DatalyticsBI: Paso a paso para configurar Amazon Redshift Cluster y acceder con Pentaho Kettle https://t.co/9YuLbvnYCv #Cloud #AWS http…'),(1,'RT @Intellipaat: #businessIntelligence Simplify Any Data, Any Analytics | #Pentaho https://t.co/0IPCRlbU7d'),(4,'RT @standure: Who is the New visionary for #businessintelligence and analytics as per #GartnerMQ 2016 https://t.co/pt85tjZ7Ll https://t.co/…'),(7,'RT @infobrainbug: Our #BI is about making dry figures accessible, useful to the right audience within an enterprise #Pentaho #Bigdata https…'),(7,'Our #BI is about making dry figures accessible, useful to the right audience within an enterprise #Pentaho #Bigdata https://t.co/Be045NWBXd'),(4,'RT @fredhds: .@Pentaho recognized as #GartnerMQ Visionary for #businessintelligence and analytics https://t.co/Xwej0pszFg https://t.co/38TQ…'),(4,'RT @standure: Who is the New visionary for #businessintelligence and analytics as per #GartnerMQ 2016 https://t.co/pt85tjZ7Ll https://t.co/…'),(4,'RT @standure: Who is the New visionary for #businessintelligence and analytics as per #GartnerMQ 2016 https://t.co/pt85tjZ7Ll https://t.co/…'),(4,'Who is the New visionary for #businessintelligence and analytics as per #GartnerMQ 2016 https://t.co/pt85tjZ7Ll https://t.co/CoGCh1168s'),(1,'RT @Pentaho: [WEBINAR] Bringing everything together for actionable insights. Register today: https://t.co/RH0yps557U #Analytics https://t.c…'),(1,'RT @Pentaho: .@HDScorp CEO Jack Domme taking the stage during today’s Women at Hitachi event! https://t.co/1vz7oJba2Q'),(1,'Have you noticed new look @Ashnikbiz Times? Pl Gives us feedback. News about #BigData #Pentaho #PostgreSQL #digital https://t.co/bTl9Wg3qWP'),(1,'RT @luclemagnifique: Creating your own @MondrianOLAP dialect for @Pentaho explained and demonstrated. https://t.co/CFkm1kS4aT'),(5,'RT @diethardsteiner: A first look at @mattcasters efforts to bring Unit Testing functionality to #pentaho Data Integration: https://t.co/2g…'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(5,'RT @diethardsteiner: A first look at @mattcasters efforts to bring Unit Testing functionality to #pentaho Data Integration: https://t.co/2g…'),(7,'RT @HDSGlobalAccts: Matthias talks to our GSI Partners about our UCP for #SAP HANA. Innovating for our customers #HDSGSI2016 #pentaho https…'),(3,'RT @CorinOConnell: Congrats on being recognized as the leaders you are, to my friends @Pentaho #BigData #Analytics  https://t.co/t51UwRqkaG'),(3,'Congrats on being recognized as the leaders you are, to my friends @Pentaho #BigData #Analytics  https://t.co/t51UwRqkaG'),(1,'RT @Pentaho: RT @EddieWhite1: TechRadar from Forrester at #HDSGSI2016   Shows Pentaho at the crest of the wave. https://t.co/DYMpqmgHTp'),(1,'RT @Pentaho: .@HDScorp CEO Jack Domme taking the stage during today’s Women at Hitachi event! https://t.co/1vz7oJba2Q'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t…'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(1,'RT @CorinOConnell: @EddieWhite1 tells how @Pentaho helps \"find the needle\" &amp; send crooks to jail #HDSGSI2016 #Finra #BigData @HDScorp https…'),(2,'Integrate, Analyze and Visualize your Batman with @Pentaho #HDSGSI2016 Hadoop is better and easier now.'),(3,'RT @CorinOConnell: Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https…'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t…'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(1,'RT @CorinOConnell: @EddieWhite1 tells how @Pentaho helps \"find the needle\" &amp; send crooks to jail #HDSGSI2016 #Finra #BigData @HDScorp https…'),(7,'RT @HDSGlobalAccts: Matthias talks to our GSI Partners about our UCP for #SAP HANA. Innovating for our customers #HDSGSI2016 #pentaho https…'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t…'),(7,'RT @HDSGlobalAccts: Matthias talks to our GSI Partners about our UCP for #SAP HANA. Innovating for our customers #HDSGSI2016 #pentaho https…'),(7,'RT @HDSGlobalAccts: Matthias talks to our GSI Partners about our UCP for #SAP HANA. Innovating for our customers #HDSGSI2016 #pentaho https…'),(7,'Matthias talks to our GSI Partners about our UCP for #SAP HANA. Innovating for our customers #HDSGSI2016 #pentaho https://t.co/qzCMs0YkIE'),(6,'RT @BhavyaJohar: @EddieWhite1 shows @Pentaho unlimited capabilities at #HDSGSI2016 https://t.co/RjoCo7bPhl'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(3,'RT @CorinOConnell: Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https…'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t…'),(3,'RT @CorinOConnell: Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https…'),(1,'.HDScorp CEO Jack Domme taking the stage during today’s Women at Hitachi event! https://t.co/747NylTI86'),(1,'RT @ablettHDS: Great panel discussion and interaction with our GSI partners &amp; @HDScorp @Pentaho at GSI Summit Columbo #HDSGSI2016 https://t…'),(1,'RT @mayaculas: Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(1,'RT @CorinOConnell: Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t…'),(6,'RT @BhavyaJohar: @EddieWhite1 shows @Pentaho unlimited capabilities at #HDSGSI2016 https://t.co/RjoCo7bPhl'),(3,'RT @CorinOConnell: Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https…'),(1,'@EddieWhite1 tells how @Pentaho helps \"find the needle\" &amp; send crooks to jail #HDSGSI2016 #Finra #BigData @HDScorp https://t.co/VKof7f1BBV'),(1,'Eddie White on how US banks use big data #HDSGSI2016 @HDScorp @Pentaho https://t.co/nmjNBmfAzM'),(1,'Why does Gartner call @Pentaho #Visionary in #MagicQuadrant? @EddieWhite1 talks time to insight at #HDSGSI2016 https://t.co/mqcB4NnY4a'),(3,'RT @CorinOConnell: Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https…'),(2,'Integrate, Analyze and Visualize your Big Data with @Pentaho  #HDSGSI2016 Hadoop is better and easier now.'),(6,'RT @BhavyaJohar: @EddieWhite1 shows @Pentaho unlimited capabilities at #HDSGSI2016 https://t.co/RjoCo7bPhl'),(6,'@EddieWhite1 shows @Pentaho unlimited capabilities at #HDSGSI2016 https://t.co/RjoCo7bPhl'),(1,'@Pentaho enables IoT and Big Data.  @EddieWhite1 shows and how at #HDSGSI2016'),(3,'Dream of consolidating 1000s of databases? @Pentaho makes it real. @EddieWhite1 shares how at #HDSGSI2016 #BigData https://t.co/EKAxvR483L'),(1,'@EddieWhite1 takes stage showcasing @Pentaho capabilities and potential #unlimitedopportunities at #HDSGSI2016'),(1,'RT @psawkar: @HDSCorp @Pentaho, key player for success of #IOT Platform #HDSGSI2016'),(1,'RT @psawkar: @HDSCorp #HDSGSI2016 Great panel discussion #socialinnovation @naveenchhabra @MikeWalkeyHDS,@MarkAblett03,@Pentaho https://t.c…'),(1,'RT @Pentaho: RT @EddieWhite1: TechRadar from Forrester at #HDSGSI2016   Shows Pentaho at the crest of the wave. https://t.co/DYMpqmgHTp'),(1,'RT @psawkar: @HDScorp leverages its big data and #socialinnovation labs to generate a fair idea of what the customer wants.#HDSGSI2016 @Pen…'),(3,'RT @SaschaOehl: .Pentaho recognized as #GartnerMQ Visionary based on ability to execute &amp; vision https://t.co/8rDVMFs1yV https://t.co/H9i7j…'),(3,'RT @SaschaOehl: .Pentaho recognized as #GartnerMQ Visionary based on ability to execute &amp; vision https://t.co/8rDVMFs1yV https://t.co/H9i7j…');
/*!40000 ALTER TABLE `kmeansout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `ID_BATCH` int(11) DEFAULT NULL,
  `CHANNEL_ID` varchar(255) DEFAULT NULL,
  `TRANSNAME` varchar(255) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `LINES_READ` bigint(20) DEFAULT NULL,
  `LINES_WRITTEN` bigint(20) DEFAULT NULL,
  `LINES_UPDATED` bigint(20) DEFAULT NULL,
  `LINES_INPUT` bigint(20) DEFAULT NULL,
  `LINES_OUTPUT` bigint(20) DEFAULT NULL,
  `LINES_REJECTED` bigint(20) DEFAULT NULL,
  `ERRORS` bigint(20) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `LOGDATE` datetime DEFAULT NULL,
  `DEPDATE` datetime DEFAULT NULL,
  `REPLAYDATE` datetime DEFAULT NULL,
  `LOG_FIELD` mediumtext,
  KEY `IDX_log_1` (`ID_BATCH`),
  KEY `IDX_log_2` (`ERRORS`,`STATUS`,`TRANSNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (0,'db740d10-50dd-4a7b-9952-8bdcf7ba9338','scd','end',0,0,0,6,7,0,0,'1899-12-31 23:00:00','2016-03-17 15:36:11','2016-03-17 15:36:12','2016-03-17 15:36:11','2016-03-17 15:36:11','2016/03/17 15:36:11 - Spoon - Transformation opened.\r\n2016/03/17 15:36:11 - Spoon - Launching transformation [scd]...\r\n2016/03/17 15:36:11 - Spoon - Started the transformation execution.\r\n2016/03/17 15:36:11 - scd - Dispatching started for transformation [scd]\r\n2016/03/17 15:36:11 - Get System Info.0 - Finished processing (I=0, O=0, R=1, W=1, U=0, E=0)\r\n2016/03/17 15:36:11 - Table input.0 - Finished reading query, closing connection.\r\n2016/03/17 15:36:11 - Table input.0 - Finished processing (I=6, O=0, R=1, W=6, U=0, E=0)\r\n2016/03/17 15:36:11 - Sort rows.0 - Finished processing (I=0, O=0, R=6, W=6, U=0, E=0)\r\n2016/03/17 15:36:11 - Text file output.0 - Finished processing (I=0, O=7, R=6, W=6, U=0, E=0)\r\n\r\nEND\r\n'),(1,'684c1d39-bf5d-4a77-af87-f9d75fec19e6','scd','end',0,0,0,0,0,0,0,'2016-03-17 15:36:11','2016-03-17 15:37:17','2016-03-17 15:37:17','2016-03-17 15:37:17','2016-03-17 15:37:17','2016/03/17 15:37:17 - Spoon - Transformation opened.\r\n2016/03/17 15:37:17 - Spoon - Launching transformation [scd]...\r\n2016/03/17 15:37:17 - Spoon - Started the transformation execution.\r\n2016/03/17 15:37:17 - scd - Dispatching started for transformation [scd]\r\n2016/03/17 15:37:17 - Get System Info.0 - Finished processing (I=0, O=0, R=1, W=1, U=0, E=0)\r\n2016/03/17 15:37:17 - Table input.0 - Finished reading query, closing connection.\r\n2016/03/17 15:37:17 - Table input.0 - Finished processing (I=0, O=0, R=1, W=0, U=0, E=0)\r\n\r\nEND\r\n'),(2,'9e23a010-f951-498b-a30f-03ace6d0df14','scd','end',0,0,0,0,0,0,0,'2016-03-17 15:37:17','2010-01-23 00:00:00','2016-03-17 15:41:07','2010-01-23 00:00:00','2010-01-23 00:00:00','2016/03/17 15:41:06 - Spoon - Transformation opened.\r\n2016/03/17 15:41:06 - Spoon - Launching transformation [scd]...\r\n2016/03/17 15:41:06 - Spoon - Started the transformation execution.\r\n2016/03/17 15:41:06 - scd - Dispatching started for transformation [scd]\r\n2016/03/17 15:41:06 - Get System Info.0 - Finished processing (I=0, O=0, R=1, W=1, U=0, E=0)\r\n2016/03/17 15:41:06 - Table input.0 - Finished reading query, closing connection.\r\n2016/03/17 15:41:06 - Table input.0 - Finished processing (I=0, O=0, R=1, W=0, U=0, E=0)\r\n\r\nEND\r\n'),(3,'051f5bce-c524-42f0-9fdd-700273e890a1','scd','end',0,0,0,0,0,0,0,'2010-01-23 00:00:00','2010-01-23 00:00:00','2016-03-17 15:41:35','2010-01-23 00:00:00','2010-01-23 00:00:00','2016/03/17 15:41:34 - Spoon - Transformation opened.\r\n2016/03/17 15:41:34 - Spoon - Launching transformation [scd]...\r\n2016/03/17 15:41:34 - Spoon - Started the transformation execution.\r\n2016/03/17 15:41:34 - scd - Dispatching started for transformation [scd]\r\n2016/03/17 15:41:34 - Get System Info.0 - Finished processing (I=0, O=0, R=1, W=1, U=0, E=0)\r\n2016/03/17 15:41:34 - Table input.0 - Finished reading query, closing connection.\r\n2016/03/17 15:41:34 - Table input.0 - Finished processing (I=0, O=0, R=1, W=0, U=0, E=0)\r\n\r\nEND\r\n');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `population`
--

DROP TABLE IF EXISTS `population`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `population` (
  `id` int(11) NOT NULL,
  `country` text NOT NULL,
  `state` text NOT NULL,
  `city` text NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `population`
--

LOCK TABLES `population` WRITE;
/*!40000 ALTER TABLE `population` DISABLE KEYS */;
INSERT INTO `population` VALUES (1,'UK','Yorkshire','Leeds',3857800),(2,'UK','Midlands','Birmingham',825863),(3,'UK','London','Surrey',5974),(4,'UK','London','Kent',2390),(5,'UK','Wales','Cardiff',2564);
/*!40000 ALTER TABLE `population` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `date` datetime DEFAULT NULL,
  `product_type` varchar(45) DEFAULT NULL,
  `sales` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('2010-01-20 00:00:00','Shoes',234),('2010-01-20 00:00:00','Cheese',456),('2010-01-21 00:00:00','Shoes',256),('2010-01-21 00:00:00','Cheese',156),('2010-01-22 00:00:00','Shoes',535),('2010-01-23 00:00:00','Cheese',433);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordcloud`
--

DROP TABLE IF EXISTS `wordcloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordcloud` (
  `word` varchar(180) DEFAULT NULL,
  `wordFreq` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordcloud`
--

LOCK TABLES `wordcloud` WRITE;
/*!40000 ALTER TABLE `wordcloud` DISABLE KEYS */;
INSERT INTO `wordcloud` VALUES ('pentaho',89),('hdsgsi',47),('eddiewhit',30),('visionari',24),('corinoconnel',23),('hdscorp',22),('bigdata',20),('analyt',16),('data',15),('gartner',15),('share',14),('call',13),('magicquadr',13),('talk',12),('recogn',10),('gartnermq',9),('about',8),('businessintellig',8),('make',8),('bank',7),('eddi',7),('insight',7),('show',7),('time',7),('white',7),('consolid',6),('custom',6),('databas',6),('dream',6),('mayacula',6),('partner',6),('real',6),('stage',6),('take',6),('capabl',5),('congrat',5),('domm',5),('dure',5),('event',5),('friend',5),('hana',5),('hitachi',5),('innov',5),('integr',5),('jack',5),('leader',5),('matthia',5),('platform',5),('today’',5),('women',5),('bring',4),('hdsglobalacct',4),('look',4),('unlimit',4),('with',4),('your',4);
/*!40000 ALTER TABLE `wordcloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sample'
--

--
-- Dumping routines for database 'sample'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-13  9:55:34
