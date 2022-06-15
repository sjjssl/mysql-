use book_shop;
SELECT title,released_year from books where released_year!=2017;
SELECT title,author_lname from books where title not like '%w%';
select * from books where released_year >2000;
select title,stock_quantity from books where stock_quantity>=100;
select 99<>1;
select 'a'>'b';
select 'A'>'a';
select 'A'>='a';
select title,released_year from books where released_year<2000 order by released_year;
select title,author_lname,released_year from books where
author_lname='eggers' and released_year>2010;
select title,author_lname,released_year from books where
author_lname='eggers' && released_year>2010 && title like '%novel%';
select title,author_lname,released_year,stock_quantity from books where
author_lname='eggers' || released_year>2010 or stock_quantity>100;
select title,released_year from books where released_year between 2004 and 2010;
select title,released_year from books where released_year not between 2004 and 2015;
select cast('2017-05-02' as datetime);
select name,birthdt from people where birthdt 
between cast('1980-01-01' as datetime) and cast('2000-01-01' as datetime);
select title,author_lname from books where author_lname in ('Carver','Lahiri','Smith');
select title,released_year from books where released_year>2000 && 
released_year not in (2000,2002,2004,2006,2008,2010,2012,2014,2016) order by released_year;
SELECT title,released_year from books where released_year>2000 && released_year%2!=0
ORDER BY released_year;
select title,released_year,
       case
         when released_year>=2000 then 'Modern Lit'
		else '20th Century Lit'
       end as GENRE
from books;
select title,stock_quantity,
       case
         when stock_quantity<50 then '*'
         when stock_quantity BETWEEN 50 and 100 then '**'
         when stock_quantity BETWEEN 101 and 200 then '***'
         else '****'
	   end as STOCK
   from books;
   select * from books where released_year<1980;
   select * from books where author_lname='eggers' || author_lname='chabon';
   select * from books where author_lname in ('eggers','chabon');
   select * from books where released_year>2000 and author_lname='Lahiri';
   select * from books where pages BETWEEN 100 and 200;
   select * from books where author_lname like 'C%' or author_lname like 'S%';
   select * from books where author_lname rlike '^[CS]';
   select * from books where substring(author_lname,1,1) in ('C','S');
   select title, author_lname,
		case
			when title like '%stories%' then 'Short Stories'
            when title='Just Kids' or title like 'A Heartbreaking Work%' then 'Memoir'
            else 'Novel'
		end as TYPE
from books;
select title, author_lname, 
    case 
        when count(*)>1 then concat(count(*),' books')
        else concat(count(*),' book')
	end as COUNT
from books GROUP BY author_lname,author_fname order by author_lname;
