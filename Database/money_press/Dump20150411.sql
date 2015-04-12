-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: money_press
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Groceries'),(2,'Bills'),(3,'Entertainment'),(4,'Restaurants'),(5,'Paycheck');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `sku` int(11) DEFAULT NULL,
  `receipt_name` int(11) DEFAULT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `items_receipt_names_fk_idx` (`receipt_name`),
  CONSTRAINT `items_receipt_names_fk` FOREIGN KEY (`receipt_name`) REFERENCES `receipt_names` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,123,1,'Milk'),(2,123,2,'Milk'),(3,NULL,NULL,'Power'),(4,NULL,NULL,'Cracker Barrel'),(5,NULL,NULL,'Carmike Cinemas 14'),(6,NULL,NULL,'Paycheck');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `person` int(11) NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `logins_people_fk_idx` (`person`),
  CONSTRAINT `logins_people_fk` FOREIGN KEY (`person`) REFERENCES `people` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'Dranthe','Jonathan.James.Stewart@gmail.com','KRAG00dner',1),(2,'KelliBean',NULL,'JJSt3wart',2);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Jonathan','James','Stewart'),(2,'Kelli',NULL,'Stewart');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people2personal_values`
--

DROP TABLE IF EXISTS `people2personal_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people2personal_values` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `person` int(11) NOT NULL,
  `personal_value` int(11) NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `people2personal_values_people_fk_idx` (`person`),
  KEY `people2personal_values_personal_values_fk_idx` (`personal_value`),
  CONSTRAINT `people2personal_values_people_fk` FOREIGN KEY (`person`) REFERENCES `people` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `people2personal_values_personal_values_fk` FOREIGN KEY (`personal_value`) REFERENCES `personal_values` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people2personal_values`
--

LOCK TABLES `people2personal_values` WRITE;
/*!40000 ALTER TABLE `people2personal_values` DISABLE KEYS */;
INSERT INTO `people2personal_values` VALUES (1,1,1),(2,1,2),(3,2,1);
/*!40000 ALTER TABLE `people2personal_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_values`
--

DROP TABLE IF EXISTS `personal_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_values` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_values`
--

LOCK TABLES `personal_values` WRITE;
/*!40000 ALTER TABLE `personal_values` DISABLE KEYS */;
INSERT INTO `personal_values` VALUES (1,'Checking'),(2,'Savings');
/*!40000 ALTER TABLE `personal_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_names`
--

DROP TABLE IF EXISTS `receipt_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_names` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_names`
--

LOCK TABLES `receipt_names` WRITE;
/*!40000 ALTER TABLE `receipt_names` DISABLE KEYS */;
INSERT INTO `receipt_names` VALUES (1,'mlk_2'),(2,'mlk_2_pct');
/*!40000 ALTER TABLE `receipt_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `person` int(11) NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `transactions_people_fk_idx` (`person`),
  CONSTRAINT `transactions_people_fk` FOREIGN KEY (`person`) REFERENCES `people` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions2categories`
--

DROP TABLE IF EXISTS `transactions2categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions2categories` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `transactions2categories_categories_fk_idx` (`category`),
  KEY `transactions2categories_transactions_fk_idx` (`transaction`),
  CONSTRAINT `transactions2categories_categories_fk` FOREIGN KEY (`category`) REFERENCES `categories` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transactions2categories_transactions_fk` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions2categories`
--

LOCK TABLES `transactions2categories` WRITE;
/*!40000 ALTER TABLE `transactions2categories` DISABLE KEYS */;
INSERT INTO `transactions2categories` VALUES (1,1,1),(2,1,2),(3,3,3),(4,2,4),(5,4,5);
/*!40000 ALTER TABLE `transactions2categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions2items`
--

DROP TABLE IF EXISTS `transactions2items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions2items` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `amount` decimal(10,0) unsigned zerofill NOT NULL,
  `is_credit` tinyint(1) NOT NULL,
  PRIMARY KEY (`pk`),
  KEY `transactions2items_transactions_fk_idx` (`transaction`),
  KEY `transactions2items_items_fk_idx` (`item`),
  CONSTRAINT `transactions2items_items_fk` FOREIGN KEY (`item`) REFERENCES `items` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transactions2items_transactions_fk` FOREIGN KEY (`transaction`) REFERENCES `transactions` (`pk`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions2items`
--

LOCK TABLES `transactions2items` WRITE;
/*!40000 ALTER TABLE `transactions2items` DISABLE KEYS */;
INSERT INTO `transactions2items` VALUES (1,1,1,0000000005,1),(2,1,3,0000000090,1),(3,2,4,0000000020,1),(4,3,5,0000000020,1),(5,4,6,0000000400,0);
/*!40000 ALTER TABLE `transactions2items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-11 22:22:37
