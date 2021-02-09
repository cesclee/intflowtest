-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`member` (
  `mID` VARCHAR(45) NOT NULL,
  `mPWD` VARCHAR(45) NULL,
  `mNAME` VARCHAR(45) NULL,
  `E-MAIL` VARCHAR(45) NULL,
  `PHONE` VARCHAR(45) NULL,
  `mCOMPANY` VARCHAR(45) NULL,
  `mREGION` VARCHAR(45) NULL,
  `mLOCATION` VARCHAR(45) NULL,
  PRIMARY KEY (`mID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`schedule` (
  `scheduleNo` INT NOT NULL,
  `start` DATE NULL,
  `end` DATE NULL,
  `memo` VARCHAR(100) NULL,
  `member_mID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`scheduleNo`),
  INDEX `fk_schedule_member_idx` (`member_mID` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_member`
    FOREIGN KEY (`member_mID`)
    REFERENCES `mydb`.`member` (`mID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`building` (
  `buildingNo` INT NOT NULL,
  `sensorNo` INT NULL,
  `feeds` FLOAT NULL,
  `member_mID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`buildingNo`, `member_mID`),
  INDEX `fk_building_member1_idx` (`member_mID` ASC) VISIBLE,
  CONSTRAINT `fk_building_member1`
    FOREIGN KEY (`member_mID`)
    REFERENCES `mydb`.`member` (`mID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`camera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`camera` (
  `cameraNo` INT NOT NULL,
  `animal` INT NULL,
  `states` VARCHAR(45) NULL,
  `foods` VARCHAR(45) NULL,
  `healthy` VARCHAR(45) NULL,
  `moves` VARCHAR(45) NULL,
  `water` VARCHAR(45) NULL,
  `building_buildingNo` INT NOT NULL,
  `building_member_mID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cameraNo`, `building_buildingNo`, `building_member_mID`),
  INDEX `fk_camera_building1_idx` (`building_buildingNo` ASC, `building_member_mID` ASC) VISIBLE,
  CONSTRAINT `fk_camera_building1`
    FOREIGN KEY (`building_buildingNo` , `building_member_mID`)
    REFERENCES `mydb`.`building` (`buildingNo` , `member_mID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sensor` (
  `sensorNo` INT NOT NULL,
  `temperature` FLOAT NULL,
  `humidity` FLOAT NULL,
  `wind` FLOAT NULL,
  `gas` FLOAT NULL,
  `building_buildingNo1` INT NOT NULL,
  PRIMARY KEY (`sensorNo`, `building_buildingNo1`),
  INDEX `fk_sensor_building2_idx` (`building_buildingNo1` ASC) VISIBLE,
  CONSTRAINT `fk_sensor_building2`
    FOREIGN KEY (`building_buildingNo1`)
    REFERENCES `mydb`.`building` (`buildingNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
