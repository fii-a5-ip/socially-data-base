CREATE TABLE IF NOT EXISTS `socially`.`event_participants` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `user_id`),
  INDEX `idx_event_participants_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_participants_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `socially`.`events` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_event_participants_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
