/* Promotes user to admin using userid */
DROP PROCEDURE IF EXISTS PromoteUser;
DELIMITER //
CREATE PROCEDURE PromoteUser(IN id INT)
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;
    UPDATE `users`
    SET `role` = 'user'
    WHERE `userid` = id;
    IF (ROW_COUNT() = 1) THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;

/*  Call procedure (userid) */
CALL PromoteUser(1);

/* Delete rating from movie */
DROP PROCEDURE IF EXISTS DeleteRating;
DELIMITER //
CREATE PROCEDURE DeleteRating(IN userId INT, IN movieId INT)
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;
    DELETE FROM `ratings`
    WHERE `userId` = userId AND `movieId` = movieId;
    IF (ROW_COUNT() = 1) THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;

/* Call procedure (userid, movieid) */
CALL DeleteRating(1, 110);

/* Add rating to movie */
DROP PROCEDURE IF EXISTS AddRating;
DELIMITER //
CREATE PROCEDURE AddRating(IN userId INT, IN movieId INT, IN rating FLOAT, IN timestamp INT)
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    START TRANSACTION;
    INSERT INTO `ratings`(userId, movieId, rating, timestamp)
    VALUES (userId, movieId, rating, timestamp);
    IF (ROW_COUNT() = 1) THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;

/* Call procedure (userid, movieid, rating, timestamp) */
CALL AddRating(1, 110, 1.0, 1425941529);