/*
Shows the most profitable movies in the data set 
*/
SELECT `title`, `revenue`, `budget`, (`revenue` - `budget`) AS `profit` 
FROM `Movies` 
GROUP BY `title`, `revenue`, `budget`
ORDER BY `profit` DESC 
LIMIT 100;

/*
Shows all Harry Potter movies in the dataset
*/
SELECT `title`, `revenue` 
FROM `movies` 
WHERE `title` LIKE '%Harry Potter%' 
ORDER BY `id` 
LIMIT 100;
