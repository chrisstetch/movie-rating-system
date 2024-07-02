/* Promotes user to admin using userid */
START TRANSACTION;
    UPDATE `users`
    SET `role` = 'admin'
    WHERE `userid` =  2;
COMMIT;

/* Delete rating from movie */
START TRANSACTION;
    DELETE FROM `ratings`
    WHERE `userId` = 1 AND `movieId` = 110;
COMMIT;

/* Add rating to movie */
START TRANSACTION;
    INSERT INTO `ratings`(userId, movieId, rating, timestamp)
    VALUES (1, 110, 1.0, 1425941529);
COMMIT;

