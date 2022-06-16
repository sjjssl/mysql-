USE testing;
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW ()
);

insert into comments(content)
VALUES('lol what a funny article'),
('I found this offensive');
insert into comments(content)
VALUES('what a sunny day');
SELECT 
    *
FROM
    comments;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW () ON UPDATE CURRENT_TIMESTAMP
);
insert into comments2(content)
VALUES('lol aloha'),
('hahahha');
SELECT 
    *
FROM
    comments2;
insert into comments2(content)
VALUES('I love cats');
UPDATE comments2 
SET 
    content = 'This is not gibberish'
WHERE
    content = 'hahahha';
SELECT 
    *
FROM
    comments2
ORDER BY changed_at;
SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
SELECT 
    CONCAT(MONTH(NOW()),
            '/',
            DAY(NOW()),
            '/',
            YEAR(NOW()));
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
SELECT 
    CONCAT(DATE_FORMAT(NOW(), '%M %D'),
            ' at ',
            DATE_FORMAT(NOW(), '%k:%i'));
CREATE TABLE tweets (
    content VARCHAR(255),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW ()
);
insert into tweets(content,username)
values('this is my first tweet','coltcat');
SELECT 
    *
FROM
    tweets;
insert into tweets(content,username)
values('this is my second tweet','coltcat');