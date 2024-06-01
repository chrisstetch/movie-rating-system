/*
Shows all ratings after January 1st, 2005, only displays 50 rows
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 LIMIT 50;

/*
Shows all ratings after January 1st, 2005 and only ratings from user 270896
only displays 50 rows
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896 LIMIT 50;

/*
Shows all ratings after January 1st, 2005 and only ratings from user 270896 with a rating higher than 3.0
orders the data by ascending rating only displays 50 rows
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896 AND `rating` > 3.0 ORDER BY `rating` ASC LIMIT 50;

/*
Displays the movie title and rating along with the userid associated with that rating
the movie title is found by joining the movie id from the ratings table to the movies table
*/
SELECT ratings.userid, ratings.rating, movies.title FROM ratings
INNER JOIN movies ON ratings.movieID = movies.id
WHERE timestamp > 1104537600 AND rating >= 4.0 LIMIT 50;