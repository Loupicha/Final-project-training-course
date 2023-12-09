CREATE DATABASE  IF NOT EXISTS `dw_vente_vw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dw_vente_vw`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: dw_vente_vw
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
  `PK_Dim_Date` int NOT NULL AUTO_INCREMENT,
  `annee` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_Dim_Date`),
  UNIQUE KEY `annee_UNIQUE` (`annee`)
) ENGINE=InnoDB AUTO_INCREMENT=4320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_annee`
--

LOCK TABLES `dim_annee` WRITE;
/*!40000 ALTER TABLE `dim_annee` DISABLE KEYS */;
INSERT INTO `dim_annee` VALUES (4260,'2013'),(4250,'2014'),(4240,'2015'),(4230,'2016'),(4220,'2017'),(4210,'2018'),(4200,'2019'),(4190,'2020'),(4180,'2021'),(4170,'2022');
/*!40000 ALTER TABLE `dim_annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_jour`
--

DROP TABLE IF EXISTS `dim_jour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_jour` (
  `iddim_jour` int NOT NULL AUTO_INCREMENT,
  `jour` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  PRIMARY KEY (`iddim_jour`),
  KEY `fk_jour_moi_idx` (`fk_mois`),
  CONSTRAINT `fk_jour_moi` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`)
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
  `iddim_marque` int NOT NULL AUTO_INCREMENT,
  `marque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_marque`),
  UNIQUE KEY `marque_UNIQUE` (`marque`)
) ENGINE=InnoDB AUTO_INCREMENT=3367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_marque`
--

LOCK TABLES `dim_marque` WRITE;
/*!40000 ALTER TABLE `dim_marque` DISABLE KEYS */;
INSERT INTO `dim_marque` VALUES (3269,'Å KODA'),(3268,'Audi'),(3271,'Bentley'),(3275,'MAN'),(3272,'Porsche'),(3274,'Scania'),(3270,'SEAT'),(3273,'Volkswagen\nCommercial Vehicles'),(3267,'Volkswagen Passenger Cars'),(3276,'VW China');
/*!40000 ALTER TABLE `dim_marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_mois`
--

DROP TABLE IF EXISTS `dim_mois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_mois` (
  `iddim_mois` int NOT NULL AUTO_INCREMENT,
  `mois` varchar(45) DEFAULT NULL,
  `annee_key` int DEFAULT NULL,
  PRIMARY KEY (`iddim_mois`),
  KEY `fk_mois_anne_idx` (`annee_key`),
  CONSTRAINT `fk_mois_anne` FOREIGN KEY (`annee_key`) REFERENCES `dim_annee` (`PK_Dim_Date`)
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
  `iddim_zone_geo` int NOT NULL AUTO_INCREMENT,
  `zone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo`),
  UNIQUE KEY `zone_UNIQUE` (`zone`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_zone_geo`
--

LOCK TABLES `dim_zone_geo` WRITE;
/*!40000 ALTER TABLE `dim_zone_geo` DISABLE KEYS */;
INSERT INTO `dim_zone_geo` VALUES (594,'Asia-Pacific'),(591,'Europe'),(592,'North America'),(593,'South America');
/*!40000 ALTER TABLE `dim_zone_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_zone_geo_region`
--

DROP TABLE IF EXISTS `dim_zone_geo_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_zone_geo_region` (
  `iddim_zone_geo_1` int NOT NULL AUTO_INCREMENT,
  `region` varchar(45) DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  PRIMARY KEY (`iddim_zone_geo_1`),
  KEY `fk_zone_geo_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_zone_geo` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`)
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
-- Table structure for table `tf_ventes_geo`
--

DROP TABLE IF EXISTS `tf_ventes_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_geo` (
  `KP` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` int DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_zone_geo` int DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_marque` int DEFAULT NULL,
  PRIMARY KEY (`KP`),
  KEY `fk_annee_idx` (`fk_annee`),
  KEY `fk_mois_idx` (`fk_mois`),
  KEY `fk_jour_idx` (`fk_jour`),
  KEY `fk_marque_idx` (`fk_marque`),
  KEY `fk_zone_idx` (`fk_zone_geo`),
  KEY `fk_zone_region_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_annee_marque` FOREIGN KEY (`fk_annee`) REFERENCES `dim_annee` (`PK_Dim_Date`),
  CONSTRAINT `fk_jour_marque` FOREIGN KEY (`fk_jour`) REFERENCES `dim_jour` (`iddim_jour`),
  CONSTRAINT `fk_marque_marque` FOREIGN KEY (`fk_marque`) REFERENCES `dim_marque` (`iddim_marque`),
  CONSTRAINT `fk_mois_marque` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`),
  CONSTRAINT `fk_zone_marque` FOREIGN KEY (`fk_zone_geo`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`),
  CONSTRAINT `fk_zone_region_marque` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo_region` (`iddim_zone_geo_1`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_geo`
--

LOCK TABLES `tf_ventes_geo` WRITE;
/*!40000 ALTER TABLE `tf_ventes_geo` DISABLE KEYS */;
INSERT INTO `tf_ventes_geo` VALUES (361,3495000,154529000000,591,NULL,4170,NULL,NULL,NULL),(362,868000,60077000000,592,NULL,4170,NULL,NULL,NULL),(363,487000,15476000000,593,NULL,4170,NULL,NULL,NULL),(364,3632000,51444000000,594,NULL,4170,NULL,NULL,NULL),(365,3727000,145570000000,591,NULL,4180,NULL,NULL,NULL),(366,805000,45305000000,592,NULL,4180,NULL,NULL,NULL),(367,503000,11039000000,593,NULL,4180,NULL,NULL,NULL),(368,3540000,48672000000,594,NULL,4180,NULL,NULL,NULL),(369,3929000,133499000000,591,NULL,4190,NULL,NULL,NULL),(370,744000,36810000000,592,NULL,4190,NULL,NULL,NULL),(371,471000,8632000000,593,NULL,4190,NULL,NULL,NULL),(372,4012000,44288000000,594,NULL,4190,NULL,NULL,NULL),(373,4856000,153999000000,591,NULL,4200,NULL,NULL,NULL),(374,956000,43351000000,592,NULL,4200,NULL,NULL,NULL),(375,607000,11297000000,593,NULL,4200,NULL,NULL,NULL),(376,4538000,43974000000,594,NULL,4200,NULL,NULL,NULL),(377,4739000,143089000000,591,NULL,4210,NULL,NULL,NULL),(378,925000,37656000000,592,NULL,4210,NULL,NULL,NULL),(379,596000,10405000000,593,NULL,4210,NULL,NULL,NULL),(380,4640000,43166000000,594,NULL,4210,NULL,NULL,NULL),(381,4731000,142753000000,591,NULL,4220,NULL,NULL,NULL),(382,992000,37686000000,592,NULL,4220,NULL,NULL,NULL),(383,526000,9988000000,593,NULL,4220,NULL,NULL,NULL),(384,4527000,39123000000,594,NULL,4220,NULL,NULL,NULL),(385,4635000,138079000000,591,NULL,4230,NULL,NULL,NULL),(386,968000,35454000000,592,NULL,4230,NULL,NULL,NULL),(387,421000,7973000000,593,NULL,4230,NULL,NULL,NULL),(388,4367000,35761000000,594,NULL,4230,NULL,NULL,NULL),(389,4524000,132535000000,591,NULL,4240,NULL,NULL,NULL),(390,941000,35384000000,592,NULL,4240,NULL,NULL,NULL),(391,540000,10148000000,593,NULL,4240,NULL,NULL,NULL),(392,4005000,35225000000,594,NULL,4240,NULL,NULL,NULL),(393,4430000,122858000000,591,NULL,4250,NULL,NULL,NULL),(394,879000,27619000000,592,NULL,4250,NULL,NULL,NULL),(395,794000,13868000000,593,NULL,4250,NULL,NULL,NULL),(396,4114000,38113000000,594,NULL,4250,NULL,NULL,NULL),(397,4209000,117062000000,591,NULL,4260,NULL,NULL,NULL),(398,901000,27434000000,592,NULL,4260,NULL,NULL,NULL),(399,987000,17495000000,593,NULL,4260,NULL,NULL,NULL),(400,3632000,35016000000,594,NULL,4260,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tf_ventes_geo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_marque`
--

DROP TABLE IF EXISTS `tf_ventes_marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_marque` (
  `KP` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` int DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_zone_geo` int DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_marque` int DEFAULT NULL,
  PRIMARY KEY (`KP`),
  KEY `fk_annee_idx` (`fk_annee`),
  KEY `fk_mois_idx` (`fk_mois`),
  KEY `fk_jour_idx` (`fk_jour`),
  KEY `fk_marque_idx` (`fk_marque`),
  KEY `fk_zone_idx` (`fk_zone_geo`),
  KEY `fk_zone_region_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_annee_geo` FOREIGN KEY (`fk_annee`) REFERENCES `dim_annee` (`PK_Dim_Date`),
  CONSTRAINT `fk_jour_geo` FOREIGN KEY (`fk_jour`) REFERENCES `dim_jour` (`iddim_jour`),
  CONSTRAINT `fk_marque_geo` FOREIGN KEY (`fk_marque`) REFERENCES `dim_marque` (`iddim_marque`),
  CONSTRAINT `fk_mois_geo` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`),
  CONSTRAINT `fk_zone_geo_geotf_ventes_geo` FOREIGN KEY (`fk_zone_geo`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`),
  CONSTRAINT `fk_zone_region_geo` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo_region` (`iddim_zone_geo_1`)
) ENGINE=InnoDB AUTO_INCREMENT=3051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_marque`
--

LOCK TABLES `tf_ventes_marque` WRITE;
/*!40000 ALTER TABLE `tf_ventes_marque` DISABLE KEYS */;
INSERT INTO `tf_ventes_marque` VALUES (2951,2594000,73773000000,NULL,NULL,4170,NULL,NULL,3267),(2952,1070000,61753000000,NULL,NULL,4170,NULL,NULL,3268),(2953,863000,21026000000,NULL,NULL,4170,NULL,NULL,3269),(2954,468000,10941000000,NULL,NULL,4170,NULL,NULL,3270),(2955,0,0,NULL,NULL,4170,NULL,NULL,3271),(2956,314000,34591000000,NULL,NULL,4170,NULL,NULL,3272),(2957,340000,11455000000,NULL,NULL,4170,NULL,NULL,3273),(2958,0,0,NULL,NULL,4170,NULL,NULL,3274),(2959,0,0,NULL,NULL,4170,NULL,NULL,3275),(2960,3122000,0,NULL,NULL,4170,NULL,NULL,3276),(2961,2719000,67856000000,NULL,NULL,4180,NULL,NULL,3267),(2962,1024000,55914000000,NULL,NULL,4180,NULL,NULL,3268),(2963,784000,17743000000,NULL,NULL,4180,NULL,NULL,3269),(2964,494000,9614000000,NULL,NULL,4180,NULL,NULL,3270),(2965,0,0,NULL,NULL,4180,NULL,NULL,3271),(2966,297000,30289000000,NULL,NULL,4180,NULL,NULL,3272),(2967,326000,9909000000,NULL,NULL,4180,NULL,NULL,3273),(2968,0,0,NULL,NULL,4180,NULL,NULL,3274),(2969,0,0,NULL,NULL,4180,NULL,NULL,3275),(2970,3042000,0,NULL,NULL,4180,NULL,NULL,3276),(2971,2835000,71076000000,NULL,NULL,4190,NULL,NULL,3267),(2972,1017000,49973000000,NULL,NULL,4190,NULL,NULL,3268),(2973,849000,17081000000,NULL,NULL,4190,NULL,NULL,3269),(2974,484000,9198000000,NULL,NULL,4190,NULL,NULL,3270),(2975,11000,2049000000,NULL,NULL,4190,NULL,NULL,3271),(2976,265000,26086000000,NULL,NULL,4190,NULL,NULL,3272),(2977,345000,9358000000,NULL,NULL,4190,NULL,NULL,3273),(2978,73000,11521000000,NULL,NULL,4190,NULL,NULL,3274),(2979,118000,10838000000,NULL,NULL,4190,NULL,NULL,3275),(2980,3577000,0,NULL,NULL,4190,NULL,NULL,3276),(2981,3677000,88407000000,NULL,NULL,4200,NULL,NULL,3267),(2982,1200000,55680000000,NULL,NULL,4200,NULL,NULL,3268),(2983,1062000,19806000000,NULL,NULL,4200,NULL,NULL,3269),(2984,667000,11496000000,NULL,NULL,4200,NULL,NULL,3270),(2985,12000,2092000000,NULL,NULL,4200,NULL,NULL,3271),(2986,277000,26060000000,NULL,NULL,4200,NULL,NULL,3272),(2987,456000,11473000000,NULL,NULL,4200,NULL,NULL,3273),(2988,101000,13934000000,NULL,NULL,4200,NULL,NULL,3274),(2989,143000,12663000000,NULL,NULL,4200,NULL,NULL,3275),(2990,4048000,0,NULL,NULL,4200,NULL,NULL,3276),(2991,3715000,84585000000,NULL,NULL,4210,NULL,NULL,3267),(2992,1467000,59248000000,NULL,NULL,4210,NULL,NULL,3268),(2993,957000,17293000000,NULL,NULL,4210,NULL,NULL,3269),(2994,608000,10202000000,NULL,NULL,4210,NULL,NULL,3270),(2995,10000,1548000000,NULL,NULL,4210,NULL,NULL,3271),(2996,253000,23668000000,NULL,NULL,4210,NULL,NULL,3272),(2997,469000,11875000000,NULL,NULL,4210,NULL,NULL,3273),(2998,97000,13360000000,NULL,NULL,4210,NULL,NULL,3274),(2999,0,0,NULL,NULL,4210,NULL,NULL,3275),(3000,4101000,0,NULL,NULL,4210,NULL,NULL,3276),(3001,3573000,79186000000,NULL,NULL,4220,NULL,NULL,3267),(3002,1530000,59789000000,NULL,NULL,4220,NULL,NULL,3268),(3003,937000,16559000000,NULL,NULL,4220,NULL,NULL,3269),(3004,595000,9892000000,NULL,NULL,4220,NULL,NULL,3270),(3005,11000,1843000000,NULL,NULL,4220,NULL,NULL,3271),(3006,248000,21674000000,NULL,NULL,4220,NULL,NULL,3272),(3007,498000,11909000000,NULL,NULL,4220,NULL,NULL,3273),(3008,92000,12789000000,NULL,NULL,4220,NULL,NULL,3274),(3009,0,0,NULL,NULL,4220,NULL,NULL,3275),(3010,4020000,0,NULL,NULL,4220,NULL,NULL,3276),(3011,4347000,105651000000,NULL,NULL,4230,NULL,NULL,3267),(3012,1534000,59317000000,NULL,NULL,4230,NULL,NULL,3268),(3013,814000,13705000000,NULL,NULL,4230,NULL,NULL,3269),(3014,548000,8894000000,NULL,NULL,4230,NULL,NULL,3270),(3015,11000,2031000000,NULL,NULL,4230,NULL,NULL,3271),(3016,239000,22318000000,NULL,NULL,4230,NULL,NULL,3272),(3017,478000,11120000000,NULL,NULL,4230,NULL,NULL,3273),(3018,83000,11303000000,NULL,NULL,4230,NULL,NULL,3274),(3019,0,0,NULL,NULL,4230,NULL,NULL,3275),(3020,3873000,0,NULL,NULL,4230,NULL,NULL,3276),(3021,4424000,106240000000,NULL,NULL,4240,NULL,NULL,3267),(3022,1529000,58420000000,NULL,NULL,4240,NULL,NULL,3268),(3023,800000,12486000000,NULL,NULL,4240,NULL,NULL,3269),(3024,544000,8572000000,NULL,NULL,4240,NULL,NULL,3270),(3025,11000,1936000000,NULL,NULL,4240,NULL,NULL,3271),(3026,219000,21533000000,NULL,NULL,4240,NULL,NULL,3272),(3027,456000,10341000000,NULL,NULL,4240,NULL,NULL,3273),(3028,78000,10479000000,NULL,NULL,4240,NULL,NULL,3274),(3029,0,0,NULL,NULL,4240,NULL,NULL,3275),(3030,3456000,0,NULL,NULL,4240,NULL,NULL,3276),(3031,4583000,99764000000,NULL,NULL,4250,NULL,NULL,3267),(3032,1444000,53787000000,NULL,NULL,4250,NULL,NULL,3268),(3033,796000,11758000000,NULL,NULL,4250,NULL,NULL,3269),(3034,501000,7699000000,NULL,NULL,4250,NULL,NULL,3270),(3035,11000,1746000000,NULL,NULL,4250,NULL,NULL,3271),(3036,187000,17205000000,NULL,NULL,4250,NULL,NULL,3272),(3037,442000,9577000000,NULL,NULL,4250,NULL,NULL,3273),(3038,80000,10381000000,NULL,NULL,4250,NULL,NULL,3274),(3039,120000,14286000000,NULL,NULL,4250,NULL,NULL,3275),(3040,3506000,0,NULL,NULL,4250,NULL,NULL,3276),(3041,4704000,99397000000,NULL,NULL,4260,NULL,NULL,3267),(3042,1349000,49880000000,NULL,NULL,4260,NULL,NULL,3268),(3043,719000,10324000000,NULL,NULL,4260,NULL,NULL,3269),(3044,459000,6874000000,NULL,NULL,4260,NULL,NULL,3270),(3045,11000,1679000000,NULL,NULL,4260,NULL,NULL,3271),(3046,155000,14326000000,NULL,NULL,4260,NULL,NULL,3272),(3047,436000,9370000000,NULL,NULL,4260,NULL,NULL,3273),(3048,80000,10360000000,NULL,NULL,4260,NULL,NULL,3274),(3049,140000,15861000000,NULL,NULL,4260,NULL,NULL,3275),(3050,3038000,0,NULL,NULL,4260,NULL,NULL,3276);
/*!40000 ALTER TABLE `tf_ventes_marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_ventes_vw`
--

DROP TABLE IF EXISTS `tf_ventes_vw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tf_ventes_vw` (
  `KP` int NOT NULL AUTO_INCREMENT,
  `Qtt_vendu` int DEFAULT NULL,
  `Montant_Vente` float DEFAULT NULL,
  `fk_zone_geo` int DEFAULT NULL,
  `fk_zone_geo_region` int DEFAULT NULL,
  `fk_annee` int DEFAULT NULL,
  `fk_mois` int DEFAULT NULL,
  `fk_jour` int DEFAULT NULL,
  `fk_marque` int DEFAULT NULL,
  PRIMARY KEY (`KP`),
  KEY `fk_annee_idx` (`fk_annee`),
  KEY `fk_mois_idx` (`fk_mois`),
  KEY `fk_jour_idx` (`fk_jour`),
  KEY `fk_marque_idx` (`fk_marque`),
  KEY `fk_zone_idx` (`fk_zone_geo`),
  KEY `fk_zone_region_idx` (`fk_zone_geo_region`),
  CONSTRAINT `fk_annee` FOREIGN KEY (`fk_annee`) REFERENCES `dim_annee` (`PK_Dim_Date`),
  CONSTRAINT `fk_jour` FOREIGN KEY (`fk_jour`) REFERENCES `dim_jour` (`iddim_jour`),
  CONSTRAINT `fk_marque` FOREIGN KEY (`fk_marque`) REFERENCES `dim_marque` (`iddim_marque`),
  CONSTRAINT `fk_mois` FOREIGN KEY (`fk_mois`) REFERENCES `dim_mois` (`iddim_mois`),
  CONSTRAINT `fk_zone` FOREIGN KEY (`fk_zone_geo`) REFERENCES `dim_zone_geo` (`iddim_zone_geo`),
  CONSTRAINT `fk_zone_region` FOREIGN KEY (`fk_zone_geo_region`) REFERENCES `dim_zone_geo_region` (`iddim_zone_geo_1`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_ventes_vw`
--

LOCK TABLES `tf_ventes_vw` WRITE;
/*!40000 ALTER TABLE `tf_ventes_vw` DISABLE KEYS */;
INSERT INTO `tf_ventes_vw` VALUES (51,2594000,73773000000,NULL,NULL,4170,NULL,NULL,NULL),(52,2719000,67856000000,NULL,NULL,4180,NULL,NULL,NULL),(53,2835000,71076000000,NULL,NULL,4190,NULL,NULL,NULL),(54,3677000,88407000000,NULL,NULL,4200,NULL,NULL,NULL),(55,3715000,84585000000,NULL,NULL,4210,NULL,NULL,NULL),(56,3573000,79186000000,NULL,NULL,4220,NULL,NULL,NULL),(57,4347000,105651000000,NULL,NULL,4230,NULL,NULL,NULL),(58,4424000,106240000000,NULL,NULL,4240,NULL,NULL,NULL),(59,4583000,99764000000,NULL,NULL,4250,NULL,NULL,NULL),(60,4704000,99397000000,NULL,NULL,4260,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tf_ventes_vw` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-01 15:29:51
