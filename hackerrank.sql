#Query all columns for all American cities in the CITY table with populations larger than 100000. 
#The CountryCode for America is USA.

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

#Query the NAME field for all American cities in the CITY table with populations larger than 120000. 

SELECT 
    name
FROM
    city
WHERE
    countrycode = 'USA'
        AND population > 120000;

#Query a list of CITY names from STATION for cities that have an even ID number.
#Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT
    city
FROM
    station
WHERE
    id % 2 = 0;

#Find the difference between the total number of CITY entries in the table 
#and the number of distinct CITY entries in the table.

SELECT 
    COUNT(city) - COUNT(DISTINCT city)
FROM
    station;

#Query the two cities in STATION with the shortest and longest CITY names,
#as well as their respective lengths (i.e.: number of characters in the name). 
#If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
#method 1

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

#method2

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

#Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
#Your result cannot contain duplicates.

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

#Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
#Your result cannot contain duplicates.

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

#Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
#Your result cannot contain duplicates.

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

#Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

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

#Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

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

#Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
#Your result cannot contain duplicates.

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[^aeiou]'
        OR city RLIKE '[^aeiou]$';

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
# Your result cannot contain duplicates.

SELECT DISTINCT
    city
FROM
    station
WHERE
    city RLIKE '^[^aeiou]'
        AND city RLIKE '[^aeiou]$';

#Query the Name of any student in STUDENTS who scored higher than  Marks. 
#Order your output by the last three characters of each name. 
#If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
#secondary sort them by ascending ID.
SELECT 
    name
FROM
    students
WHERE
    marks > 75
ORDER BY RIGHT(name, 3) , id;

#Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession 
#as a parenthetical (i.e.: enclosed in parentheses).

SELECT 
    CONCAT(name, '(', LEFT(occupation, 1), ')')
FROM
    occupations
ORDER BY name;

#Query the number of ocurrences of each occupation in OCCUPATIONS. 
#Sort the occurrences in ascending order, and output them in the following format:
#There are a total of [occupation_count] [occupation]s.
#where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
#If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

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

#You are given a table, BST, 
#containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
#Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

#Root: If node is root node.
#Leaf: If node is leaf node.
#Inner: If node is neither root nor leaf node.

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
#Consider (a,c) and (b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) 
#and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
#Query the Euclidean Distance between points (a,c) and (b,d)  and format your answer to display 4 decimal digits.
SELECT 
    ROUND(SQRT(POWER(MAX(lat_n) - MIN(lat_n), 2) + POWER(MAX(long_w) - MIN(long_w), 2)),
            4)
FROM
    station;
#A median is defined as a number separating the higher half of a data set from the lower half. 
#Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
SET @row_index := -1;

SELECT 
    ROUND(AVG(subq.lat_n), 4) AS median_value
FROM
    (SELECT 
        @row_index:=@row_index + 1 AS row_index, lat_n
    FROM
        station
    ORDER BY lat_n) AS subq
WHERE
    subq.row_index IN (FLOOR(@row_index / 2) , CEIL(@row_index / 2));
#Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT 
    city.name
FROM
    city
        JOIN
    country ON country.code = city.countrycode
WHERE
    continent = 'Africa';
#Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations
SELECT 
    continent, FLOOR(AVG(c.population))
FROM
    city c
        JOIN
    country co ON c.countrycode = co.code
GROUP BY continent;
#P(R) represents a pattern drawn by Julia in R rows. Write a query to print the pattern P(20).
set @number = 21;
SELECT 
    REPEAT('* ', @number:=@number - 1)
FROM
    information_schema.tables
LIMIT 20;

#P(R) represents a pattern drawn by Julia in R rows. Write a query to print the pattern P(20).

set @num =0;
SELECT 
    REPEAT('* ', @num:=@num + 1)
FROM
    information_schema.tables
LIMIT 20;

#Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
#Output one of the following statements for each record in the table:
#Equilateral: It's a triangle with  sides of equal length.
#Isosceles: It's a triangle with  sides of equal length.
#Scalene: It's a triangle with  sides of differing lengths.
#Not A Triangle: The given values of A, B, and C don't form a triangle.
SELECT 
    CASE
        WHEN t.A = t.B AND t.B = t.C THEN 'Equilateral'
        WHEN
            t.A + t.B <= t.C OR t.A + t.C <= t.B
                OR t.B + t.C <= t.A
        THEN
            'Not A Triangle'
        WHEN t.A != t.B AND t.B != t.C AND t.A != t.C THEN 'Scalene'
        ELSE 'Isosceles'
    END
FROM
    triangles t;

# Query a count of the number of cities in CITY having a Population larger than.
SELECT 
    COUNT(*)
FROM
    city
WHERE
    population > 100000;
#Query the total population of all cities in CITY where District is California.
SELECT 
    SUM(population)
FROM
    city
WHERE
    district = 'California';
#Query the average population of all cities in CITY where District is California.
SELECT 
    AVG(population)
FROM
    city
WHERE
    district = 'California';
#Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT 
    FLOOR(AVG(population))
FROM
    city;
#Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT 
    SUM(population)
FROM
    city
WHERE
    countrycode = 'JPN';
#Query the difference between the maximum and minimum populations in CITY.
SELECT 
    MAX(population) - MIN(population)
FROM
    city;
#Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
#but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference 
#between her miscalculation (using salaries with any zeros removed), and the actual average salary.
#Write a query calculating the amount of error, and round it up to the next integer.
SELECT 
    CEIL(AVG(salary) - AVG(REPLACE(salary, 0, '')))
FROM
    employees;
#We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings 
#for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of 
#employees who have maximum total earnings. Then print these values as 2 space-separated integers.
SELECT 
    salary * months, COUNT(*)
FROM
    employee
GROUP BY salary * months DESC
LIMIT 1;
#Query the following two values from the STATION table:The sum of all values in LAT_N rounded to a scale of  decimal places.
#The sum of all values in LONG_W rounded to a scale of  decimal places.
SELECT 
    ROUND(SUM(lat_n), 2), ROUND(SUM(long_w), 2)
FROM
    station;
#Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
#Truncate your answer to  4 decimal places.
SELECT 
    ROUND(SUM(lat_n), 4)
FROM
    station
WHERE
    lat_n > 38.7880 AND lat_n < 137.2345;
#Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
SELECT 
    ROUND(MAX(lat_n), 4)
FROM
    station
WHERE
    lat_n < 137.2345;
#Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
#Round your answer to 4 decimal places.
SELECT 
    ROUND(long_w, 4)
FROM
    station
WHERE
    lat_n = (SELECT 
            MAX(lat_n)
        FROM
            station
        WHERE
            lat_n < 137.2345);
#Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880. Round your answer to 4 decimal places.
SELECT 
    ROUND(MIN(lat_n), 4)
FROM
    station
WHERE
    lat_n > 38.7780;
#Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880. 
#Round your answer to 4 decimal places.
SELECT 
    ROUND(long_w, 4)
FROM
    station
WHERE
    lat_n = (SELECT 
            MIN(lat_n)
        FROM
            station
        WHERE
            lat_n > 38.7880);
#Consider (a,b) and (c,d) to be two points on a 2D plane. a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
#b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
#c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
#d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
#Query the Manhattan Distance between points and round it to a scale of  decimal places.
SELECT 
    ROUND(MAX(lat_n) - MIN(lat_n) + MAX(long_w) - MIN(long_w),
            4)
FROM
    station;
#Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT 
    SUM(city.population)
FROM
    city
        JOIN
    country ON city.countrycode = country.code
WHERE
    continent = 'Asia';
#You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
#Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
#Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
SELECT 
    s.name
FROM
    students s
        JOIN
    friends f USING (id)
        JOIN
    packages s1 ON s.id = s1.id
        JOIN
    packages s2 ON s2.id = f.friend_id
WHERE
    s2.salary > s1.salary
ORDER BY s2.salary;
#You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
#Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
#Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
#The report must be in descending order by grade -- i.e. higher grades are entered first. 
#If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
#Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
SELECT 
    IF(grade >= 8, s.name, NULL), s.grade, s.marks
FROM
    (SELECT 
        name,
            CASE
                WHEN marks >= 90 THEN 10
                WHEN marks >= 80 THEN 9
                WHEN marks >= 70 THEN 8
                WHEN marks >= 60 THEN 7
                WHEN marks >= 50 THEN 6
                WHEN marks >= 40 THEN 5
                WHEN marks >= 30 THEN 4
                WHEN marks >= 20 THEN 3
                WHEN marks >= 10 THEN 2
                ELSE 1
            END AS grade,
            marks
    FROM
        students) AS s
ORDER BY grade DESC , name;

#Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand. 
#Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high 
#power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, 
#sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
SELECT id, age, coins_needed,power 
FROM
(SELECT id,age,coins_needed,power,ROW_NUMBER() OVER(PARTITION BY power,age ORDER BY coins_needed) AS rn 
FROM wands w JOIN wands_property wp USING(code) WHERE is_evil=0)
WHERE rn=1 
ORDER BY power DESC,age DESC;
