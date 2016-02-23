CREATE DATABASE  IF NOT EXISTS `traindb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `traindb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: traindb
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
-- Table structure for table `public_transport`
--

DROP TABLE IF EXISTS `public_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_transport` (
  `vehicle_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asset_id` bigint(20) NOT NULL,
  `manufacturer_code` varchar(20) NOT NULL,
  `vehicle_type_code` varchar(20) NOT NULL,
  `ownership` varchar(20) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `record_modification_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_transport`
--

LOCK TABLES `public_transport` WRITE;
/*!40000 ALTER TABLE `public_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_vehicle_manufactures`
--

DROP TABLE IF EXISTS `ref_vehicle_manufactures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_vehicle_manufactures` (
  `manufacturer_code` varchar(20) NOT NULL,
  `manufacturer_name` varchar(25) DEFAULT NULL,
  `manufacturer_country` varchar(25) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `record_modification_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`manufacturer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_vehicle_manufactures`
--

LOCK TABLES `ref_vehicle_manufactures` WRITE;
/*!40000 ALTER TABLE `ref_vehicle_manufactures` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_vehicle_manufactures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_vehicle_type`
--

DROP TABLE IF EXISTS `ref_vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_vehicle_type` (
  `vehicle_type_code` varchar(20) NOT NULL,
  `vehicle_desc` varchar(25) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `record_modification_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_vehicle_type`
--

LOCK TABLES `ref_vehicle_type` WRITE;
/*!40000 ALTER TABLE `ref_vehicle_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `train_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(25) DEFAULT NULL,
  `train_operator` varchar(25) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `record_modification_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tram`
--

DROP TABLE IF EXISTS `tram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tram` (
  `tram_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tram_name` varchar(25) DEFAULT NULL,
  `tram_operator` varchar(25) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `record_modification_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tram`
--

LOCK TABLES `tram` WRITE;
/*!40000 ALTER TABLE `tram` DISABLE KEYS */;
/*!40000 ALTER TABLE `tram` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-23 20:46:51
