DROP DATABASE IF EXISTS `movie`;
CREATE DATABASE `movie`;
USE `movie`;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 LIMIT 50;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896 AND `rating` > 3.0 ORDER BY `rating` ASC;

SELECT `movieid`, `rating` FROM `ratings` WHERE `timestamp` > 1104537600 AND `rating` >= 4.0;