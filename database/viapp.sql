CREATE DATABASE  IF NOT EXISTS `viapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `viapp`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: viapp
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint DEFAULT '1',
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_edition` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Desarrollo Móvil',1,'2024-01-24 04:20:53',NULL),(2,'Testing',1,'2024-01-26 01:58:00',NULL),(3,'Documentacion',1,'2024-01-26 01:58:00',NULL),(4,'Marketing',1,'2024-01-26 01:58:27',NULL),(5,'Diseño Grafico',1,'2024-01-26 01:58:27',NULL),(6,'Desarrollo Web',1,'2024-01-26 01:58:27',NULL),(7,'Recursos Humanos',1,'2024-01-27 23:38:20',NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edition` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` VALUES (1,'Desarrollador de Aplicaciones Moviles',1,'2024-01-20 16:51:03',NULL),(2,'Desarrollador Web',1,'2024-01-26 02:00:02',NULL),(3,'Diseñador/a de Aplicaciones Móviles',1,'2024-01-26 02:00:02',NULL),(4,'Analista de Base de Datos',1,'2024-01-26 02:02:08',NULL),(5,'Recursos Humanos',1,'2024-01-27 23:38:10',NULL);
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recover_password`
--

DROP TABLE IF EXISTS `recover_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recover_password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_edition` datetime DEFAULT NULL,
  `user_creation_id` int DEFAULT NULL,
  `user_edition_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `recover_user_creation_id` (`user_creation_id`) USING BTREE,
  KEY `recover_user_edition_id` (`user_edition_id`) USING BTREE,
  CONSTRAINT `recover_user_creation_id` FOREIGN KEY (`user_creation_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `recover_user_edition_id` FOREIGN KEY (`user_edition_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recover_password`
--

LOCK TABLES `recover_password` WRITE;
/*!40000 ALTER TABLE `recover_password` DISABLE KEYS */;
INSERT INTO `recover_password` VALUES (1,2,'558742',1,'A','2024-01-31 11:05:53','2024-01-31 11:06:27',2,2),(2,2,'998172',1,'A','2024-01-31 15:16:41','2024-01-31 15:16:59',2,2);
/*!40000 ALTER TABLE `recover_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT 'TODAS LAS SOLICITUDES LO INCLUYE',
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'TODAS LAS SOLICITUDES LO INCLUYE',
  `reason` varchar(255) NOT NULL COMMENT 'TODAS LAS SOLICITUDES LO INCLUYE',
  `user_id_creation` int NOT NULL COMMENT 'TODAS LAS SOLICITUDES LO INCLUYE',
  `type_request_id` int NOT NULL,
  `status_request_id` int NOT NULL DEFAULT '1',
  `request_status_reason` varchar(255) DEFAULT NULL,
  `user_id_edition` int DEFAULT NULL,
  `edit` tinyint DEFAULT '0',
  `date_edition` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_creation_idx` (`user_id_creation`),
  KEY `type_request_id_idx` (`type_request_id`),
  KEY `status_request_id_idx` (`status_request_id`),
  KEY `user_id_edition_idx` (`user_id_edition`),
  CONSTRAINT `status_request_id` FOREIGN KEY (`status_request_id`) REFERENCES `status_request` (`id`),
  CONSTRAINT `type_request_id` FOREIGN KEY (`type_request_id`) REFERENCES `type_request` (`id`),
  CONSTRAINT `user_id_creation` FOREIGN KEY (`user_id_creation`) REFERENCES `users` (`id`),
  CONSTRAINT `user_id_edition` FOREIGN KEY (`user_id_edition`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'20240225221403087848779','2024-02-25 22:14:03','quiero hacer una prueba de administrador para verificar el envio de correo',2,4,3,NULL,2,1,'2024-02-25 22:15:53'),(2,'20240225221414487722002','2024-02-25 22:14:14','quiero hacer una prueba de administrador para verificar el envio de correo',2,1,2,'se rechaza porque no cumplio con los parametros indicados.',2,1,'2024-02-25 22:15:22'),(3,'20240225221418126206975','2024-02-25 22:14:18','quiero hacer una prueba de administrador para verificar el envio de correo',2,8,1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_request`
--

DROP TABLE IF EXISTS `status_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `status` tinyint DEFAULT '1',
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_request`
--

LOCK TABLES `status_request` WRITE;
/*!40000 ALTER TABLE `status_request` DISABLE KEYS */;
INSERT INTO `status_request` VALUES (1,'Pendiente','757575',1,'2024-01-26 14:19:10'),(2,'Rechazada','dc3545',1,'2024-01-26 14:19:10'),(3,'Aceptada','198754',1,'2024-01-26 14:19:10');
/*!40000 ALTER TABLE `status_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_request`
--

DROP TABLE IF EXISTS `type_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_request` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID de la solicitud',
  `name_request` varchar(255) NOT NULL COMMENT 'Solicitud',
  `request_code` varchar(255) NOT NULL COMMENT 'Codigo de la solicitud',
  `description_request` varchar(255) NOT NULL COMMENT 'Descripcion de la solicitud',
  `status_request` tinyint(1) DEFAULT '1' COMMENT 'Estado de la solicitud (Habilitada o Deshabilitada)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_request`
--

LOCK TABLES `type_request` WRITE;
/*!40000 ALTER TABLE `type_request` DISABLE KEYS */;
INSERT INTO `type_request` VALUES (1,'Solicitud de Vacaciones','9025824561','Genera tu solicitud de Vacaciones con VIAPP',1),(2,'Solicitud de Salida Temprana Laboral','1736904841','Genera tu solicitud de Salida Temprana Laboral con VIAPP',1),(3,'Solicitud de Entrada Tardía','2272543022','Genera tu solicitud de Entrada Tardía con VIAPP',1),(4,'Solicitud de Equipos Tecnológicos','0161381197','Genera tu solicitud de Equipos Tecnológicos con VIAPP',1),(5,'Solicitud de Modificación de Hora de Almuerzo','2545597407','Genera tu solicitud de Modificación de Hora de Almuerzo con VIAPP',1),(6,'Solicitud de Acceso a Puertas','8965255865','Genera tu solicitud de Acceso a Puertas con VIAPP',1),(7,'Solicitud de Uso del Gimnasio','5578807752','Genera tu solicitud de Uso del Gimnasio con VIAPP',1),(8,'Solicitud de Formación','6790843990','Genera tu solicitud de Formación con VIAPP',1),(9,'Solicitud de Teletrabajo','1383620075','Genera tu solicitud de Teletrabajo con VIAPP',1),(10,'Solicitud de Licencia sin Sueldo','3704053200','Genera tu solicitud de Licencia sin Sueldo con VIAPP',1),(11,'Solicitud de Movilización','9196891642','Genera tu solicitud de Movilización con VIAPP',1),(12,'Solicitud de Certificado Laboral','1616858044','Genera tu solicitud de Certificado Laboral con VIAPP',1),(13,'Solicitudes Varias','4179005305','Genera tus solicitudes varias con VIAPP',1);
/*!40000 ALTER TABLE `type_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID del usuario registrado',
  `first_name` varchar(255) NOT NULL COMMENT 'Nombre del usuario',
  `last_name` varchar(255) NOT NULL COMMENT 'Apellidos del Uusario',
  `email` varchar(255) NOT NULL COMMENT 'Emial del Usuario',
  `user_name` varchar(255) NOT NULL COMMENT 'Usuario o username',
  `password` varchar(255) NOT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Indicador si es administrados o usuario común',
  `identification` varchar(10) NOT NULL COMMENT 'Identificación del usuario ( Cédula o Ruc)',
  `url_photo` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `birth_date` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT 'Estado del Usuario',
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edition` datetime DEFAULT NULL,
  `user_edition_id` int DEFAULT NULL,
  `charge_id` int NOT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `charge_id_idx` (`charge_id`),
  KEY `area_id_idx` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de usuarios tegistrados en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Ronny','Gomez','ronnygomez695@gmail.com','ronnygomezp','$2a$10$twfgVxyDL5iuPqKl10xIMOflOtEqKDzU7NTrwXcMgqq6ItFcyr6E.',1,'0924112618','https://ui-avatars.com/api/?name=Ronny+Gomez&background=FE6936&color=ffffff&length=2&size=200','0961397955','2000-06-04',1,'2024-01-25 14:49:28','2024-02-25 23:13:47',2,1,1),(4,'Alex Alberto','Ramirez Abarca','alexraab08@gmail.com','aramireza','$2a$10$9Qpe1RaCZDU0lG1Mjy/HweR49vUs7SoghjllZ1M8EyLy.lsx2eDKa',0,'0932144165','https://ui-avatars.com/api/?name=Alex Alberto+Ramirez Abarca&background=FE6936&color=ffffff&length=2&size=200','0984196793','2000-06-08',1,'2024-01-26 14:39:10',NULL,NULL,4,1),(5,'Carmen','Guzman','carmen.guzmanm@hotmail.com','carmenguzmamm','$2a$10$8ToUv5O0aptODeQICk/GHeCdgek7Sdxp04vvKsXVdveGsToNV8Ecq',0,'0901022798','https://ui-avatars.com/api/?name=Carmen+Guzman&background=FE6936&color=ffffff&length=2&size=200','0912091290','2000-06-04',1,'2024-01-27 21:35:02',NULL,NULL,5,7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'viapp'
--

--
-- Dumping routines for database 'viapp'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_AUTH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AUTH`(
IN _option VARCHAR(255), 
IN _first_name VARCHAR(255), 
IN _last_name VARCHAR(255),
IN _email VARCHAR(255), 
IN _user_name VARCHAR(255), 
IN _password VARCHAR(255),
IN _identification VARCHAR(10),
IN _url_photo VARCHAR(255),
IN _phone VARCHAR(10),
IN _birth_date VARCHAR(100),
IN _user_id INT,
IN _charge_id INT,
IN _area_id INT
)
BEGIN
DECLARE message VARCHAR(50);
SET message = "no existe una opcion con ese parametro";

	CASE(UPPER(_option))
		WHEN 'SAVE' THEN 
			INSERT INTO users(first_name, last_name, email, user_name, password, identification, url_photo, phone, birth_date,charge_id,area_id) VALUES (_first_name, _last_name, _email, _user_name, _password, _identification, _url_photo, _phone, _birth_date,_charge_id,_area_id);
			SELECT LAST_INSERT_ID() as id;
		WHEN 'EMAIL_USER_EXISTS' THEN
			SELECT id FROM users WHERE user_name = _user_name OR email = _email;
		WHEN 'LOGIN' THEN
			SELECT id, first_name, last_name, email, user_name, identification, password, super_user, status FROM users WHERE user_name = _user_name;
		/*WHEN 'LOGIN_USER_NAME' THEN
			SELECT id from users WHERE user_name = _user_name;*/
		ELSE SELECT message;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CATALOGUE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CATALOGUE`(IN _option VARCHAR(255))
BEGIN
	CASE UPPER(_option)

	

	WHEN "SELECT"  THEN

		set @charge = (SELECT
			JSON_ARRAYAGG(
				JSON_OBJECT(
					'id',c.id, 
					'name',c.name 
				)) as charge
			from charge c);
            
		set @area = (SELECT
			JSON_ARRAYAGG(
				JSON_OBJECT(
					'id',a.id, 
					'name',a.name 
				)) as area
			from area a);

	
		SELECT @charge as charge, @area as area;

	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DATA_REQUESTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DATA_REQUESTS`()
BEGIN
	DECLARE total_requests INT;
	DECLARE total_requests_status1 INT;
	DECLARE total_requests_status2 INT;
	DECLARE total_requests_status3 INT;
    
     SELECT COUNT(*)
	INTO total_requests FROM request;
     -- Obtener la cantidad de solicitudes con estado 1
    SELECT COUNT(*)
	INTO total_requests_status1 FROM request WHERE status_request_id = 1;
    -- Obtener la cantidad de solicitudes con estado 2
    SELECT COUNT(*)
	INTO total_requests_status2 FROM request WHERE status_request_id = 2;
    -- Obtener la cantidad de solicitudes con estado 3
    SELECT COUNT(*)
	INTO total_requests_status3 FROM request WHERE status_request_id = 3;
    
    -- SELECT CONCAT(first_name, ' ', last_name) as 'full_name', email from users where super_user = 1;
     set @admin = (SELECT
					JSON_OBJECT(
						'full_name', CONCAT(u.first_name, ' ', u.last_name),
						'email', u.email 
					) as admin from users u where u.super_user = 1);
    
     -- Mostrar los resultados
    /*SELECT 'Total de solicitudes:', total_requests;
    SELECT 'Solicitudes con estado 1:', total_requests_status1;
    SELECT 'Solicitudes con estado 2:', total_requests_status2;
    SELECT 'Solicitudes con estado 3:', total_requests_status3;*/
    set @report = (SELECT JSON_OBJECT(
				'total_requests', total_requests,
                'total_requests_earring', total_requests_status1,
                'total_requests_rejected', total_requests_status2,
                'total_requests_accepted', total_requests_status3
			) as report_pdf);
            
	SELECT @admin as admin, @report as report;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PROFILE_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PROFILE_USER`(IN _option VARCHAR(255), IN _user_id INT)
BEGIN

DECLARE message VARCHAR(50);
SET message = "no existe una opcion con ese parametro";
	CASE(UPPER(_option))
		WHEN 'SELECT' THEN 
			SELECT u.identification, u.first_name, u.last_name, u.email, u.user_name, u.url_photo,
			u.phone, u.url_photo, DATE_FORMAT(u.birth_date, '%d/%m/%Y') as birth_date 
			from users u WHERE u.id = _user_id;
		ELSE SELECT message;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECOVER_PASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECOVER_PASSWORD`(
IN _option VARCHAR(225),
IN _user_name VARCHAR(225),
IN _code VARCHAR(6),
IN _status CHAR(1),
IN _dates VARCHAR(225),
IN _id INT,
IN _pass VARCHAR(225),
IN _id_recover INT,
IN _date_creation_start VARCHAR(255),
IN _date_creation_end VARCHAR(255)
)
BEGIN
	set @MESSAGE_NOT_FOUND = "El usuario requerido no se encuentra registrado o activo";
	set @MESSAGE_EXIST = "Los parámetros de identificación deben estar previamente registrados o activos";
  CASE UPPER(_option)
	
	WHEN "SAVE"  THEN
		set @USER_ID := (SELECT id FROM `users` WHERE user_name = _user_name);
		IF (@USER_ID IS NULL) THEN 
		SELECT true as error , @MESSAGE_NOT_FOUND as message;
		ELSE
		INSERT INTO recover_password  (user_id ,code,`status`,date_creation,user_creation_id) VALUES(@USER_ID,_code,'A',CURRENT_TIMESTAMP,@USER_ID);
		SELECT LAST_INSERT_ID() as id;
		END IF;
	WHEN "SELECTID" THEN
		SELECT rp.id,
		rp.user_id ,
		u.user_name ,
		rp.code ,
		rp.status ,
		rp.used ,
		rp.date_creation 
		FROM recover_password rp
		INNER JOIN `users` u on u.id = rp.user_id
		WHERE rp.used = FALSE AND u.user_name = _user_name
		ORDER BY rp.id DESC 
		LIMIT 1;
	WHEN "SELECTID_RECOVER" THEN
		SELECT rp.id,
		rp.user_id ,
		u.user_name ,
		rp.code ,
		rp.status ,
		rp.used ,
		rp.date_creation 
		FROM recover_password rp
		INNER JOIN `users` u on u.id = rp.user_id
		WHERE rp.used = FALSE
		ORDER BY rp.id DESC 
		LIMIT 1;
	WHEN "SELECT_CODE" THEN
		SELECT rp.id,
		rp.user_id ,
		u.user_name ,
		u.last_name ,
		u.first_name ,
		u.email ,
		rp.code ,
		rp.status ,
		rp.date_creation 
		FROM recover_password rp
		INNER JOIN `users` u on u.id = rp.user_id
		WHERE rp.code = _code
		AND u.user_name = _user_name;
	WHEN "UPDATEUSER" THEN
		set @USER_EXISTS = (SELECT true FROM `users` WHERE id = _id AND `status` = TRUE);
		IF (@USER_EXISTS = true) THEN
			UPDATE `users` SET `password` = _pass, user_edition_id = _id, date_edition = CURRENT_TIMESTAMP 
			WHERE id = _id;
			SELECT _id as id;
		ELSE
			SELECT true as error , @MESSAGE_NOT_FOUND as message;
		END IF;
	WHEN "UPDATE_CODE_USED" THEN
		set @USER_ID = (SELECT true FROM `users` WHERE id = _id);
		IF (@USER_ID = True) THEN 
			UPDATE recover_password SET used = true , user_edition_id = _id, date_edition = CURRENT_TIMESTAMP 
			WHERE id = _id_recover;
			SELECT _id_recover as id;
		ELSE
			SELECT true as error , @MESSAGE_NOT_FOUND as message;
		END IF;
	WHEN "GET_USERNAME" THEN
		SELECT id, user_name FROM users WHERE user_name = _user_name AND status = true;
	WHEN "QUANTITY_REQUESTS" THEN
		SELECT count(*) AS user_id FROM recover_password WHERE user_id = _id AND status = 'A' AND date_creation BETWEEN _date_creation_start AND _date_creation_end;
	WHEN "UPDATE_STATUS" THEN
		UPDATE recover_password SET status = 'I' WHERE user_id = _id AND date_creation BETWEEN _date_creation_start AND _date_creation_end;
		SELECT LAST_INSERT_ID() as id;
    END CASE;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REQUEST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REQUEST`(
IN _option VARCHAR(255),
IN _code VARCHAR(255),
IN _reason VARCHAR(255),
IN _user_id_creation INT,
IN _type_request_id INT,
IN _request_id INT,
IN _description VARCHAR(300),
IN _status_request_id INT
)
begin

	DECLARE message VARCHAR(50);

	SET message = "no existe una opcion con ese parametro";

	CASE(UPPER(_option))
		WHEN 'SAVE' THEN
			INSERT INTO request(code, reason, user_id_creation, type_request_id) VALUES(_code, _reason, _user_id_creation, _type_request_id);
			SELECT LAST_INSERT_ID() as id;
		WHEN 'SELECT' then
			SELECT r.id, CONCAT(u.first_name,' ', u.last_name) as 'full_name', tr.name_request, r.code, sr.name as 'name_status', sr.color as 'color_status' FROM request r INNER JOIN type_request tr 
			ON r.type_request_id  = tr.id INNER JOIN status_request sr on sr.id = r.status_request_id 
			inner join users u on r.user_id_creation = u.id where sr.id = _status_request_id order by r.id;
		WHEN 'FIND_REQUEST' THEN
			set @user_data_admin = (SELECT
				JSON_OBJECT(
					'first_name_admin',u.first_name,
					'last_name_admin',u.last_name,
					'email_admim', u.email 
				) as user_data_admin
			from users u where u.super_user = 1);
            
			set @request = (SELECT
				JSON_OBJECT(
					'id',r.id,
					'code', r.code,
					'reason', r.reason,
					'date_creation', DATE_FORMAT(r.date_creation , '%d/%m/%Y'),
					'first_name', u.first_name,
					'last_name', u.last_name,
					'position', c.name,
					'area', a.name,
					'identification', u.identification,
					'email', u.email,
					'name_request', tr.name_request 
				) as request
				from request r inner join users u on r.user_id_creation = u.id
				inner join type_request tr on r.type_request_id = tr.id 
				inner join charge c on u.charge_id = c.id 
				inner join area a on u.area_id = a.id where r.id = _request_id);
			
			SELECT @user_data_admin as user_data_admin, @request as request;
		WHEN 'UPDATE' THEN
			UPDATE request SET status_request_id  = _status_request_id, request_status_reason = _description, user_id_edition = _user_id_creation, edit = 1, date_edition = CURRENT_TIMESTAMP WHERE id = _request_id;
			SELECT _request_id as id;
		WHEN 'NOTIFICATION_USER' THEN
			select r.id, r.code, r.request_status_reason as 'description', sr.name as 'name_status', CONCAT(u.first_name , ' ', u.last_name) as 'full_name',
			u.email from request r inner join users u on r.user_id_creation = u.id inner join status_request sr 
			on r.status_request_id = sr.id where r.id = _request_id
			order by r.id;
        ELSE SELECT message;
	END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TYPE_REQUEST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TYPE_REQUEST`(
IN _option VARCHAR(255), 
IN _name_request VARCHAR(255), 
IN _description_request VARCHAR(255),
IN _request_code VARCHAR(255),
IN _status_request BOOL)
BEGIN
DECLARE message VARCHAR(50);
SET message = "no existe una opcion con ese parametro";

	CASE(UPPER(_option))
		WHEN 'SAVE' THEN 
			INSERT INTO type_request(name_request, description_request, request_code, status_request) VALUES (_name_request, _description_request, _request_code, _status_request);
			SELECT LAST_INSERT_ID() as id;
		WHEN 'FIND' THEN 
			SELECT * FROM type_request WHERE status_request = 1;
		ELSE SELECT message;
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USER`(IN _option VARCHAR(255), IN _status INT, IN _user_id INT)
BEGIN
	DECLARE message VARCHAR(50);

	SET message = "no existe una opcion con ese parametro";

	CASE(UPPER(_option))
		WHEN 'SELECT' THEN
			select id, first_name, last_name, email, user_name, status from users where super_user = 0;
        WHEN 'UPDATE' THEN
			UPDATE users SET status = _status , date_edition = CURRENT_TIMESTAMP WHERE id = _user_id;
			SELECT _user_id as id;
        ELSE SELECT message;
	END CASE;
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

-- Dump completed on 2024-02-26  0:21:23
