/*
Shows all ratings after January 1st, 2005, only displays 50 rows
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 LIMIT 50;

/*
Shows all ratings after January 1st, 2005 and only ratings from user 270896
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896;

/*
Shows all ratings after January 1st, 2005 and only ratings from user 270896 with a rating higher than 3.0
orders the data by ascending rating
*/
SELECT * FROM `ratings` WHERE `timestamp` > 1104537600 AND `userid` = 270896 AND `rating` > 3.0 ORDER BY `rating` ASC;

/*
Selects only the movieid and rating columns and displays only ratings after January 1st, 2005
and 4.0 or higher
*/
SELECT `movieid`, `rating` FROM `ratings` WHERE `timestamp` > 1104537600 AND `rating` >= 4.0;