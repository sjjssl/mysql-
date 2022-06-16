USE testing;
CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
INSERT INTO people (name,birthdate,birthtime,birthdt)
VALUES ('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35'),
('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');
SELECT 
    *
FROM
    people;
SELECT 
    name, birthdate
FROM
    people;
SELECT 
    name, DAY(birthdate)
FROM
    people;
SELECT 
    name, DAYNAME(birthdate)
FROM
    people;
SELECT 
    name, DAYOFWEEK(birthdate)
FROM
    people;
SELECT 
    name, DAYOFYEAR(birthdate)
FROM
    people;
SELECT 
    name, birthtime, DAYOFYEAR(birthdt)
FROM
    people;
SELECT 
    name, birthtime, MONTH(birthdt)
FROM
    people;
SELECT 
    name, birthtime, MONTHNAME(birthdt)
FROM
    people;
SELECT 
    name, birthtime, HOUR(birthdt)
FROM
    people;
SELECT 
    name, birthtime, MINUTE(birthdt)
FROM
    people;
SELECT 
    CONCAT(MONTHNAME(birthdate),
            ' ',
            DAY(birthdate),
            ' ',
            YEAR(birthdate)) AS 'birth day'
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, '%D-%M-%Y')
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, '%m/%d/%Y')
FROM
    people;
SELECT 
    DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%m')
FROM
    people;
SELECT 
    *
FROM
    people;
SELECT 
    name, birthdate, DATEDIFF(NOW(), birthdate) AS 'days passed'
FROM
    people;
SELECT 
    birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH)
FROM
    people;
SELECT 
    birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER)
FROM
    people;
SELECT 
    birthdt, birthdt + INTERVAL 1 MONTH
FROM
    people;
SELECT 
    birthdt, birthdt - INTERVAL 7 MONTH
FROM
    people;
SELECT 
    birthdt, birthdt - INTERVAL 15 MONTH + INTERVAL 10 HOUR
FROM
    people;