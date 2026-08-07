CREATE DATABASE  IF NOT EXISTS `literacy_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `literacy_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: literacy_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add lab exercise',7,'add_labexercise'),(26,'Can change lab exercise',7,'change_labexercise'),(27,'Can delete lab exercise',7,'delete_labexercise'),(28,'Can view lab exercise',7,'view_labexercise'),(29,'Can add module',8,'add_module'),(30,'Can change module',8,'change_module'),(31,'Can delete module',8,'delete_module'),(32,'Can view module',8,'view_module'),(33,'Can add lab red flag',9,'add_labredflag'),(34,'Can change lab red flag',9,'change_labredflag'),(35,'Can delete lab red flag',9,'delete_labredflag'),(36,'Can view lab red flag',9,'view_labredflag'),(37,'Can add lab submission',10,'add_labsubmission'),(38,'Can change lab submission',10,'change_labsubmission'),(39,'Can delete lab submission',10,'delete_labsubmission'),(40,'Can view lab submission',10,'view_labsubmission'),(41,'Can add lesson',11,'add_lesson'),(42,'Can change lesson',11,'change_lesson'),(43,'Can delete lesson',11,'delete_lesson'),(44,'Can view lesson',11,'view_lesson'),(45,'Can add quiz question',12,'add_quizquestion'),(46,'Can change quiz question',12,'change_quizquestion'),(47,'Can delete quiz question',12,'delete_quizquestion'),(48,'Can view quiz question',12,'view_quizquestion'),(49,'Can add quiz submission',13,'add_quizsubmission'),(50,'Can change quiz submission',13,'change_quizsubmission'),(51,'Can delete quiz submission',13,'delete_quizsubmission'),(52,'Can view quiz submission',13,'view_quizsubmission'),(53,'Can add user profile',14,'add_userprofile'),(54,'Can change user profile',14,'change_userprofile'),(55,'Can delete user profile',14,'delete_userprofile'),(56,'Can view user profile',14,'view_userprofile'),(57,'Can add user lesson progress',15,'add_userlessonprogress'),(58,'Can change user lesson progress',15,'change_userlessonprogress'),(59,'Can delete user lesson progress',15,'delete_userlessonprogress'),(60,'Can view user lesson progress',15,'view_userlessonprogress'),(61,'Can add certificate',16,'add_certificate'),(62,'Can change certificate',16,'change_certificate'),(63,'Can delete certificate',16,'delete_certificate'),(64,'Can view certificate',16,'view_certificate'),(65,'Can add lab',7,'add_lab'),(66,'Can change lab',7,'change_lab'),(67,'Can delete lab',7,'delete_lab'),(68,'Can view lab',7,'view_lab'),(69,'Can add lab result',10,'add_labresult'),(70,'Can change lab result',10,'change_labresult'),(71,'Can delete lab result',10,'delete_labresult'),(72,'Can view lab result',10,'view_labresult'),(73,'Can add progress',15,'add_progress'),(74,'Can change progress',15,'change_progress'),(75,'Can delete progress',15,'delete_progress'),(76,'Can view progress',15,'view_progress'),(77,'Can add quiz result',13,'add_quizresult'),(78,'Can change quiz result',13,'change_quizresult'),(79,'Can delete quiz result',13,'delete_quizresult'),(80,'Can view quiz result',13,'view_quizresult'),(81,'Can add red flag',9,'add_redflag'),(82,'Can change red flag',9,'change_redflag'),(83,'Can delete red flag',9,'delete_redflag'),(84,'Can view red flag',9,'view_redflag'),(85,'Can add question',17,'add_question'),(86,'Can change question',17,'change_question'),(87,'Can delete question',17,'delete_question'),(88,'Can view question',17,'view_question');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$0c0loEnqYJNBfgWBk30lFg$3vdqG+EIGJWLgQNCrFlllMGvJL8JJ/6FGth4STCGCV0=','2026-07-21 07:48:29.397998',1,'admin','','','renishamondi@gmail.com',1,1,'2026-06-23 12:51:44.054228'),(14,'pbkdf2_sha256$1000000$LgIJLlzBIbVCWrnppMHvsD$kVZJqwS8oO99AiJQBnrzFllxnK8CaKGbIQW2Zm4WbVM=',NULL,0,'mwangi','Mwangi','Ngugi','mwangi@example.com',0,1,'2025-10-12 00:00:00.000000'),(15,'pbkdf2_sha256$1000000$d2NEUrD6ebm5DHXuVXajVu$mkNlGvJOJVxtQlRaiENIWe5OQtrrfR8xiSUNrarmlqg=',NULL,0,'cherono','Cherono','Koech','cherono@example.com',0,1,'2025-11-19 00:00:00.000000'),(16,'pbkdf2_sha256$1000000$vEZFePyKZHS3ZgtVSGjD2i$c4yKiq4Clm0+rqrXVxPrf444gmwOCY2gNLgddwZPhmQ=',NULL,0,'nekesa','Nekesa','Nafula','nekesa@example.com',0,1,'2025-12-24 00:00:00.000000'),(17,'pbkdf2_sha256$1000000$avoh6mrVAytAbznBNMtmIR$yN1Ks1xFg1FubsN0Nc6FOxt7ClSy6hRpBiwnOxg0dqw=',NULL,0,'amara','Amara','Diallo','amara@example.com',0,1,'2026-01-10 00:00:00.000000'),(18,'pbkdf2_sha256$1000000$Tsppo2zYqhtwQpsHoP6mg2$sg0Gy1stKrWdHR1FZTRfyA5e3KYrJJNH89573123iLQ=',NULL,0,'fatima','Fatima','Al-Rashid','fatima@example.com',0,1,'2026-02-15 00:00:00.000000'),(19,'pbkdf2_sha256$1000000$iDm5PFbvARzt71FDkFOb4B$2G6YSgGwEKnlBTFGDeRVWqE6nE7Sk5w3i+9jR4LblAg=',NULL,0,'tendai','Tendai','Moyo','tendai@example.com',0,1,'2026-03-05 00:00:00.000000'),(20,'pbkdf2_sha256$1000000$llOc5aMmDvIDq1cAGkujfu$4wOYlTZeCIHdz//vGX7mZGngNtrZI2TxW1To8lmT6Ow=',NULL,0,'chidi','Chidi','Okafor','chidi@example.com',0,1,'2026-03-20 00:00:00.000000'),(21,'pbkdf2_sha256$1000000$29FmjbKklU0FLCza1IxVul$+uJYwjSJd5qZikzQ5+9sdqpsMbz71m2lsTfAQPdSrBY=',NULL,0,'leila','Leila','Mensah','leila@example.com',0,1,'2026-04-02 00:00:00.000000'),(22,'pbkdf2_sha256$1000000$bnCwdabw3SMp5RmhS42ryF$yh+RGOlPrQyJEDZENT7igwNq+khvaMrAqoahBWOA8ws=',NULL,0,'wanjiku','Wanjiku','Kamau','wanjiku@example.com',0,1,'2026-04-18 00:00:00.000000'),(23,'pbkdf2_sha256$1000000$iUPoV0AsDM1XB9ZbFeM7ta$ZX/Qj8VtaPCSZVAL/HIezMlhLadteTIfTkbS4aA3ZrY=',NULL,0,'otieno','Otieno','Omondi','otieno@example.com',0,1,'2026-05-07 00:00:00.000000'),(24,'pbkdf2_sha256$1000000$PXjtIZ6nnrDOkTY6iGCqSU$H8+GydjkzAPlhxebmBW+Iku114/Xbo1ejfpvTPgSOL0=',NULL,0,'abdi','Abdi','Ibrahim','abdi@example.com',0,1,'2026-05-25 00:00:00.000000'),(25,'pbkdf2_sha256$1000000$ZfQ8MOKXL2uuBrh34prwfr$XapMQHuZU4ughlDm9pVrKn8mvE8XfhhoJk1c3ubdc5o=',NULL,0,'halima','Halima','Yusuf','halima@example.com',0,1,'2026-06-03 00:00:00.000000'),(26,'pbkdf2_sha256$1000000$LXRVwjZVqgJavwjYFdRjZj$NyjSZK0Ee05Bb9FJ2gGVtvIYhaagpdioXSmt7natgzk=',NULL,0,'james','James','Osei','james@example.com',0,1,'2026-06-14 00:00:00.000000'),(27,'pbkdf2_sha256$1000000$l5z17iubo73xoYTn0YCC6M$EP3ukayjp4iKHx5d5dXoZSlyuj8nl+4JmkE5hf9AE1U=','2026-06-30 09:40:35.799091',0,'willmay','William','Mayfair','willmay@gmail.com',0,1,'2026-06-30 09:40:35.282463'),(28,'pbkdf2_sha256$1000000$96FDxJ615ZBneFmxgkdbPx$4fKcNh1nsncFCUeqV1Dqiq7kR79PEIDXvov+dBisNBs=','2026-07-01 10:25:57.711469',0,'jmary','John','Mary','john@gmail.com',0,1,'2026-07-01 10:24:52.079606'),(29,'pbkdf2_sha256$1000000$4XIL704Q8RgAjZp8jExCZ0$k99fD713sYdPwnMBIOpgjXo3qSBw6JpQe/UUXC6JRCA=','2026-07-02 19:01:24.175791',0,'Director','Rei','Hill','renishamondi@gmail.com',1,1,'2026-07-02 18:56:58.000000'),(30,'pbkdf2_sha256$1000000$QLEJ25uVIDDBW2VimaZsfR$6HZ9XpphQKP5D+D8+tWCs1VNl3YlGDC7k9M6gHV/3Q8=','2026-07-05 19:52:39.752568',0,'jmary2','John','Mary','jmary@gmail.com',0,1,'2026-07-05 19:52:38.192792'),(31,'pbkdf2_sha256$1000000$bnBoAdmEBc3xauQjCu5Hcg$fSV6CgtDbsbq2k1AkEAv73xCrXmPI3P5QU+l3pMVA6Q=','2026-07-05 19:53:45.724822',0,'mary2','John','Mary','jmary2@gmail.com',0,1,'2026-07-05 19:53:44.337123'),(32,'pbkdf2_sha256$1000000$6DHhsVIIT2JMFQWLN5PqXG$XjUVIizfh0kgXpNC3HKFux7AP02MEdmSp10JXdpswk8=','2026-07-16 17:33:01.083481',0,'_tulo_','Tei@','Vai','tei@gmail.com',0,1,'2026-07-06 15:17:15.715596'),(33,'pbkdf2_sha256$1000000$u9fmQnj9lb2RHJb0dCPcjB$0LZHhABskdlWKdjrAMlQ3iEvo5AxUplnOOc+i0vi7MQ=','2026-07-20 18:40:39.251798',0,'Val','Treasure','Ayime','admin@fakenewsedu.com',0,1,'2026-07-19 09:35:41.552717'),(34,'pbkdf2_sha256$1000000$VrqOpp92eSrCrJelBW2JM5$zC629v3WoLLq5n4qB4Po0gUCPAPZRJMiifrz1VDfJ3Q=','2026-07-20 19:29:23.440672',0,'Kilo.','ofgard','Hill','kendimanuella@gmail.com',0,1,'2026-07-20 19:29:22.078819'),(35,'pbkdf2_sha256$1000000$98RMTlOKXhY2izbl614p03$QXq1puAk7ehbyDZyb3siNln9qStfkjOecyCdP3CI9HA=','2026-07-21 05:34:02.228615',0,'viena.','Keri','hurA','tulo@lebo.com',0,1,'2026-07-21 05:34:00.921980'),(36,'pbkdf2_sha256$1000000$Xfk6Qu6qT4bx2i3fM1GrdL$drft7x2NGmUYq0hUpRvQXFSoNRzOtyFn60yst/EXWxk=','2026-07-21 07:34:08.842347',0,'Janro','Janro','Laitama','janro@gmail.com',0,1,'2026-07-21 07:34:07.439264');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,29,4),(2,29,8),(3,29,12),(4,29,16),(5,29,20),(6,29,24),(7,29,28),(8,29,32),(9,29,36),(10,29,40),(11,29,44),(12,29,48),(13,29,52),(14,29,56),(15,29,60),(16,29,64),(17,29,68),(18,29,72),(19,29,76),(20,29,80),(21,29,84),(22,29,88);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_certificate`
--

DROP TABLE IF EXISTS `core_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_certificate` (
  `id` char(32) NOT NULL,
  `issued_date` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `core_certificate_user_id_86df4eeb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_certificate`
--

LOCK TABLES `core_certificate` WRITE;
/*!40000 ALTER TABLE `core_certificate` DISABLE KEYS */;
INSERT INTO `core_certificate` VALUES ('485962e6aa9d44649db2e4c9af96109c','2026-06-30',15),('514c3ee1b8b74513b3faad8cda3078b9','2026-06-30',1),('976a8cecdc2c43e6a56900d9e98ae347','2026-06-30',14);
/*!40000 ALTER TABLE `core_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_lab`
--

DROP TABLE IF EXISTS `core_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_lab` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `article_headline` varchar(255) NOT NULL,
  `article_meta` varchar(255) NOT NULL,
  `article_body` longtext NOT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_labexercise_module_id_9193336f_fk_core_module_id` (`module_id`),
  CONSTRAINT `core_labexercise_module_id_9193336f_fk_core_module_id` FOREIGN KEY (`module_id`) REFERENCES `core_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_lab`
--

LOCK TABLES `core_lab` WRITE;
/*!40000 ALTER TABLE `core_lab` DISABLE KEYS */;
INSERT INTO `core_lab` VALUES (21,'Spotting WhatsApp Broadcast Scams','Nairobi County Government Announces Free Fuel to Every Citizen Tomorrow!','Forwarded Many Times | WhatsApp Broadcast Alert','BREAKING NEWS: To ease economic pressure, the Nairobi County Government has just announced that all local petrol stations will give out free fuel to citizens tomorrow only! YOU MUST CLICK THIS UNKNOWN LINK IMMEDIATELY TO REGISTER BEFORE MIDNIGHT: http://nairobi-free-fuel.scam-link.net !!! Share this widely!',21),(22,'Dissecting Cloned Graphics','CLONED HEADLINE: Parliament Votes to Increase Taxes on WhatsApp to 80%!','Graphic shared widely on X (formerly Twitter) | 5,000 Reposts','A highly viral digital image designed to look like a prominent Kenyan newspaper\'s front page has circulated on social media. The lead headline reads \'WHATSAPP TAX TRIPLE\' and claims Parliament has passed an immediate law to tax the messaging app. However, close observation reveals the headline uses different fonts, displays uneven letter alignments, and shows pixelated blurring directly around the borders of the text. A check of the official e-paper shows the real headline for today was completely different.',22),(23,'Investigating Viral Environmental Rumors','Viral Post: Lion Spotted Roaming Free Along Mombasa Road Traffic Today!','Shared by AlertKenya On Facebook | 12,000 shares','A viral Facebook post warns: \'Terrifying news! A huge male lion has escaped Nairobi National Park and is currently walking right down Mombasa Road next to the Express Way. Avoid the area completely!\' The post includes a photo of a lion next to a highway barrier. However, no local drivers have confirmed this, KWS social media pages are completely silent, and a reverse image search reveals the photo was taken in a South African game reserve in 2017.',23),(24,'Evaluating Spoofed Domains','Urgent: Ministry of Education Announces Closure of All Schools Starting Friday!','Published on portal: education-ministry-updates.co.ke','Urgent announcement! Due to unexpected policy adjustments, the Ministry of Education has directed all primary and secondary schools to send students home indefinitely starting this Friday. Parents must click the link below to download the mandatory transport refund form on this non-governmental portal.',24);
/*!40000 ALTER TABLE `core_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_labresult`
--

DROP TABLE IF EXISTS `core_labresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_labresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score_percentage` double NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `lab_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_labsubmission_user_id_aae8e56e_fk_auth_user_id` (`user_id`),
  KEY `core_labsubmission_lab_id_ce9f9114_fk_core_lab_id` (`lab_id`),
  CONSTRAINT `core_labsubmission_lab_id_ce9f9114_fk_core_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `core_lab` (`id`),
  CONSTRAINT `core_labsubmission_user_id_aae8e56e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_labresult`
--

LOCK TABLES `core_labresult` WRITE;
/*!40000 ALTER TABLE `core_labresult` DISABLE KEYS */;
INSERT INTO `core_labresult` VALUES (34,100,'2026-06-30 08:29:53.487731',21,14),(35,80,'2026-06-30 08:29:53.519941',22,14),(36,100,'2026-06-30 08:29:53.548563',23,14),(37,80,'2026-06-30 08:29:53.571975',24,14),(38,80,'2026-06-30 08:29:54.665536',21,15),(39,100,'2026-06-30 08:29:54.691605',22,15),(40,80,'2026-06-30 08:29:54.719291',23,15),(41,100,'2026-06-30 08:29:54.744236',24,15),(42,100,'2026-06-30 08:29:55.785860',21,16),(43,80,'2026-06-30 08:29:55.823225',22,16),(44,100,'2026-06-30 08:29:55.854438',23,16),(45,80,'2026-06-30 08:29:57.119102',21,17),(46,100,'2026-06-30 08:29:57.151231',22,17),(47,80,'2026-06-30 08:29:57.185524',23,17),(48,100,'2026-06-30 08:29:58.273366',21,18),(49,80,'2026-06-30 08:29:58.317119',22,18),(50,100,'2026-06-30 08:29:58.360983',23,18),(51,80,'2026-06-30 08:29:59.246534',21,19),(52,100,'2026-06-30 08:29:59.269415',22,19),(53,80,'2026-06-30 08:29:59.300090',23,19),(54,100,'2026-06-30 08:30:00.565863',21,20),(55,80,'2026-06-30 08:30:00.598571',22,20),(56,80,'2026-06-30 08:30:02.062749',21,21),(57,100,'2026-06-30 08:30:02.104103',22,21),(58,100,'2026-06-30 08:30:03.574532',21,22),(59,80,'2026-06-30 08:30:03.616171',22,22),(60,80,'2026-06-30 08:30:05.132755',21,23),(61,100,'2026-06-30 08:30:05.209060',22,23),(62,100,'2026-06-30 08:30:06.743779',21,24),(63,80,'2026-06-30 08:30:08.232998',21,25),(64,100,'2026-06-30 08:30:09.591217',21,26),(67,100,'2026-07-16 17:36:10.292879',22,32),(68,50,'2026-07-16 17:48:23.537119',21,32),(72,50,'2026-07-19 17:10:57.953965',21,1);
/*!40000 ALTER TABLE `core_labresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_labresult_selected_flags`
--

DROP TABLE IF EXISTS `core_labresult_selected_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_labresult_selected_flags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `labresult_id` bigint NOT NULL,
  `redflag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_labsubmission_selec_labsubmission_id_labredf_8df4a504_uniq` (`labresult_id`,`redflag_id`),
  KEY `core_labresult_selec_redflag_id_12f98b2f_fk_core_redf` (`redflag_id`),
  CONSTRAINT `core_labresult_selec_labresult_id_e2614524_fk_core_labr` FOREIGN KEY (`labresult_id`) REFERENCES `core_labresult` (`id`),
  CONSTRAINT `core_labresult_selec_redflag_id_12f98b2f_fk_core_redf` FOREIGN KEY (`redflag_id`) REFERENCES `core_redflag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_labresult_selected_flags`
--

LOCK TABLES `core_labresult_selected_flags` WRITE;
/*!40000 ALTER TABLE `core_labresult_selected_flags` DISABLE KEYS */;
INSERT INTO `core_labresult_selected_flags` VALUES (30,67,80),(31,67,81),(32,67,82),(33,67,83),(34,68,76),(35,68,78),(36,68,79),(43,72,76),(44,72,78),(45,72,79);
/*!40000 ALTER TABLE `core_labresult_selected_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_lesson`
--

DROP TABLE IF EXISTS `core_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_lesson_module_id_ec1bd51f_fk_core_module_id` (`module_id`),
  CONSTRAINT `core_lesson_module_id_ec1bd51f_fk_core_module_id` FOREIGN KEY (`module_id`) REFERENCES `core_module` (`id`),
  CONSTRAINT `core_lesson_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_lesson`
--

LOCK TABLES `core_lesson` WRITE;
/*!40000 ALTER TABLE `core_lesson` DISABLE KEYS */;
INSERT INTO `core_lesson` VALUES (44,'Identifying Misinformation in a Viral World','<h3>The Challenge of Viral Rumors</h3>\r\n                        <p>In Kenya, false or misleading information spreads incredibly fast across platforms like WhatsApp, TikTok, and X (formerly Twitter). Misinformation often dresses up as legitimate breaking news to trick unsuspecting citizens.</p>\r\n                        <ul>\r\n                            <li><strong>Emotional Triggers:</strong> Fake news often tries to make you feel angry, shocked, or fearful.</li>\r\n                            <li><strong>The Forwarding Problem:</strong> Forwarded messages on WhatsApp frequently strip away the original source, leaving no accountability.</li>\r\n                        </ul>','https://www.youtube-nocookie.com/embed/9kYkcb3_47U',1,21),(45,'Misinformation, Disinformation & Malinformation','<h3>Defining the Spectrum of Falsehoods</h3>\r\n                        <p>Not all false information shared online shares the same motive. Academics and journalists divide it into three distinct categories based on intent:</p>\r\n                        <ul>\r\n                            <li><strong>Misinformation:</strong> False info shared without any bad intentions (e.g., a relative sharing an unverified health tip thinking it helps).</li>\r\n                            <li><strong>Disinformation:</strong> Information that is deliberately created or shared to deceive, harm, or manipulate people.</li>\r\n                            <li><strong>Malinformation:</strong> Real, genuine information shared out of context or leaked maliciously to cause harm.</li>\r\n                        </ul>','https://www.youtube-nocookie.com/embed/6VEP0VTmgTM',2,21),(46,'Elections, Propaganda, and Disinformation','\n                        <h3>The Machinery of Political Trolls</h3>\n                        <p>During democratic processes, coordinated online networks often deploy intentional disinformation campaigns. These groups use paid influencers, automated bots, and heavily biased narratives to sway public opinion or create artificial divisions.</p>\n                        <ul>\n                            <li><strong>Coordinated Behavior:</strong> Multiple distinct accounts posting identical text strings simultaneously.</li>\n                            <li><strong>Astroturfing:</strong> Creating the fake appearance of a grassroots movement when it\'s actually funded by a centralized political operator.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/518v8qypjT4',1,22),(47,'Manipulated Media: Fabricating Kenyan News','\n                        <h3>The Threat of Cloned Graphics</h3>\n                        <p>A highly prevalent tactic in Kenya involves digital manipulation of mainstream newspaper front pages. Scammers use photo editing software to change the lead headlines on digital images of papers like <em>The Daily Nation</em> or <em>The Standard</em> before sharing them online.</p>\n                        <ul>\n                            <li><strong>Visual Inspection:</strong> Look closely for font mismatches, odd alignment, or low-resolution text patches.</li>\n                            <li><strong>Cross-Verification:</strong> Always visit the media house\'s official social channels or e-paper platform to check the real headline for that day.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/4bREUIo93IA',2,22),(48,'Inside PesaCheck\'s Verification System','\n                        <h3>How the Experts Debunk Rumors</h3>\n                        <p>Professional fact-checking desks don\'t guess; they follow rigorous investigative pathways to verify claims floating around East Africa.</p>\n                        <ul>\n                            <li><strong>Primary Source Sourcing:</strong> Contacting government ministries, corporate spokespeople, or scientists directly to verify claims rather than relying on hearsay.</li>\n                            <li><strong>Database Checks:</strong> Checking national registries, official gazettes, and official economic data databases to evaluate financial claims.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/sgltywuNtn4',1,23),(49,'The Pillars of Local Fact-Checking','\n                        <h3>Key Steps to Take Yourself</h3>\n                        <p>You don\'t need a journalism degree to start fact-checking everyday messages. Veteran editors rely on simple, repetitive investigative routines:</p>\n                        <ul>\n                            <li><strong>Lateral Reading:</strong> Opening new browser tabs to find out what independent sources say about a website instead of just relying on the site\'s own \'About\' description.</li>\n                            <li><strong>Contextual Tracking:</strong> Checking when an image or quote was originally generated to ensure it isn\'t old media passed off as happening today.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/x6w00vxeVCM',2,23),(50,'Digital Forensics & Verification Desks','\n                        <h3>Putting Forensic Tools to Work</h3>\n                        <p>When claims use manipulated visual assets, simple observation might fail. This is where dedicated digital investigative forensics tools come in.</p>\n                        <ul>\n                            <li><strong>Reverse Image Search:</strong> Tools like Google Lens, TinEye, and Yandex help uncover where an image originally appeared.</li>\n                            <li><strong>Domain Spoofing Check:</strong> Scammers clone trusted names using weird extensions (e.g., using <code>citizen.news-kenya.co</code> instead of the real domain). Always verify domain architecture.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/VVAOwOoCehw',1,24),(51,'Unmasking AI and Deepfakes in Kenya','\n                        <h3>Spotting Synthetic Audio and Video</h3>\n                        <p>Generative AI now allows bad actors to create highly realistic voice clones of political leaders or fabricated videos of public figures saying things they never did.</p>\n                        <ul>\n                            <li><strong>Audio Indicators:</strong> Listen closely for flat emotional delivery, unexpected metallic robotic echoes, or unnatural breathing pauses.</li>\n                            <li><strong>Visual Artifacts:</strong> Check for strange blurring patterns around the lips, missing teeth definitions, or reflections inside eyes that don\'t match ambient lighting.</li>\n                        </ul>\n                    ','https://www.youtube-nocookie.com/embed/LW3XFnBDO8A',2,24),(52,'Final Exam Instructions','\n                        <h3>Welcome to your Capstone Assessment</h3>\n                        <p>You have successfully journeyed through fake news identification, content classifications, lateral reading, and forensic tool execution. Now it is time to prove your skills.</p>\n                        <ul>\n                            <li>This comprehensive exam features critical thinking questions.</li>\n                            <li>The focus is entirely on realistic media environment challenges faced in daily life.</li>\n                            <li>A passing score secures your \'Truth Defender\' course completion badge. Good luck!</li>\n                        </ul>\n                    ','',1,25);
/*!40000 ALTER TABLE `core_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_module`
--

DROP TABLE IF EXISTS `core_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `order` int unsigned NOT NULL,
  `badge_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `order` (`order`),
  CONSTRAINT `core_module_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_module`
--

LOCK TABLES `core_module` WRITE;
/*!40000 ALTER TABLE `core_module` DISABLE KEYS */;
INSERT INTO `core_module` VALUES (21,'FNL-101','Introduction to Fake News','Understand the basics of what fake news is and its growing impact within the Kenyan media landscape.',1,'Fake News Novice'),(22,'FNL-102','Types of Misinformation','Examine how organized propaganda campaigns and manipulated print graphics target Kenyan readers.',2,'Info-Type Analyst'),(23,'FNL-103','Digital Fact-Checking Techniques','Learn the step-by-step newsroom verification steps used by professional fact-checkers in East Africa.',3,'Fact-Checker'),(24,'FNL-104','Detection Tools & Verification','Deploy tools to dissect false contexts, verify domain names, and unmask AI deepfakes.',4,'Tool Specialist'),(25,'FNL-105','Final Evaluation Test','Test your comprehensive media literacy skills and achieve your badge as a verified Kenyan Truth Defender.',5,'Truth Defender');
/*!40000 ALTER TABLE `core_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_progress`
--

DROP TABLE IF EXISTS `core_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_progress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `lesson_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_userlessonprogress_user_id_lesson_id_a4250f7d_uniq` (`user_id`,`lesson_id`),
  KEY `core_userlessonprogress_lesson_id_9a217936_fk_core_lesson_id` (`lesson_id`),
  CONSTRAINT `core_userlessonprogress_lesson_id_9a217936_fk_core_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `core_lesson` (`id`),
  CONSTRAINT `core_userlessonprogress_user_id_ee4f9d15_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_progress`
--

LOCK TABLES `core_progress` WRITE;
/*!40000 ALTER TABLE `core_progress` DISABLE KEYS */;
INSERT INTO `core_progress` VALUES (29,1,'2026-06-29 17:23:42.540423',44,1),(30,1,'2026-06-29 17:24:00.752974',45,1),(83,1,'2026-06-30 08:20:16.526755',46,1),(84,1,'2026-06-30 08:20:18.521903',47,1),(85,1,'2026-06-30 08:21:01.223474',48,1),(86,1,'2026-06-30 08:21:03.530955',49,1),(87,1,'2026-06-30 08:21:24.811311',50,1),(88,1,'2026-06-30 08:21:36.386877',51,1),(89,1,'2026-06-30 08:22:21.309325',52,1),(90,1,'2026-06-30 08:29:53.463657',44,14),(91,1,'2026-06-30 08:29:53.471826',45,14),(92,1,'2026-06-30 08:29:53.496161',46,14),(93,1,'2026-06-30 08:29:53.505832',47,14),(94,1,'2026-06-30 08:29:53.529876',48,14),(95,1,'2026-06-30 08:29:53.529876',49,14),(96,1,'2026-06-30 08:29:53.557103',50,14),(97,1,'2026-06-30 08:29:53.561564',51,14),(98,1,'2026-06-30 08:29:53.579616',52,14),(99,1,'2026-06-30 08:29:54.641464',44,15),(100,1,'2026-06-30 08:29:54.648773',45,15),(101,1,'2026-06-30 08:29:54.674894',46,15),(102,1,'2026-06-30 08:29:54.674894',47,15),(103,1,'2026-06-30 08:29:54.698914',48,15),(104,1,'2026-06-30 08:29:54.703712',49,15),(105,1,'2026-06-30 08:29:54.723969',50,15),(106,1,'2026-06-30 08:29:54.727564',51,15),(107,1,'2026-06-30 08:29:54.752534',52,15),(108,1,'2026-06-30 08:29:55.756998',44,16),(109,1,'2026-06-30 08:29:55.764540',45,16),(110,1,'2026-06-30 08:29:55.796375',46,16),(111,1,'2026-06-30 08:29:55.804635',47,16),(112,1,'2026-06-30 08:29:55.833942',48,16),(113,1,'2026-06-30 08:29:55.837492',49,16),(114,1,'2026-06-30 08:29:57.092973',44,17),(115,1,'2026-06-30 08:29:57.101284',45,17),(116,1,'2026-06-30 08:29:57.127934',46,17),(117,1,'2026-06-30 08:29:57.132678',47,17),(118,1,'2026-06-30 08:29:57.159645',48,17),(119,1,'2026-06-30 08:29:57.168245',49,17),(120,1,'2026-06-30 08:29:58.235558',44,18),(121,1,'2026-06-30 08:29:58.244144',45,18),(122,1,'2026-06-30 08:29:58.284964',46,18),(123,1,'2026-06-30 08:29:58.297870',47,18),(124,1,'2026-06-30 08:29:58.331765',48,18),(125,1,'2026-06-30 08:29:58.344666',49,18),(126,1,'2026-06-30 08:29:59.224971',44,19),(127,1,'2026-06-30 08:29:59.229621',45,19),(128,1,'2026-06-30 08:29:59.254553',46,19),(129,1,'2026-06-30 08:29:59.258221',47,19),(130,1,'2026-06-30 08:29:59.274983',48,19),(131,1,'2026-06-30 08:29:59.283301',49,19),(132,1,'2026-06-30 08:30:00.543766',44,20),(133,1,'2026-06-30 08:30:00.549194',45,20),(134,1,'2026-06-30 08:30:00.574186',46,20),(135,1,'2026-06-30 08:30:00.577314',47,20),(136,1,'2026-06-30 08:30:02.041904',44,21),(137,1,'2026-06-30 08:30:02.048402',45,21),(138,1,'2026-06-30 08:30:02.079393',46,21),(139,1,'2026-06-30 08:30:02.085809',47,21),(140,1,'2026-06-30 08:30:03.540523',44,22),(141,1,'2026-06-30 08:30:03.553118',45,22),(142,1,'2026-06-30 08:30:03.585710',46,22),(143,1,'2026-06-30 08:30:03.593894',47,22),(144,1,'2026-06-30 08:30:05.081634',44,23),(145,1,'2026-06-30 08:30:05.092455',45,23),(146,1,'2026-06-30 08:30:05.153645',46,23),(147,1,'2026-06-30 08:30:05.169242',47,23),(148,1,'2026-06-30 08:30:06.701248',44,24),(149,1,'2026-06-30 08:30:06.712457',45,24),(150,1,'2026-06-30 08:30:08.187373',44,25),(151,1,'2026-06-30 08:30:08.199904',45,25),(152,1,'2026-06-30 08:30:09.555708',44,26),(153,1,'2026-06-30 08:30:09.564000',45,26),(154,1,'2026-06-30 09:40:46.654291',44,27),(155,1,'2026-06-30 09:40:50.121507',45,27),(156,1,'2026-07-01 10:26:39.130557',44,28),(157,1,'2026-07-01 10:26:52.395367',45,28),(158,1,'2026-07-06 15:26:41.126054',44,32),(159,1,'2026-07-06 15:26:46.036888',45,32),(160,1,'2026-07-19 09:35:55.815395',44,33),(161,1,'2026-07-19 09:36:02.219410',45,33),(162,1,'2026-07-19 09:36:31.954786',46,33),(163,1,'2026-07-20 18:40:49.231328',47,33),(164,1,'2026-07-20 18:41:08.014113',48,33);
/*!40000 ALTER TABLE `core_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_question`
--

DROP TABLE IF EXISTS `core_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `choice_a` varchar(255) NOT NULL,
  `choice_b` varchar(255) NOT NULL,
  `choice_c` varchar(255) NOT NULL,
  `choice_d` varchar(255) NOT NULL,
  `correct_option` varchar(1) NOT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_question_module_id_b83d8387_fk_core_module_id` (`module_id`),
  CONSTRAINT `core_question_module_id_b83d8387_fk_core_module_id` FOREIGN KEY (`module_id`) REFERENCES `core_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_question`
--

LOCK TABLES `core_question` WRITE;
/*!40000 ALTER TABLE `core_question` DISABLE KEYS */;
INSERT INTO `core_question` VALUES (119,'When a person shares an unverified forward on WhatsApp thinking they are helping their family, what are they spreading?','Disinformation','Misinformation','Malinformation','Satire','B',21),(120,'What defines \'Disinformation\' compared to other forms of fake news?','It is always published in physical newspapers.','It is false information shared with a deliberate intent to deceive or cause harm.','It is completely true but boring.','It can only be spread by verified social media accounts.','B',21),(121,'Why do false claims spread so rapidly in Kenyan WhatsApp groups?','Because WhatsApp automatically verifies all links.','Because forwarded messages often lack context, hiding the original source.','Because all WhatsApp groups are public.','Because users must pay to read real news.','B',21),(122,'Which of these describes \'Malinformation\'?','Completely made-up scientific data.','A parody article from a comedy website.','Genuine, real information shared out of context specifically to cause harm.','An honest typo made by a mainstream journalist.','C',21),(123,'What is the most common reason fake news creators use highly emotional headlines?','To bypass the reader\'s critical thinking and spark immediate clicks or shares.','To adhere to strict journalistic ethics codes.','To ensure their grammar is correct.','To cut down the length of the article text.','A',21),(124,'What is \'astroturfing\' in online political campaigns?','Planting real grass around government buildings.','Artificially creating the false impression of widespread organic public support.','Using satellite imagery to verify news claims.','Deleting old posts from political candidates.','B',22),(125,'You see an image of a prominent Kenyan newspaper front page with a shocking headline. How should you verify it?','Assume it is real and forward it to your groups immediately.','Check the media house\'s official, verified social media channels or official e-paper site to see if the headlines match.','Ask a friend if they think it looks real.','Look at the colors in the background.','B',22),(126,'Which of these is a common visual warning sign of a manipulated news graphic?','The article uses standard black font color.','Mismatched font styles, strange alignment, or blurry text boxes over a clear image.','The presence of a correct date stamp.','A high-resolution photograph of the journalist.','B',22),(127,'What is the primary role of an \'online influencer farm\' during election cycles?','To teach local farmers how to market their produce online.','To systematically push paid political narratives and amplify attacks against opponents.','To fact-check political statements impartially.','To provide technical support for election voting equipment.','B',22),(128,'Why do digital news falsifiers target trusted mainstream brands like The Daily Nation or The Standard?','To help those brands get more print subscribers.','To hijack the brand\'s hard-earned public credibility to make a lie believable.','Because those brands don\'t have websites.','To test out new image editing software features.','B',22),(129,'When a professional fact-checker encounters a viral claim about a new law, what is their first step?','They write an opinion piece about why the law is bad.','They locate the primary source, such as the official Kenya Gazette or parliament records.','They count how many likes the post has.','They delete the post from social media accounts.','B',23),(130,'What is \'Lateral Reading\'?','Reading text sideways to spot secret codes.','Leaving a web page to open multiple tabs and cross-verify the credentials and claims of that source against other reputable inputs.','Skimming only the right side of a paragraph.','Translating an article into multiple local languages.','B',23),(131,'Which of these is considered a \'primary source\' for verification?','An unverified video analysis by an anonymous TikToker.','An official, stamped public statement released on an official government portal.','A blog post summarizing what a newspaper said.','A trending hashtag on social media.','B',23),(132,'Why do fact-checkers verify when an image was first uploaded to the internet?','To see if the image files are too large for mobile phones.','To ensure an old event or photo is not being falsely repurposed as evidence of a current incident.','To find out what type of camera the photographer used.','To copyright check the photograph for profit.','B',23),(133,'What organization is a prominent independent fact-checking platform active across Kenya and East Africa?','The Onion News Desk','PesaCheck','Reddit Kenya','Wikipedia Admin Group','B',23),(134,'Which specific tool is best suited to trace the true original online appearance of an uploaded image file?','Google Docs','TinEye or Google Lens Reverse Search','Adobe Photoshop Editor','Microsoft Excel','B',24),(135,'You encounter a news blog operating under the URL \'ntv-kenya.com.co\'. What should this suffix make you suspect?','It is an official high-speed premium server link.','It is a domain-spoofing attempt attempting to masquerade as NTV Kenya.','It is the exclusive site for mobile phone browsers.','It means the site is protected by government security encryption.','B',24),(136,'What is a common sign that an online video of a public figure might be an AI deepfake?','The video length is longer than two minutes.','Unnatural lip movements, strange eye-blinking patterns, and shifting skin textures near the jawline.','The speaker is wearing an official suit jacket.','The recording was taken outdoors during daylight.','B',24),(137,'When assessing suspected AI voice clones of famous individuals, what should you listen for?','Background traffic noises.','Unnatural cadence, lack of realistic breathing patterns, and flat robotic phrasing tones.','A loud volume setting.','The use of local Swahili phrases.','B',24),(138,'What is the official domain structure used exclusively by authentic Kenyan Government ministries and departments?','go.ke','com.ke','org.ke','gov.com','A',24),(139,'If someone accidentally forwards a fake medical cure on social media without knowing it is false, this is called:','Disinformation','Misinformation','Malinformation','Satire','B',25),(140,'Which of these domain architectures should you trust most for an official announcement about national tax policies?','kra-portal-updates.com','kra.go.ke','kra-news.co.ke','kenya-revenue-authority.org.co','B',25),(141,'Coordinated networks using paid actors or bot clusters to push a custom trending hashtag during an election is an example of:','Lateral Reading','Astroturfing Disinformation','Objective Media Reporting','Reverse Image Searching','B',25),(142,'What does a successful \'Reverse Image Search\' help a media user discover?','The identity of everyone who liked the photo.','The historical origins, early upload dates, and true contexts of an image asset.','How to edit out objects from the photograph.','The camera model serial number.','B',25),(143,'Why is relying solely on a website\'s \'About Us\' section a poor confirmation practice?','Because \'About Us\' sections are always too long to read completely.','Because bad actors can easily fabricate an impressive, professional-sounding description about themselves.','Because search engines don\'t index \'About Us\' pages.','Because news sites do not have these pages.','B',25),(144,'A trending audio file appears online showing a regional politician saying something shocking, but it sounds metallic and lacks common breathing pauses. What should you evaluate for?','A bad micro-SD card connection.','An AI generative voice clone attempt.','Standard local broadcast interference.','The speed settings on your media player.','B',25),(145,'When cross-checking a viral claim, what is the value of independent platforms like PesaCheck or Africa Check?','They provide fast, entertaining commentary on internet trends.','They apply transparent, non-partisan verification workflows to back up or debunk local claims.','They block false websites from opening on Kenyan phones.','They provide free mobile data bundles to users.','B',25),(146,'What psychological trap causes people to immediately trust a fake news story simply because it matches their existing political views?','The Reverse Search Effect','Confirmation Bias','Astroturfing Illusion','Domain Ambiguity','B',25),(147,'What is the best immediate reaction when a family member sends a shocking \'breaking news\' link with the tag \'Forwarded Many Times\' into your group?','Forward it to your other networks immediately to be safe.','Pause, read laterally, and check trusted local media outlets or fact-checkers before taking action.','Ignore the message completely and leave the group chat.','Reply immediately with an angry emoji.','B',25),(148,'What is fake news','fake info','fake','fake','fake','A',21);
/*!40000 ALTER TABLE `core_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_quizresult`
--

DROP TABLE IF EXISTS `core_quizresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_quizresult` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score_percentage` double NOT NULL,
  `passed` tinyint(1) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `module_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_quizsubmission_module_id_fc593b81_fk_core_module_id` (`module_id`),
  KEY `core_quizsubmission_user_id_d6d3c5a2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `core_quizsubmission_module_id_fc593b81_fk_core_module_id` FOREIGN KEY (`module_id`) REFERENCES `core_module` (`id`),
  CONSTRAINT `core_quizsubmission_user_id_d6d3c5a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_quizresult`
--

LOCK TABLES `core_quizresult` WRITE;
/*!40000 ALTER TABLE `core_quizresult` DISABLE KEYS */;
INSERT INTO `core_quizresult` VALUES (51,100,1,'2026-06-30 08:21:20.588697',23,1),(52,80,1,'2026-06-30 08:22:05.364334',24,1),(53,100,1,'2026-06-30 08:22:48.218152',25,1),(54,100,1,'2026-06-30 08:29:53.480972',21,14),(55,80,1,'2026-06-30 08:29:53.511519',22,14),(56,100,1,'2026-06-30 08:29:53.538451',23,14),(57,80,1,'2026-06-30 08:29:53.567066',24,14),(58,100,1,'2026-06-30 08:29:53.588165',25,14),(59,80,1,'2026-06-30 08:29:54.657217',21,15),(60,100,1,'2026-06-30 08:29:54.682055',22,15),(61,80,1,'2026-06-30 08:29:54.710891',23,15),(62,100,1,'2026-06-30 08:29:54.737363',24,15),(63,80,1,'2026-06-30 08:29:54.757159',25,15),(64,100,1,'2026-06-30 08:29:55.773415',21,16),(65,80,1,'2026-06-30 08:29:55.812341',22,16),(66,100,1,'2026-06-30 08:29:55.843565',23,16),(67,80,1,'2026-06-30 08:29:57.109620',21,17),(68,100,1,'2026-06-30 08:29:57.142923',22,17),(69,80,1,'2026-06-30 08:29:57.176631',23,17),(70,100,1,'2026-06-30 08:29:58.262075',21,18),(71,80,1,'2026-06-30 08:29:58.304804',22,18),(72,100,1,'2026-06-30 08:29:58.351739',23,18),(73,80,1,'2026-06-30 08:29:59.237455',21,19),(74,100,1,'2026-06-30 08:29:59.264766',22,19),(75,80,1,'2026-06-30 08:29:59.291665',23,19),(76,100,1,'2026-06-30 08:30:00.555481',21,20),(77,80,1,'2026-06-30 08:30:00.585255',22,20),(78,80,1,'2026-06-30 08:30:02.057873',21,21),(79,100,1,'2026-06-30 08:30:02.091261',22,21),(80,100,1,'2026-06-30 08:30:03.564326',21,22),(81,80,1,'2026-06-30 08:30:03.603840',22,22),(82,80,1,'2026-06-30 08:30:05.109656',21,23),(83,100,1,'2026-06-30 08:30:05.186010',22,23),(84,100,1,'2026-06-30 08:30:06.726674',21,24),(85,80,1,'2026-06-30 08:30:08.213393',21,25),(86,100,1,'2026-06-30 08:30:09.572605',21,26),(88,40,0,'2026-06-30 09:47:38.782067',21,27),(89,60,0,'2026-07-01 10:27:19.035688',21,28),(91,80,1,'2026-07-06 15:36:43.410970',21,32),(93,60,1,'2026-07-19 09:36:21.968730',21,33),(97,80,1,'2026-07-20 18:40:16.879838',22,1),(98,100,1,'2026-07-20 18:41:03.363842',22,33),(100,66.66666666666666,1,'2026-07-21 08:02:03.651828',21,1);
/*!40000 ALTER TABLE `core_quizresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_redflag`
--

DROP TABLE IF EXISTS `core_redflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_redflag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `lab_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_labredflag_lab_id_fe22e974_fk_core_lab_id` (`lab_id`),
  CONSTRAINT `core_labredflag_lab_id_fe22e974_fk_core_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `core_lab` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_redflag`
--

LOCK TABLES `core_redflag` WRITE;
/*!40000 ALTER TABLE `core_redflag` DISABLE KEYS */;
INSERT INTO `core_redflag` VALUES (76,'No official named spokesperson or verified mainstream media source is cited',1,21),(77,'Uses urgent, alarming language and multiple exclamation marks to create artificial pressure',1,21),(78,'The text contains standard, professional formatting guidelines',0,21),(79,'Urges the reader to click a highly suspicious, non-governmental link to register',1,21),(80,'The main headline font style differs noticeably from the standard typography of the newspaper',1,22),(81,'The official logo of the media company is displayed in the upper corner',0,22),(82,'The official daily e-paper archives show a completely different lead story for that exact date',1,22),(83,'There is visible digital artifacting and blurry pixel boxes around the letters of the headline',1,22),(84,'A reverse search reveals the associated photo was taken in a different country years ago',1,23),(85,'The Kenya Wildlife Service (KWS) official verified social accounts have released no alerts',1,23),(86,'The text lists Mombasa Road as the location of the incident',0,23),(87,'No secondary reports, eyewitness videos, or mainstream traffic reporters have confirmed the sighting',1,23),(88,'The URL is a spoofed domain instead of the official \'education.go.ke\' domain',1,24),(89,'The page forces users to enter sensitive personal and financial details to download a public file',1,24),(90,'No official press statement exists on verified mainstream Kenyan broadcast channels',1,24),(91,'The article uses standard, professional typography and layout formats',0,24);
/*!40000 ALTER TABLE `core_redflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-06-29 11:17:40.820083','13','Progress object (13)',2,'[]',15,1),(2,'2026-06-29 11:18:04.842145','14','Progress object (14)',1,'[{\"added\": {}}]',15,1),(3,'2026-06-29 11:18:16.731335','15','Progress object (15)',1,'[{\"added\": {}}]',15,1),(4,'2026-06-29 11:18:24.699947','16','Progress object (16)',1,'[{\"added\": {}}]',15,1),(5,'2026-06-29 12:11:26.536351','14','FNL-104: Detection Tools & Verification',2,'[{\"changed\": {\"name\": \"lesson\", \"object\": \"FNL-104 - Lesson 1\", \"fields\": [\"Content\"]}}, {\"changed\": {\"name\": \"lesson\", \"object\": \"FNL-104 - Lesson 2\", \"fields\": [\"Content\"]}}]',8,1),(6,'2026-06-29 12:12:31.016367','14','FNL-104: Detection Tools & Verification',2,'[{\"changed\": {\"name\": \"lesson\", \"object\": \"FNL-104 - Lesson 2\", \"fields\": [\"Video url\"]}}]',8,1),(7,'2026-07-02 18:57:00.224117','29','Director',1,'[{\"added\": {}}]',4,1),(8,'2026-07-02 18:57:11.754622','29','Director',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,1),(9,'2026-07-02 18:59:44.021883','29','Director',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]',4,1),(10,'2026-07-19 09:38:39.505439','66','LabResult object (66)',3,'',10,1),(11,'2026-07-19 09:40:41.386614','65','LabResult object (65)',3,'',10,1),(12,'2026-07-19 09:41:01.439790','33','LabResult object (33)',3,'',10,1),(13,'2026-07-19 09:41:01.439790','32','LabResult object (32)',3,'',10,1),(14,'2026-07-19 16:23:42.621511','71','LabResult object (71)',3,'',10,1),(15,'2026-07-19 16:23:42.621511','70','LabResult object (70)',3,'',10,1),(16,'2026-07-19 16:28:07.769841','69','LabResult object (69)',3,'',10,1),(17,'2026-07-21 08:00:03.883968','21','FNL-101: Introduction to Fake News',2,'[{\"changed\": {\"name\": \"lesson\", \"object\": \"FNL-101 - Lesson 1\", \"fields\": [\"Content\"]}}, {\"changed\": {\"name\": \"lesson\", \"object\": \"FNL-101 - Lesson 2\", \"fields\": [\"Content\"]}}, {\"added\": {\"name\": \"question\", \"object\": \"Question object (148)\"}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(16,'core','certificate'),(7,'core','lab'),(10,'core','labresult'),(11,'core','lesson'),(8,'core','module'),(15,'core','progress'),(17,'core','question'),(12,'core','quizquestion'),(13,'core','quizresult'),(9,'core','redflag'),(14,'core','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-06-23 12:49:34.972174'),(2,'auth','0001_initial','2026-06-23 12:49:35.876033'),(3,'admin','0001_initial','2026-06-23 12:49:36.124828'),(4,'admin','0002_logentry_remove_auto_add','2026-06-23 12:49:36.142278'),(5,'admin','0003_logentry_add_action_flag_choices','2026-06-23 12:49:36.161839'),(6,'contenttypes','0002_remove_content_type_name','2026-06-23 12:49:36.316836'),(7,'auth','0002_alter_permission_name_max_length','2026-06-23 12:49:36.405945'),(8,'auth','0003_alter_user_email_max_length','2026-06-23 12:49:36.454858'),(9,'auth','0004_alter_user_username_opts','2026-06-23 12:49:36.466554'),(10,'auth','0005_alter_user_last_login_null','2026-06-23 12:49:36.550619'),(11,'auth','0006_require_contenttypes_0002','2026-06-23 12:49:36.564704'),(12,'auth','0007_alter_validators_add_error_messages','2026-06-23 12:49:36.583139'),(13,'auth','0008_alter_user_username_max_length','2026-06-23 12:49:36.689305'),(14,'auth','0009_alter_user_last_name_max_length','2026-06-23 12:49:36.800251'),(15,'auth','0010_alter_group_name_max_length','2026-06-23 12:49:36.834218'),(16,'auth','0011_update_proxy_permissions','2026-06-23 12:49:36.851029'),(17,'auth','0012_alter_user_first_name_max_length','2026-06-23 12:49:36.982909'),(18,'core','0001_initial','2026-06-23 12:49:38.448851'),(19,'sessions','0001_initial','2026-06-23 12:49:38.565373'),(20,'core','0002_lesson_duration_minutes_module_badge_name_and_more','2026-06-23 18:46:17.044641'),(21,'core','0003_remove_quizquestion_explanation_alter_lesson_content_and_more','2026-06-24 12:32:29.417074'),(22,'core','0004_alter_lesson_content_alter_lesson_video_url','2026-06-24 12:40:37.583096'),(23,'core','0005_remove_userprofile_study_hours','2026-06-25 07:06:07.094953'),(24,'core','0006_delete_userprofile','2026-06-28 08:09:30.992806'),(25,'core','0007_rename_labexercise_lab_and_more','2026-06-28 10:22:10.122319'),(26,'core','0008_rename_is_true_red_flag_redflag_is_correct','2026-07-05 16:18:48.628148'),(27,'core','0009_remove_lesson_duration_minutes','2026-07-20 17:24:05.608903');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6jt0dij8tk6ah3sa1ibcw4jlvbzt8hhc','.eJxVjEEOwiAQRe_C2hDKDLS4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrB1GpkJnzOIAj7SgnRRQwguPROHRZR22MRZ6AbTYhogbkhJYnBBLvD_orOD4:1wccn0:Hzfyx371Dg9XE-hgzxytuykNMhX6zGspRXo9TthsR8Y','2026-07-09 05:38:14.860070'),('7ker32vtrpyt139w2an1x4etb8muh174','.eJxVjMsOwiAQRf-FtSHQ8igu3fsNZJgZpGogKe3K-O_apAvd3nPOfYkI21ri1nmJM4mzGMXpd0uAD647oDvUW5PY6rrMSe6KPGiX10b8vBzu30GBXr61CROyDgQEGUcHgN55UgyZk4GBXcYho04U2CuXJxsspsDWWO0yKRDvDyvlOY4:1weAdO:YvV-YWvp9duU3q10ftAuletCVE13jD9bUGvGHJUkfiA','2026-07-13 11:58:42.919398'),('iynzbw6xd2htkd8j59oikzad6romenro','.eJxVjEEOwiAQRe_C2hDKDLS4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrB1GpkJnzOIAj7SgnRRQwguPROHRZR22MRZ6AbTYhogbkhJYnBBLvD_orOD4:1wdnLp:CpNPzEV47whxjaXvzEFj1fAnIRmC8rd3Xv-2FJ2JboA','2026-07-12 11:07:01.537167'),('wc2ky22ri69wauuku5g5rykrczf20f4p','.eJxVjEEOwiAQRe_C2hDKDLS4dO8ZyACDVA0kpV0Z765NutDtf-_9l_C0rcVvnRc_J3EWgzj9boHig-sO0p3qrcnY6rrMQe6KPGiX15b4eTncv4NCvXxrB1GpkJnzOIAj7SgnRRQwguPROHRZR22MRZ6AbTYhogbkhJYnBBLvD_orOD4:1wm5DJ:x98A7e1rhYGLZMLj7bPAgqnKuxu0fqh5GtTWw9lHLy0','2026-08-04 07:48:29.403211');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-07 11:49:42
