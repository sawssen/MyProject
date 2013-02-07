SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `CVMobile` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `CVMobile`;

-- -----------------------------------------------------
-- Table `CVMobile`.`Level`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Level` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `level` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CVMobile`.`Member`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Member` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `firstName` VARCHAR(70) NULL ,
  `lastName` VARCHAR(70) NULL ,
  `age` INT NULL ,
  `birth'sday` DATE NULL ,
  `birth'splace` VARCHAR(50) NULL ,
  `adress` VARCHAR(90) NULL ,
  `telephoneNumber` VARCHAR(60) NULL ,
  `email` VARCHAR(60) NULL ,
  `website` VARCHAR(70) NULL ,
  `image'sName` VARCHAR(70) NULL ,
  `iacRole` VARCHAR(100) NULL ,
  `drivingLicense` VARCHAR(80) NULL ,
  `Level_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Member_Level1`
    FOREIGN KEY (`Level_id` )
    REFERENCES `CVMobile`.`Level` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Member_Level1` ON `CVMobile`.`Member` (`Level_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`Catégorie`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Catégorie` (
  `id` INT NOT NULL ,
  `label` LONGTEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CVMobile`.`Compétence`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Compétence` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(45) NULL ,
  `Catégorie_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Compétence_Catégorie`
    FOREIGN KEY (`Catégorie_id` )
    REFERENCES `CVMobile`.`Catégorie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Compétence_Catégorie` ON `CVMobile`.`Compétence` (`Catégorie_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`AcademicCursus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`AcademicCursus` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `establishment` VARCHAR(45) NULL ,
  `description` TEXT NULL ,
  `startDate` DATE NULL ,
  `endDate` DATE NULL ,
  `Member_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_AcademicCursus_Member1`
    FOREIGN KEY (`Member_id` )
    REFERENCES `CVMobile`.`Member` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_AcademicCursus_Member1` ON `CVMobile`.`AcademicCursus` (`Member_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`Experience`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Experience` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `company` VARCHAR(70) NULL ,
  `status` TEXT NULL ,
  `description` LONGTEXT NULL ,
  `startDate` DATE NULL ,
  `endDate` DATE NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CVMobile`.`Experience_Member`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Experience_Member` (
  `Experience_id` INT NOT NULL ,
  `Member_id` INT NOT NULL ,
  PRIMARY KEY (`Experience_id`, `Member_id`) ,
  CONSTRAINT `fk_Experience_has_Member_Experience1`
    FOREIGN KEY (`Experience_id` )
    REFERENCES `CVMobile`.`Experience` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experience_has_Member_Member1`
    FOREIGN KEY (`Member_id` )
    REFERENCES `CVMobile`.`Member` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Experience_has_Member_Experience1` ON `CVMobile`.`Experience_Member` (`Experience_id` ASC) ;

CREATE INDEX `fk_Experience_has_Member_Member1` ON `CVMobile`.`Experience_Member` (`Member_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`Member_Compétence`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Member_Compétence` (
  `Member_id` INT NOT NULL ,
  `Compétence_id` INT NOT NULL ,
  PRIMARY KEY (`Member_id`, `Compétence_id`) ,
  CONSTRAINT `fk_Member_has_Compétence_Member1`
    FOREIGN KEY (`Member_id` )
    REFERENCES `CVMobile`.`Member` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Member_has_Compétence_Compétence1`
    FOREIGN KEY (`Compétence_id` )
    REFERENCES `CVMobile`.`Compétence` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Member_has_Compétence_Member1` ON `CVMobile`.`Member_Compétence` (`Member_id` ASC) ;

CREATE INDEX `fk_Member_has_Compétence_Compétence1` ON `CVMobile`.`Member_Compétence` (`Compétence_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`SocialLife`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`SocialLife` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `description` LONGTEXT NULL ,
  `startDate` DATE NULL ,
  `endDate` DATE NULL ,
  `Member_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_SocialLife_Member1`
    FOREIGN KEY (`Member_id` )
    REFERENCES `CVMobile`.`Member` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SocialLife_Member1` ON `CVMobile`.`SocialLife` (`Member_id` ASC) ;


-- -----------------------------------------------------
-- Table `CVMobile`.`Certification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Certification` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(80) NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CVMobile`.`Membe_Certification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CVMobile`.`Membe_Certification` (
  `Member_id` INT NOT NULL ,
  `Certification_id` INT NOT NULL ,
  PRIMARY KEY (`Member_id`, `Certification_id`) ,
  CONSTRAINT `fk_Member_has_Certification_Member1`
    FOREIGN KEY (`Member_id` )
    REFERENCES `CVMobile`.`Member` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Member_has_Certification_Certification1`
    FOREIGN KEY (`Certification_id` )
    REFERENCES `CVMobile`.`Certification` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Member_has_Certification_Member1` ON `CVMobile`.`Membe_Certification` (`Member_id` ASC) ;

CREATE INDEX `fk_Member_has_Certification_Certification1` ON `CVMobile`.`Membe_Certification` (`Certification_id` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
