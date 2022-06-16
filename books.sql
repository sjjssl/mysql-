use book_shop;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year != 2017;
SELECT 
    title, author_lname
FROM
    books
WHERE
    title NOT LIKE '%w%';
SELECT 
    *
FROM
    books
WHERE
    released_year > 2000;
SELECT 
    title, stock_quantity
FROM
    books
WHERE
    stock_quantity >= 100;
SELECT 99 <> 1;
SELECT 'a' > 'b';
SELECT 'A' > 'a';
SELECT 'A' >= 'a';
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 2000
ORDER BY released_year;
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'eggers'
        AND released_year > 2010;
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'eggers'
        && released_year > 2010
        && title LIKE '%novel%';
SELECT 
    title, author_lname, released_year, stock_quantity
FROM
    books
WHERE
    author_lname = 'eggers'
        || released_year > 2010
        OR stock_quantity > 100;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year BETWEEN 2004 AND 2010;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year NOT BETWEEN 2004 AND 2015;
SELECT CAST('2017-05-02' AS DATETIME);
SELECT 
    name, birthdt
FROM
    people
WHERE
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname IN ('Carver' , 'Lahiri', 'Smith');
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year > 2000
        && released_year NOT IN (2000 , 2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016)
ORDER BY released_year;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year > 2000
        && released_year % 2 != 0
ORDER BY released_year;
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM
    books;
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity < 50 THEN '*'
        WHEN stock_quantity BETWEEN 50 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 200 THEN '***'
        ELSE '****'
    END AS STOCK
FROM
    books;
SELECT 
    *
FROM
    books
WHERE
    released_year < 1980;
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'eggers'
        || author_lname = 'chabon';
SELECT 
    *
FROM
    books
WHERE
    author_lname IN ('eggers' , 'chabon');
SELECT 
    *
FROM
    books
WHERE
    released_year > 2000
        AND author_lname = 'Lahiri';
SELECT 
    *
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;
SELECT 
    *
FROM
    books
WHERE
    author_lname LIKE 'C%'
        OR author_lname LIKE 'S%';
SELECT 
    *
FROM
    books
WHERE
    author_lname RLIKE '^[CS]';
SELECT 
    *
FROM
    books
WHERE
    SUBSTRING(author_lname, 1, 1) IN ('C' , 'S');
SELECT 
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN
            title = 'Just Kids'
                OR title LIKE 'A Heartbreaking Work%'
        THEN
            'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM
    books;
SELECT 
    title,
    author_lname,
    CASE
        WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), ' books')
        ELSE CONCAT(COUNT(*), ' book')
    END AS COUNT
FROM
    books
GROUP BY author_lname , author_fname
ORDER BY author_lname;
