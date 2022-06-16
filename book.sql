drop database if exists book_shop;
CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
SELECT 
    *
FROM
    books;
SELECT 
    author_fname, author_lname
FROM
    books;
SELECT CONCAT(author_fname, ' ', author_lname);
SELECT CHAR_LENGTH('hello world');
SELECT REPLACE('hello world', 'e', '3');
SELECT REVERSE('woof');
SELECT SUBSTRING('hello world', 1, 7);
SELECT 
    CONCAT(author_lname,
            ' is ',
            CHAR_LENGTH(author_lname),
            ' characters long') AS info
FROM
    books;
SELECT UPPER('hello world');
SELECT LOWER('Hello World');
SELECT 
    CONCAT('MY FAVORITE BOOK IS THE ', UPPER(title)) AS 'favority info'
FROM
    books;
SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES 
('10% Happier','Dan','Harris',2014,29,256),
('fake_book','Freida','Harris',2001,287,428),
('Lincoln In The Bardo','George','Saunders',2017,1000,367);
SELECT 
    *
FROM
    books;
SELECT DISTINCT
    author_lname
FROM
    books;
SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname;
SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
SELECT 
    CONCAT(title, '-', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';
SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity , released_year DESC
LIMIT 3;
SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;
SELECT 
    UPPER(CONCAT('MY FAVORITE AUTHOR IS ',
                    author_fname,
                    ' ',
                    author_lname,
                    '!')) AS yell
FROM
    books
ORDER BY author_lname;
SELECT 
    COUNT(*) AS count
FROM
    books;
SELECT 
    COUNT(DISTINCT author_fname) AS count
FROM
    books;
SELECT 
    author_fname, COUNT(author_fname)
FROM
    books
GROUP BY author_fname;
SELECT 
    COUNT(DISTINCT author_lname)
FROM
    books;
SELECT 
    author_lname, COUNT(author_lname) AS count
FROM
    books
GROUP BY author_lname;
SELECT 
    COUNT(DISTINCT author_lname, author_fname)
FROM
    books;
SELECT 
    COUNT(*)
FROM
    books
WHERE
    title LIKE '%the%';
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS name, COUNT(*)
FROM
    books
GROUP BY name;
SELECT 
    COUNT(*), author_lname
FROM
    books
GROUP BY author_lname;
SELECT 
    COUNT(*), author_lname, author_fname
FROM
    books
GROUP BY author_lname , author_fname;
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year
ORDER BY released_year DESC;
SELECT 
    CONCAT('In ',
            released_year,
            ' ',
            COUNT(*),
            ' book(s) released') AS info
FROM
    books
GROUP BY released_year
ORDER BY released_year;
SELECT 
    MIN(released_year)
FROM
    books;
SELECT 
    MAX(released_year)
FROM
    books;
SELECT 
    MIN(pages)
FROM
    books;
SELECT 
    title
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
SELECT 
    title
FROM
    books
ORDER BY pages DESC
LIMIT 1;
SELECT 
    MIN(released_year),
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
GROUP BY author;
SELECT 
    COUNT(*), CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
GROUP BY author;
SELECT 
    author_fname, author_lname, MIN(released_year)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    author_fname, author_lname, MAX(pages)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    SUM(pages)
FROM
    books;
SELECT 
    author_fname, author_lname, SUM(pages)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    AVG(released_year)
FROM
    books;
SELECT 
    AVG(pages)
FROM
    books;
SELECT 
    released_year, AVG(stock_quantity)
FROM
    books
GROUP BY released_year;
SELECT 
    author_fname, author_lname, AVG(pages)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    COUNT(*)
FROM
    books;
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;
SELECT 
    SUM(stock_quantity)
FROM
    books;
SELECT 
    author_fname, author_lname, AVG(released_year)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS 'full name',
    pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
SELECT 
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year
ORDER BY released_year;


