CREATE DATABASE  IF NOT EXISTS `dw_vente_bmw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dw_vente_bmw`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: dw_vente_bmw
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `dim_annee`
--

DROP TABLE IF EXISTS `dim_annee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_annee` (
  `PK_Dim_Date` int NOT NULL,
  `annee` int DEFAULT NULL,
  PRIMARY KEY (`PK_Dim_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_annee`
--

LOCK TABLES `dim_annee` WRITE;
/*!40000 ALTER TABLE `dim_annee` DISABLE KEYS */;
INSERT INTO `dim_annee` VALUES (1,2022),(2,2021),(3,2020),(4,2019),(5,2018);
/*!40000 ALTER TABLE `dim_annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_jour`
--

DROP TABLE IF EXISTS `dim_jour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_jour` (
  `iddim_jour` int NOT NULL,
  `jour` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  PRIMARY KEY (`iddim_jour`),
  KEY `fk_mois_jour_idx` (`fk_mois`),
  CONSTRAINT `fk_mois_jour` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_jour`
--

LOCK TABLES `dim_jour` WRITE;
/*!40000 ALTER TABLE `dim_jour` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_jour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_marque`
--

DROP TABLE IF EXISTS `dim_marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_marque` (
  `iddim_marque` int NOT NULL,
  `marque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_marque`
--

LOCK TABLES `dim_marque` WRITE;
/*!40000 ALTER TABLE `dim_marque` DISABLE KEYS */;
INSERT INTO `dim_marque` VALUES (1,'BMW'),(2,'MINI'),(3,'Rolls-Royce');
/*!40000 ALTER TABLE `dim_marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_mois`
--

DROP TABLE IF EXISTS `dim_mois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_mois` (
  `iddim_mois` int NOT NULL,
  `mois` varchar(45) DEFAULT NULL,
  `annee_key` int DEFAULT NULL,
  PRIMARY KEY (`iddim_mois`),
  KEY `fk_mois_annee_idx` (`annee_key`),
  CONSTRAINT `key` FOREIGN KEY (`annee_key`) REFERENCES `dim_annee` (`PK_Dim_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_mois`
--

LOCK TABLES `dim_mois` WRITE;
/*!40000 ALTER TABLE `dim_mois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_mois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_zone_geo`
--

DROP TABLE IF EXISTS `dim_zone_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_zone_geo` (
  `iddim_zone_geo` int NOT NULL,
  `zone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_zone_geo`
--

LOCK TABLES `dim_zone_geo` WRITE;
/*!40000 ALTER TABLE `dim_zone_geo` DISABLE KEYS */;
INSERT INTO `dim_zone_geo` VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Other markets'),(5,'China');
/*!40000 ALTER TABLE `dim_zone_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_zone_geo_region`
--

DROP TABLE IF EXISTS `dim_zone_geo_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_zone_geo_region` (
  `iddim_zone_geo_1` int NOT NULL,
  `region` varchar(45) DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo_1`),
  KEY `fk_zone_gro_region_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_zone_gro_region` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_zone_geo_region`
--

LOCK TABLES `dim_zone_geo_region` WRITE;
/*!40000 ALTER TABLE `dim_zone_geo_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_zone_geo_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referentiel_prix`
--

DROP TABLE IF EXISTS `referentiel_prix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referentiel_prix` (
  `idreferentiel_prix` int NOT NULL AUTO_INCREMENT,
  `prix_min` float(10,2) DEFAULT NULL,
  `prix_max` float(10,2) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `energie` varchar(45) DEFAULT NULL,
  `boite_vitesse` varchar(45) DEFAULT NULL,
  `marque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idreferentiel_prix`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referentiel_prix`
--

LOCK TABLES `referentiel_prix` WRITE;
/*!40000 ALTER TABLE `referentiel_prix` DISABLE KEYS */;
INSERT INTO `referentiel_prix` VALUES (1,54490.00,98681.72,'BMW i4 Électrique','Electrique',NULL,'BMW'),(2,159890.00,200525.00,'BMW i7 Électrique','Electrique',NULL,'BMW'),(3,79580.01,151349.98,'BMW iX Électrique','Electrique',NULL,'BMW'),(4,61310.00,76120.02,'BMW iX1 Électrique','Electrique',NULL,'BMW'),(5,58234.99,86539.98,'BMW iX3 Électrique','Electrique',NULL,'BMW'),(6,46140.80,69718.98,'BMW Série 2','Hybrid',NULL,'BMW'),(7,53065.39,85053.97,'BMW Série 3','Hybrid',NULL,'BMW'),(8,67493.59,102951.40,'BMW Série 5','Hybrid',NULL,'BMW'),(9,157280.02,175590.00,'BMW Série 7','Hybrid',NULL,'BMW'),(10,56652.60,76415.00,'BMW X1','Hybrid',NULL,'BMW'),(11,50407.00,65123.98,'BMW X2','Hybrid',NULL,'BMW'),(12,66149.28,88810.00,'BMW X3','Hybrid',NULL,'BMW'),(13,99899.99,142849.00,'BMW X5','Hybrid',NULL,'BMW'),(14,172267.98,198934.98,'BMW XM','Hybrid',NULL,'BMW'),(15,133865.38,145184.98,'BMW M3','Thermique',NULL,'BMW'),(16,132210.00,160190.02,'BMW M4','Thermique',NULL,'BMW'),(17,37383.08,71325.00,'BMW Série 1','Thermique',NULL,'BMW'),(18,40490.00,79478.99,'BMW Série 2','Thermique',NULL,'BMW'),(19,48955.01,94565.57,'BMW Série 3','Thermique',NULL,'BMW'),(20,56378.00,100588.98,'BMW Série 4','Thermique',NULL,'BMW'),(21,64190.00,94744.99,'BMW Série 5','Thermique',NULL,'BMW'),(22,117489.99,117489.99,'BMW Série 8','Thermique',NULL,'BMW'),(23,47505.00,60182.80,'BMW X1','Thermique',NULL,'BMW'),(24,41279.00,57500.00,'BMW X2','Thermique',NULL,'BMW'),(25,53599.99,130680.00,'BMW X3','Thermique',NULL,'BMW'),(26,65692.98,101889.96,'BMW X4','Thermique',NULL,'BMW'),(27,111844.98,184264.98,'BMW X5','Thermique',NULL,'BMW'),(28,120765.01,198754.98,'BMW X6','Thermique',NULL,'BMW'),(29,135914.98,135914.98,'BMW X7','Thermique',NULL,'BMW'),(30,59990.00,90183.01,'BMW Z4','Thermique',NULL,'BMW'),(31,37400.00,41600.00,'Mini Mini','Electrique',NULL,'Mini'),(32,60490.00,60490.00,'Mini Cabrio','Electrique',NULL,'Mini'),(33,46000.00,52150.00,'Mini Countryman','Hybrid',NULL,'Mini'),(34,42900.00,42900.00,'MINI JOHN COOPER WORKS','Hybrid',NULL,'Mini'),(35,35500.00,46600.00,'Mini Cabrio','Thermique',NULL,'Mini'),(36,37700.00,53200.00,'Mini Clubman','Thermique',NULL,'Mini'),(37,38800.00,54300.00,'Mini Countryman','Thermique',NULL,'Mini'),(38,30400.00,47000.00,'Mini Mini','Thermique',NULL,'Mini'),(39,391800.00,391800.00,'Rolls-Royce Cullinan','Thermique',NULL,'Rolls-Royce'),(40,411990.00,411990.00,'Rolls-Royce Dawn','Thermique',NULL,'Rolls-Royce'),(41,303600.00,355770.00,'Rolls-Royce Ghost','Thermique',NULL,'Rolls-Royce'),(42,462000.00,558000.00,'Rolls-Royce Phantom','Thermique',NULL,'Rolls-Royce'),(43,423739.22,481259.38,'Rolls-Royce Wraith','Thermique',NULL,'Rolls-Royce');
/*!40000 ALTER TABLE `referentiel_prix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_marque_bmw`
--

DROP TABLE IF EXISTS `tf_ventes_marque_bmw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_marque_bmw` (
  `pk_ventes_marque_bmw` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` float DEFAULT NULL,
  `Montant_vente` float DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_marque` int DEFAULT NULL,
  PRIMARY KEY (`pk_ventes_marque_bmw`),
  KEY `fk_tf_jour_idx` (`fk_jour`),
  KEY `fk_tf_mois_idx` (`fk_mois`),
  KEY `fk_tf_annee_idx` (`fk_annee`),
  KEY `fk_tf_marque_idx` (`fk_marque`),
  CONSTRAINT `fk_tf_annee` FOREIGN KEY (`fk_annee`) REFERENCES `dim_annee` (`PK_Dim_Date`),
  CONSTRAINT `fk_tf_jour` FOREIGN KEY (`fk_jour`) REFERENCES `dim_jour` (`iddim_jour`),
  CONSTRAINT `fk_tf_marque` FOREIGN KEY (`fk_marque`) REFERENCES `dim_marque` (`iddim_marque`),
  CONSTRAINT `fk_tf_mois` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_marque_bmw`
--

LOCK TABLES `tf_ventes_marque_bmw` WRITE;
/*!40000 ALTER TABLE `tf_ventes_marque_bmw` DISABLE KEYS */;
INSERT INTO `tf_ventes_marque_bmw` VALUES (1,2117850,NULL,5,NULL,NULL,1),(2,364101,NULL,5,NULL,NULL,2),(3,4194,NULL,5,NULL,NULL,3),(4,2184940,NULL,4,NULL,NULL,1),(5,347465,NULL,4,NULL,NULL,2),(6,5100,NULL,4,NULL,NULL,3),(7,2028840,NULL,3,NULL,NULL,1),(8,292582,NULL,3,NULL,NULL,2),(9,3756,NULL,3,NULL,NULL,3),(10,2213790,NULL,2,NULL,NULL,1),(11,302138,NULL,2,NULL,NULL,2),(12,5586,NULL,2,NULL,NULL,3),(13,2100690,NULL,1,NULL,NULL,1),(14,292922,NULL,1,NULL,NULL,2),(15,6021,NULL,1,NULL,NULL,3);
/*!40000 ALTER TABLE `tf_ventes_marque_bmw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_zone_geo_bmw`
--

DROP TABLE IF EXISTS `tf_ventes_zone_geo_bmw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_zone_geo_bmw` (
  `pk_ventes_zone_geo_bmw` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` float DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_zone_geo` int DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  PRIMARY KEY (`pk_ventes_zone_geo_bmw`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_zone_geo_bmw`
--

LOCK TABLES `tf_ventes_zone_geo_bmw` WRITE;
/*!40000 ALTER TABLE `tf_ventes_zone_geo_bmw` DISABLE KEYS */;
INSERT INTO `tf_ventes_zone_geo_bmw` VALUES (1,878500,NULL,1,1,NULL,NULL),(2,441500,NULL,2,1,NULL,NULL),(3,237500,NULL,3,1,NULL,NULL),(4,48600,NULL,4,1,NULL,NULL),(5,793500,NULL,5,1,NULL,NULL),(6,949100,NULL,1,2,NULL,NULL),(7,451700,NULL,2,2,NULL,NULL),(8,220000,NULL,3,2,NULL,NULL),(9,52800,NULL,4,2,NULL,NULL),(10,847900,NULL,5,2,NULL,NULL),(11,913600,NULL,1,3,NULL,NULL),(12,379700,NULL,2,3,NULL,NULL),(13,208100,NULL,3,3,NULL,NULL),(14,45400,NULL,4,3,NULL,NULL),(15,778400,NULL,5,3,NULL,NULL),(16,1081600,NULL,1,4,NULL,NULL),(17,472900,NULL,2,4,NULL,NULL),(18,206100,NULL,3,4,NULL,NULL),(19,52200,NULL,4,4,NULL,NULL),(20,724700,NULL,5,4,NULL,NULL),(21,1097400,NULL,1,5,NULL,NULL),(22,457100,NULL,2,5,NULL,NULL),(23,236000,NULL,3,5,NULL,NULL),(24,59900,NULL,4,5,NULL,NULL),(25,635800,NULL,5,5,NULL,NULL);
/*!40000 ALTER TABLE `tf_ventes_zone_geo_bmw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 15:35:12
CREATE DATABASE  IF NOT EXISTS `dw_vente_stellantis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dw_vente_stellantis`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: dw_vente_stellantis
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `dim_annee`
--

DROP TABLE IF EXISTS `dim_annee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_annee` (
  `PK_Dim_Date` int NOT NULL,
  `annee` int DEFAULT NULL,
  PRIMARY KEY (`PK_Dim_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_annee`
--

LOCK TABLES `dim_annee` WRITE;
/*!40000 ALTER TABLE `dim_annee` DISABLE KEYS */;
INSERT INTO `dim_annee` VALUES (1,2022),(2,2021),(3,2020);
/*!40000 ALTER TABLE `dim_annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_jour`
--

DROP TABLE IF EXISTS `dim_jour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_jour` (
  `iddim_jour` int NOT NULL,
  `jour` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  PRIMARY KEY (`iddim_jour`),
  KEY `fk_mois_jour_idx` (`fk_mois`),
  CONSTRAINT `fk_mois_jour` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_jour`
--

LOCK TABLES `dim_jour` WRITE;
/*!40000 ALTER TABLE `dim_jour` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_jour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_marque`
--

DROP TABLE IF EXISTS `dim_marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_marque` (
  `iddim_marque` int NOT NULL,
  `marque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_marque`
--

LOCK TABLES `dim_marque` WRITE;
/*!40000 ALTER TABLE `dim_marque` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_mois`
--

DROP TABLE IF EXISTS `dim_mois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_mois` (
  `iddim_mois` int NOT NULL,
  `mois` varchar(45) DEFAULT NULL,
  `annee_key` int DEFAULT NULL,
  PRIMARY KEY (`iddim_mois`),
  KEY `fk_mois_annee_idx` (`annee_key`),
  CONSTRAINT `key` FOREIGN KEY (`annee_key`) REFERENCES `dim_annee` (`PK_Dim_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_mois`
--

LOCK TABLES `dim_mois` WRITE;
/*!40000 ALTER TABLE `dim_mois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_mois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_zone_geo`
--

DROP TABLE IF EXISTS `dim_zone_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_zone_geo` (
  `iddim_zone_geo` int NOT NULL,
  `zone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_zone_geo`
--

LOCK TABLES `dim_zone_geo` WRITE;
/*!40000 ALTER TABLE `dim_zone_geo` DISABLE KEYS */;
INSERT INTO `dim_zone_geo` VALUES (1,'Europe'),(2,'Other markets'),(3,'Asia'),(4,'China'),(5,'Americas');
/*!40000 ALTER TABLE `dim_zone_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_zone_geo_region`
--

DROP TABLE IF EXISTS `dim_zone_geo_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_zone_geo_region` (
  `iddim_zone_geo_1` int NOT NULL,
  `region` varchar(45) DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo_1`),
  KEY `fk_zone_gro_region_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_zone_gro_region` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_zone_geo_region`
--

LOCK TABLES `dim_zone_geo_region` WRITE;
/*!40000 ALTER TABLE `dim_zone_geo_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_zone_geo_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referentiel_prix`
--

DROP TABLE IF EXISTS `referentiel_prix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referentiel_prix` (
  `idreferentiel_prix` int NOT NULL AUTO_INCREMENT,
  `prix_min` float(10,2) DEFAULT NULL,
  `prix_max` float(10,2) DEFAULT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `energie` varchar(45) DEFAULT NULL,
  `boite_vitesse` varchar(45) DEFAULT NULL,
  `marque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idreferentiel_prix`)
) ENGINE=InnoDB AUTO_INCREMENT=865 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referentiel_prix`
--

LOCK TABLES `referentiel_prix` WRITE;
/*!40000 ALTER TABLE `referentiel_prix` DISABLE KEYS */;
INSERT INTO `referentiel_prix` VALUES (1,24600.00,36960.00,'500','Abarth','Thermique','Manuelle'),(2,26600.00,36600.00,'500','Abarth','Thermique','Automatique'),(3,36900.00,43000.00,'500','Abarth','Electrique','Automatique'),(4,27600.00,35000.00,'500C','Abarth','Thermique','Manuelle'),(5,29600.00,34600.00,'500C','Abarth','Thermique','Automatique'),(6,42300.00,46000.00,'500C','Abarth','Electrique','Automatique'),(7,47450.00,93500.00,'Giulia','Alfa Romeo','Thermique','Automatique'),(8,59500.00,102600.00,'Stelvio','Alfa Romeo','Thermique','Automatique'),(9,38500.00,43500.00,'Tonale','Alfa Romeo','Thermique','Automatique'),(10,38000.00,57600.00,'Tonale','Alfa Romeo','Hybride','Automatique'),(11,49445.43,67007.13,'Pacifica','Chrysler','Thermique','Automatique'),(12,55453.38,63309.93,'Pacifica','Chrysler','Hybride','Automatique'),(13,42929.11,52310.76,'300','Chrysler','Thermique','Automatique'),(14,36750.00,41700.00,'Berlingo','Citroën','Electrique','Automatique'),(15,16590.00,24480.00,'C3','Citroën','Thermique','Manuelle'),(16,24650.00,25600.00,'C4','Citroën','Thermique','Automatique'),(17,24400.00,29300.00,'C3 Aircross','Citroën','Thermique','Manuelle'),(18,28350.00,30250.00,'C3 Aircross','Citroën','Thermique','Automatique'),(19,27450.00,31750.00,'C4','Citroën','Thermique','Manuelle'),(20,31700.00,35550.00,'C4','Citroën','Thermique','Automatique'),(21,34990.00,45100.00,'C4','Citroën','Electrique','Automatique'),(22,27650.00,27650.00,'C4 X','Citroën','Thermique','Manuelle'),(23,32400.00,36250.00,'C4 X','Citroën','Thermique','Automatique'),(24,41900.00,45800.00,'C4 X','Citroën','Electrique','Automatique'),(25,33550.00,33550.00,'C5 Aircross','Citroën','Thermique','Manuelle'),(26,36550.00,41950.00,'C5 Aircross','Citroën','Thermique','Automatique'),(27,44750.00,51200.00,'C5 Aircross','Citroën','Hybride','Automatique'),(28,35400.00,31200.00,'C5 X','Citroën','Thermique','Automatique'),(29,48700.00,56100.00,'C5 X','Citroën','Hybride','Automatique'),(30,40680.00,57120.00,'Jumper','Citroën','Thermique','Manuelle'),(31,73188.00,82152.00,'Jumper','Citroën','Electrique','Automatique'),(32,35400.00,47460.00,'Jumpy','Citroën','Thermique','Manuelle'),(33,40920.00,50820.00,'Jumpy','Citroën','Thermique','Automatique'),(34,48600.00,62580.00,'Jumpy','Citroën','Electrique','Automatique'),(35,164162.00,165242.00,'Jumpy','Citroën','Hydrogène','Automatique'),(36,56720.00,72620.00,'Spacetourer','Citroën','Electrique','Automatique'),(37,37244.67,120981.63,'Challenger','Dodge','Thermique','Automatique'),(38,38048.81,104898.81,'Charger','Dodge','Thermique','Automatique'),(39,49630.29,123384.81,'Durango','Dodge','Thermique','Automatique'),(40,30100.00,30600.00,'3','DS','Thermique','Manuelle'),(41,33100.00,41800.00,'3','DS','Thermique','Automatique'),(42,41700.00,48800.00,'3','DS','Electrique','Automatique'),(43,27000.00,32400.00,'3 Crossback','DS','Thermique','Manuelle'),(44,30120.00,42600.00,'3 Crossback','DS','Thermique','Automatique'),(45,39300.00,50400.00,'3 Crossback','DS','Electrique','Automatique'),(46,33450.00,49000.00,'4','DS','Thermique','Automatique'),(47,41500.00,56100.00,'4','DS','Hybride','Automatique'),(48,44700.00,54500.00,'7','DS','Thermique','Automatique'),(49,53900.00,74800.00,'7','DS','Hybride','Automatique'),(50,67000.00,87000.00,'9','DS','Hybride','Automatique'),(51,18200.00,21500.00,'500','Fiat','Thermique','Manuelle'),(52,18200.00,21500.00,'500','Fiat','Electrique','Automatique'),(53,28400.00,41400.00,'500 3+1','Fiat','Electrique','Automatique'),(54,21200.00,27000.00,'500C','Fiat','Thermique','Manuelle'),(55,33800.00,42800.00,'500C','Fiat','Electrique','Automatique'),(56,29300.00,39800.00,'500X','Fiat','Thermique','Manuelle'),(57,32000.00,42200.00,'500X','Fiat','Thermique','Automatique'),(58,23712.00,24072.00,'Fiorino','Fiat','Thermique','Manuelle'),(59,12300.00,16590.00,'Panda','Fiat','Thermique','Manuelle'),(60,18090.00,20690.00,'Panda 4x4','Fiat','Thermique','Manuelle'),(61,28900.00,33900.00,'Tipo','Fiat','Thermique','Automatique'),(62,19990.00,31300.00,'Tipo Cross','Fiat','Thermique','Manuelle'),(63,28300.00,31100.00,'Tipo Cross','Fiat','Thermique','Automatique'),(64,29900.00,34900.00,'Tipo Sw','Fiat','Thermique','Automatique'),(65,54900.00,71400.00,'Ulysse','Fiat','Electrique','Automatique'),(66,27000.00,27000.00,'Avenger','Jeep','Thermique','Manuelle'),(67,39000.00,43500.00,'Avenger','Jeep','Electrique','Automatique'),(68,37450.00,44450.00,'Compass','Jeep','Thermique','Automatique'),(69,47490.00,53250.00,'Compass','Jeep','Hybride','Automatique'),(70,99500.00,99500.00,'Grand Cherokee','Jeep','Hybride','Automatique'),(71,30950.00,38800.00,'Renegade','Jeep','Thermique','Automatique'),(72,41990.00,47900.00,'Renegade','Jeep','Hybride','Automatique'),(73,92300.00,156300.00,'Ghibli','Maserati','Thermique','Automatique'),(74,181350.00,225650.00,'GranTurismo','Maserati','Thermique','Automatique'),(75,77000.00,117900.00,'Grecale','Maserati','Thermique','Automatique'),(76,98000.00,178750.00,'Levante','Maserati','Thermique','Automatique'),(77,235200.00,235200.00,'MC20','Maserati','Thermique','Automatique'),(78,153550.00,191400.00,'Quattroporte','Maserati','Thermique','Automatique'),(79,92300.00,156300.00,'Ghibli','Maserati','Thermique','Automatique'),(80,28100.00,32600.00,'Astra','Opel','Thermique','Manuelle'),(81,33100.00,36800.00,'Astra','Opel','Thermique','Automatique'),(82,44050.00,49150.00,'Astra','Opel','Hybride','Automatique'),(83,18800.00,22800.00,'Corsa','Opel','Thermique','Manuelle'),(84,23500.00,26300.00,'Corsa','Opel','Thermique','Automatique'),(85,36050.00,37600.00,'Corsa','Opel','Electrique','Automatique'),(86,26350.00,28700.00,'Crossland','Opel','Thermique','Manuelle'),(87,29600.00,29600.00,'Crossland','Opel','Thermique','Automatique'),(88,36000.00,36800.00,'Grandland','Opel','Thermique','Manuelle'),(89,37900.00,40850.00,'Grandland','Opel','Thermique','Automatique'),(90,48650.00,59700.00,'Grandland','Opel','Hybride','Automatique'),(91,25600.00,32500.00,'Mokka','Opel','Thermique','Manuelle'),(92,30250.00,34650.00,'Mokka','Opel','Thermique','Automatique'),(93,42000.00,46300.00,'Mokka','Opel','Electrique','Automatique'),(94,36750.00,41700.00,'Combo','Opel','Electrique','Automatique'),(95,34320.00,46340.00,'Vivaro','Opel','Thermique','Manuelle'),(96,39840.00,49740.00,'Vivaro','Opel','Thermique','Automatique'),(97,47160.00,61140.00,'Vivaro','Opel','Electrique','Automatique'),(98,55620.00,71520.00,'Zafira','Opel','Electrique','Automatique'),(99,39240.00,55680.00,'Movano','Opel','Thermique','Manuelle'),(100,73188.00,82152.00,'Movano','Opel','Electrique','Automatique'),(101,39250.00,39250.00,'Insignia','Opel','Thermique','Manuelle'),(102,40750.00,47700.00,'Insignia','Opel','Thermique','Automatique'),(103,38100.00,38100.00,'Insignia Grand Sport','Opel','Thermique','Manuelle'),(104,39800.00,46400.00,'Insignia Grand Sport','Opel','Thermique','Automatique'),(105,19200.00,27920.00,'208','Peugeot','Thermique','Manuelle'),(106,24220.00,30020.00,'208','Peugeot','Thermique','Automatique'),(107,34800.00,40000.00,'208','Peugeot','Electrique','Automatique'),(108,29420.00,32170.00,'308','Peugeot','Thermique','Manuelle'),(109,31420.00,38820.00,'308','Peugeot','Thermique','Automatique'),(110,40870.00,47470.00,'308','Peugeot','Hybride','Automatique'),(111,45720.00,48220.00,'308','Peugeot','Electrique','Automatique'),(112,37350.00,41800.00,'408','Peugeot','Thermique','Automatique'),(113,45450.00,51400.00,'408','Peugeot','Hybride','Automatique'),(114,45900.00,48200.00,'508','Peugeot','Thermique','Automatique'),(115,50200.00,70650.00,'508','Peugeot','Hybride','Automatique'),(116,47200.00,49500.00,'508 SW','Peugeot','Thermique','Automatique'),(117,51500.00,71950.00,'508 SW','Peugeot','Hybride','Automatique'),(118,26400.00,31870.00,'2008','Peugeot','Thermique','Manuelle'),(119,30370.00,35570.00,'2008','Peugeot','Thermique','Automatique'),(120,40150.00,45100.00,'2008','Peugeot','Electrique','Automatique'),(121,35320.00,40220.00,'3008','Peugeot','Thermique','Manuelle'),(122,37370.00,45170.00,'3008','Peugeot','Thermique','Automatique'),(123,46520.00,58120.00,'3008','Peugeot','Hybrid','Automatique'),(124,38120.00,43820.00,'5008','Peugeot','Thermique','Manuelle'),(125,40170.00,48770.00,'5008','Peugeot','Thermique','Automatique'),(126,41670.00,47370.00,'5008','Peugeot','Hybride','Automatique'),(127,35400.00,47460.00,'Expert','Peugeot','Thermique','Manuelle'),(128,40920.00,50820.00,'Expert','Peugeot','Thermique','Automatique'),(129,48600.00,62580.00,'Expert','Peugeot','Electrique','Automatique'),(130,164162.00,165242.00,'Expert','Peugeot','Hydrogène','Automatique'),(131,40680.00,57120.00,'Boxer','Peugeot','Thermique','Manuelle'),(132,73188.00,82152.00,'Boxer','Peugeot','Electrique','Automatique'),(133,56720.00,72620.00,'Traveller','Peugeot','Electrique','Automatique'),(134,25560.00,31980.00,'Partner','Peugeot','Thermique','Manuelle'),(135,29640.00,33120.00,'Partner','Peugeot','Thermique','Automatique'),(136,40440.00,44040.00,'Partner','Peugeot','Electrique','Automatique'),(137,37850.00,43050.00,'Rifter','Peugeot','Electrique','Automatique'),(138,28935.23,45489.47,'Ram 1500 Classic','Ram','Thermique','Automatique'),(139,35074.82,63350.98,'Ram 1500','Ram','Thermique','Automatique'),(140,78535.04,78535.04,'Ram 1500 TRX','Ram','Thermique','Automatique'),(141,40277.32,51363.77,'Ram Promaster','Ram','Thermique','Automatique'),(142,30059.61,30516.32,'Ram ProMaster City','Ram','Thermique','Automatique'),(143,47798.26,82932.62,'RAM 2500','Ram','Thermique','Automatique'),(144,44527.00,75322.80,'Ram 3500','Ram','Thermique','Automatique');
/*!40000 ALTER TABLE `referentiel_prix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_marque_stellantis`
--

DROP TABLE IF EXISTS `tf_ventes_marque_stellantis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_marque_stellantis` (
  `pk_ventes_marque_stellantis` int NOT NULL,
  `Qtt_vendu` float DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_marque` int DEFAULT NULL,
  PRIMARY KEY (`pk_ventes_marque_stellantis`),
  KEY `fk_tf_jour_idx` (`fk_jour`),
  KEY `fk_tf_mois_idx` (`fk_mois`),
  KEY `fk_tf_annee_idx` (`fk_annee`),
  KEY `fk_tf_marque_idx` (`fk_marque`),
  CONSTRAINT `fk_tf_annee` FOREIGN KEY (`fk_annee`) REFERENCES `dim_annee` (`PK_Dim_Date`),
  CONSTRAINT `fk_tf_jour` FOREIGN KEY (`fk_jour`) REFERENCES `dim_jour` (`iddim_jour`),
  CONSTRAINT `fk_tf_marque` FOREIGN KEY (`fk_marque`) REFERENCES `dim_marque` (`iddim_marque`),
  CONSTRAINT `fk_tf_mois` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_marque_stellantis`
--

LOCK TABLES `tf_ventes_marque_stellantis` WRITE;
/*!40000 ALTER TABLE `tf_ventes_marque_stellantis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tf_ventes_marque_stellantis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_zone_geo_stellantis`
--

DROP TABLE IF EXISTS `tf_ventes_zone_geo_stellantis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_zone_geo_stellantis` (
  `pk_ventes_zone_geo_stellantis` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` float DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_zone_geo` int DEFAULT NULL,
  PRIMARY KEY (`pk_ventes_zone_geo_stellantis`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_zone_geo_stellantis`
--

LOCK TABLES `tf_ventes_zone_geo_stellantis` WRITE;
/*!40000 ALTER TABLE `tf_ventes_zone_geo_stellantis` DISABLE KEYS */;
INSERT INTO `tf_ventes_zone_geo_stellantis` VALUES (1,2570000,NULL,1,NULL,NULL,1),(2,415000,NULL,1,NULL,NULL,2),(3,103000,NULL,1,NULL,NULL,3),(4,94000,NULL,1,NULL,NULL,4),(5,2635000,NULL,1,NULL,NULL,5),(6,3098000,NULL,2,NULL,NULL,1),(7,411000,NULL,2,NULL,NULL,2),(8,106000,NULL,2,NULL,NULL,3),(9,124000,NULL,2,NULL,NULL,4),(10,2817000,NULL,2,NULL,NULL,5),(11,3071000,NULL,3,NULL,NULL,1),(12,396000,NULL,3,NULL,NULL,2),(13,85000,NULL,3,NULL,NULL,3),(14,108000,NULL,3,NULL,NULL,4),(15,2650000,NULL,3,NULL,NULL,5);
/*!40000 ALTER TABLE `tf_ventes_zone_geo_stellantis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 15:35:12
