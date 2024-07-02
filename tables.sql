/*
Movies table creation
*/

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
    adult VARCHAR(10),
    belongs_to_collection JSON,
    budget INT,
    genres JSON,
    homepage VARCHAR(255),
    id INT PRIMARY KEY,
    imdb_id VARCHAR(10),
    original_language VARCHAR(2),
    original_title VARCHAR(255),
    overview TEXT,
    popularity DECIMAL(10, 6),
    poster_path VARCHAR(255),
    production_companies JSON,
    production_countries JSON,
    release_date DATE,
    revenue BIGINT,
    runtime DECIMAL(5, 1),
    spoken_languages JSON,
    status VARCHAR(50),
    tagline TEXT,
    title VARCHAR(255),
    video VARCHAR(10),
    vote_average DECIMAL(3, 1),
    vote_count INT
);

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\movies_metadata.csv'
INTO TABLE `movies`
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, budget, @dummy, @dummy, id, @dummy, original_language, original_title, overview, popularity, @dummy, @dummy, @dummy, release_date, revenue, runtime, @dummy, status, tagline, title, @dummy, vote_average, vote_count);

/*
Keywords table creation
*/
DROP TABLE IF EXISTS `Keywords`;
CREATE TABLE `Keywords`(id INT, keywords VARCHAR(500));

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\keywords.csv'
INTO TABLE Keywords
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
Ratings table creation
*/
DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (`userid` INT, `movieID` INT, `rating` DECIMAL(2,1), `timestamp` INT);

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\ratings.csv'
INTO TABLE `ratings`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/*
Genres table creation
*/

DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
	id INT, 
    budget DOUBLE, 
    revenue DOUBLE, 
    release_date date, 
    original_language TEXT, 
    title TEXT, 
    overview TEXT, 
    adult TEXT, 
    genre TEXT);

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\movies_genres_expanded.csv'
INTO TABLE `genres`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
Crew table creation
*/

DROP TABLE IF EXISTS `crew`;
CREATE TABLE `crew` (
	movie_id INT, 
    credit_id TEXT, 
    department TEXT, 
    gender TEXT, 
    id INT, 
    job TEXT, 
    `name` TEXT, 
    profile_path TEXT);

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\parsed_crew.csv'
INTO TABLE `crew`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
Actors table creation
*/

DROP TABLE IF EXISTS `actors`;
CREATE TABLE `actors`(
	`movieid` INT, 
	`character` VARCHAR(400), 
	`gender` TINYINT, 
	`name` VARCHAR(400), 
	PRIMARY KEY(`movieid`)); 

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\parsed_cast.csv'
INTO TABLE actors
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

/*
Users table creation
*/

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(
	`userid` INT, 
	`username` VARCHAR(50), 
	`email` VARCHAR(50), 
    `role` VARCHAR(50),
	PRIMARY KEY(`userid`));

LOAD DATA LOCAL INFILE 'C:\\Users\\chris\\Documents\\uvic\\2024 05 Summer\\CSC 370\\Project\\movie-rating-system\\data\\users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
