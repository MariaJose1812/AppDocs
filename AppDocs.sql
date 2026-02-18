-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: appdocs
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `acta_entrega(detalle)`
--

DROP TABLE IF EXISTS `acta_entrega(detalle)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_entrega(detalle)` (
  `idActa_EntregaDet` int NOT NULL AUTO_INCREMENT,
  `idActa_EntregaEnc` int NOT NULL,
  `descripcion_AEDet` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `marca_AEDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `modelo_AEDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serie_AEDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `invFich_AEDet` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `asignado_a` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `observacion_AEDet` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `idFirmas_AEDet` int NOT NULL,
  PRIMARY KEY (`idActa_EntregaDet`),
  UNIQUE KEY `idActa_EntregaDet_UNIQUE` (`idActa_EntregaDet`),
  KEY `idActa_EntregaEnc_idx` (`idActa_EntregaEnc`),
  KEY `idFirmas_AEDet_idx` (`idFirmas_AEDet`),
  CONSTRAINT `idActa_EntregaEnc` FOREIGN KEY (`idActa_EntregaEnc`) REFERENCES `acta_entrega(encabezado)` (`idActa_EntregaEnc`),
  CONSTRAINT `idFirmas_AEDet` FOREIGN KEY (`idFirmas_AEDet`) REFERENCES `firmas` (`idFirmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_entrega(detalle)`
--

LOCK TABLES `acta_entrega(detalle)` WRITE;
/*!40000 ALTER TABLE `acta_entrega(detalle)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_entrega(detalle)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_entrega(encabezado)`
--

DROP TABLE IF EXISTS `acta_entrega(encabezado)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_entrega(encabezado)` (
  `idActa_EntregaEnc` int NOT NULL AUTO_INCREMENT,
  `idReceptores` int NOT NULL,
  `idUsuario` int NOT NULL,
  `cargo_rec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cargo_usu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `asunto_AEEnc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fech_AEEnc` datetime NOT NULL,
  `est_AEEnc` enum('Borrador','Finalizado') NOT NULL DEFAULT 'Borrador',
  PRIMARY KEY (`idActa_EntregaEnc`),
  UNIQUE KEY `idActa_EntregaEnc_UNIQUE` (`idActa_EntregaEnc`),
  KEY `idReceptores_idx` (`idReceptores`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idReceptores` FOREIGN KEY (`idReceptores`) REFERENCES `receptores` (`idReceptores`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_entrega(encabezado)`
--

LOCK TABLES `acta_entrega(encabezado)` WRITE;
/*!40000 ALTER TABLE `acta_entrega(encabezado)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_entrega(encabezado)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_recepcion(detalle)`
--

DROP TABLE IF EXISTS `acta_recepcion(detalle)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_recepcion(detalle)` (
  `idActa_RecepcionDet` int NOT NULL AUTO_INCREMENT,
  `idActa_RecepcionEnc` int NOT NULL,
  `descr_prod` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `precio_prod` decimal(10,2) NOT NULL,
  `num_recibo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `num_fact` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fech_ARCDet` datetime NOT NULL,
  `idFirm_ARCDet` int NOT NULL,
  `invFich_ARCDet` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idActa_RecepcionDet`),
  UNIQUE KEY `idActa_RecepcionDet_UNIQUE` (`idActa_RecepcionDet`),
  KEY `fk_encabezadoRecep_DetalleRecep_idx` (`idActa_RecepcionEnc`),
  KEY `fk_firmas_detalleRecepcion_idx` (`idFirm_ARCDet`),
  CONSTRAINT `fk_encabezadoRecep_DetalleRecep` FOREIGN KEY (`idActa_RecepcionEnc`) REFERENCES `acta_recepcion(encabezado)` (`idActa_RecepcionEnc`),
  CONSTRAINT `fk_firmas_detalleRecepcion` FOREIGN KEY (`idFirm_ARCDet`) REFERENCES `firmas` (`idFirmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_recepcion(detalle)`
--

LOCK TABLES `acta_recepcion(detalle)` WRITE;
/*!40000 ALTER TABLE `acta_recepcion(detalle)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_recepcion(detalle)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_recepcion(encabezado)`
--

DROP TABLE IF EXISTS `acta_recepcion(encabezado)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_recepcion(encabezado)` (
  `idActa_RecepcionEnc` int NOT NULL AUTO_INCREMENT,
  `idUsuarios` int NOT NULL,
  `idReceptores` int NOT NULL,
  `desc_ARCEnc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `est_ARCEnc` enum('Borrador','Finalizado') NOT NULL DEFAULT 'Borrador',
  PRIMARY KEY (`idActa_RecepcionEnc`),
  UNIQUE KEY `idActa_RecepcionEnc_UNIQUE` (`idActa_RecepcionEnc`),
  KEY `fk_usuarios_RecepcionDetalle_idx` (`idUsuarios`),
  KEY `fk_receptores_RecepcionDetalle_idx` (`idReceptores`),
  CONSTRAINT `fk_receptores_RecepcionDetalle` FOREIGN KEY (`idReceptores`) REFERENCES `receptores` (`idReceptores`),
  CONSTRAINT `fk_usuarios_RecepcionDetalle` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_recepcion(encabezado)`
--

LOCK TABLES `acta_recepcion(encabezado)` WRITE;
/*!40000 ALTER TABLE `acta_recepcion(encabezado)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_recepcion(encabezado)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_retiro(detalle)`
--

DROP TABLE IF EXISTS `acta_retiro(detalle)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_retiro(detalle)` (
  `idActa_RetiroDet` int NOT NULL AUTO_INCREMENT,
  `idActa_RetiroEnc` int NOT NULL,
  `desc_ARDet` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `marca_ARDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `modelo_ARDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serie_ARDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `invFich_ARDet` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idFirm_ARDet` int NOT NULL,
  `observa_ARDet` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idActa_RetiroDet`),
  UNIQUE KEY `idActa_RetiroDet_UNIQUE` (`idActa_RetiroDet`),
  KEY `fk_encabezado_detalle_idx` (`idActa_RetiroEnc`),
  KEY `fk_firmas_detalle_idx` (`idFirm_ARDet`),
  CONSTRAINT `fk_encabezado_detalle` FOREIGN KEY (`idActa_RetiroEnc`) REFERENCES `acta_retiro(encabezado)` (`idActa_RetiroEnc`),
  CONSTRAINT `fk_firmas_detalle` FOREIGN KEY (`idFirm_ARDet`) REFERENCES `firmas` (`idFirmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_retiro(detalle)`
--

LOCK TABLES `acta_retiro(detalle)` WRITE;
/*!40000 ALTER TABLE `acta_retiro(detalle)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_retiro(detalle)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acta_retiro(encabezado)`
--

DROP TABLE IF EXISTS `acta_retiro(encabezado)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acta_retiro(encabezado)` (
  `idActa_RetiroEnc` int NOT NULL AUTO_INCREMENT,
  `idusuarios` int NOT NULL,
  `idreceptores` int NOT NULL,
  `asunto_AREnc` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fech_AREnc` datetime NOT NULL,
  `est_AREnc` enum('Borrador','Finalizado') NOT NULL DEFAULT 'Borrador',
  PRIMARY KEY (`idActa_RetiroEnc`),
  UNIQUE KEY `idActa_RetiroEnc_UNIQUE` (`idActa_RetiroEnc`),
  KEY `idreceptores_idx` (`idreceptores`),
  KEY `fk_usuarios_idx` (`idusuarios`),
  CONSTRAINT `fk_receptores` FOREIGN KEY (`idreceptores`) REFERENCES `receptores` (`idReceptores`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acta_retiro(encabezado)`
--

LOCK TABLES `acta_retiro(encabezado)` WRITE;
/*!40000 ALTER TABLE `acta_retiro(encabezado)` DISABLE KEYS */;
/*!40000 ALTER TABLE `acta_retiro(encabezado)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitácora`
--

DROP TABLE IF EXISTS `bitácora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitácora` (
  `idBitácora` int NOT NULL AUTO_INCREMENT,
  `fechBit` datetime NOT NULL,
  `tipo_acta` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `accBit` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idUsuarios` int NOT NULL,
  PRIMARY KEY (`idBitácora`),
  UNIQUE KEY `idBitácora_UNIQUE` (`idBitácora`),
  KEY `idUsuarios_idx` (`idUsuarios`),
  CONSTRAINT `idUsuarios` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitácora`
--

LOCK TABLES `bitácora` WRITE;
/*!40000 ALTER TABLE `bitácora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitácora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmas`
--

DROP TABLE IF EXISTS `firmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firmas` (
  `idFirmas` int NOT NULL,
  `nomFirm` varchar(50) NOT NULL,
  `cargoFirm` varchar(50) NOT NULL,
  `empFirm` varchar(50) NOT NULL,
  `estFirm` enum('Activo','No activo') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idFirmas`),
  UNIQUE KEY `idFirmas_UNIQUE` (`idFirmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmas`
--

LOCK TABLES `firmas` WRITE;
/*!40000 ALTER TABLE `firmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pase_salida(detalle)`
--

DROP TABLE IF EXISTS `pase_salida(detalle)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pase_salida(detalle)` (
  `idPase_SalidaDet` int NOT NULL AUTO_INCREMENT,
  `idPase_SalidaEnc` int NOT NULL,
  `marca_PSDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `modelo_PSDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serie_PSDet` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `invFich_PSDet` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `idFirm_PSDet` int NOT NULL,
  PRIMARY KEY (`idPase_SalidaDet`),
  UNIQUE KEY `idPase_SalidaDet_UNIQUE` (`idPase_SalidaDet`),
  KEY `fk_encabezadoPS_detallePS_idx` (`idPase_SalidaEnc`),
  KEY `fk_firmas_detallePS_idx` (`idFirm_PSDet`),
  CONSTRAINT `fk_encabezadoPS_detallePS` FOREIGN KEY (`idPase_SalidaEnc`) REFERENCES `pase_salida(encabezado)` (`idPase_SalidaEnc`),
  CONSTRAINT `fk_firmas_detallePS` FOREIGN KEY (`idFirm_PSDet`) REFERENCES `firmas` (`idFirmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pase_salida(detalle)`
--

LOCK TABLES `pase_salida(detalle)` WRITE;
/*!40000 ALTER TABLE `pase_salida(detalle)` DISABLE KEYS */;
/*!40000 ALTER TABLE `pase_salida(detalle)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pase_salida(encabezado)`
--

DROP TABLE IF EXISTS `pase_salida(encabezado)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pase_salida(encabezado)` (
  `idPase_SalidaEnc` int NOT NULL AUTO_INCREMENT,
  `idReceptores` int NOT NULL,
  `idUsuarios` int NOT NULL,
  `emp_PSEnc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `motivo_PSEnc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fech_PSEnc` datetime NOT NULL,
  `est_PSEnc` enum('Borrador','Finalizado') NOT NULL DEFAULT 'Borrador',
  PRIMARY KEY (`idPase_SalidaEnc`),
  UNIQUE KEY `idPase_SalidaEnc_UNIQUE` (`idPase_SalidaEnc`),
  KEY `fk_receptores_PaseSalidaEnc_idx` (`idReceptores`),
  KEY `fk_usuarios_PaseSalida_idx` (`idUsuarios`),
  CONSTRAINT `fk_receptores_PaseSalidaEnc` FOREIGN KEY (`idReceptores`) REFERENCES `receptores` (`idReceptores`),
  CONSTRAINT `fk_usuarios_PaseSalida` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pase_salida(encabezado)`
--

LOCK TABLES `pase_salida(encabezado)` WRITE;
/*!40000 ALTER TABLE `pase_salida(encabezado)` DISABLE KEYS */;
/*!40000 ALTER TABLE `pase_salida(encabezado)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptores`
--

DROP TABLE IF EXISTS `receptores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptores` (
  `idReceptores` int NOT NULL AUTO_INCREMENT,
  `nomRec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `corRec` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `empRec` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idReceptores`),
  UNIQUE KEY `idReceptores_UNIQUE` (`idReceptores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptores`
--

LOCK TABLES `receptores` WRITE;
/*!40000 ALTER TABLE `receptores` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nomUsu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `corUsu` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cargoUsu` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `conUsu` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `idUsuarios_UNIQUE` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-17 21:26:18
