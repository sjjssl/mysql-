USE testing;
CREATE TABLE comments(content VARCHAR(100),
created_at TIMESTAMP DEFAULT NOW());

insert into comments(content)
VALUES('lol what a funny article'),
('I found this offensive');
insert into comments(content)
VALUES('what a sunny day');
SELECT * FROM comments;
create table comments2 (content VARCHAR(100),
changed_at TIMESTAMP DEFAULT now() on update CURRENT_TIMESTAMP);
insert into comments2(content)
VALUES('lol aloha'),
('hahahha');
SELECT * FROM comments2;
insert into comments2(content)
VALUES('I love cats');
UPDATE comments2 set content='This is not gibberish' where content='hahahha';
SELECT * FROM comments2 ORDER BY changed_at;
SELECT curtime();
SELECT curdate();
select dayofweek(now());
select date_format(now(),'%w')+1;
select dayname(now());
select date_format(now(),'%W');
SELECT concat(month(now()),'/',day(now()),'/',year(now()));
SELECT date_format(now(),'%m/%d/%Y');
SELECT concat(date_format(now(),'%M %D'),' at ',date_format(now(),'%k:%i'));
create table tweets(content VARCHAR(255),
username varchar(20),
created_at TIMESTAMP DEFAULT now());
insert into tweets(content,username)
values('this is my first tweet','coltcat');
select * from tweets;
insert into tweets(content,username)
values('this is my second tweet','coltcat');