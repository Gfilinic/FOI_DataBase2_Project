CREATE DATABASE  IF NOT EXISTS `kafić` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kafić`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: kafić
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `artikl`
--

DROP TABLE IF EXISTS `artikl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artikl` (
  `idArtikl` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  `Cijena` double NOT NULL,
  `V_Nromativ` int NOT NULL,
  PRIMARY KEY (`idArtikl`),
  UNIQUE KEY `Naziv_UNIQUE` (`Naziv`),
  UNIQUE KEY `V_Nromativ_UNIQUE` (`V_Nromativ`),
  CONSTRAINT `V_nromativ` FOREIGN KEY (`V_Nromativ`) REFERENCES `normativ` (`idNormativ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artikl`
--

LOCK TABLES `artikl` WRITE;
/*!40000 ALTER TABLE `artikl` DISABLE KEYS */;
/*!40000 ALTER TABLE `artikl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konobar`
--

DROP TABLE IF EXISTS `konobar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konobar` (
  `idKonobar` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(45) NOT NULL,
  `Prezime` varchar(45) NOT NULL,
  `OIB` char(9) DEFAULT NULL,
  `Datum_rodenja` datetime DEFAULT NULL,
  PRIMARY KEY (`idKonobar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konobar`
--

LOCK TABLES `konobar` WRITE;
/*!40000 ALTER TABLE `konobar` DISABLE KEYS */;
/*!40000 ALTER TABLE `konobar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mjera`
--

DROP TABLE IF EXISTS `mjera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mjera` (
  `idMjera` int NOT NULL AUTO_INCREMENT,
  `Mjerna_jedincia` varchar(3) NOT NULL,
  PRIMARY KEY (`idMjera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mjera`
--

LOCK TABLES `mjera` WRITE;
/*!40000 ALTER TABLE `mjera` DISABLE KEYS */;
/*!40000 ALTER TABLE `mjera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `način_plaćanja`
--

DROP TABLE IF EXISTS `način_plaćanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `način_plaćanja` (
  `idNačin_plaćanja` int NOT NULL AUTO_INCREMENT,
  `Način_plaćanja` varchar(45) NOT NULL,
  PRIMARY KEY (`idNačin_plaćanja`),
  UNIQUE KEY `Način_plaćanja_UNIQUE` (`Način_plaćanja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `način_plaćanja`
--

LOCK TABLES `način_plaćanja` WRITE;
/*!40000 ALTER TABLE `način_plaćanja` DISABLE KEYS */;
/*!40000 ALTER TABLE `način_plaćanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normativ`
--

DROP TABLE IF EXISTS `normativ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normativ` (
  `idNormativ` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`idNormativ`),
  UNIQUE KEY `Naziv_UNIQUE` (`Naziv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normativ`
--

LOCK TABLES `normativ` WRITE;
/*!40000 ALTER TABLE `normativ` DISABLE KEYS */;
/*!40000 ALTER TABLE `normativ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postavka`
--

DROP TABLE IF EXISTS `postavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postavka` (
  `idPostavka` int NOT NULL AUTO_INCREMENT,
  `V_Sastojak` int DEFAULT NULL,
  `V_Mjera` int DEFAULT NULL,
  `Količina` int DEFAULT NULL,
  PRIMARY KEY (`idPostavka`),
  KEY `V_Sastojak_idx` (`V_Sastojak`),
  KEY `V_Mjera_idx` (`V_Mjera`),
  CONSTRAINT `V_Mjera` FOREIGN KEY (`V_Mjera`) REFERENCES `mjera` (`idMjera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `V_Sastojak` FOREIGN KEY (`V_Sastojak`) REFERENCES `sastojak` (`idSastojak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postavka`
--

LOCK TABLES `postavka` WRITE;
/*!40000 ALTER TABLE `postavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `postavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `povijest_transakcija`
--

DROP TABLE IF EXISTS `povijest_transakcija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `povijest_transakcija` (
  `IdPovijest_transakcija` int NOT NULL AUTO_INCREMENT,
  `Vrijeme` timestamp NULL DEFAULT NULL,
  `Konobar` int DEFAULT NULL,
  `Stol` int DEFAULT NULL,
  `Način_plaćanja` int DEFAULT NULL,
  `Ukupna_cijena` double DEFAULT NULL,
  PRIMARY KEY (`IdPovijest_transakcija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `povijest_transakcija`
--

LOCK TABLES `povijest_transakcija` WRITE;
/*!40000 ALTER TABLE `povijest_transakcija` DISABLE KEYS */;
/*!40000 ALTER TABLE `povijest_transakcija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `račun`
--

DROP TABLE IF EXISTS `račun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `račun` (
  `idRačun` int NOT NULL AUTO_INCREMENT,
  `Vrijeme` timestamp NOT NULL,
  `Konobar` int NOT NULL,
  `Stol` int NOT NULL,
  `Način_plaćanja` int NOT NULL,
  `Ukupna_cijena` double NOT NULL,
  PRIMARY KEY (`idRačun`),
  KEY `V_Konobar_idx` (`Konobar`),
  KEY `V_Stol_idx` (`Stol`),
  KEY `V_Način_plaćanja_idx` (`Način_plaćanja`),
  CONSTRAINT `V_Konobar` FOREIGN KEY (`Konobar`) REFERENCES `konobar` (`idKonobar`),
  CONSTRAINT `V_Način_plaćanja` FOREIGN KEY (`Način_plaćanja`) REFERENCES `način_plaćanja` (`idNačin_plaćanja`),
  CONSTRAINT `V_Stol` FOREIGN KEY (`Stol`) REFERENCES `stol` (`idStol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `račun`
--

LOCK TABLES `račun` WRITE;
/*!40000 ALTER TABLE `račun` DISABLE KEYS */;
/*!40000 ALTER TABLE `račun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sastojak`
--

DROP TABLE IF EXISTS `sastojak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sastojak` (
  `idSastojak` int NOT NULL AUTO_INCREMENT,
  `Sastojak` varchar(45) NOT NULL,
  PRIMARY KEY (`idSastojak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sastojak`
--

LOCK TABLES `sastojak` WRITE;
/*!40000 ALTER TABLE `sastojak` DISABLE KEYS */;
/*!40000 ALTER TABLE `sastojak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavka`
--

DROP TABLE IF EXISTS `stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavka` (
  `idStavka` int NOT NULL AUTO_INCREMENT,
  `V_Normativ` int DEFAULT NULL,
  `V_Podstavka` int DEFAULT NULL,
  PRIMARY KEY (`idStavka`),
  KEY `V_Normativ_idx` (`V_Normativ`),
  KEY `V_Podstavka_idx` (`V_Podstavka`),
  CONSTRAINT `V_Normativ` FOREIGN KEY (`V_Normativ`) REFERENCES `normativ` (`idNormativ`),
  CONSTRAINT `V_Podstavka` FOREIGN KEY (`V_Podstavka`) REFERENCES `postavka` (`idPostavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavka`
--

LOCK TABLES `stavka` WRITE;
/*!40000 ALTER TABLE `stavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavka_računa`
--

DROP TABLE IF EXISTS `stavka_računa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavka_računa` (
  `idStavka_računa` int NOT NULL AUTO_INCREMENT,
  `Račun` int DEFAULT NULL,
  `Artikl` int DEFAULT NULL,
  `Količina` int DEFAULT NULL,
  `Cijena` double DEFAULT NULL,
  PRIMARY KEY (`idStavka_računa`),
  KEY `V_Račun_idx` (`Račun`),
  KEY `V_artikl_idx` (`Artikl`),
  CONSTRAINT `V_Artikl` FOREIGN KEY (`Artikl`) REFERENCES `artikl` (`idArtikl`),
  CONSTRAINT `V_Račun` FOREIGN KEY (`Račun`) REFERENCES `račun` (`idRačun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavka_računa`
--

LOCK TABLES `stavka_računa` WRITE;
/*!40000 ALTER TABLE `stavka_računa` DISABLE KEYS */;
/*!40000 ALTER TABLE `stavka_računa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stol`
--

DROP TABLE IF EXISTS `stol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stol` (
  `idStol` int NOT NULL AUTO_INCREMENT,
  `Broj_Stola` int DEFAULT NULL,
  `Broj_,Mjesta` int DEFAULT NULL,
  PRIMARY KEY (`idStol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stol`
--

LOCK TABLES `stol` WRITE;
/*!40000 ALTER TABLE `stol` DISABLE KEYS */;
/*!40000 ALTER TABLE `stol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kafić'
--

--
-- Dumping routines for database 'kafić'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-15  0:14:58
