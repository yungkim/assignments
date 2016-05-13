-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema codingdojo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema codingdojo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `codingdojo` ;
USE `codingdojo` ;

-- -----------------------------------------------------
-- Table `codingdojo`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(60) NULL,
  `last_name` VARCHAR(60) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codingdojo`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NULL,
  `description` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codingdojo`.`course_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`course_students` (
  `students_id` INT NOT NULL,
  `courses_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`students_id`, `courses_id`),
  INDEX `fk_students_has_courses_courses1_idx` (`courses_id` ASC),
  INDEX `fk_students_has_courses_students_idx` (`students_id` ASC),
  CONSTRAINT `fk_students_has_courses_students`
    FOREIGN KEY (`students_id`)
    REFERENCES `codingdojo`.`students` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_students_has_courses_courses1`
    FOREIGN KEY (`courses_id`)
    REFERENCES `codingdojo`.`courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
