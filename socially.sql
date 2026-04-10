-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema socially
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `socially` DEFAULT CHARACTER SET utf8 ;
USE `socially` ;

-- -----------------------------------------------------
-- Table `socially`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`outgoings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`outgoings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8mb4' NOT NULL,
  `url` VARCHAR(2048) CHARACTER SET 'utf8mb4' NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_outgoings_location_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `fk_outgoings_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `socially`.`locations` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`purchases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` DOUBLE NULL DEFAULT 0,
  `user` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_purchases_users`
    FOREIGN KEY (`id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`filters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`filters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`user_filters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`user_filters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `filter_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_filter_id_idx` (`filter_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_filter_id`
    FOREIGN KEY (`filter_id`)
    REFERENCES `socially`.`filters` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`location_filters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`location_filters` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `filter_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_loc_filt_location_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_loc_filt_filter_idx` (`filter_id` ASC) VISIBLE,
  CONSTRAINT `fk_loc_filt_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `socially`.`locations` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_loc_filt_filter`
    FOREIGN KEY (`filter_id`)
    REFERENCES `socially`.`filters` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `socially`.`group_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `socially`.`group_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gu_group_idx` (`group_id` ASC) VISIBLE,
  INDEX `fk_gu_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_gu_group`
    FOREIGN KEY (`group_id`)
    REFERENCES `socially`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gu_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;