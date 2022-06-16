drop database if exists testing;
create database testing;
use testing;
CREATE TABLE dogs (
    name CHAR(5),
    breed VARCHAR(10)
);
insert into dogs(name,breed)
values ('bob','beagle'),
('robby','corgi');
insert into dogs(name,breed) 
VALUEs ('Princ','Retriever');
insert into dogs(name,breed) 
VALUEs ('Princ','Retrieveka');
SELECT 
    *
FROM
    dogs;

