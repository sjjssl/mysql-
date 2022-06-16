DROP DATABASE IF EXISTS Instagram;
CREATE DATABASE Instagram;
USE Instagram;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW ()
);
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW (),
    FOREIGN KEY (user_id)
        REFERENCES users (id)
);
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW (),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (photo_id)
        REFERENCES photos (id)
);
DESCRIBE comments;
INSERT INTO users(username)
VALUES('BlueTheCat'),
	  ('CharlieBrown'),
      ('ColtSteele');
INSERT INTO photos(image_url,user_id)
VALUES ('/alskjd76',1),
       ('/lkajsd98',2),
       ('/90jddlkj',2);
INSERT INTO comments(comment_text,user_id,photo_id)
VALUES ('Meow!',1,2),
	   ('Amazing Shot!',3,2),
       ('I <3 This!',2,1);
SELECT 
    *
FROM
    users;
SELECT 
    *
FROM
    photos;
SELECT 
    *
FROM
    photos
        JOIN
    users ON photos.user_id = users.id;
SELECT 
    *
FROM
    comments;
