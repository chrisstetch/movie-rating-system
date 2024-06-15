/*
Gives top 100 revenue movies without genres combined
*/
SELECT movies.id, movies.title, genres.genre
FROM `movies`
INNER JOIN `genres`
ON movies.id = genres.id
ORDER BY movies.revenue DESC
LIMIT 100;


/*
Gives top 100 revenue movies with genres combined
*/
SELECT movies.id, movies.title, movies.revenue, GROUP_CONCAT(genres.genre SEPARATOR ', ') as `genres`
FROM `movies`
INNER JOIN `genres`
ON movies.id = genres.id
GROUP BY movies.id, title, movies.revenue
ORDER BY movies.revenue DESC
LIMIT 100;