CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bill` (
  `bill_id` int NOT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `chef_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `cuisine` varchar(45) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `phno` bigint DEFAULT NULL,
  PRIMARY KEY (`chef_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (101,'Sunil',45000,'chinese',3,'male',7895672341),(102,'Rahul',30000,'south indian',2,'male',6783458761),(103,'Sonali',60000,'italian',5,'female',4672874671),(104,'Ratan',50000,'north indian',4,'male',7491089563),(105,'Reshma',45000,'lebanese',4,'female',9284820818),(106,'priya',45000,'chinese',4,'female',6284673829),(107,'prakash',80000,'italian',6,'male',7295728472),(108,'tom',60000,'american',3,'male',8629852983),(109,'divya',80000,'desserts',4,'female',7436372366);
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consists of`
--

DROP TABLE IF EXISTS `consists of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consists of` (
  `meal_id` int DEFAULT NULL,
  `ing_id` int DEFAULT NULL,
  KEY `meal_idx` (`meal_id`),
  KEY `ing_idx` (`ing_id`),
  CONSTRAINT `ing` FOREIGN KEY (`ing_id`) REFERENCES `ingredients` (`ingredients_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `meal` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consists of`
--

LOCK TABLES `consists of` WRITE;
/*!40000 ALTER TABLE `consists of` DISABLE KEYS */;
INSERT INTO `consists of` VALUES (601,201),(601,201),(601,206),(601,207),(601,204),(601,210),(602,201),(602,219),(602,202),(602,204),(602,210),(602,207),(602,206),(602,208),(602,211),(603,217),(603,220),(603,212),(603,209),(604,203),(604,204),(604,210),(604,214),(604,216),(605,201),(605,211),(606,204),(606,210),(606,213),(606,216),(607,203),(607,215),(608,203),(608,215),(609,202),(609,204),(609,210),(609,216),(609,206),(610,204),(610,206),(610,210),(611,202),(611,207),(611,210),(611,216),(611,206),(612,208),(612,205),(612,218),(613,219),(613,206),(613,211),(613,204),(614,201),(614,217),(614,219),(614,209),(615,201),(615,208),(615,209),(615,218);
/*!40000 ALTER TABLE `consists of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phno` bigint DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (3001,'harsha',3425678392,'31/2 RT road Bangalore'),(3002,'chandan',2345287492,'21/34 MR road Bangalore'),(3003,'atharv',5573948930,'39/21 CT road Bangalore '),(3004,'puneeth',8757294759,'21/32 MM road Mysore'),(3005,'ishaan',8583957602,'90/11 KR road Tumkur'),(3006,'isha',7391257295,'21//33 LT road Davangere'),(3007,'ram',7382957482,'43/22 RR road Bangalore'),(3008,'geetha',8147483028,'56/5 MK road Bangalore'),(3009,'suresh',8472857692,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredients_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shelf_life` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ingredients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (201,'flour','1 year'),(202,'noodles','1 year'),(203,'rice','2 years'),(204,'vegetables','1 week'),(205,'fruits','1 week'),(206,'sauces','10 months'),(207,'cheese','2 months'),(208,'milk','1 week'),(209,'sugar','1 year'),(210,'spices','2 years'),(211,'butter','1 month'),(212,'ice cream','1 month'),(213,'chicken','1 week'),(214,'mutton','1 week'),(215,'lentils','2 years'),(216,'greens','4 days'),(217,'chocholates','5 months'),(218,'eggs','2 weeks'),(219,'bread','3 days'),(220,'biscuits ','1 month');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `chef_id` int DEFAULT NULL,
  `cuisine` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (601,'pizza',103,'italian',450),(602,'pasta',107,'italian',350),(603,'chocolate milkshake',109,'desserts',200),(604,'biryani',104,'north indian',400),(605,'roti',104,'north indian',100),(606,'curry',104,'north indian',200),(607,'idly',102,'south indian',100),(608,'dosa',102,'south indian',150),(609,'noodles',101,'chinese',300),(610,'manchurian',106,'chinese',280),(611,'mac and cheese',108,'american',370),(612,'panna cota',107,'italian',260),(613,'sandwich ',103,'american',250),(614,'brownies',109,'desserts',180),(615,'cake',109,'desserts',180);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `customer_id` int DEFAULT NULL,
  `meal_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  KEY `cust_idx` (`customer_id`),
  KEY `bill_idx` (`bill_id`),
  KEY `meal_idx` (`meal_id`),
  CONSTRAINT `bill` FOREIGN KEY (`bill_id`) REFERENCES `Bill` (`bill_id`),
  CONSTRAINT `cust` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `meals` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provides`
--

DROP TABLE IF EXISTS `provides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provides` (
  `supplier id` int DEFAULT NULL,
  `ingredients id` int DEFAULT NULL,
  KEY `supp_idx` (`supplier id`),
  KEY `ing_idx` (`ingredients id`),
  CONSTRAINT `ings` FOREIGN KEY (`ingredients id`) REFERENCES `ingredients` (`ingredients_id`),
  CONSTRAINT `supp` FOREIGN KEY (`supplier id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provides`
--

LOCK TABLES `provides` WRITE;
/*!40000 ALTER TABLE `provides` DISABLE KEYS */;
INSERT INTO `provides` VALUES (402,202),(401,201),(402,202),(401,203),(402,202),(403,204),(402,205),(411,206),(430,207),(404,208),(406,209),(409,210),(407,211),(404,212),(408,213),(407,214),(412,215),(411,216),(411,218),(416,219),(415,220),(420,202),(423,204),(424,207),(426,208),(427,209),(427,210),(430,211),(421,212),(411,213),(421,214),(412,215),(406,216),(409,217),(410,218),(411,219),(412,220),(413,212),(414,201),(415,220),(416,211),(417,213),(421,203),(422,211),(405,206),(402,209);
/*!40000 ALTER TABLE `provides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `chef_id` int DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `chef_id_idx` (`chef_id`),
  CONSTRAINT `chef_supplier` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (401,'yashas','bangalore',102),(402,'manas','chennai',NULL),(403,'vineeth','delhi',NULL),(404,'pankaj','mumbai',NULL),(405,'ankit','pune',NULL),(406,'prajwal','hyderabad',NULL),(407,'raghu','bangalore',NULL),(408,'bhuvan','vizag',NULL),(409,'bushan','mysore',NULL),(410,'barath','mysore',NULL),(411,'bhanu','delhi',NULL),(412,'bushan','bangalore',NULL),(413,'prateek','delhi',NULL),(414,'pavan','chennai',NULL),(415,'ritviz','pune',NULL),(416,'ganesh','bangalore',NULL),(417,'jhon','mumbai',NULL),(418,'bhasker','delhi',NULL),(419,'vijay','delhi',NULL),(420,'surya','pune',NULL),(421,'karthik','bangalore',NULL),(422,'kiran','mysore',NULL),(423,'indira','pune',NULL),(424,'sonia','hyderabad',NULL),(425,'mahesh','chennai',NULL),(426,'manasa','chennai',NULL),(427,'vishnu','delhi',NULL),(428,'chaitra','bangalore',NULL),(429,'pranav','mumbai',NULL),(430,'pruthvik','pune',NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 13:26:56
