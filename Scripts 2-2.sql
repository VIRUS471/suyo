-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SUYOOFFICIALFINALE
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SUYOOFFICIALFINALE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SUYOOFFICIALFINALE` DEFAULT CHARACTER SET utf8 ;
USE `SUYOOFFICIALFINALE` ;

-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`UserTypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`UserTypes` (
  `UserTypeId` INT NOT NULL AUTO_INCREMENT,
  `UserType` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`UserTypeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`AccountRequirements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`AccountRequirements` (
  `AccountRequirementsId` INT NOT NULL AUTO_INCREMENT,
  `filepath` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`AccountRequirementsId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Users` (
  `UserId` INT NOT NULL AUTO_INCREMENT,
  `FirebaseRegistrationId` VARCHAR(300) NOT NULL,
  `Firstname` VARCHAR(50) NOT NULL,
  `Lastname` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `ProfilePicture` BLOB NOT NULL,
  `Mobile` BIGINT(20) NOT NULL,
  `Address` VARCHAR(200) NOT NULL,
  `Municipality` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `ActivationNo` VARCHAR(200) NOT NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateActivated` TIMESTAMP NULL,
  `DateModified` TIMESTAMP NULL,
  `UserTypeId` INT NOT NULL,
  `AccountRequirementsId` INT NULL,
  PRIMARY KEY (`UserId`),
  INDEX `fk_Users_UserTypes1_idx` (`UserTypeId` ASC),
  INDEX `fk_Users_AccountRequirements1_idx` (`AccountRequirementsId` ASC),
  CONSTRAINT `fk_Users_UserTypes1`
    FOREIGN KEY (`UserTypeId`)
    REFERENCES `SUYOOFFICIALFINALE`.`UserTypes` (`UserTypeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_AccountRequirements1`
    FOREIGN KEY (`AccountRequirementsId`)
    REFERENCES `SUYOOFFICIALFINALE`.`AccountRequirements` (`AccountRequirementsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Skill` (
  `SkillId` INT NOT NULL AUTO_INCREMENT,
  `SkillName` VARCHAR(50) NOT NULL,
  `Description` TEXT NOT NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` TIMESTAMP NULL,
  PRIMARY KEY (`SkillId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`ServiceProviderBusiness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`ServiceProviderBusiness` (
  `BusinessAccountId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `BusinessLocation` VARCHAR(500) NULL COMMENT 'Gets Map Latitude and Longitude that will be shown in the map',
  `BusinessName` VARCHAR(45) NULL,
  `BusinessAddress` VARCHAR(200) NOT NULL,
  `BusinessNumber` BIGINT(20) NULL,
  `Status` VARCHAR(45) NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` TIMESTAMP NULL,
  `SkillId` INT NOT NULL,
  PRIMARY KEY (`BusinessAccountId`),
  INDEX `fk_ServiceProviderBusiness_Users_idx` (`UserId` ASC),
  INDEX `fk_ServiceProviderBusiness_Skill1_idx` (`SkillId` ASC),
  CONSTRAINT `fk_ServiceProviderBusiness_Users`
    FOREIGN KEY (`UserId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceProviderBusiness_Skill1`
    FOREIGN KEY (`SkillId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Skill` (`SkillId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Quotations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Quotations` (
  `QuoteId` INT NOT NULL AUTO_INCREMENT,
  `Description` TEXT NOT NULL,
  `AgreedPrice` DECIMAL NULL,
  `Status` VARCHAR(45) NOT NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` TIMESTAMP NULL,
  `DateProcessed` TIMESTAMP NULL,
  PRIMARY KEY (`QuoteId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Payments` (
  `PaymentsId` INT NOT NULL AUTO_INCREMENT,
  `PaymentType` VARCHAR(45) NOT NULL,
  `AmountPaid` DECIMAL NULL,
  `ReferenceNo` BIGINT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `DateTimeProcessed` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentsId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`FeedBacks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`FeedBacks` (
  `FeedBackId` INT NOT NULL AUTO_INCREMENT,
  `Rating` DECIMAL NULL,
  `Remarks` TEXT NULL,
  `DateTimeAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FeedBackId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Reports` (
  `ReportsId` INT NOT NULL AUTO_INCREMENT,
  `Subject` VARCHAR(45) NOT NULL,
  `Details` TEXT NULL,
  `DateAdded` TIMESTAMP NOT NULL,
  `DateProcessed` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReportsId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`ProblemImages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`ProblemImages` (
  `ProblemImagesId` INT NOT NULL AUTO_INCREMENT,
  `FileLocation` VARCHAR(200) NULL,
  PRIMARY KEY (`ProblemImagesId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Booking` (
  `BookingId` INT NOT NULL AUTO_INCREMENT,
  `Remarks` TEXT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `BookingType` VARCHAR(45) NOT NULL,
  `BookingDateTime` DATETIME NOT NULL,
  `DateAccepted` TIMESTAMP NULL,
  `DateCanceled` TIMESTAMP NULL,
  `DateModified` TIMESTAMP NULL,
  `DateCompleted` TIMESTAMP NULL,
  `UserId` INT NOT NULL,
  `QuoteId` INT NULL,
  `BusinessAccountId` INT NULL,
  `PaymentsId` INT NULL,
  `FeedBackId` INT NULL,
  `ReportsId` INT NULL,
  `ProblemImagesId` INT NOT NULL,
  PRIMARY KEY (`BookingId`),
  INDEX `fk_Booking_Users1_idx` (`UserId` ASC),
  INDEX `fk_Booking_Quotations1_idx` (`QuoteId` ASC),
  INDEX `fk_Booking_ServiceProviderBusiness1_idx` (`BusinessAccountId` ASC),
  INDEX `fk_Booking_Payments1_idx` (`PaymentsId` ASC),
  INDEX `fk_Booking_FeedBacks1_idx` (`FeedBackId` ASC),
  INDEX `fk_Booking_Reports1_idx` (`ReportsId` ASC),
  INDEX `fk_Booking_ProblemImages1_idx` (`ProblemImagesId` ASC),
  CONSTRAINT `fk_Booking_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Quotations1`
    FOREIGN KEY (`QuoteId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Quotations` (`QuoteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_ServiceProviderBusiness1`
    FOREIGN KEY (`BusinessAccountId`)
    REFERENCES `SUYOOFFICIALFINALE`.`ServiceProviderBusiness` (`BusinessAccountId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Payments1`
    FOREIGN KEY (`PaymentsId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Payments` (`PaymentsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_FeedBacks1`
    FOREIGN KEY (`FeedBackId`)
    REFERENCES `SUYOOFFICIALFINALE`.`FeedBacks` (`FeedBackId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Reports1`
    FOREIGN KEY (`ReportsId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Reports` (`ReportsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_ProblemImages1`
    FOREIGN KEY (`ProblemImagesId`)
    REFERENCES `SUYOOFFICIALFINALE`.`ProblemImages` (`ProblemImagesId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Services` (
  `ServiceId` INT NOT NULL AUTO_INCREMENT,
  `ServiceName` VARCHAR(50) NOT NULL,
  `ServiceDescription` TEXT NOT NULL,
  `MinPrice` DECIMAL NULL,
  `MaxPrice` DECIMAL NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` TIMESTAMP NULL,
  `BusinessAccountId` INT NOT NULL,
  PRIMARY KEY (`ServiceId`),
  INDEX `fk_Services_ServiceProviderBusiness1_idx` (`BusinessAccountId` ASC),
  CONSTRAINT `fk_Services_ServiceProviderBusiness1`
    FOREIGN KEY (`BusinessAccountId`)
    REFERENCES `SUYOOFFICIALFINALE`.`ServiceProviderBusiness` (`BusinessAccountId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`DataLog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`DataLog` (
  `DataLogId` INT NOT NULL AUTO_INCREMENT,
  `LogType` VARCHAR(20) NOT NULL,
  `LogInDateTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogOutDateTime` TIMESTAMP NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`DataLogId`),
  INDEX `fk_DataLog_Users1_idx` (`UserId` ASC),
  CONSTRAINT `fk_DataLog_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`Admin` (
  `AdminId` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(10) NULL,
  `AccountStatus` VARCHAR(10) NULL,
  `DateAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` TIMESTAMP NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`AdminId`),
  INDEX `fk_Admin_Users1_idx` (`UserId` ASC),
  CONSTRAINT `fk_Admin_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SUYOOFFICIALFINALE`.`InterviewSchedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SUYOOFFICIALFINALE`.`InterviewSchedules` (
  `InterviewId` INT NOT NULL AUTO_INCREMENT,
  `InterviewStatus` VARCHAR(10) NOT NULL,
  `DateScheduled` DATE NOT NULL,
  `DateRescheduled` DATE NULL,
  `DateTimeAdded` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateTimeModified` TIMESTAMP NULL,
  `DateApproved` TIMESTAMP NULL,
  `AdminId` INT NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`InterviewId`),
  INDEX `fk_Interview_Admin1_idx` (`AdminId` ASC),
  INDEX `fk_InterviewSchedules_Users1_idx` (`UserId` ASC),
  CONSTRAINT `fk_Interview_Admin1`
    FOREIGN KEY (`AdminId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Admin` (`AdminId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InterviewSchedules_Users1`
    FOREIGN KEY (`UserId`)
    REFERENCES `SUYOOFFICIALFINALE`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
