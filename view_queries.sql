'''Creates view that only shows names of the actors and keeps information like age and movie hidden'''
CREATE VIEW `actors_names` as SELECT actors.name FROM `actors`;

'''Creates view that keeps ratings anonymous by only giving out the rating and movieid'''
CREATE VIEW `ratings_anonymous` as SELECT ratings.movieID, rating FROM `ratings`;

'''Creates more advanced view which still keeps users anonymous but gives more information on the movie and on ratings with 3.0 or higher rating'''
CREATE VIEW `ratings_anonymous_advanced` AS 
SELECT title, rating, release_date FROM `movies`
INNER JOIN movies ON movies.id = ratings.movieID
WHERE rating > 3.0;
