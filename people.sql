USE testing;
CREATE TABLE people(name VARCHAR(100),
birthdate DATE,
birthtime TIME,
birthdt DATETIME);
INSERT INTO people (name,birthdate,birthtime,birthdt)
VALUES ('Padma','1983-11-11','10:07:35','1983-11-11 10:07:35'),
('Larry','1943-12-25','04:10:42','1943-12-25 04:10:42');
SELECT * FROM people;
SELECT name,birthdate FROM people;
SELECT name,day(birthdate) FROM people;
SELECT name,dayname(birthdate) FROM people;
SELECT name,dayofweek(birthdate) FROM people;
SELECT name,dayofyear(birthdate) FROM people;
select name,birthtime,dayofyear(birthdt) from people;
select name,birthtime,month(birthdt) from people;
select name,birthtime,monthname(birthdt) from people;
select name,birthtime,hour(birthdt) from people;
select name,birthtime,minute(birthdt) from people;
select concat(monthname(birthdate),' ',day(birthdate),' ',year(birthdate)) as 'birth day' 
from people;
select date_format(birthdt,'%D-%M-%Y') from people;
select date_format(birthdt,'%m/%d/%Y') from people;
select date_format(birthdt,'%m/%d/%Y at %h:%m') from people;
SELECT * from people;
SELECT name, birthdate,datediff(now(),birthdate) as 'days passed' from people;
select birthdt,date_add(birthdt,interval 1 month) from people;
select birthdt,date_add(birthdt,interval 3 quarter) from people;
select birthdt,birthdt+interval 1 month from people;
select birthdt,birthdt-interval 7 month from people;
select birthdt,birthdt-interval 15 month+interval 10 hour from people;