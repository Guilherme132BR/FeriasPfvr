CREATE DATABASE  IF NOT EXISTS `guilherme_osterberg` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guilherme_osterberg`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guilherme_osterberg
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobreNome` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `celular` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `desconto` varchar(50) DEFAULT NULL,
  `fk_usuarios` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_usuarios_idx` (`fk_usuarios`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idCompras` int NOT NULL,
  `dataCompras` date NOT NULL,
  `fk_Cliente` int NOT NULL,
  `fk_Vendedor` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `fk_cliente_idx` (`fk_Cliente`),
  KEY `fk_vendedor2_idx` (`fk_Vendedor`),
  CONSTRAINT `fk_cliente2` FOREIGN KEY (`fk_Cliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_vendedor2` FOREIGN KEY (`fk_Vendedor`) REFERENCES `vendedor` (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprasproduto`
--

DROP TABLE IF EXISTS `comprasproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprasproduto` (
  `idComprasProduto` int NOT NULL,
  `fk_Compra` int NOT NULL,
  `fk_Produtos` int NOT NULL,
  `quantidade` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idComprasProduto`),
  KEY `fk_Compras_idx` (`fk_Compra`),
  KEY `fk_Produtos4_idx` (`fk_Produtos`),
  CONSTRAINT `fk_Compras` FOREIGN KEY (`fk_Compra`) REFERENCES `compras` (`idCompras`),
  CONSTRAINT `fk_Produtos4` FOREIGN KEY (`fk_Produtos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprasproduto`
--

LOCK TABLES `comprasproduto` WRITE;
/*!40000 ALTER TABLE `comprasproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprasproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos`
--

DROP TABLE IF EXISTS `jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogos` (
  `idJogos` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `versaoFisica` varchar(50) NOT NULL,
  `dataLancamento` date NOT NULL,
  `fk_Patrocinadores` int NOT NULL,
  `fk_Plataforma` int NOT NULL,
  PRIMARY KEY (`idJogos`),
  KEY `fk_Plataforma_idx` (`fk_Plataforma`),
  KEY `fk_Patrocinadores_idx` (`fk_Patrocinadores`),
  CONSTRAINT `fk_Patrocinadores` FOREIGN KEY (`fk_Patrocinadores`) REFERENCES `patrocinadores` (`idPatrocinadores`),
  CONSTRAINT `fk_plataforma2` FOREIGN KEY (`fk_Plataforma`) REFERENCES `plataforma` (`idPlataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos`
--

LOCK TABLES `jogos` WRITE;
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrocinadores`
--

DROP TABLE IF EXISTS `patrocinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocinadores` (
  `idPatrocinadores` int NOT NULL,
  `NomeEmpresa` varchar(50) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `celular` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idPatrocinadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocinadores`
--

LOCK TABLES `patrocinadores` WRITE;
/*!40000 ALTER TABLE `patrocinadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `patrocinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `idPlataforma` int NOT NULL,
  `plataforma` varchar(50) NOT NULL,
  `ConsolePlat` varchar(50) NOT NULL,
  PRIMARY KEY (`idPlataforma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProdutos` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` varchar(50) NOT NULL,
  `codigoBarras` int NOT NULL,
  `fk_Patrocinadores` int NOT NULL,
  PRIMARY KEY (`idProdutos`),
  KEY `fk_Patrocinadores3_idx` (`fk_Patrocinadores`),
  CONSTRAINT `fk_Patrocinadores3` FOREIGN KEY (`fk_Patrocinadores`) REFERENCES `patrocinadores` (`idPatrocinadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Apelido` varchar(50) NOT NULL,
  `Cpf` varchar(14) NOT NULL,
  `DataNasc` date NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `Nivel` int NOT NULL,
  `Ativo` varchar(50) NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `idVendas` int NOT NULL,
  `dataVendas` date NOT NULL,
  `fk_Cliente` int NOT NULL,
  `fk_Vendedor` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idVendas`),
  KEY `fk_Cliente_idx` (`fk_Cliente`),
  KEY `fk_Vendedor_idx` (`fk_Vendedor`),
  CONSTRAINT `fk_Cliente` FOREIGN KEY (`fk_Cliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_Vendedor` FOREIGN KEY (`fk_Vendedor`) REFERENCES `vendedor` (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendasprodutos`
--

DROP TABLE IF EXISTS `vendasprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendasprodutos` (
  `idVendasProduto` int NOT NULL,
  `fkVendas` int NOT NULL,
  `quantidade` int NOT NULL,
  `valorUnitario` decimal(10,2) NOT NULL,
  `fkProdutos` int NOT NULL,
  PRIMARY KEY (`idVendasProduto`),
  KEY `fk_vendas_idx` (`fkVendas`),
  KEY `fkProdutos_idx` (`fkProdutos`),
  CONSTRAINT `fk_Vendas` FOREIGN KEY (`fkVendas`) REFERENCES `vendas` (`idVendas`),
  CONSTRAINT `fkProdutos` FOREIGN KEY (`fkProdutos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendasprodutos`
--

LOCK TABLES `vendasprodutos` WRITE;
/*!40000 ALTER TABLE `vendasprodutos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendasprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idvendedor` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `dataNasc` date NOT NULL,
  `genero` varchar(15) NOT NULL,
  `fk_usuarios` int NOT NULL,
  PRIMARY KEY (`idvendedor`),
  KEY `fk_usuarios2_idx` (`fk_usuarios`),
  CONSTRAINT `fk_usuarios2` FOREIGN KEY (`fk_usuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-03 14:17:05
