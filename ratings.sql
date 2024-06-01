DROP DATABASE IF EXISTS `movie`;
CREATE DATABASE `movie`;
USE `movie`;

CREATE TABLE `ratings` (`userid` INT, `movieid` INT, `rating` DECIMAL(2,1), `timestamp` INT);

LOAD DATA LOCAL INFILE '/Users/sarpozcetin/workspace/c370/summer24/ratings.csv' INTO TABLE `ratings` FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 LIMIT 50;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896;

SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896 AND `rating` > 3.0 ORDER BY `rating` ASC;

SELECT `movieid`, `rating` FROM `ratings` WHERE `timestamp` > 1104537600 AND `rating` >= 4.0;