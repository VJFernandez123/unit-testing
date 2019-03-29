CREATE TABLE IF NOT EXISTS `ZONE` (
  `ZONE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ZONE_NAME` varchar(45) NOT NULL,
  `ZONE_STATE` varchar(45) NOT NULL,
  `ZONE_CREATED_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ZONE_CREATED_BY` int(11) NOT NULL,
  `ZONE_MODIFIED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `ZONE_MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZONE_ID`),
  UNIQUE KEY `ZONE_ID_UNIQUE` (`ZONE_ID`),
  UNIQUE KEY `ZONE_NAME_UNIQUE` (`ZONE_NAME`)
);

CREATE TABLE IF NOT EXISTS `GRADE` (
  `GRADE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRADE_NAME` varchar(45) NOT NULL,
  `GRADE_ZONE_ID` int(11) NOT NULL,
  `GRADE_STATE` varchar(45) NOT NULL,
  `GRADE_CREATED_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `GRADE_CREATED_BY` int(11) NOT NULL,
  `GRADE_MODIFIED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `GRADE_MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  UNIQUE KEY `GRADE_ID_UNIQUE` (`GRADE_ID`),
  UNIQUE KEY `GRADE_NAME_UNIQUE` (`GRADE_NAME`),
  KEY `fk_GRADE_ZONE_FK_idx` (`GRADE_ZONE_ID`),
  CONSTRAINT `fk_GRADE_ZONE_FK` FOREIGN KEY (`GRADE_ZONE_ID`) REFERENCES `ZONE` (`ZONE_ID`)
);

CREATE TABLE IF NOT EXISTS `CLASS` (
  `CLASS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(45) NOT NULL,
  `CLASS_GRADE_ID` int(11) NOT NULL,
  `CLASS_PART` varchar(45) NOT NULL,
  `CLASS_STATE` varchar(45) NOT NULL,
  `CLASS_CREATED_TIMESTAMP` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CLASS_CREATED_BY` int(11) DEFAULT NULL,
  `CLASS_MODIFIED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `CLASS_MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`),
  UNIQUE KEY `CLAZZ_NAME_UNIQUE` (`CLASS_NAME`),
  KEY `fk_CLAZZ_GRADE_FK_idx` (`CLASS_GRADE_ID`),
  CONSTRAINT `fk_CLASS_GRADE` FOREIGN KEY (`CLASS_GRADE_ID`) REFERENCES `GRADE` (`GRADE_ID`)
);

INSERT INTO ZONE(ZONE_ID,ZONE_NAME,ZONE_STATE,ZONE_CREATED_BY) VALUES(1,'PRIMARY','ACTIVE',1);
INSERT INTO ZONE(ZONE_ID,ZONE_NAME,ZONE_STATE,ZONE_CREATED_BY) VALUES(2,'KANISHTA','ACTIVE',1);
INSERT INTO GRADE(GRADE_ID,GRADE_NAME,GRADE_ZONE_ID,GRADE_STATE,GRADE_CREATED_BY) VALUES(1,'GRADE 2',1,'ACTIVE',1);
INSERT INTO GRADE(GRADE_ID,GRADE_NAME,GRADE_ZONE_ID,GRADE_STATE,GRADE_CREATED_BY) VALUES(2,'GRADE 3',1,'ACTIVE',1);
INSERT INTO GRADE(GRADE_ID,GRADE_NAME,GRADE_ZONE_ID,GRADE_STATE,GRADE_CREATED_BY) VALUES(3,'GRADE 4',2,'ACTIVE',1);
INSERT INTO GRADE(GRADE_ID,GRADE_NAME,GRADE_ZONE_ID,GRADE_STATE,GRADE_CREATED_BY) VALUES(4,'GRADE 5',2,'ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (1,'2A',1,'A','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (2,'2B',1,'B','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (3,'3A',2,'A','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (4,'3B',2,'B','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (5,'4A',3,'A','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (6,'4B',3,'B','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (7,'5A',4,'A','ACTIVE',1);
INSERT INTO CLASS(CLASS_ID,CLASS_NAME,CLASS_GRADE_ID,CLASS_PART,CLASS_STATE,CLASS_CREATED_BY)
VALUES (8,'5B',4,'B','ACTIVE',1);
