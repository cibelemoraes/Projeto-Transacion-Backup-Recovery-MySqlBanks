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

USE `ecommerce`;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Rua A',123,'Centro','S├úo Paulo','SP','Brasil','01234-56','Apto. 101'),(2,'Av. B',456,'Liberdade','Rio de Janeiro','RJ','Brasil','02345-67','Casa 2'),(3,'Rua C',789,'Barra','Belo Horizonte','MG','Brasil','03456-78','Sala 3'),(4,'Av. D',101,'Boa Vista','Curitiba','PR','Brasil','04567-89','Apto. 202'),(5,'Rua E',234,'Jardim','Porto Alegre','RS','Brasil','05678-90','Casa 4'),(6,'Av. F',567,'Vila Nova','Bras├¡lia','DF','Brasil','06789-01','Sala 5'),(7,'Rua G',890,'Ipanema','Salvador','BA','Brasil','07890-12','Apto. 303'),(8,'Av. H',112,'Santos','Recife','PE','Brasil','08901-23','Casa 6'),(9,'Rua I',345,'Copacabana','Fortaleza','CE','Brasil','09012-34','Apto. 404'),(10,'Av. J',678,'Boa Viagem','Bel├®m','PA','Brasil','00123-45','Sala 7');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientfp`
--

LOCK TABLES `clientfp` WRITE;
/*!40000 ALTER TABLE `clientfp` DISABLE KEYS */;
INSERT INTO `clientfp` VALUES (1,'Jo├úo','S','Silva','12345678901','1990-01-15','(11) 98765-4321'),(2,'Maria','A','Santos','98765432101','1985-03-20','(21) 12345-6789'),(3,'Pedro','R','Oliveira','45678901201','1992-07-10','(31) 55555-5555'),(4,'Ana','M','Rocha','78901234501','1980-05-05','(41) 99999-9999'),(6,'Carla','B','Ferreira','56789012301','1995-04-22','(61) 33333-3333'),(7,'Paulo','P','Costa','67890123401','1987-09-18','(71) 88888-8888'),(8,'Julia','K','Pereira','34567890101','1993-02-14','(81) 22222-2222'),(9,'Marcos','L','Sousa','89012345601','1996-08-25','(91) 44444-4444');
/*!40000 ALTER TABLE `clientfp` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `clientfplivesin`
--

LOCK TABLES `clientfplivesin` WRITE;
/*!40000 ALTER TABLE `clientfplivesin` DISABLE KEYS */;
INSERT INTO `clientfplivesin` VALUES (1,1),(2,2),(3,3),(4,4),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `clientfplivesin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientjp`
--

LOCK TABLES `clientjp` WRITE;
/*!40000 ALTER TABLE `clientjp` DISABLE KEYS */;
INSERT INTO `clientjp` VALUES (1,'Empresa ABC Ltda.','12345678901234','ABC Ltda.','Jos├® da Silva','(11) 1111-1111'),(2,'Empresa XYZ S.A.','98765432101234','XYZ S.A.','Maria Pereira','(21) 2222-2222'),(3,'Com├®rcio R├ípido Ltda.','23456789012345','Com├®rcio R├ípido','Pedro Santos','(31) 3333-3333'),(4,'Ind├║stria Tech S.A.','34567890123456','Tech S.A.','Ana Rocha','(41) 4444-4444'),(5,'Supermercado Bom Pre├ºo Ltda.','45678901234567','Bom Pre├ºo Ltda.','Lucas Alves','(51) 5555-5555'),(6,'Consultoria Solu├º├Áes Ltda.','56789012345678','Solu├º├Áes Ltda.','Carla Ferreira','(61) 6666-6666'),(7,'Transportadora Veloz S.A.','67890123456789','Veloz S.A.','Paulo Costa','(71) 7777-7777'),(8,'Editora Livro Novo Ltda.','78901234567890','Livro Novo Ltda.','Julia Pereira','(81) 8888-8888'),(9,'Construtora Obras Prontas Ltda.','89012345678901','Obras Prontas','Marcos Sousa','(91) 9999-9999'),(10,'Farm├ícia Sa├║de Total Ltda.','90123456789012','Sa├║de Total Ltda.','Larissa Ribeiro','(01) 1010-1010');
/*!40000 ALTER TABLE `clientjp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientjplivesin`
--

LOCK TABLES `clientjplivesin` WRITE;
/*!40000 ALTER TABLE `clientjplivesin` DISABLE KEYS */;
INSERT INTO `clientjplivesin` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `clientjplivesin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (11,'Marcos','Silva','12345678901','(11) 1111-1111',1),(12,'Carla','Santos','98765432101','(21) 2222-2222',1),(13,'Paulo','Oliveira','23456789001','(31) 3333-3333',3),(14,'Julia','Rocha','34567890101','(41) 4444-4444',4),(15,'Lucas','Alves','45678901201','(51) 5555-5555',4),(16,'Maria','Ferreira','56789012301','(61) 6666-6666',6),(17,'Ana','Costa','67890123401','(71) 7777-7777',7),(18,'Pedro','Pereira','78901234501','(81) 8888-8888',8),(19,'Larissa','Sousa','89012345601','(91) 9999-9999',4),(20,'Jo├úo','Ribeiro','90123456701','(01) 1010-1010',10);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordertoproduct`
--

LOCK TABLES `ordertoproduct` WRITE;
/*!40000 ALTER TABLE `ordertoproduct` DISABLE KEYS */;
INSERT INTO `ordertoproduct` VALUES (1,1,1),(2,2,2),(3,3,5),(4,4,1),(6,6,3),(7,7,1),(8,8,2),(9,9,3);
/*!40000 ALTER TABLE `ordertoproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Aguardando pagamento',799.99,'2023-01-20 08:30:00'),(2,2,2,'Pagamento confirmado',49.99,'2023-02-25 10:15:00'),(3,3,1,'Processando',1299.99,'2023-03-30 14:45:00'),(4,4,3,'Aguardando pagamento',5.99,'2023-04-05 16:30:00'),(6,6,1,'Processando',399.99,'2023-06-15 09:45:00'),(7,7,4,'Pagamento cancelado',29.99,'2023-07-20 12:00:00'),(8,8,1,'Pagamento confirmado',2.99,'2023-08-25 15:10:00'),(9,9,2,'Pagamento confirmado',999.99,'2023-09-30 13:05:00');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Cart├úo de cr├®dito','Dispon├¡vel'),(2,'Cart├úo de d├®bito','Dispon├¡vel'),(3,'Boleto banc├írio','Indispon├¡vel'),(4,'Transf├¬rencia banc├íria','Dispon├¡vel'),(5,'Pix','Dispon├¡vel');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Eletr├┤nicos',926.09,'Smartphone modelo X'),(2,'Roupas',49.99,'Camiseta branca tamanho M'),(3,'Eletr├┤nicos',1433.24,'Notebook ultrafino'),(4,'Alimentos',5.99,'Pacote de arroz 1kg'),(5,'M├│veis',299.99,'Cadeira de escrit├│rio'),(6,'Eletrodom├®sticos',399.99,'Liquidificador potente'),(7,'Roupas',29.99,'Cal├ºa jeans azul tamanho L'),(8,'Alimentos',6.99,'Lata de sopa de tomate'),(9,'Eletr├┤nicos',1102.49,'Fone de ouvido sem fio'),(10,'M├│veis',199.99,'Mesa de jantar redonda'),(11,'M├│veis',109.99,'Cadeira de balan├ºo'),(12,'M├│veis',109.99,'Cadeira de balan├ºo');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productdelivery`
--

LOCK TABLES `productdelivery` WRITE;
/*!40000 ALTER TABLE `productdelivery` DISABLE KEYS */;
INSERT INTO `productdelivery` VALUES (23,1,1,'1234567890','Saindo do local de origem'),(24,2,1,'1234567123','Saindo do local de origem'),(25,1,2,'1234567550','A caminho'),(26,3,3,'1234567111','Saindo do local de origem'),(27,4,4,'1234567689','A caminho'),(29,1,6,'1234567777','Saindo do local de origem'),(30,2,7,'1234567444','Saindo do local de origem'),(31,1,8,'1234567999','Saindo do local de origem'),(32,3,9,'1234567222','Saindo do local de origem');
/*!40000 ALTER TABLE `productdelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productsoldbythirdpartyseller`
--

LOCK TABLES `productsoldbythirdpartyseller` WRITE;
/*!40000 ALTER TABLE `productsoldbythirdpartyseller` DISABLE KEYS */;
INSERT INTO `productsoldbythirdpartyseller` VALUES (1,1,5,3999.95,'2023-09-09'),(2,2,10,999.90,'2023-09-09'),(3,3,7,9099.93,'2023-09-09'),(4,4,3,1797.00,'2023-09-09'),(5,5,8,2399.92,'2023-09-09'),(6,6,2,799.98,'2023-09-09'),(7,7,6,179.94,'2023-09-09'),(8,8,4,1999.96,'2023-09-09'),(9,9,9,899.91,'2023-09-09'),(10,10,1,199.99,'2023-09-09');
/*!40000 ALTER TABLE `productsoldbythirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productstocked`
--

LOCK TABLES `productstocked` WRITE;
/*!40000 ALTER TABLE `productstocked` DISABLE KEYS */;
INSERT INTO `productstocked` VALUES (1,1,50,'2023-09-09'),(2,2,100,'2023-09-09'),(3,3,75,'2023-09-09'),(4,4,200,'2023-09-09'),(5,5,60,'2023-09-09'),(6,6,90,'2023-09-09'),(7,7,40,'2023-09-09'),(8,8,80,'2023-09-09'),(9,9,120,'2023-09-09'),(10,10,30,'2023-09-09');
/*!40000 ALTER TABLE `productstocked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productsuppliedtothirdpartyseller`
--

LOCK TABLES `productsuppliedtothirdpartyseller` WRITE;
/*!40000 ALTER TABLE `productsuppliedtothirdpartyseller` DISABLE KEYS */;
INSERT INTO `productsuppliedtothirdpartyseller` VALUES (1,1,100,2999.95,'2023-09-09'),(2,2,100,899.90,'2023-09-09'),(3,3,100,7999.93,'2023-09-09'),(4,4,100,997.00,'2023-09-09'),(5,5,100,1399.92,'2023-09-09'),(6,6,100,399.98,'2023-09-09'),(7,7,100,119.94,'2023-09-09'),(8,8,100,1499.96,'2023-09-09'),(9,9,100,599.91,'2023-09-09'),(10,10,100,99.99,'2023-09-09');
/*!40000 ALTER TABLE `productsuppliedtothirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,'Processando','Pedido em andamento',1),(2,'Confirmado','Pedido confirmado',2),(3,'Processando','Aguardando pagamento',3),(4,'Enviado','Pedido enviado',4),(6,'Processando','Aguardando pagamento',6),(7,'Cancelado','Pedido cancelado',7),(8,'Confirmado','Pedido confirmado',8),(9,'Processando','Aguardando pagamento',9);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Loja 1',11),(2,'Loja 2',NULL),(3,'Loja 3',NULL),(4,'Loja 4',14),(5,'Loja 5',NULL),(6,'Loja 6',NULL),(7,'Loja 7',NULL),(8,'Loja 8',NULL),(9,'Loja 9',NULL),(10,'Loja 10',NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stocklocatedin`
--

LOCK TABLES `stocklocatedin` WRITE;
/*!40000 ALTER TABLE `stocklocatedin` DISABLE KEYS */;
INSERT INTO `stocklocatedin` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `stocklocatedin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplierprovidesproducts`
--

LOCK TABLES `supplierprovidesproducts` WRITE;
/*!40000 ALTER TABLE `supplierprovidesproducts` DISABLE KEYS */;
INSERT INTO `supplierprovidesproducts` VALUES (1,1,100,3999.95,'2023-01-15'),(2,2,200,899.90,'2023-02-20'),(3,3,150,7999.93,'2023-03-25'),(4,4,300,997.00,'2023-04-30'),(5,5,120,1399.92,'2023-05-05'),(6,6,180,399.98,'2023-06-10'),(7,7,180,119.94,'2023-07-15'),(8,8,100,1499.96,'2023-08-20'),(9,9,200,599.91,'2023-09-25'),(10,10,100,99.99,'2023-10-30');
/*!40000 ALTER TABLE `supplierprovidesproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `thirdpartyseller`
--

LOCK TABLES `thirdpartyseller` WRITE;
/*!40000 ALTER TABLE `thirdpartyseller` DISABLE KEYS */;
INSERT INTO `thirdpartyseller` VALUES (1,1,'2023-01-15',NULL,'Ativo'),(2,2,'2023-02-20',NULL,'Ativo'),(3,3,'2023-03-25',NULL,'Ativo'),(4,4,'2023-04-30',NULL,'Inativo'),(5,5,'2023-05-05',NULL,'Inativo'),(6,6,'2023-06-10',NULL,'Em an├ílise'),(7,7,'2023-07-15',NULL,'Em an├ílise'),(8,8,'2023-08-20',NULL,'Ativo'),(9,9,'2023-09-25',NULL,'Ativo'),(10,10,'2023-10-30',NULL,'Ativo');
/*!40000 ALTER TABLE `thirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_deleted_accounts`
--

LOCK TABLES `users_deleted_accounts` WRITE;
/*!40000 ALTER TABLE `users_deleted_accounts` DISABLE KEYS */;
INSERT INTO `users_deleted_accounts` VALUES (5,'Lucas','C','Alves','23456789001','1998-11-30','(51) 77777-7777','2023-11-01 21:18:32');
/*!40000 ALTER TABLE `users_deleted_accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-21 20:36:22
