DROP TABLE IF EXISTS `ratings_cleaned`;
CREATE TABLE `ratings_cleaned` (`userid` INT, `movieid` INT, `rating` DECIMAL(2,1), `timestamp` INT);

LOAD DATA LOCAL INFILE '/Users/sarpozcetin/workspace/duplicate_free.csv'
INTO TABLE `ratings_cleaned`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE `ratings_cleaned`
ADD PRIMARY KEY (`userid`);

