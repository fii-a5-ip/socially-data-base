INSERT INTO `socially`.`users` (`id`, `username`, `fullname`, `email`) VALUES
(10, 'user1', 'Utilizator Unu', 'user1@example.com'),
(11, 'user2', 'Utilizator Doi', 'user2@example.com'),
(12, 'user3', 'Utilizator Trei', 'user3@example.com'),
(13, 'user4', 'Utilizator Patru', 'user4@example.com'),
(14, 'user5', 'Utilizator Cinci', 'user5@example.com'),
(15, 'user6', 'Utilizator Sase', 'user6@example.com'),
(16, 'user7', 'Utilizator Sapte', 'user7@example.com'),
(17, 'user8', 'Utilizator Opt', 'user8@example.com'),
(18, 'user9', 'Utilizator Noua', 'user9@example.com'),
(19, 'user10', 'Utilizator Zece', 'user10@example.com'),
(20, 'user11', 'Utilizator Unsprezece', 'user11@example.com'),
(21, 'user12', 'Utilizator Doisprezece', 'user12@example.com'),
(22, 'user13', 'Utilizator Treisprezece', 'user13@example.com'),
(23, 'user14', 'Utilizator Paisprezece', 'user14@example.com'),
(24, 'user15', 'Utilizator Cincisprezece', 'user15@example.com');

INSERT INTO `socially`.`locations` (`id`, `name`, `latitude`, `longitude`) VALUES
(10, 'Viper Club', 47.15580000, 27.60440000),
(11, 'Time Out', 47.17250000, 27.57500000),
(12, 'Zona de Agrement Ciric', 47.17850000, 27.62580000),
(13, 'Cafeneaua Acaju', 47.16450000, 27.58620000);

INSERT INTO `socially`.`groups` (`id`, `name`, `creator_user_id`, `desc`) VALUES
(10, 'Grup Sportiv', 10, 'Grup dedicat iesirilor la biliard, ping pong si activitati competitive.'),
(11, 'Grup Studenti', 15, 'Grup pentru pauze de cafea, iesiri la o bere si socializare dupa cursuri.'),
(12, 'Grup Iesiri in Aer Liber', 20, 'Grup pentru activitati in aer liber, gratare, picnicuri si plimbari in natura.');

INSERT INTO `socially`.`group_users` (`group_id`, `user_id`, `role`) VALUES
(10, 10, 'admin'),
(10, 11, 'member'),
(10, 12, 'member'),
(10, 13, 'member'),
(10, 14, 'member'),
(11, 15, 'admin'),
(11, 16, 'member'),
(11, 17, 'member'),
(11, 18, 'member'),
(11, 19, 'member'),
(12, 20, 'admin'),
(12, 21, 'member'),
(12, 22, 'member'),
(12, 23, 'member'),
(12, 24, 'member');

INSERT INTO `socially`.`events` (`id`, `name`, `location_id`, `creator_user_id`, `desc`, `group_id`) VALUES
(10, 'Turneu de Biliard si Ping Pong', 10, 10, 'Turneu de Biliard si Ping Pong', 10),
(11, 'Iesire la o bere in Copou', 11, 15, 'Iesire la o bere in Copou cu stefano', 11),
(12, 'Seara de Darts si Socializare', 10, 12, 'Seara de Darts si Socializare', NULL),
(13, 'Pauza de cafea la terasa', 11, 13, 'Pauza de cafea la terasa', NULL),
(14, 'Campionat amical de Ping Pong', 10, 14, 'Campionat amical de Ping Pong', NULL),
(15, 'Gratar de weekend la Ciric', 12, 20, 'Gratar de weekend la Ciric cu baietii', 12),
(16, 'Plimbare cu barca pe lac', 12, 21, 'Plimbare relaxanta cu barca pe lacul Ciric', 12),
(17, 'Picnic si relaxare in padure', 12, 22, 'Picnic de duminica la umbra copacilor', NULL),
(18, 'Concert acustic si socializare', 13, 23, 'Seara de muzica live si atmosfera faina la Acaju', NULL),
(19, 'Cafea de specialitate si board games', 13, 24, 'Ne strangem la Acaju pentru cafea si Catan', NULL);

INSERT INTO `socially`.`location_filters` (`location_id`, `filter_id`) VALUES
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'pool table')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'table tennis')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'bowling alley')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'darts')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'indoor seating')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'pub')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'cafe')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'outdoor seating')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'indoor seating')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'bbq facilities')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'lakeside')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'forest setting')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'picnic area')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'outdoor seating')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'boat hire')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'cafe')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'live music')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'board games')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'vegan options')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'indoor seating')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'outdoor seating'));

INSERT INTO `socially`.`event_filters` (`event_id`, `filter_id`) VALUES
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'pool table')),
(10, (SELECT id FROM `socially`.`filters` WHERE name = 'table tennis')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(11, (SELECT id FROM `socially`.`filters` WHERE name = 'pub')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'darts')),
(12, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'cafe')),
(13, (SELECT id FROM `socially`.`filters` WHERE name = 'outdoor seating')),
(14, (SELECT id FROM `socially`.`filters` WHERE name = 'table tennis')),
(15, (SELECT id FROM `socially`.`filters` WHERE name = 'bbq facilities')),
(15, (SELECT id FROM `socially`.`filters` WHERE name = 'outdoor seating')),
(16, (SELECT id FROM `socially`.`filters` WHERE name = 'lakeside')),
(16, (SELECT id FROM `socially`.`filters` WHERE name = 'boat hire')),
(17, (SELECT id FROM `socially`.`filters` WHERE name = 'picnic area')),
(17, (SELECT id FROM `socially`.`filters` WHERE name = 'forest setting')),
(18, (SELECT id FROM `socially`.`filters` WHERE name = 'live music')),
(18, (SELECT id FROM `socially`.`filters` WHERE name = 'bar')),
(18, (SELECT id FROM `socially`.`filters` WHERE name = 'indoor seating')),
(19, (SELECT id FROM `socially`.`filters` WHERE name = 'cafe')),
(19, (SELECT id FROM `socially`.`filters` WHERE name = 'board games'));