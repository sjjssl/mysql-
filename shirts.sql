drop database if exists shirts_db ;
create database shirts_db;
use shirts_db;
CREATE TABLE shirts (
    shirt_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(255),
    color VARCHAR(255),
    shirt_size VARCHAR(255),
    last_worn INT
);
insert into shirts (article,color,shirt_size,last_worn)
values ('t-shirt', 'white', 'S', 10),
  ('t-shirt', 'green', 'S', 200),
  ('polo shirt', 'black', 'M', 10),
  ('tank top', 'blue', 'S', 50),
  ('t-shirt', 'pink', 'S', 0),
  ('polo shirt', 'red', 'M', 5),
  ('tank top', 'white', 'S', 200),
  ('tank top', 'blue', 'M', 15);
SELECT 
    *
FROM
    shirts;
  insert into shirts(color,shirt_size,article,last_worn) 
  values('purple','M','polo shirt',50);
SELECT 
    *
FROM
    shirts;
SELECT 
    article, color
FROM
    shirts;
SELECT 
    article, color, shirt_size, last_worn
FROM
    shirts
WHERE
    shirt_size = 'M';
UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';
SELECT 
    *
FROM
    shirts;
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;
UPDATE shirts 
SET 
    shirt_size = 'XS',
    color = 'off white'
WHERE
    color = 'white';
DELETE FROM shirts 
WHERE
    last_worn = 200;
DELETE FROM shirts 
WHERE
    article = 'tank top';
DELETE FROM shirts;
  drop table shirts;
  drop database shirts_db;