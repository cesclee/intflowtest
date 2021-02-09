-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ERD_task01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ERD_task01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ERD_task01` DEFAULT CHARACTER SET utf8 ;
USE `ERD_task01` ;

-- -----------------------------------------------------
-- Table `ERD_task01`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`building` (
  `buildingnumber` INT NOT NULL,
  `temperature` FLOAT NULL,
  `humidity` FLOAT NULL,
  `wind` FLOAT NULL,
  `gas` FLOAT NULL,
  PRIMARY KEY (`buildingnumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`animal` (
  `animalID` INT NOT NULL,
  `sex` BINARY(1) NULL,
  `memo` LONGTEXT NULL,
  PRIMARY KEY (`animalID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`camera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`camera` (
  `cameraID` INT NOT NULL,
  `function` VARCHAR(100) NULL,
  `onoff` BINARY(1) NULL,
  `animal_animalID` INT NOT NULL,
  PRIMARY KEY (`cameraID`),
  INDEX `fk_camera_animal1_idx` (`animal_animalID` ASC) VISIBLE,
  CONSTRAINT `fk_camera_animal1`
    FOREIGN KEY (`animal_animalID`)
    REFERENCES `ERD_task01`.`animal` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`farm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`farm` (
  `farmID` INT NOT NULL,
  `scheduleID` INT NOT NULL,
  `buildingID` INT NOT NULL,
  `cameraID` INT NOT NULL,
  `farmcol` VARCHAR(45) NOT NULL,
  `building_buildingnumber1` INT NOT NULL,
  `camera_cameraID` INT NOT NULL,
  PRIMARY KEY (`farmID`),
  INDEX `fk_farm_building2_idx` (`building_buildingnumber1` ASC) VISIBLE,
  INDEX `fk_farm_camera1_idx` (`camera_cameraID` ASC) VISIBLE,
  CONSTRAINT `fk_farm_building2`
    FOREIGN KEY (`building_buildingnumber1`)
    REFERENCES `ERD_task01`.`building` (`buildingnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_farm_camera1`
    FOREIGN KEY (`camera_cameraID`)
    REFERENCES `ERD_task01`.`camera` (`cameraID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`company` (
  `companyname` INT NOT NULL,
  `field` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `scale` INT NULL,
  `farm_farmID1` INT NOT NULL,
  PRIMARY KEY (`companyname`),
  INDEX `fk_company_farm2_idx` (`farm_farmID1` ASC) VISIBLE,
  CONSTRAINT `fk_company_farm2`
    FOREIGN KEY (`farm_farmID1`)
    REFERENCES `ERD_task01`.`farm` (`farmID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`member` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `PWD` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `membercol` VARCHAR(45) NULL,
  `company_companyname` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_member_company_idx` (`company_companyname` ASC) VISIBLE,
  CONSTRAINT `fk_member_company`
    FOREIGN KEY (`company_companyname`)
    REFERENCES `ERD_task01`.`company` (`companyname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERD_task01`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERD_task01`.`schedule` (
  `scheduleNumber` INT NOT NULL,
  `start` VARCHAR(45) NULL,
  `end` VARCHAR(45) NULL,
  `memo` LONGTEXT NULL,
  `farm_farmID` INT NOT NULL,
  PRIMARY KEY (`scheduleNumber`),
  INDEX `fk_schedule_farm1_idx` (`farm_farmID` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_farm1`
    FOREIGN KEY (`farm_farmID`)
    REFERENCES `ERD_task01`.`farm` (`farmID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
