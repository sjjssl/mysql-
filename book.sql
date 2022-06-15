drop database if exists book_shop;
CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
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
select * from books;
select author_fname,author_lname from books;
select concat(author_fname,' ',author_lname);
select char_length('hello world');
select replace('hello world','e','3');
select reverse('woof');
select substring('hello world',1,7);
select concat(author_lname,' is ',char_length(author_lname),' characters long') as info from books;
select upper('hello world');
select lower('Hello World');
select concat('MY FAVORITE BOOK IS THE ',UPPER(title)) as 'favority info' from books;
select concat(substring(title,1,10),'...') as 'short title', 
concat(author_lname,',',author_fname) as author,
concat(stock_quantity,' in stock') as quantity from books;
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES 
('10% Happier','Dan','Harris',2014,29,256),
('fake_book','Freida','Harris',2001,287,428),
('Lincoln In The Bardo','George','Saunders',2017,1000,367);
select * from books;
select distinct author_lname from books;
select title,author_lname from books order by author_lname;
select title from books where title like '%stories%';
select title,pages from books order by pages desc limit 1;
select concat(title,'-',released_year) as summary from books order by released_year desc limit 3;
select title, author_lname from books where author_lname like '% %';
select title,released_year,stock_quantity from books 
order by stock_quantity,released_year desc limit 3;
select title,author_lname from books order by author_lname,title;
select upper(concat('MY FAVORITE AUTHOR IS ',author_fname,' ',author_lname,'!')) as yell 
from books order by author_lname;
select count(*) as count from books;
select count(distinct author_fname) as count from books;
select author_fname, count( author_fname) from books 
group by author_fname;
select count(distinct author_lname) from books;
select author_lname,count(author_lname) as count 
from books group by author_lname;
select count(distinct author_lname,author_fname) from books;
select count(*) from books where title like '%the%';
select concat(author_fname,' ',author_lname) as name,count(*) 
from books group by name;
select count(*),author_lname from books group by author_lname;
select count(*),author_lname,author_fname 
from books 
group by author_lname,author_fname;
select released_year,count(*) 
from books 
group by released_year 
order by released_year desc;
select concat('In ', released_year, ' ',Count(*),' book(s) released') as info 
from books 
group by released_year order by released_year;
select min(released_year) from books;
select max(released_year) from books;
select min(pages) from books;
select title from books where pages=(select max(pages) from books);
select title from books order by pages desc limit 1;
select min(released_year), concat(author_fname,' ',author_lname) as author from books group by author;
select count(*), concat(author_fname,' ',author_lname) as author 
from books 
group by author;
select author_fname,author_lname,min(released_year) 
from books 
group by author_fname,author_lname;
select author_fname,author_lname,max(pages) 
from books 
group by author_fname,author_lname;
select sum(pages) from books;
select  author_fname,author_lname,sum(pages) from books 
group by author_fname,author_lname;
select avg(released_year) from books;
select avg(pages) from books;
select released_year,avg(stock_quantity) from books 
group by released_year;
select author_fname,author_lname,avg(pages) from books 
group by author_fname,author_lname;
select count(*) from books;
select released_year,count(*) from books group by released_year;
select sum(stock_quantity) from books;
select author_fname,author_lname, avg(released_year) from books 
group by author_fname,author_lname;
select concat(author_fname,' ',author_lname) as 'full name',pages from books 
order by pages desc limit 1;
select released_year as year, count(*) as '# books', avg(pages) as 'avg pages' from books
group by released_year order by released_year;


