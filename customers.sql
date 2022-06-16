drop database if EXISTS customers;
create database customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(15)
);
insert into customers(customer_name)
VALUES ('Daniel'),
       ('Diana'),
       ('Elizabeth'),
       ('Jhon');
insert into orders(order_id,customer_id,product_name)
values ('10',1,'A'),
	   ('20',1,'B'),
       ('30',1,'D'),
       ('40',1,'C'),
       ('50',2,'A'),
       ('60',3,'A'),
       ('70',3,'B'),
       ('80',3,'D'),
       ('90',4,'C');
SELECT 
    customer_id, customer_name
FROM
    customers
WHERE
    customer_id IN (SELECT DISTINCT
            customer_id
        FROM
            orders
        WHERE
            customer_id IN (SELECT DISTINCT
                    customer_id
                FROM
                    orders
                WHERE
                    product_name = 'A')
                AND customer_id IN (SELECT DISTINCT
                    customer_id
                FROM
                    orders
                WHERE
                    product_name = 'B')
                AND customer_id NOT IN (SELECT DISTINCT
                    customer_id
                FROM
                    orders
                WHERE
                    product_name = 'C'));
SELECT 
    customer_id, customer_name
FROM
    orders o
        JOIN
    customers c USING (customer_id)
WHERE
    customer_id NOT IN (SELECT DISTINCT
            customer_id
        FROM
            orders
        WHERE
            product_name = 'C')
        AND customer_id IN (SELECT DISTINCT
            customer_id
        FROM
            orders
        WHERE
            product_name = 'A')
        AND customer_id IN (SELECT DISTINCT
            customer_id
        FROM
            orders
        WHERE
            product_name = 'B')
GROUP BY customer_id
HAVING COUNT(*) >= 2;
with t as 
(SELECT customer_id, 
	max('C'=product_name) c, 
	max('B'=product_name) b,
	max('A'=product_name) a
from  Orders GROUP BY customer_id)
SELECT cu.*
from Customers cu INNER JOIN t on 
	cu.customer_id=t.customer_id and 
	t.c=0 and t.a=1 and t.b=1;
SELECT 
    *
FROM
    orders;
SELECT 
    *
FROM
    customers;

SELECT 
    s.customer_id, s.customer_name
FROM
    (SELECT 
        c.customer_name,
            c.customer_id,
            (SELECT 
                    COUNT(1)
                FROM
                    orders o2
                WHERE
                    o2.customer_id = c.customer_id
                        AND product_name = 'c') AS prod_c_cnt
    FROM
        customers c, orders o
    WHERE
        c.customer_id = o.customer_id
            AND product_name IN ('A' , 'B')
    GROUP BY c.customer_name , c.customer_id
    HAVING MAX(o.product_name) <> MIN(o.product_name)) AS s
WHERE
    s.prod_c_cnt = 0;



