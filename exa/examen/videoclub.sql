CREATE DATABASE  IF NOT EXISTS `videoclub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `videoclub`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: videoclub
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `ACTOR`
--

DROP TABLE IF EXISTS `ACTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTOR` (
  `CodiActor` int NOT NULL,
  `Nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CodiActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTOR`
--

LOCK TABLES `ACTOR` WRITE;
/*!40000 ALTER TABLE `ACTOR` DISABLE KEYS */;
INSERT INTO `ACTOR` VALUES (12,'Tom Hanks'),(13,'Meryl Streep'),(14,'Brad Pitt'),(15,'Penélope Cruz'),(16,'Leonardo DiCaprio'),(17,'Antonio Banderas'),(18,'Charlize Theron'),(19,'Javier Bardem'),(20,'Christian Bale'),(21,'Heath Ledger'),(22,'Keira Knightley'),(23,'Anne Hathaway'),(24,'Orlando Bloom'),(25,'Robin Wright'),(26,'Gary Sinise');
/*!40000 ALTER TABLE `ACTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `DNI` char(10) NOT NULL,
  `Nom` varchar(20) DEFAULT NULL,
  `Adreca` varchar(20) DEFAULT NULL,
  `Telefon` char(9) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('011111111Z','Pere Puig Roig',NULL,'934444444'),('022222222R','Maria Catasús Comas',NULL,'555666111'),('11237653G','Javier Gates',NULL,'612853947'),('51525365B','Cristóbal Carnero','Calle Melancolía, 7','786678744'),('67347398B','Marco Aurelio',NULL,'615556765');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURA`
--

DROP TABLE IF EXISTS `FACTURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FACTURA` (
  `CodiFactura` int NOT NULL,
  `Data` date DEFAULT NULL,
  `Import` decimal(9,2) DEFAULT NULL,
  `DNI` char(10) DEFAULT NULL,
  PRIMARY KEY (`CodiFactura`),
  KEY `IDX_FACT_DNI` (`DNI`),
  CONSTRAINT `FACTURA_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `CLIENT` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURA`
--

LOCK TABLES `FACTURA` WRITE;
/*!40000 ALTER TABLE `FACTURA` DISABLE KEYS */;
INSERT INTO `FACTURA` VALUES (1,'2009-03-01',5.50,'011111111Z'),(2,'2009-03-02',4.50,'022222222R'),(3,'2009-03-06',13.50,'022222222R'),(4,'2024-03-06',10.25,'11237653G'),(5,'2024-03-06',5.50,'67347398B'),(6,'2024-03-01',2.50,'67347398B'),(7,'2024-02-24',8.50,'67347398B');
/*!40000 ALTER TABLE `FACTURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERE`
--

DROP TABLE IF EXISTS `GENERE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GENERE` (
  `CodiGenere` int NOT NULL,
  `Descripcio` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CodiGenere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERE`
--

LOCK TABLES `GENERE` WRITE;
/*!40000 ALTER TABLE `GENERE` DISABLE KEYS */;
INSERT INTO `GENERE` VALUES (1,'Terror'),(2,'Còmic'),(3,'Drama'),(4,'Aventura'),(5,'Romance'),(6,'Acción'),(7,'Suspense'),(8,'Fantasía'),(9,'Biográfica');
/*!40000 ALTER TABLE `GENERE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INTERPRETADA`
--

DROP TABLE IF EXISTS `INTERPRETADA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INTERPRETADA` (
  `CodiPeli` int NOT NULL,
  `CodiActor` int NOT NULL,
  PRIMARY KEY (`CodiPeli`,`CodiActor`),
  KEY `IDX_PELIINTERPRETADA` (`CodiPeli`),
  KEY `IDX_ACTORINTERPRETADA` (`CodiActor`),
  CONSTRAINT `INTERPRETADA_ibfk_1` FOREIGN KEY (`CodiPeli`) REFERENCES `PELICULA` (`CodiPeli`),
  CONSTRAINT `INTERPRETADA_ibfk_2` FOREIGN KEY (`CodiActor`) REFERENCES `ACTOR` (`CodiActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INTERPRETADA`
--

LOCK TABLES `INTERPRETADA` WRITE;
/*!40000 ALTER TABLE `INTERPRETADA` DISABLE KEYS */;
INSERT INTO `INTERPRETADA` VALUES (23,12),(23,25),(23,26),(24,13),(25,14),(26,15),(27,16),(28,17),(29,18),(30,19),(31,12),(31,21),(32,13),(33,14),(34,15),(35,16),(36,17),(37,18),(38,19),(41,22),(41,24);
/*!40000 ALTER TABLE `INTERPRETADA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PELICULA`
--

DROP TABLE IF EXISTS `PELICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PELICULA` (
  `CodiPeli` int NOT NULL,
  `Titol` varchar(100) DEFAULT NULL,
  `CodiGenere` int DEFAULT NULL,
  `SegonaPart` int DEFAULT NULL,
  `CodiActor` int DEFAULT NULL,
  PRIMARY KEY (`CodiPeli`),
  KEY `IDX_PELI_GEN` (`CodiGenere`),
  KEY `IDX_PELI_SEGP` (`SegonaPart`),
  KEY `IDX_PELI_ACT` (`CodiActor`),
  CONSTRAINT `PELICULA_ibfk_1` FOREIGN KEY (`CodiGenere`) REFERENCES `GENERE` (`CodiGenere`),
  CONSTRAINT `PELICULA_ibfk_2` FOREIGN KEY (`SegonaPart`) REFERENCES `PELICULA` (`CodiPeli`),
  CONSTRAINT `PELICULA_ibfk_3` FOREIGN KEY (`CodiActor`) REFERENCES `ACTOR` (`CodiActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PELICULA`
--

LOCK TABLES `PELICULA` WRITE;
/*!40000 ALTER TABLE `PELICULA` DISABLE KEYS */;
INSERT INTO `PELICULA` VALUES (23,'Forrest Gump',4,NULL,12),(24,'The Devil Wears Prada',5,NULL,13),(25,'Fight Club',6,NULL,14),(26,'Vicky Cristina Barcelona',5,NULL,15),(27,'Titanic',5,NULL,16),(28,'The Mask of Zorro',4,NULL,17),(29,'Mad Max: Fury Road',6,NULL,18),(30,'No Country for Old Men',7,NULL,19),(31,'The Departed',7,NULL,12),(32,'Inception',4,NULL,13),(33,'Ocean\'s Eleven',6,39,14),(34,'Pirates of the Caribbean',4,41,15),(35,'Gladiator',6,NULL,16),(36,'Desperado',6,NULL,17),(37,'Monster',5,NULL,18),(38,'Skyfall',7,NULL,19),(39,'Ocean\'\'s Twelve',6,NULL,14),(41,'Pirates of the Caribbean: At World\'s End',4,NULL,15);
/*!40000 ALTER TABLE `PELICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESTEC`
--

DROP TABLE IF EXISTS `PRESTEC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRESTEC` (
  `CodiPeli` int NOT NULL,
  `Data` date NOT NULL,
  `DNI` char(10) DEFAULT NULL,
  PRIMARY KEY (`CodiPeli`,`Data`),
  KEY `IDX_PRESTEC_CLIENT` (`DNI`),
  CONSTRAINT `PRESTEC_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `CLIENT` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESTEC`
--

LOCK TABLES `PRESTEC` WRITE;
/*!40000 ALTER TABLE `PRESTEC` DISABLE KEYS */;
INSERT INTO `PRESTEC` VALUES (23,'2009-03-01','011111111Z'),(23,'2009-03-02','022222222R'),(25,'2009-03-06','022222222R'),(33,'2024-03-06','11237653G'),(39,'2024-03-06','11237653G'),(38,'2024-03-06','67347398B'),(41,'2024-03-24','67347398B');
/*!40000 ALTER TABLE `PRESTEC` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 18:27:44
