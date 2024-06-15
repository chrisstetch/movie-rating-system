/*
Gets the top rated Harry Potter films, sorted by top user rating.
*/

SELECT movies.title, movies.revenue, movies.budget, AVG(ratings.rating) as average_rating
FROM `Movies` 
INNER JOIN `ratings`
ON movies.id = ratings.movieid
WHERE `title` LIKE '%Harry Potter%' 
GROUP BY `title`,`revenue`, `budget`
ORDER BY `average_rating` DESC
LIMIT 100;


