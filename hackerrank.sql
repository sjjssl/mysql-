SELECT 
    *
FROM
    city
WHERE
    countrycode = 'USA'
        && population > 100000;
SELECT 
    *
FROM
    city
WHERE
    countrycode = 'USA'
        AND population > 100000;

SELECT 
    name
FROM
    city
WHERE
    countrycode = 'USA'
        AND population > 120000;

SELECT DISTINCT
    city
FROM
    station
WHERE
    id % 2 = 0;

SELECT 
    COUNT(city) - COUNT(DISTINCT city)
FROM
    station;

SELECT 
    city, CHAR_LENGTH(city)
FROM
    station
ORDER BY CHAR_LENGTH(city) , city
LIMIT 1;
SELECT 
    city, CHAR_LENGTH(city)
FROM
    station
ORDER BY CHAR_LENGTH(city) DESC , city
LIMIT 1;

(SELECT 
    city, CHAR_LENGTH(city)
FROM
    station
ORDER BY CHAR_LENGTH(city) , city
LIMIT 1) UNION (SELECT 
    city, CHAR_LENGTH(city)
FROM
    station
ORDER BY CHAR_LENGTH(city) DESC , city
LIMIT 1);

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[aeiou]';
SELECT DISTINCT
    city
FROM
    station
WHERE
    city REGEXP '^[aeiou]';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '[aeiou]$';
SELECT DISTINCT
    city
FROM
    station
WHERE
    city REGEXP '[aeiou]$';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[aeiou].*[aeiou]$';
SELECT DISTINCT
    city
FROM
    station
WHERE
    city REGEXP '^[aeiou].*[aeiou]$';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city NOT RLIKE '^[aeiou]';
SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[^aeiou]';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city NOT RLIKE '[aeiou]$';
SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '[^aeiou]$';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[^aeiou]'
        OR city RLIKE '[^aeiou]$';

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[^aeiou]'
        AND city RLIKE '[^aeiou]$';

SELECT 
    name
FROM
    students
WHERE
    marks > 75
ORDER BY RIGHT(name, 3) , id;

SELECT 
    CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM
    occupations
ORDER BY name;

SELECT 
    CONCAT('There are a total of ',
            COUNT(*),
            ' ',
            LOWER(occupation),
            's.')
FROM
    occupations
GROUP BY occupation
ORDER BY COUNT(*) , occupation;

SELECT 
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN
            (SELECT 
                    COUNT(*)
                FROM
                    BST
                WHERE
                    B.N = P) > 0
        THEN
            'Inner'
        ELSE 'Leaf'
    END
FROM
    BST B
ORDER BY B.N;



