use testing;
CREATE TABLE items (
    price DECIMAL(5 , 2 )
);
insert into items(price) 
values(7),
(34.88),
(298.9999),
(1.9999);
SELECT 
    *
FROM
    items;
CREATE TABLE prices (
    price FLOAT
);
insert into prices(price)
VALUES (88.45);
SELECT 
    *
FROM
    prices;
insert into prices(price)
VALUES (8877.45);
insert into prices(price)
VALUES (8877665544.45);