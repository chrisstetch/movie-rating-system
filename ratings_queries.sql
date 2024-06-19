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

/*
Displays all users who rated movies with a budget of $65 million along with how many ratings they did
and the average. Orders by descending rating and limits output to 20.
*/
SELECT ratings.userid, COUNT(ratings.rating) AS `Number of ratings by user`,
AVG(ratings.rating) AS `Average user rating`
FROM ratings JOIN Movies ON ratings.movieid = Movies.id
WHERE Movies.budget > 65000000
GROUP BY ratings.userid
HAVING `Number of ratings by user` >= 10
ORDER BY `Average user rating` DESC
LIMIT 20;

/*
Displays all movies in the Science Fiction genre with over 5000 total reviews and a minimum average
review of 3.5
*/
SELECT genres.title, COUNT(ratings.rating) AS `Total Ratings`,
AVG(ratings.rating) AS `Average Rating`
FROM ratings JOIN genres ON ratings.movieid = genres.id
WHERE genres.genre LIKE '%Science Fiction%'
GROUP BY genres.title
HAVING `Total Ratings` >= 5000 AND `Average Rating` >= 3.5
ORDER BY `Average Rating` DESC
LIMIT 20;
