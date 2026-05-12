ALTER TABLE `socially`.`users`ADD COLUMN `bio` VARCHAR(1000) NULL;

ALTER TABLE `socially`.`events`
DROP COLUMN `votes_yes`,
DROP COLUMN `vote_maybe`,
DROP COLUMN `vote_no`;


CREATE TABLE `socially`.`votes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `vote` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_votes_event_idx` (`event_id` ASC) VISIBLE,
  INDEX `fk_votes_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_votes_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `socially`.`events` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_votes_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `chk_vote_value` 
    CHECK (`vote` >= 0 AND `vote` <= 3)
);