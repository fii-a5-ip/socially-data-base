ALTER TABLE `socially`.`users` 
ADD COLUMN `fullname` VARCHAR(45) NOT NULL AFTER `username`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `fullname`,
ADD COLUMN `password` VARCHAR(45) NULL AFTER `email`,
ADD COLUMN `google_id` VARCHAR(45) NULL AFTER `password`,
ADD COLUMN `profile_img_url` VARCHAR(2048) NULL AFTER `google_id`,
ADD UNIQUE INDEX `fullname_UNIQUE` (`fullname` ASC) VISIBLE,
ADD UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
ADD UNIQUE INDEX `google_id_UNIQUE` (`google_id` ASC) VISIBLE;

ALTER TABLE `socially`.`locations` 
ADD COLUMN `latitude` DECIMAL(10,8) NOT NULL AFTER `name`,
ADD COLUMN `longitude` DECIMAL(10,8) NOT NULL AFTER `latitude`,
ADD COLUMN `img_url` VARCHAR(2048) NULL AFTER `longitude`;

ALTER TABLE `socially`.`events` 
ADD COLUMN `creator_user_id` INT NOT NULL AFTER `location_id`,
ADD COLUMN `desc` LONGTEXT NOT NULL AFTER `creator_user_id`,
ADD COLUMN `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `desc`,
ADD INDEX `fk_events_creator_idx` (`creator_user_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_events_creator`
  FOREIGN KEY (`creator_user_id`)
  REFERENCES `socially`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `socially`.`groups` 
ADD COLUMN `creator_user_id` INT NOT NULL AFTER `name`,
ADD COLUMN `img_link` VARCHAR(2048) NULL AFTER `creator_user_id`,
ADD INDEX `fk_groups_creator_idx` (`creator_user_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_groups_creator`
  FOREIGN KEY (`creator_user_id`)
  REFERENCES `socially`.`users` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;