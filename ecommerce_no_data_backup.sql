-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ecommerce`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `IdAddress` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) NOT NULL,
  `Num` smallint(5) unsigned DEFAULT NULL,
  `Neighborhood` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `FederativeUnit` char(2) NOT NULL,
  `Country` varchar(10) NOT NULL,
  `CEP` char(8) DEFAULT NULL,
  `Complement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientfp`
--

DROP TABLE IF EXISTS `clientfp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientfp` (
  `IdClientFP` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `InitMname` char(1) NOT NULL,
  `Lname` varchar(45) NOT NULL,
  `CPF` char(11) NOT NULL,
  `BirthDate` date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`IdClientFP`),
  UNIQUE KEY `clientFP_cpf_unique` (`CPF`),
  UNIQUE KEY `clientFP_phone_unique` (`Phone`),
  UNIQUE KEY `clientFP_id_unique` (`IdClientFP`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_remove_user_trigger
BEFORE DELETE ON Clientfp
FOR EACH ROW
	BEGIN        
	  -- Inserir os dados do usu├írio que est├í sendo removido em uma tabela de contas deletadas
		INSERT INTO users_deleted_accounts
		VALUES (OLD.IdClientFP, OLD.Fname, OLD.InitMname, OLD.Lname, OLD.CPF, OLD.BirthDate, OLD.Phone, now());

	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientfplivesin`
--

DROP TABLE IF EXISTS `clientfplivesin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientfplivesin` (
  `IdClientFP` int(11) NOT NULL,
  `IdAddress` int(11) NOT NULL,
  PRIMARY KEY (`IdClientFP`,`IdAddress`),
  KEY `fk_clientFP_lives_in_to_address` (`IdAddress`),
  CONSTRAINT `fk_clientFP_lives_in_to_address` FOREIGN KEY (`IdAddress`) REFERENCES `address` (`IdAddress`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_clientFP_lives_in_to_clientFP` FOREIGN KEY (`IdClientFP`) REFERENCES `clientfp` (`IdClientFP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientjp`
--

DROP TABLE IF EXISTS `clientjp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientjp` (
  `IdClientJP` int(11) NOT NULL AUTO_INCREMENT,
  `CorporateName` varchar(45) NOT NULL,
  `CNPJ` char(14) NOT NULL,
  `FantasyName` varchar(45) DEFAULT NULL,
  `JuridicPersonName` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  PRIMARY KEY (`IdClientJP`),
  UNIQUE KEY `clinetJP_corp_name_unique` (`CorporateName`),
  UNIQUE KEY `clinetJP_cnpj_unique` (`CNPJ`),
  UNIQUE KEY `clinetJP_phone_unique` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientjplivesin`
--

DROP TABLE IF EXISTS `clientjplivesin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientjplivesin` (
  `IdClientJP` int(11) NOT NULL,
  `IdAddress` int(11) NOT NULL,
  PRIMARY KEY (`IdAddress`,`IdClientJP`),
  KEY `fk_clientJP_lives_in_to_clientJP` (`IdClientJP`),
  CONSTRAINT `fk_clientJP_lives_in_to_address` FOREIGN KEY (`IdAddress`) REFERENCES `address` (`IdAddress`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_clientJP_lives_in_to_clientJP` FOREIGN KEY (`IdClientJP`) REFERENCES `clientjp` (`IdClientJP`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `IdEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `Lname` varchar(45) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `IdStock` int(11) NOT NULL,
  PRIMARY KEY (`IdEmployee`),
  UNIQUE KEY `employee_cpf_unique` (`CPF`),
  UNIQUE KEY `employee_phone_unique` (`Phone`),
  KEY `fk_employee_to_stock` (`IdStock`),
  CONSTRAINT `fk_employee_to_stock` FOREIGN KEY (`IdStock`) REFERENCES `stock` (`IdStock`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordertoproduct`
--

DROP TABLE IF EXISTS `ordertoproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertoproduct` (
  `IdOrder` int(11) NOT NULL,
  `IdProduct` int(11) NOT NULL,
  `Quatity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`IdOrder`,`IdProduct`),
  KEY `fk_ord_to_prod_to_product` (`IdProduct`),
  CONSTRAINT `fk_ord_to_prod_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ord_to_prod_to_purchase_order` FOREIGN KEY (`IdOrder`) REFERENCES `purchaseorder` (`IdOrder`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `IdPayment` int(11) NOT NULL AUTO_INCREMENT,
  `IdClient` int(11) NOT NULL,
  `IdPaymentMethod` int(11) NOT NULL,
  `Status` enum('Aguardando pagamento','Processando','Pagamento confirmado','Pagamento cancelado') DEFAULT 'Aguardando pagamento',
  `PaymentValue` float DEFAULT NULL,
  `PaymentDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`IdPayment`,`IdClient`,`IdPaymentMethod`),
  KEY `fk_payment_to_payment_method` (`IdPaymentMethod`),
  KEY `fk_payment_to_clientFP` (`IdClient`),
  CONSTRAINT `fk_payment_to_clientFP` FOREIGN KEY (`IdClient`) REFERENCES `clientfp` (`IdClientFP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_to_payment_method` FOREIGN KEY (`IdPaymentMethod`) REFERENCES `paymentmethod` (`IdPaymentMethod`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `IdPaymentMethod` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMethod` enum('Cart├úo de cr├®dito','Cart├úo de d├®bito','Boleto banc├írio','Transf├¬rencia banc├íria','Pix') DEFAULT NULL,
  `StatusMethod` enum('Dispon├¡vel','Indispon├¡vel') DEFAULT 'Dispon├¡vel',
  PRIMARY KEY (`IdPaymentMethod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `IdProduct` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Pname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdProduct`),
  KEY `idx_product_price` (`Price`),
  FULLTEXT KEY `idx_product_name` (`Pname`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productdelivery`
--

DROP TABLE IF EXISTS `productdelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdelivery` (
  `IdDelivery` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduct` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `TrackingCode` char(10) NOT NULL,
  `Status` enum('Saindo do local de origem','A caminho','Entregue') NOT NULL DEFAULT 'Saindo do local de origem',
  PRIMARY KEY (`IdDelivery`,`IdProduct`,`IdClient`),
  UNIQUE KEY `product_delivery_tracking_code_unique` (`TrackingCode`),
  KEY `fk_product_delivery_to_product` (`IdProduct`),
  KEY `fk_product_delivery_to_clientFP` (`IdClient`),
  CONSTRAINT `fk_product_delivery_to_clientFP` FOREIGN KEY (`IdClient`) REFERENCES `clientfp` (`IdClientFP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_delivery_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productsoldbythirdpartyseller`
--

DROP TABLE IF EXISTS `productsoldbythirdpartyseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsoldbythirdpartyseller` (
  `IdThirdPartySeller` int(11) NOT NULL,
  `IdProduct` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SaleAmount` decimal(10,2) DEFAULT NULL,
  `SaleDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdThirdPartySeller`,`IdProduct`),
  KEY `fk_pdt_sold_thrd_party_sllr_to_product` (`IdProduct`),
  CONSTRAINT `fk_pdt_sold_thrd_party_sllr_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`) ON DELETE NO ACTION,
  CONSTRAINT `fk_pdt_sold_thrd_party_sllr_to_seller` FOREIGN KEY (`IdThirdPartySeller`) REFERENCES `thirdpartyseller` (`IdThirdPartySeller`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productstocked`
--

DROP TABLE IF EXISTS `productstocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstocked` (
  `IdProduct` int(11) NOT NULL,
  `IdStock` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `RegiterDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdProduct`,`IdStock`),
  KEY `fk_pdt_stocked_to_stock` (`IdStock`),
  CONSTRAINT `fk_pdt_stocked_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pdt_stocked_to_stock` FOREIGN KEY (`IdStock`) REFERENCES `stock` (`IdStock`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `chk_quantity_stocked_biggest_then_0` CHECK (`Quantity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productsuppliedtothirdpartyseller`
--

DROP TABLE IF EXISTS `productsuppliedtothirdpartyseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsuppliedtothirdpartyseller` (
  `IdThirdPartySeller` int(11) NOT NULL,
  `IdProduct` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 100,
  `SupplyCost` decimal(10,2) DEFAULT NULL,
  `SupplyDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdThirdPartySeller`,`IdProduct`),
  KEY `fk_pdt_supplied_thrd_party_sllr_to_product` (`IdProduct`),
  CONSTRAINT `fk_pdt_supplied_thrd_party_sllr_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_pdt_supplied_thrd_party_sllr_to_seller` FOREIGN KEY (`IdThirdPartySeller`) REFERENCES `thirdpartyseller` (`IdThirdPartySeller`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `chk_quantity_supplied_to_thrd_party_seller` CHECK (`Quantity` >= 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorder` (
  `IdOrder` int(11) NOT NULL AUTO_INCREMENT,
  `Status` enum('Processando','Confirmado','Cancelado','Enviado','Entregue') DEFAULT 'Processando',
  `Description` varchar(100) DEFAULT NULL,
  `IdClientFP` int(11) NOT NULL,
  PRIMARY KEY (`IdOrder`),
  UNIQUE KEY `purchase_order_idOrder_unique` (`IdOrder`),
  KEY `fk_order_to_clientFP` (`IdClientFP`),
  CONSTRAINT `fk_order_to_clientFP` FOREIGN KEY (`IdClientFP`) REFERENCES `clientfp` (`IdClientFP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `IdStock` int(11) NOT NULL AUTO_INCREMENT,
  `EstablishmentName` varchar(45) NOT NULL,
  `IdManager` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdStock`),
  KEY `fk_stock_employee_mgr` (`IdManager`),
  CONSTRAINT `fk_stock_employee_mgr` FOREIGN KEY (`IdManager`) REFERENCES `employee` (`IdEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stocklocatedin`
--

DROP TABLE IF EXISTS `stocklocatedin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocklocatedin` (
  `IdStock` int(11) NOT NULL,
  `IdAddress` int(11) NOT NULL,
  PRIMARY KEY (`IdStock`,`IdAddress`),
  KEY `fk_stock_located_in_to_address` (`IdAddress`),
  CONSTRAINT `fk_stock_located_in_to_address` FOREIGN KEY (`IdAddress`) REFERENCES `address` (`IdAddress`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stock_located_in_to_stock` FOREIGN KEY (`IdStock`) REFERENCES `stock` (`IdStock`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `IdSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `IdClientJP` int(11) NOT NULL,
  PRIMARY KEY (`IdSupplier`),
  KEY `fk_supplier_to_clientJP` (`IdClientJP`),
  CONSTRAINT `fk_supplier_to_clientJP` FOREIGN KEY (`IdClientJP`) REFERENCES `clientjp` (`IdClientJP`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplierprovidesproducts`
--

DROP TABLE IF EXISTS `supplierprovidesproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierprovidesproducts` (
  `IdSupplier` int(11) NOT NULL,
  `IdProduct` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SupplyValue` decimal(10,2) NOT NULL,
  `SupplyDate` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdSupplier`,`IdProduct`),
  KEY `fk_SupplierProvidesProducts_to_product` (`IdProduct`),
  CONSTRAINT `fk_SupplierProvidesProducts_to_product` FOREIGN KEY (`IdProduct`) REFERENCES `product` (`IdProduct`),
  CONSTRAINT `fk_SupplierProvidesProducts_to_supplier` FOREIGN KEY (`IdSupplier`) REFERENCES `supplier` (`IdSupplier`),
  CONSTRAINT `chk_quantity_SupplierProvidesProducts` CHECK (`Quantity` >= 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thirdpartyseller`
--

DROP TABLE IF EXISTS `thirdpartyseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thirdpartyseller` (
  `IdThirdPartySeller` int(11) NOT NULL AUTO_INCREMENT,
  `IdClientJP` int(11) NOT NULL,
  `StartPartnership` date NOT NULL,
  `EndPartnership` date DEFAULT NULL,
  `Status` enum('Ativo','Inativo','Em an├ílise') DEFAULT 'Em an├ílise',
  PRIMARY KEY (`IdThirdPartySeller`),
  KEY `fk_thrd_party_sllr_to_clientJP` (`IdClientJP`),
  CONSTRAINT `fk_thrd_party_sllr_to_clientJP` FOREIGN KEY (`IdClientJP`) REFERENCES `clientjp` (`IdClientJP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_deleted_accounts`
--

DROP TABLE IF EXISTS `users_deleted_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_deleted_accounts` (
  `IdClientFP` int(11) NOT NULL,
  `Fname` varchar(45) NOT NULL,
  `InitMname` char(1) NOT NULL,
  `Lname` varchar(45) NOT NULL,
  `CPF` char(11) NOT NULL,
  `BirthDate` date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `exclusion_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`IdClientFP`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `employee_salary_increase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_salary_increase`(
	in increase_percent int,
    in ssn char(9)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS LIMIT 1;
		ROLLBACK;
        SELECT 'An exception was occured' as exception_message;
    END;
    
    SET @@autocommit = 0;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;
		UPDATE employee SET salary = salary * @increase_percent WHERE ssn = @essn;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operation_ecommerce_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operation_ecommerce_product`(
	IN option_ INT,
    IN table_name VARCHAR(50),
    IN columns VARCHAR(40),
    IN values_ VARCHAR(100),
    IN where_col VARCHAR(40),
    IN where_val VARCHAR(40)
)
BEGIN
	CASE option_
		WHEN 1 THEN
			SET @CMD = concat('SELECT ', columns, 'FROM ', table_name, ';');
			PREPARE stmt FROM @CMD;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
            
        WHEN 2 THEN
			SET @CMD = concat('UPDATE ', table_name, ' SET ', columns, ' = ', values_, ' WHERE ', where_col, ' = ', where_val, ';');
            PREPARE stmt FROM @CMD;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
            
        WHEN 3 THEN
			SET @CMD = concat('DELETE FROM ', table_name, ' WHERE ', where_col, '="', where_val, '";');
            PREPARE stmt FROM @CMD;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
            
		ELSE
			SELECT 'Argumento inv├ílido! argumentos validos: 1, 2, 3' AS msg;
            
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sql_fail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sql_fail`()
BEGIN
    DECLARE exit handler for sqlexception  # TRATA EXCE├ç├âO CASO OCORRA DA ROLLBACK
    BEGIN
		ROLLBACK;
        SELECT 'Transa├º├úo encerrada. Erro desconhecido!' AS warn;
    END;
    
    SET @@autocommit = 0;
    START TRANSACTION;
		UPDATE ordertoproduct
		SET quatity = 5
		WHERE IdOrder = 3;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-21 20:37:14
