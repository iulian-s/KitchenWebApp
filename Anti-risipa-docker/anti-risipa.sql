-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: anti_risipa
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `alimente`
--

DROP TABLE IF EXISTS `alimente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimente` (
  `id_alimente` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_categorii` int NOT NULL,
  `id_utilizator_care_a_adaugat` int NOT NULL,
  `data_inserarii` date NOT NULL,
  PRIMARY KEY (`id_alimente`) USING BTREE,
  UNIQUE KEY `nume` (`nume`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='lista generica de alimente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimente`
--

LOCK TABLES `alimente` WRITE;
/*!40000 ALTER TABLE `alimente` DISABLE KEYS */;
INSERT INTO `alimente` VALUES (1,'lapte',1,1,'2024-11-24'),(2,'mere',2,3,'2024-11-24'),(3,'faina',5,1,'2024-11-24'),(4,'oua',4,2,'2024-11-24'),(5,'ulei',5,2,'2024-11-24'),(6,'gem de pruna',7,3,'2024-11-24'),(7,'carnat',6,1,'2024-11-24'),(8,'rahat turcesc',4,2,'2024-11-28'),(9,'capsuni',2,1,'2025-03-01'),(10,'jeleu',8,1,'2025-03-01'),(11,'pulpe de pui',6,1,'2025-03-05'),(12,'Apa',5,1,'2025-03-06'),(13,'zahar',5,7,'2025-03-06'),(14,'sare',5,8,'2025-03-07'),(15,'gorgonzolla',1,9,'2025-03-08'),(16,'caise',2,1,'2025-03-13'),(17,'banane',9,1,'2025-03-13');
/*!40000 ALTER TABLE `alimente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alimente_utilizator`
--

DROP TABLE IF EXISTS `alimente_utilizator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimente_utilizator` (
  `id_alimente_utilizator` int NOT NULL AUTO_INCREMENT,
  `id_utilizatori` int NOT NULL,
  `id_alimente` int NOT NULL,
  `cantitate` int NOT NULL,
  `id_unitati_de_masura` int NOT NULL,
  `data_expirare` date DEFAULT NULL,
  `pret` int NOT NULL,
  PRIMARY KEY (`id_alimente_utilizator`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='ce are fiecare user in camaralui?';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimente_utilizator`
--

LOCK TABLES `alimente_utilizator` WRITE;
/*!40000 ALTER TABLE `alimente_utilizator` DISABLE KEYS */;
INSERT INTO `alimente_utilizator` VALUES (2,1,3,1000,1,'2025-11-26',4),(3,1,4,1200,1,'2025-11-26',42),(4,1,5,900,2,'2024-12-24',5),(5,1,6,400,0,'3025-11-24',12),(6,2,1,400,2,'2024-11-25',6),(7,3,7,13,3,'2025-03-19',255),(10,1,7,13,3,'2025-03-19',25),(11,1,1,20,3,'2025-03-27',19),(13,5,8,500,1,'2025-06-25',12),(14,1,10,140,3,'2025-03-18',60),(16,2,11,400,1,'2025-03-26',21),(18,7,10,200,1,'2025-05-21',6),(19,8,14,200,1,'3025-04-03',2),(20,9,11,5,3,'2025-04-27',25);
/*!40000 ALTER TABLE `alimente_utilizator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorii`
--

DROP TABLE IF EXISTS `categorii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorii` (
  `id_categorii` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_categorii`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorii`
--

LOCK TABLES `categorii` WRITE;
/*!40000 ALTER TABLE `categorii` DISABLE KEYS */;
INSERT INTO `categorii` VALUES (1,'lactate'),(2,'fructe'),(3,'legume'),(4,'proaspete'),(5,'de baza'),(6,'carne'),(7,'conserve'),(8,'alta'),(9,'fructi');
/*!40000 ALTER TABLE `categorii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continut_retete`
--

DROP TABLE IF EXISTS `continut_retete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continut_retete` (
  `id_continut_retete` int NOT NULL AUTO_INCREMENT,
  `id_retete` int DEFAULT NULL,
  `id_alimente` int DEFAULT NULL,
  `cantitate` int NOT NULL,
  `id_unitati_de_masura` int DEFAULT NULL,
  PRIMARY KEY (`id_continut_retete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continut_retete`
--

LOCK TABLES `continut_retete` WRITE;
/*!40000 ALTER TABLE `continut_retete` DISABLE KEYS */;
INSERT INTO `continut_retete` VALUES (1,1,4,2,3),(2,2,1,250,2),(3,2,3,250,1),(4,2,4,2,3),(5,2,5,50,2),(6,2,6,300,1),(7,3,5,2,2),(8,4,4,1,3),(9,4,6,2,1),(10,5,1,22,2),(11,6,1,22,3),(12,6,5,33,1),(13,7,3,250,1),(14,7,5,20,2),(15,7,4,1,3),(16,8,3,250,1),(17,8,4,5,3),(18,8,2,500,1),(19,9,2,2,3),(20,9,9,100,1),(21,10,3,100,1),(22,10,4,1,3),(23,10,12,250,2),(24,11,12,500,1),(25,11,7,2,3),(26,12,4,2,3),(27,12,14,3,2),(28,12,15,250,1),(29,12,7,13,3),(30,13,15,200,1),(31,13,14,15,1);
/*!40000 ALTER TABLE `continut_retete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurnale`
--

DROP TABLE IF EXISTS `jurnale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnale` (
  `id_jurnale` int NOT NULL,
  `id_utilizatori` int NOT NULL,
  `id_alimente` int NOT NULL,
  `data_inserare` date NOT NULL,
  `mod_utilizat` enum('aruncat','salvat','consumat') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'salvat (datorita aplicatiei), consumat (din prorpie initiativa)',
  `cantitate` int DEFAULT NULL,
  `unitate_de_masura` int DEFAULT NULL,
  `pret` float DEFAULT NULL,
  PRIMARY KEY (`id_jurnale`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='de pus date la cantitate , unitate_de_masura, pret';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurnale`
--

LOCK TABLES `jurnale` WRITE;
/*!40000 ALTER TABLE `jurnale` DISABLE KEYS */;
INSERT INTO `jurnale` VALUES (1,1,1,'2024-11-24','consumat',300,2,5),(2,2,2,'2024-11-25','salvat',2,3,4),(3,3,4,'2024-11-27','aruncat',2,3,9);
/*!40000 ALTER TABLE `jurnale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parole`
--

DROP TABLE IF EXISTS `parole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parole` (
  `id_parole` int NOT NULL AUTO_INCREMENT,
  `id_utilizatori` int DEFAULT NULL,
  `parola` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_parole`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='parolele utilizatorilor ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parole`
--

LOCK TABLES `parole` WRITE;
/*!40000 ALTER TABLE `parole` DISABLE KEYS */;
INSERT INTO `parole` VALUES (1,1,'lenoi'),(2,2,'vasile'),(3,3,'maria'),(5,5,'gigel'),(6,6,'///;s'),(7,7,'gog'),(8,8,'ginel'),(9,9,'costica');
/*!40000 ALTER TABLE `parole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retete`
--

DROP TABLE IF EXISTS `retete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retete` (
  `id_retete` int NOT NULL AUTO_INCREMENT,
  `titlu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `instructiuni` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_utilizator_care_a_adaugat` int DEFAULT NULL,
  `data_adaugarii` date DEFAULT NULL,
  PRIMARY KEY (`id_retete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retete`
--

LOCK TABLES `retete` WRITE;
/*!40000 ALTER TABLE `retete` DISABLE KEYS */;
INSERT INTO `retete` VALUES (1,'omleta','bateti oua si prajiti in tigaie',1,'2024-11-24'),(2,'clatite','amestecati tot si prajiti in tigaie',1,'2024-11-24'),(3,'salam prajit','prajiti salam',1,'2025-03-06'),(4,'aa','bc',1,'2025-03-06'),(5,'aab','sadad',1,'2025-03-06'),(6,'asdasd','sad',1,'2025-03-06'),(7,'paine','cautati altundeva va rog',1,'2025-03-06'),(8,'placinta de mere','taiati merele cat mai mici, puneti straturi de foi si mere',2,'2025-03-06'),(9,'salata de fructe','taiati si puneti la un loc',1,'2025-03-06'),(10,'taitei','mixati apa, oua si faina, faceti coca si apoi taiati-o fasii',7,'2025-03-06'),(11,'carnati fierti','fierbeti carnatii in apa pana se fac, dupa ii mancati',8,'2025-03-07'),(12,'musaca','straturi de cartofi,carne,cartofi,carne,cartofi,smantana',9,'2025-03-08'),(13,'asdasd','<script>Alert(\'xss\')</script>',1,'2025-03-13');
/*!40000 ALTER TABLE `retete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitate_de_masura`
--

DROP TABLE IF EXISTS `unitate_de_masura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitate_de_masura` (
  `id_unitate_de_masura` int NOT NULL AUTO_INCREMENT,
  `unitate_de_masura` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_unitate_de_masura`) USING BTREE,
  UNIQUE KEY `unitate` (`unitate_de_masura`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitate_de_masura`
--

LOCK TABLES `unitate_de_masura` WRITE;
/*!40000 ALTER TABLE `unitate_de_masura` DISABLE KEYS */;
INSERT INTO `unitate_de_masura` VALUES (3,'buc'),(1,'g'),(2,'ml');
/*!40000 ALTER TABLE `unitate_de_masura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizatori`
--

DROP TABLE IF EXISTS `utilizatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilizatori` (
  `id_utilizatori` int NOT NULL AUTO_INCREMENT,
  `nume_utilizator` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'unic',
  `id_parola` int DEFAULT NULL,
  `nume` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenume` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` enum('admin','user') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `data_nasterii` date NOT NULL,
  `gen` enum('F','B','X') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_utilizatori`) USING BTREE,
  UNIQUE KEY `nume_utilizator` (`nume_utilizator`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizatori`
--

LOCK TABLES `utilizatori` WRITE;
/*!40000 ALTER TABLE `utilizatori` DISABLE KEYS */;
INSERT INTO `utilizatori` VALUES (1,'ionel55',1,'Gheorghe','Ion','user','2001-10-24','B'),(2,'vasile44',2,'Mincu','Vasile','user','1900-11-24','B'),(3,'maria33',3,'Gelu','Maria','user','2000-09-12','F'),(5,'gigel66',5,'Gheorghe','Gicu','user','2025-03-04','B'),(6,'&lt;samir/&gt;',6,'samir','abdullah','user','2025-04-23','X'),(7,'gog62',7,'gogut','georgel','user','1995-04-22','X'),(8,'ginel33',8,'gelu','marian','user','1902-03-22','F'),(9,'costica69',9,'samir','cicu','user','1969-12-14','X');
/*!40000 ALTER TABLE `utilizatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-13 17:07:56
