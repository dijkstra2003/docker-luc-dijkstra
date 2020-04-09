DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `actors`;
CREATE TABLE `actors` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `first-name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last-name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `age` tinyint(3) NOT NULL,
    PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `actors-in-movies`;
CREATE TABLE `actors-in-movies` (
    `actor-id` int(10) NOT NULL,
    `movie-id` int(10) NOT NULL,
    KEY `actor_id_foreign` (`actor-id`),
    KEY `movie_id_foreign` (`movie-id`),
    CONSTRAINT `actor_id_foreign` FOREIGN KEY (`actor-id`) REFERENCES `actors` (`id`),
    CONSTRAINT `movie_id_foreign` FOREIGN KEY (`movie-id`) REFERENCES `movies` (`id`)
);

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
    `source` varchar(255) NOT NULL,
    `movie-id` int(10) NOT NULL,
    `rating` tinyint(2),
    KEY `movie_id_ratings_foreign` (`movie-id`),
    CONSTRAINT `movie_id_ratings_foreign` FOREIGN KEY (`movie-id`) REFERENCES `movies` (`id`)
);