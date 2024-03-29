﻿-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: dms
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `st_id` int NOT NULL,
  `cust_id` int NOT NULL,
  `m_id` int NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`b_id`),
  KEY `fk_billst_id_staffid` (`st_id`),
  KEY `fk_billmilk_id_milkid` (`m_id`),
  KEY `fk_billcust_id_custid` (`cust_id`),
  CONSTRAINT `fk_billcust_id_custid` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_billmilk_id_milkid` FOREIGN KEY (`m_id`) REFERENCES `milk` (`m_id`),
  CONSTRAINT `fk_billst_id_staffid` FOREIGN KEY (`st_id`) REFERENCES `staff` (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (2013,902,1207,1502,8.00,528.00,'2022-01-24'),(2014,908,1208,1501,10.00,600.00,'2022-01-26'),(2015,908,1208,1504,9.00,1350.00,'2022-01-26'),(2016,901,1209,1503,12.00,552.00,'2022-01-26'),(2017,901,1208,1502,15.00,990.00,'2022-01-26'),(2018,902,1209,1503,8.00,368.00,'2022-03-25');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `br_id` int NOT NULL AUTO_INCREMENT,
  `br_name` varchar(20) NOT NULL,
  `br_address` varchar(30) NOT NULL,
  PRIMARY KEY (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (501,'Amul','Mangalore'),(502,'Nandi','Puttur'),(503,'Laxmi','Belthangdy'),(504,'Hassan','Sullia'),(510,'Kamadenu','Ujire');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
-- Create New Customer
CREATE TABLE `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(20) NOT NULL,
  `cust_phone` varchar(14) NOT NULL,
  `br_id` int NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `fk_customerbr_id_branchid` (`br_id`),
  CONSTRAINT `fk_customerbr_id_branchid` FOREIGN KEY (`br_id`) REFERENCES `branch` (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1207,'Saad','9916930711',503,'Mangalore'),(1208,'Nithin','7341559837',510,'Ujire'),(1209,'Ajay','8431128267',502,'Puttur'),(1210,'Suraj','7878965412',502,'kota');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `mg_id` int NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(20) NOT NULL,
  `mg_email` varchar(30) NOT NULL,
  `mg_password` varchar(20) NOT NULL,
  PRIMARY KEY (`mg_id`),
  UNIQUE KEY `mg_email` (`mg_email`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (101,'Nithin','nk123@mail.com','9999'),(104,'Akhil','akhil@123.com','7777');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milk`
--

DROP TABLE IF EXISTS `milk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milk` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_type` varchar(20) NOT NULL,
  `amt_per_liter` decimal(10,2) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milk`
--

LOCK TABLES `milk` WRITE;
/*!40000 ALTER TABLE `milk` DISABLE KEYS */;
INSERT INTO `milk` VALUES (1501,'Buffalo',60.00),(1502,'Toned Milk',66.00),(1503,'Cow',46.00),(1504,'Goat',150.00);
/*!40000 ALTER TABLE `milk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `st_id` int NOT NULL AUTO_INCREMENT,
  `st_name` varchar(20) NOT NULL,
  `st_email` varchar(30) NOT NULL,
  `st_password` varchar(20) NOT NULL,
  `st_phone` varchar(14) NOT NULL,
  `br_id` int NOT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `st_email` (`st_email`),
  KEY `fk_staffbr_id_branchid` (`br_id`),
  CONSTRAINT `fk_staffbr_id_branchid` FOREIGN KEY (`br_id`) REFERENCES `branch` (`br_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (901,'Akhil','akhil@mail.com','1122','9449564734',501),(902,'Jaideep','Jaideep@gmail.com','2121','987456332',501),(903,'Hari','Hari@123','5555','9481123564',503),(908,'Manoj','manoj@outlook.com','mmmm','9658235866',510),(909,'Gotham','gotham@gmail.com','9988','7456987456',502);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-29 20:31:30
