ALTER TABLE `socially`.`users` MODIFY COLUMN `password` VARCHAR(256) NULL;
ALTER TABLE `socially`.`users` MODIFY COLUMN `username` VARCHAR(100) NOT NULL;
ALTER TABLE `socially`.`users` MODIFY COLUMN `fullname` VARCHAR(100) NOT NULL;
ALTER TABLE `socially`.`users` MODIFY COLUMN `email` VARCHAR(100) NULL;
ALTER TABLE `socially`.`users` MODIFY COLUMN `google_id` VARCHAR(100) NULL;
ALTER TABLE `socially`.`users` DROP INDEX `fullname_UNIQUE`;
ALTER TABLE `socially`.`groups` ADD COLUMN `desc` LONGTEXT NULL;
ALTER TABLE `socially`.`filters` ADD COLUMN `category` VARCHAR(45) NULL;