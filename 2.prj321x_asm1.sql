CREATE DATABASE `prj321x_asm1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prj321x_asm1`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prj321x_asm1
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `donation`
--


DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organization_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `visible` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,'QGLL01','2023-03-14 09:18:27','Quyên góp giúp đỡ đồng bào vùng bị lũ lụt.','2023-03-16','2023-03-30',300000000,'Quyên góp lũ lụt','Hội hỗ trợ mùa lũ','0287413695',4,1),(3,'QGNTT01','2023-03-15 10:09:20','Quỹ xây dựng nhà tình thương cho bà con nghèo khó khăn.','2023-03-02','2023-03-30',0,'Xây dựng nhà tình thương','Hội từ thiện','0987456321',3,1),(4,'QGNG01','2023-03-15 13:47:35','Chăm sóc người già neo đơn.','2023-03-25','2023-04-07',11000000,'Chăm sóc người già neo đơn','Hội người cao tuổi','0245612398',2,1),(5,'QGKH01','2023-03-15 21:09:20','Quỹ khuyến học cho trẻ em vùng cao.','2023-03-17','2023-03-19',0,'Quỹ khuyến học trẻ em vùng cao','Quang Phương Group','0979189790',1,1),(6,'QGTE01','2023-03-15 22:18:31','Từ thiện giúp đỡ trẻ em nghèo.','2023-03-17','2023-03-23',5000000,'Giúp đỡ trẻ em nghèo','Hội từ thiện','0781236549',2,1),(7,'QGMT01','2023-03-16 15:12:22','Quỹ bảo vệ môi trường.','2023-03-14','2023-04-29',0,'Quỹ bảo vệ môi trường','Quang Phương Group','0979189790',1,1),(9,'test','2023-03-16 23:07:22','hr','2023-03-16','2023-03-23',0,'từ thiện 32','qp','356',1,0);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'User'),(2,'Admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`role_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Hồ Chí Minh','phuongnq1809@gmail.com','Nguyễn Quang Phương',NULL,'phuongnq','1','0979189790',1,'2023-03-16 08:22:30',2),(2,'Hồ Chí Minh','trungkien@gmail.com','Nguyễn Kiên',NULL,'trungkien','1','2346667890',1,'2023-03-16 08:23:31',1),(3,'Hồ Chí Minh','tamnguyen@gmail.com','Tâm Nguyễn',NULL,'tamnguyen','1','0345612378',1,'2023-03-16 08:24:16',1),(4,'Hồ Chí Minh','lienpham@gmail.com','Liên Phạm',NULL,'lienpham','1','0123456789',1,'2023-03-16 08:25:39',1),(5,'Hà Nội','test@gmail.com','Test User',NULL,'test','1','0147852369',0,'2023-03-16 08:26:16',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_donation`
--

DROP TABLE IF EXISTS `user_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `donation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER` (`user_id`),
  KEY `FK_DONATION` (`donation_id`),
  CONSTRAINT `FK_DONATION` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_donation`
--

LOCK TABLES `user_donation` WRITE;
/*!40000 ALTER TABLE `user_donation` DISABLE KEYS */;
INSERT INTO `user_donation` VALUES (1,'2023-03-16 18:53:18',500000,'Tesst',1,'wgweg',4,4),(2,'2023-03-16 18:55:25',250000,'abc',0,'hserhrtj',4,6),(3,'2023-03-16 18:56:05',5000000,'nguyễn phương',1,'quyên góp cho trẻ em nghèo',4,6),(4,'2023-03-16 19:01:46',500000,'tgh',1,'quyên góp.',4,4),(5,'2023-03-17 00:53:34',500000,'liên',0,'sdfh',4,4),(6,'2023-03-17 00:55:25',10000000,'Quang Phương',1,'quyên góp giúp đỡ người già neo đơn, có hoàn cảnh khó khăn.',4,4);
/*!40000 ALTER TABLE `user_donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 10:36:36
