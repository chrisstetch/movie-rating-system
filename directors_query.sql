/*
List the people who have directed the most movies.
*/

SELECT crew.name, COUNT(movies.id) as movie_count
FROM `crew`
INNER JOIN `movies`
ON movies.id = crew.movie_id
WHERE crew.job = "Director"
GROUP BY crew.name
HAVING COUNT(movies.id) > 5
ORDER BY movie_count DESC;
