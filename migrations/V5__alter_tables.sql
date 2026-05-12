ALTER TABLE `socially`.`events` ADD COLUMN `group_id` INT NULL;
ALTER TABLE `socially`.`events` ADD COLUMN `votes_yes` INT DEFAULT 0;
ALTER TABLE `socially`.`events` ADD COLUMN `vote_maybe` INT DEFAULT 0;
ALTER TABLE `socially`.`events` ADD COLUMN `vote_no` INT DEFAULT 0;
ALTER TABLE `socially`.`events` ADD CONSTRAINT `fk_events_group` FOREIGN KEY (`group_id`) REFERENCES `socially`.`groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE `socially`.`group_users` ADD COLUMN `role` VARCHAR(45) NULL;