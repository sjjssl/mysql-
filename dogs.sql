drop database if exists testing;
create database testing;
use testing;
create table dogs (name char(5),
                   breed varchar(10));
insert into dogs(name,breed)
values ('bob','beagle'),
('robby','corgi');
insert into dogs(name,breed) 
VALUEs ('Princ','Retriever');
insert into dogs(name,breed) 
VALUEs ('Princ','Retrieveka');
select * from dogs;

