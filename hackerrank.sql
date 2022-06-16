#Query all columns for all American cities in the CITY table with populations larger than 100000. 
#The CountryCode for America is USA.

SELECT * FROM city WHERE countrycode="USA" && population>100000;
SELECT * FROM city WHERE countrycode="USA" AND population>100000;

#Query the NAME field for all American cities in the CITY table with populations larger than 120000. 

SELECT name FROM city WHERE countrycode='USA' And population>120000;

#Query a list of CITY names from STATION for cities that have an even ID number.
#Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT city FROM station WHERE id%2=0;

#Find the difference between the total number of CITY entries in the table 
#and the number of distinct CITY entries in the table.

SELECT COUNT(city)-COUNT(DISTINCT city) FROM station;

#Query the two cities in STATION with the shortest and longest CITY names,
#as well as their respective lengths (i.e.: number of characters in the name). 
#If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
#method 1

SELECT city, char_length(city) FROM station ORDER BY char_length(city),city LIMIT 1;
SELECT city, char_length(city) FROM station ORDER BY char_length(city) DESC,city LIMIT 1;

#method2

(select city,char_length(city) from station order by char_length(city),city limit 1)
union
(select city,char_length(city) from station order by char_length(city) desc,city  limit 1);

#Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
#Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city RLIKE '^[aeiou]';
SELECT DISTINCT city FROM station WHERE city REGEXP '^[aeiou]';

#Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
#Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city RLIKE '[aeiou]$';
SELECT DISTINCT city FROM station WHERE city REGEXP '[aeiou]$';

#Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
#Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city RLIKE '^[aeiou].*[aeiou]$';
SELECT DISTINCT city FROM station WHERE city REGEXP '^[aeiou].*[aeiou]$';

#Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city NOT RLIKE '^[aeiou]';
SELECT DISTINCT city FROM station WHERE city  RLIKE '^[^aeiou]';

#Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city NOT RLIKE '[aeiou]$';
SELECT DISTINCT city FROM station WHERE city RLIKE '[^aeiou]$';

#Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
#Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city RLIKE '^[^aeiou]' or city RLIKE '[^aeiou]$';

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
# Your result cannot contain duplicates.

SELECT DISTINCT city FROM station WHERE city RLIKE '^[^aeiou]' AND city RLIKE '[^aeiou]$';

#Query the Name of any student in STUDENTS who scored higher than  Marks. 
#Order your output by the last three characters of each name. 
#If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
#secondary sort them by ascending ID.
SELECT name FROM students WHERE marks>75 ORDER BY right(name,3),id;

#Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession 
#as a parenthetical (i.e.: enclosed in parentheses).

SELECT concat(name,'(',left(occupation,1),')') FROM occupations ORDER BY name;

#Query the number of ocurrences of each occupation in OCCUPATIONS. 
#Sort the occurrences in ascending order, and output them in the following format:
#There are a total of [occupation_count] [occupation]s.
#where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
#If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

SELECT concat('There are a total of ', count(*),' ',lower(occupation),'s.') 
FROM occupations GROUP BY occupation ORDER BY count(*),occupation;

#You are given a table, BST, 
#containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
#Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

#Root: If node is root node.
#Leaf: If node is leaf node.
#Inner: If node is neither root nor leaf node.

SELECT N, CASE
             WHEN P IS NULL THEN 'Root'
             WHEN (SELECT count(*) FROM BST WHERE B.N=P)>0 THEN 'Inner'
             ELSE 'Leaf'
           END
FROM BST B ORDER BY B.N;



