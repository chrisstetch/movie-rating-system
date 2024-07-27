/* Gets movies without any ratings */
SELECT `movies`.`title`
FROM `movies`
LEFT JOIN `ratings` ON `ratings`.`movieID` = `movies`.`id`
WHERE `ratings`.`rating` IS NULL;

/* Lists movies that do not have an assigned genre */
SELECT `movies`.`title`
FROM `movies`
LEFT JOIN `genres` ON `movies`.`id` = `genres`.`id`
WHERE `genres`.`genre` IS NULL;

/* Gets userid of users who have not rated a specific genre of movie */
SELECT DISTINCT `ratings`.`userid`
FROM `ratings`
WHERE `ratings`.`userid` NOT IN (
    SELECT `ratings`.`userid`
    FROM `ratings`
    JOIN `movies` ON `ratings`.`movieID` = `movies`.`id`
     JOIN `genres` ON `movies`.`id` = `genres`.`id`
    WHERE `genres`.`genre` = 'Comedy'
    OR `genres`.`genre` IS NULL
);

