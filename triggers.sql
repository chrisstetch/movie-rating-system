--Examples of how triggers can be utilized in the database

SET @num_ratings = 0;

DELIMITER //
CREATE TRIGGER after_insert_ratings
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
    SET @num_ratings = @num_ratings + 1;
END;
//
DELIMITER ;


SET @num_users = 0;

DELIMITER //
CREATE TRIGGER after_insert_users
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    SET @num_users = @num_users + 1;
END;
//
DELIMITER ;
