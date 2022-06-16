CREATE DATABASE trigger_1;
USE trigger_1;
CREATE TABLE users (
    username VARCHAR(100),
    age INT
);
INSERT INTO users(username,age)
VALUES('bobby',23);
INSERT INTO users(username,age)
VALUES('Sally',16);
SELECT 
    *
FROM
    users;

DELIMITER $$
CREATE TRIGGER must_be_adult
    BEFORE INSERT ON users FOR EACH ROW
    BEGIN
         IF NEW.age<18
         THEN
             SIGNAL SQLSTATE '45000'
			        SET MESSAGE_TEXT='Must be an adult!';
		  END IF;
	END;
$$

DELIMITER ;
INSERT INTO users(username,age)
VALUES('Sue',54);
# THE FOLLOWING CODE WON'T WORK BECAUSE OF THE AGE.
#INSERT INTO users(username,age)
#VALUES('Yang',14);

