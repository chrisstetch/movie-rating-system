'''Create an index on the title column to improve query performance '''
CREATE INDEX idx_title ON movies(title);

```Execute the query to select title, revenue, budget, and average rating for movies with titles containing 'Harry Potter' ```
SELECT movies.title, movies.revenue, movies.budget, AVG(ratings.rating) as average_rating
FROM `movies` 
INNER JOIN `ratings`
ON movies.id = ratings.movieid
WHERE movies.title LIKE '%Harry Potter%' 
GROUP BY movies.title, movies.revenue, movies.budget
ORDER BY average_rating DESC
LIMIT 100;


'''Create an index on the job column to improve query performance '''
CREATE INDEX idx_crew_job ON crew(job);

```Execute the query to select crew names and their movie counts for directors with more than 5 movies ```
SELECT crew.name, COUNT(movies.id) as movie_count
FROM `crew`
INNER JOIN `movies`
ON movies.id = crew.movie_id
WHERE crew.job = 'Director'
GROUP BY crew.name
HAVING COUNT(movies.id) > 5
ORDER BY movie_count DESC;
