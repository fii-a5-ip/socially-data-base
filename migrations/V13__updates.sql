ALTER TABLE `socially`.`events`
ADD COLUMN `likes` INT NOT NULL DEFAULT 0;

ALTER TABLE `socially`.`locations`
ADD COLUMN `placeId` VARCHAR(255) NULL;