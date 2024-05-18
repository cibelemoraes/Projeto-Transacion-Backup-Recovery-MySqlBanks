-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: company
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
-- Current Database: `company`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `company`;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dpt_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `fk_departament_to_employee` (`Mgr_ssn`),
  CONSTRAINT `fk_departament_to_employee` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK (`Mgr_start_date` >= `Dpt_create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Headquarters',1,NULL,NULL,'1988-05-22'),('Administration',4,NULL,NULL,'1988-05-22'),('Research',5,'123456789','2002-05-22','1988-05-22');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `department_managers_view`
--

DROP TABLE IF EXISTS `department_managers_view`;
/*!50001 DROP VIEW IF EXISTS `department_managers_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `department_managers_view` AS SELECT 
 1 AS `Dnumber`,
 1 AS `Dname`,
 1 AS `Mgr_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Birth_date` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_dependent` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('333445555','Layla','F','2002-05-06','Daughter'),('333445555','Mario','M','2005-08-23','Son'),('333449999','Yenifer','M','2008-07-21','Son');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_dept_locations_to_dept` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Stafford'),(4,'Houston'),(5,'New York');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(20) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(20) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_employee` (`Super_ssn`),
  KEY `idx_employee_dno` (`Dno`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Marcola','B','Smith','123405389','1965-01-09',NULL,'M',34650.00,'333445555',1),('Jo├úo','B','Smith','123455789','1965-01-09','731-Fondren-Houston-TX','M',29000.00,'123456789',1),('Jhon','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',33000.00,NULL,5),('Cristina','F','Maia','333440000','1995-01-02','731-Fondren-Houston-TX','F',19800.00,'123456789',5),('Jo├úo','M','Watson','333445555','1995-01-09','731-Fondren-Houston-TX','M',33000.00,'123456789',4),('Camila','F','Santos','333446666','1986-03-19','731-Fondren-Houston-TX','F',25000.00,'123456789',5),('Carlos','M','Martines','333447777','1999-09-30','731-Fondren-Houston-TX','M',22000.00,'123456789',4),('Sergio','M','wolfram','333448888','1979-12-14','731-Fondren-Houston-TX','M',11000.00,'123456789',5),('Maria','F','Spring','333449999','1988-05-21','731-Fondren-Houston-TX','F',27500.00,'123456789',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger mgr_dpt_chk_trigger before insert on employee
for each row 
	begin
		case NEW.Dno
			when 1 then set NEW.Super_ssn = '333445555';
            when 2 then set NEW.Super_ssn = null;
            when 3 then set NEW.Super_ssn = null;
            when 4 then set NEW.Super_ssn = null;
            when 5 then set NEW.Super_ssn = '123456789';
		end case;
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger check_null_address_trigger after insert on employee
for each row
	begin
		if new.address is null then
			insert into user_messages (msg, ssn) value (concat('update your address', ', ', new.fname), new.ssn);
		end if;
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employee_and_managers_with_dependents_view`
--

DROP TABLE IF EXISTS `employee_and_managers_with_dependents_view`;
/*!50001 DROP VIEW IF EXISTS `employee_and_managers_with_dependents_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_and_managers_with_dependents_view` AS SELECT 
 1 AS `emp_name`,
 1 AS `is_manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_by_department_view`
--

DROP TABLE IF EXISTS `employee_by_department_view`;
/*!50001 DROP VIEW IF EXISTS `employee_by_department_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_by_department_view` AS SELECT 
 1 AS `Dnumber`,
 1 AS `Dname`,
 1 AS `Dlocation`,
 1 AS `number_of_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_dependents_view`
--

DROP TABLE IF EXISTS `employee_dependents_view`;
/*!50001 DROP VIEW IF EXISTS `employee_dependents_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_dependents_view` AS SELECT 
 1 AS `emp_name`,
 1 AS `salary`,
 1 AS `dependents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_project_works_view`
--

DROP TABLE IF EXISTS `employee_project_works_view`;
/*!50001 DROP VIEW IF EXISTS `employee_project_works_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_project_works_view` AS SELECT 
 1 AS `name`,
 1 AS `project_name`,
 1 AS `Hours`,
 1 AS `Department`,
 1 AS `super_ssn`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_salary_27000_view`
--

DROP TABLE IF EXISTS `employee_salary_27000_view`;
/*!50001 DROP VIEW IF EXISTS `employee_salary_27000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_salary_27000_view` AS SELECT 
 1 AS `Name`,
 1 AS `Salary`,
 1 AS `Dpt_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_salary_view`
--

DROP TABLE IF EXISTS `employee_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employee_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_salary_view` AS SELECT 
 1 AS `Name`,
 1 AS `Salary`,
 1 AS `Dpt_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_by_project_view`
--

DROP TABLE IF EXISTS `employees_by_project_view`;
/*!50001 DROP VIEW IF EXISTS `employees_by_project_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_by_project_view` AS SELECT 
 1 AS `Pnumber`,
 1 AS `Pname`,
 1 AS `employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_pname` (`Pname`),
  KEY `fk_project_to_dept` (`Dnum`),
  CONSTRAINT `fk_project_to_dept` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProjecttX',1,'Houston',5),('ProjectY',2,'Sugarland',5),('ProjectZ',3,'New York',5);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_department_manager_view`
--

DROP TABLE IF EXISTS `project_department_manager_view`;
/*!50001 DROP VIEW IF EXISTS `project_department_manager_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_department_manager_view` AS SELECT 
 1 AS `Pnumber`,
 1 AS `Pname`,
 1 AS `Dnumber`,
 1 AS `Dname`,
 1 AS `Mgr_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(100) DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_message` (`ssn`),
  CONSTRAINT `fk_employee_message` FOREIGN KEY (`ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_messages`
--

LOCK TABLES `user_messages` WRITE;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
INSERT INTO `user_messages` VALUES (1,'update your address, Marcola','123405389');
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_today`
--

DROP TABLE IF EXISTS `v_today`;
/*!50001 DROP VIEW IF EXISTS `v_today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_today` AS SELECT 
 1 AS `Today`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_works_on_project` (`Pno`),
  CONSTRAINT `fk_employee_works_on` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_works_on_project` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,7.8),('333440000',1,3.8),('333445555',1,3.8),('333446666',1,5.1),('333447777',2,3.8),('333448888',3,5.3),('333449999',1,3.8);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_employee_salary_before_update_works_on
AFTER UPDATE ON works_on
FOR EACH ROW
BEGIN
	-- Pegando o total de horas trabalhadas pelo funcion├írio
	SELECT sum(Hours) INTO @emp_worked_hours FROM employee e
		INNER JOIN works_on w ON w.Essn = e.ssn
		INNER JOIN project p ON p.Pnumber = w.Pno
    WHERE e.Ssn = NEW.Essn;
    
	IF (@emp_worked_hours > 10) THEN
		UPDATE employee SET salary = 35000 WHERE ssn = NEW.Essn;
	
    ELSEIF (@emp_worked_hours > 5) THEN
		UPDATE employee SET salary = 25000 WHERE ssn = NEW.Essn;
	
    ELSE
		UPDATE employee SET salary = 10000 WHERE ssn = NEW.Essn;
        
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'company'
--

--
-- Dumping routines for database 'company'
--
/*!50003 DROP FUNCTION IF EXISTS `calc_employee_salary_increase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calc_employee_salary_increase`(Salary decimal(10,2),
    increase_percent INT
) RETURNS double
RETURN salary + (salary * increase_percent / 100) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `first_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `first_function`(x decimal(10, 2), y int) RETURNS int(11)
    DETERMINISTIC
return x * y ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
    in essn char(9)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS LIMIT 1;
		ROLLBACK;
        -- SELECT 'An exception was occured' as exception_message;
    END;
    
    SET @@autocommit = 0;
    SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;
		UPDATE employee SET salary = salary + (salary * (increase_percent/100)) WHERE ssn = essn;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `first_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `first_procedure`()
begin
	select * from employee inner join departament on Ssn = Mgr_ssn;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operation`(
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
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Rua A',123,'Centro','S├úo Paulo','SP','Brasil','01234-56','Apto. 101'),(2,'Av. B',456,'Liberdade','Rio de Janeiro','RJ','Brasil','02345-67','Casa 2'),(3,'Rua C',789,'Barra','Belo Horizonte','MG','Brasil','03456-78','Sala 3'),(4,'Av. D',101,'Boa Vista','Curitiba','PR','Brasil','04567-89','Apto. 202'),(5,'Rua E',234,'Jardim','Porto Alegre','RS','Brasil','05678-90','Casa 4'),(6,'Av. F',567,'Vila Nova','Bras├¡lia','DF','Brasil','06789-01','Sala 5'),(7,'Rua G',890,'Ipanema','Salvador','BA','Brasil','07890-12','Apto. 303'),(8,'Av. H',112,'Santos','Recife','PE','Brasil','08901-23','Casa 6'),(9,'Rua I',345,'Copacabana','Fortaleza','CE','Brasil','09012-34','Apto. 404'),(10,'Av. J',678,'Boa Viagem','Bel├®m','PA','Brasil','00123-45','Sala 7');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `clientfplivesin`
--

LOCK TABLES `clientfplivesin` WRITE;
/*!40000 ALTER TABLE `clientfplivesin` DISABLE KEYS */;
INSERT INTO `clientfplivesin` VALUES (1,1),(2,2),(3,3),(4,4),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `clientfplivesin` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `clientjp`
--

LOCK TABLES `clientjp` WRITE;
/*!40000 ALTER TABLE `clientjp` DISABLE KEYS */;
INSERT INTO `clientjp` VALUES (1,'Empresa ABC Ltda.','12345678901234','ABC Ltda.','Jos├® da Silva','(11) 1111-1111'),(2,'Empresa XYZ S.A.','98765432101234','XYZ S.A.','Maria Pereira','(21) 2222-2222'),(3,'Com├®rcio R├ípido Ltda.','23456789012345','Com├®rcio R├ípido','Pedro Santos','(31) 3333-3333'),(4,'Ind├║stria Tech S.A.','34567890123456','Tech S.A.','Ana Rocha','(41) 4444-4444'),(5,'Supermercado Bom Pre├ºo Ltda.','45678901234567','Bom Pre├ºo Ltda.','Lucas Alves','(51) 5555-5555'),(6,'Consultoria Solu├º├Áes Ltda.','56789012345678','Solu├º├Áes Ltda.','Carla Ferreira','(61) 6666-6666'),(7,'Transportadora Veloz S.A.','67890123456789','Veloz S.A.','Paulo Costa','(71) 7777-7777'),(8,'Editora Livro Novo Ltda.','78901234567890','Livro Novo Ltda.','Julia Pereira','(81) 8888-8888'),(9,'Construtora Obras Prontas Ltda.','89012345678901','Obras Prontas','Marcos Sousa','(91) 9999-9999'),(10,'Farm├ícia Sa├║de Total Ltda.','90123456789012','Sa├║de Total Ltda.','Larissa Ribeiro','(01) 1010-1010');
/*!40000 ALTER TABLE `clientjp` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `clientjplivesin`
--

LOCK TABLES `clientjplivesin` WRITE;
/*!40000 ALTER TABLE `clientjplivesin` DISABLE KEYS */;
INSERT INTO `clientjplivesin` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `clientjplivesin` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (11,'Marcos','Silva','12345678901','(11) 1111-1111',1),(12,'Carla','Santos','98765432101','(21) 2222-2222',1),(13,'Paulo','Oliveira','23456789001','(31) 3333-3333',3),(14,'Julia','Rocha','34567890101','(41) 4444-4444',4),(15,'Lucas','Alves','45678901201','(51) 5555-5555',4),(16,'Maria','Ferreira','56789012301','(61) 6666-6666',6),(17,'Ana','Costa','67890123401','(71) 7777-7777',7),(18,'Pedro','Pereira','78901234501','(81) 8888-8888',8),(19,'Larissa','Sousa','89012345601','(91) 9999-9999',4),(20,'Jo├úo','Ribeiro','90123456701','(01) 1010-1010',10);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `ordertoproduct`
--

LOCK TABLES `ordertoproduct` WRITE;
/*!40000 ALTER TABLE `ordertoproduct` DISABLE KEYS */;
INSERT INTO `ordertoproduct` VALUES (1,1,1),(2,2,2),(3,3,5),(4,4,1),(6,6,3),(7,7,1),(8,8,2),(9,9,3);
/*!40000 ALTER TABLE `ordertoproduct` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Aguardando pagamento',799.99,'2023-01-20 08:30:00'),(2,2,2,'Pagamento confirmado',49.99,'2023-02-25 10:15:00'),(3,3,1,'Processando',1299.99,'2023-03-30 14:45:00'),(4,4,3,'Aguardando pagamento',5.99,'2023-04-05 16:30:00'),(6,6,1,'Processando',399.99,'2023-06-15 09:45:00'),(7,7,4,'Pagamento cancelado',29.99,'2023-07-20 12:00:00'),(8,8,1,'Pagamento confirmado',2.99,'2023-08-25 15:10:00'),(9,9,2,'Pagamento confirmado',999.99,'2023-09-30 13:05:00');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Cart├úo de cr├®dito','Dispon├¡vel'),(2,'Cart├úo de d├®bito','Dispon├¡vel'),(3,'Boleto banc├írio','Indispon├¡vel'),(4,'Transf├¬rencia banc├íria','Dispon├¡vel'),(5,'Pix','Dispon├¡vel');
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Eletr├┤nicos',926.09,'Smartphone modelo X'),(2,'Roupas',49.99,'Camiseta branca tamanho M'),(3,'Eletr├┤nicos',1433.24,'Notebook ultrafino'),(4,'Alimentos',5.99,'Pacote de arroz 1kg'),(5,'M├│veis',299.99,'Cadeira de escrit├│rio'),(6,'Eletrodom├®sticos',399.99,'Liquidificador potente'),(7,'Roupas',29.99,'Cal├ºa jeans azul tamanho L'),(8,'Alimentos',6.99,'Lata de sopa de tomate'),(9,'Eletr├┤nicos',1102.49,'Fone de ouvido sem fio'),(10,'M├│veis',199.99,'Mesa de jantar redonda'),(11,'M├│veis',109.99,'Cadeira de balan├ºo'),(12,'M├│veis',109.99,'Cadeira de balan├ºo');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `productdelivery`
--

LOCK TABLES `productdelivery` WRITE;
/*!40000 ALTER TABLE `productdelivery` DISABLE KEYS */;
INSERT INTO `productdelivery` VALUES (23,1,1,'1234567890','Saindo do local de origem'),(24,2,1,'1234567123','Saindo do local de origem'),(25,1,2,'1234567550','A caminho'),(26,3,3,'1234567111','Saindo do local de origem'),(27,4,4,'1234567689','A caminho'),(29,1,6,'1234567777','Saindo do local de origem'),(30,2,7,'1234567444','Saindo do local de origem'),(31,1,8,'1234567999','Saindo do local de origem'),(32,3,9,'1234567222','Saindo do local de origem');
/*!40000 ALTER TABLE `productdelivery` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `productsoldbythirdpartyseller`
--

LOCK TABLES `productsoldbythirdpartyseller` WRITE;
/*!40000 ALTER TABLE `productsoldbythirdpartyseller` DISABLE KEYS */;
INSERT INTO `productsoldbythirdpartyseller` VALUES (1,1,5,3999.95,'2023-09-09'),(2,2,10,999.90,'2023-09-09'),(3,3,7,9099.93,'2023-09-09'),(4,4,3,1797.00,'2023-09-09'),(5,5,8,2399.92,'2023-09-09'),(6,6,2,799.98,'2023-09-09'),(7,7,6,179.94,'2023-09-09'),(8,8,4,1999.96,'2023-09-09'),(9,9,9,899.91,'2023-09-09'),(10,10,1,199.99,'2023-09-09');
/*!40000 ALTER TABLE `productsoldbythirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `productstocked`
--

LOCK TABLES `productstocked` WRITE;
/*!40000 ALTER TABLE `productstocked` DISABLE KEYS */;
INSERT INTO `productstocked` VALUES (1,1,50,'2023-09-09'),(2,2,100,'2023-09-09'),(3,3,75,'2023-09-09'),(4,4,200,'2023-09-09'),(5,5,60,'2023-09-09'),(6,6,90,'2023-09-09'),(7,7,40,'2023-09-09'),(8,8,80,'2023-09-09'),(9,9,120,'2023-09-09'),(10,10,30,'2023-09-09');
/*!40000 ALTER TABLE `productstocked` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `productsuppliedtothirdpartyseller`
--

LOCK TABLES `productsuppliedtothirdpartyseller` WRITE;
/*!40000 ALTER TABLE `productsuppliedtothirdpartyseller` DISABLE KEYS */;
INSERT INTO `productsuppliedtothirdpartyseller` VALUES (1,1,100,2999.95,'2023-09-09'),(2,2,100,899.90,'2023-09-09'),(3,3,100,7999.93,'2023-09-09'),(4,4,100,997.00,'2023-09-09'),(5,5,100,1399.92,'2023-09-09'),(6,6,100,399.98,'2023-09-09'),(7,7,100,119.94,'2023-09-09'),(8,8,100,1499.96,'2023-09-09'),(9,9,100,599.91,'2023-09-09'),(10,10,100,99.99,'2023-09-09');
/*!40000 ALTER TABLE `productsuppliedtothirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (1,'Processando','Pedido em andamento',1),(2,'Confirmado','Pedido confirmado',2),(3,'Processando','Aguardando pagamento',3),(4,'Enviado','Pedido enviado',4),(6,'Processando','Aguardando pagamento',6),(7,'Cancelado','Pedido cancelado',7),(8,'Confirmado','Pedido confirmado',8),(9,'Processando','Aguardando pagamento',9);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Loja 1',11),(2,'Loja 2',NULL),(3,'Loja 3',NULL),(4,'Loja 4',14),(5,'Loja 5',NULL),(6,'Loja 6',NULL),(7,'Loja 7',NULL),(8,'Loja 8',NULL),(9,'Loja 9',NULL),(10,'Loja 10',NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `stocklocatedin`
--

LOCK TABLES `stocklocatedin` WRITE;
/*!40000 ALTER TABLE `stocklocatedin` DISABLE KEYS */;
INSERT INTO `stocklocatedin` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `stocklocatedin` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `supplierprovidesproducts`
--

LOCK TABLES `supplierprovidesproducts` WRITE;
/*!40000 ALTER TABLE `supplierprovidesproducts` DISABLE KEYS */;
INSERT INTO `supplierprovidesproducts` VALUES (1,1,100,3999.95,'2023-01-15'),(2,2,200,899.90,'2023-02-20'),(3,3,150,7999.93,'2023-03-25'),(4,4,300,997.00,'2023-04-30'),(5,5,120,1399.92,'2023-05-05'),(6,6,180,399.98,'2023-06-10'),(7,7,180,119.94,'2023-07-15'),(8,8,100,1499.96,'2023-08-20'),(9,9,200,599.91,'2023-09-25'),(10,10,100,99.99,'2023-10-30');
/*!40000 ALTER TABLE `supplierprovidesproducts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `thirdpartyseller`
--

LOCK TABLES `thirdpartyseller` WRITE;
/*!40000 ALTER TABLE `thirdpartyseller` DISABLE KEYS */;
INSERT INTO `thirdpartyseller` VALUES (1,1,'2023-01-15',NULL,'Ativo'),(2,2,'2023-02-20',NULL,'Ativo'),(3,3,'2023-03-25',NULL,'Ativo'),(4,4,'2023-04-30',NULL,'Inativo'),(5,5,'2023-05-05',NULL,'Inativo'),(6,6,'2023-06-10',NULL,'Em an├ílise'),(7,7,'2023-07-15',NULL,'Em an├ílise'),(8,8,'2023-08-20',NULL,'Ativo'),(9,9,'2023-09-25',NULL,'Ativo'),(10,10,'2023-10-30',NULL,'Ativo');
/*!40000 ALTER TABLE `thirdpartyseller` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `users_deleted_accounts`
--

LOCK TABLES `users_deleted_accounts` WRITE;
/*!40000 ALTER TABLE `users_deleted_accounts` DISABLE KEYS */;
INSERT INTO `users_deleted_accounts` VALUES (5,'Lucas','C','Alves','23456789001','1998-11-30','(51) 77777-7777','2023-11-01 21:18:32');
/*!40000 ALTER TABLE `users_deleted_accounts` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Current Database: `company`
--

USE `company`;

--
-- Final view structure for view `department_managers_view`
--

/*!50001 DROP VIEW IF EXISTS `department_managers_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `department_managers_view` AS select 1 AS `Dnumber`,1 AS `Dname`,1 AS `Mgr_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_and_managers_with_dependents_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_and_managers_with_dependents_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manager2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_and_managers_with_dependents_view` AS select concat(`e`.`Fname`,' ',`e`.`Lname`) AS `emp_name`,case when `e`.`Ssn` in (select `company`.`departament`.`Mgr_ssn` from `departament`) then 'yes' else 'no' end AS `is_manager` from (`employee` `e` join `dependent` `d` on(`e`.`Ssn` = `d`.`Essn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_by_department_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_by_department_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manager`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_by_department_view` AS select `d`.`Dnumber` AS `Dnumber`,`d`.`Dname` AS `Dname`,`dl`.`Dlocation` AS `Dlocation`,count(0) AS `number_of_employees` from ((`employee` `e` join `departament` `d` on(`e`.`Dno` = `d`.`Dnumber`)) join `dept_locations` `dl` on(`dl`.`Dnumber` = `d`.`Dnumber`)) group by `d`.`Dnumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_dependents_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_dependents_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_dependents_view` AS select concat(`e`.`Fname`,' ',`e`.`Minit`,'. ',`e`.`Lname`) AS `emp_name`,`e`.`Salary` AS `salary`,count(0) AS `dependents` from (`employee` `e` join `dependent` `d` on(`d`.`Essn` = `e`.`Ssn`)) group by `e`.`Ssn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_project_works_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_project_works_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_project_works_view` AS select concat(`e`.`Fname`,' ',`e`.`Lname`) AS `name`,`p`.`Pname` AS `project_name`,`w`.`Hours` AS `Hours`,`p`.`Dnum` AS `Department`,`e`.`Super_ssn` AS `super_ssn` from ((`employee` `e` join `works_on` `w` on(`w`.`Essn` = `e`.`Ssn`)) join `project` `p` on(`w`.`Pno` = `p`.`Pnumber`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_salary_27000_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_salary_27000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_salary_27000_view` AS select concat(`employee`.`Fname`,' ',`employee`.`Minit`,' ',`employee`.`Lname`) AS `Name`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dpt_number` from `employee` where `employee`.`Salary` > 26999 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_salary_view` AS select concat(`employee`.`Fname`,' ',`employee`.`Minit`,' ',`employee`.`Lname`) AS `Name`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dpt_number` from `employee` where `employee`.`Sex` = 'F' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_by_project_view`
--

/*!50001 DROP VIEW IF EXISTS `employees_by_project_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`employee`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_by_project_view` AS select `p`.`Pnumber` AS `Pnumber`,`p`.`Pname` AS `Pname`,count(0) AS `employees` from ((`project` `p` join `departament` `d` on(`p`.`Dnum` = `d`.`Dnumber`)) join `employee` `e` on(`e`.`Dno` = `d`.`Dnumber`)) group by '' order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_department_manager_view`
--

/*!50001 DROP VIEW IF EXISTS `project_department_manager_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`manager2`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_department_manager_view` AS select `p`.`Pnumber` AS `Pnumber`,`p`.`Pname` AS `Pname`,`d`.`Dnumber` AS `Dnumber`,`d`.`Dname` AS `Dname`,concat(`e`.`Fname`,' ',`e`.`Lname`) AS `Mgr_name` from ((`project` `p` join `departament` `d` on(`p`.`Dnum` = `d`.`Dnumber`)) join `employee` `e` on(`e`.`Ssn` = `d`.`Mgr_ssn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_today`
--

/*!50001 DROP VIEW IF EXISTS `v_today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_today` AS select curdate() AS `Today` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `ecommerce`
--

USE `ecommerce`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-21 20:35:49