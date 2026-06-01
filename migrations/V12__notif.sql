CREATE TABLE IF NOT EXISTS `socially`.`notifications` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipient_user_id` INT NOT NULL,
  `person_user_id` INT NULL,
  `type` VARCHAR(50) NOT NULL,
  `message` TEXT NOT NULL,
  `reference_id` INT NULL,
  `reference_type` VARCHAR(50) NULL,
  `column_name` VARCHAR(100) NULL,
  `column_id` VARCHAR(100) NULL,
  `is_read` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actions` VARCHAR(255) NULL,
  `external_link` VARCHAR(2048) NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_notifications_recipient_created_at` (`recipient_user_id`, `created_at`),
  INDEX `idx_notifications_person_user_id` (`person_user_id`),
  CONSTRAINT `fk_notifications_recipient`
    FOREIGN KEY (`recipient_user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_notifications_person`
    FOREIGN KEY (`person_user_id`)
    REFERENCES `socially`.`users` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);
