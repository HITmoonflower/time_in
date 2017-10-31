create database PDO;
CREATE TABLE `pdo`.`tablekey` (
  `userID` INT NOT NULL,
  `pdoID` INT NOT NULL,
  `key0` VARCHAR(45) NULL,
  `key1` VARCHAR(45) NULL,
  `key2` VARCHAR(45) NULL,
  `key3` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`));
  CREATE TABLE `pdo`.`tablevalue` (
  `userID` INT NOT NULL,
  `pdoID` INT NULL,
  `date` DATE NULL,
  `spend` FLOAT NULL,
  `place` VARCHAR(45) NULL,
  `value0` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`));
  CREATE TABLE `pdo`.`tablequery` (
  `userID` INT NOT NULL,
  `pdoID` INT NULL,
  `date` DATE NULL,
  `spend` FLOAT NULL,
  `place` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`));
