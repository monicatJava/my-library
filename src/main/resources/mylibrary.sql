--mylibrary


CREATE DATABASE `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

use library;

-- `role` definition

CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- title_kind definition

CREATE TABLE `title_kind` (
  `title_kind_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`title_kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- title definition

CREATE TABLE `title` (
  `title_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title_kind_id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`title_id`),
  KEY `ttl_tik_fk` (`title_kind_id`),
  CONSTRAINT `ttl_tik_fk` FOREIGN KEY (`title_kind_id`) REFERENCES `title_kind` (`title_kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- `user` definition

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `usr_rol_fk` (`role_id`),
  CONSTRAINT `usr_rol_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- item definition

CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `title_id` int NOT NULL,
  `added_date` datetime DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `due_back` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `itm_ttl_fk` (`title_id`),
  KEY `itm_usr_fk` (`user_id`),
  CONSTRAINT `itm_ttl_fk` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`),
  CONSTRAINT `itm_usr_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- reservation definition

CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `date_time_created` datetime NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `res_itm_fk` (`item_id`),
  KEY `res_usr_fk` (`user_id`),
  CONSTRAINT `res_itm_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `res_usr_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO title_kind (name) VALUES
	 ('Magazine'),
	 ('Book');

INSERT INTO `role` (name) VALUES
	 ('Test Role');

INSERT INTO title (name,title_kind_id,description,author,isbn) VALUES
	 ('Core J2EE Patterns',2,'','John Doe','08-13364512-99'),
	 ('UML 2 Toolkit',2,'','Brian Lyons, David Fado','0-471-46361-2'),
	 ('Java Extreme Programming',2,'','Jane Smith','11-11-11-1-11');

INSERT INTO library.`user` (username,password,first_name,last_name,address,city,state,zipcode,phone,role_id) VALUES
	 ('smatyas','password','steve','matyas','','','','','',1),
	 ('pduvall','password','paul','duvall','','','','','',1);

INSERT INTO library.item (title_id,added_date,checked_out,user_id,due_back,comments) VALUES
	 (2,'2003-05-06 00:00:00','2003-05-13 00:00:00',2,NULL,'Not in good condition'),
	 (2,'2003-05-10 00:00:00','2003-05-14 00:00:00',2,NULL,'Good condition'),
	 (1,'2003-05-01 00:00:00','2003-05-02 00:00:00',2,NULL,'It''s fine');

INSERT INTO library.item (title_id,added_date,checked_out,user_id,due_back,comments) VALUES
	 (2,'2003-05-06 00:00:00','2003-05-13 00:00:00',2,NULL,'Not in good condition'),
	 (2,'2003-05-10 00:00:00','2003-05-14 00:00:00',2,NULL,'Good condition'),
	 (1,'2003-05-01 00:00:00','2003-05-02 00:00:00',2,NULL,'It''s fine');




