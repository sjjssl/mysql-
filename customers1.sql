use testing;
CREATE TABLE customers1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers1 (id)
);
INSERT INTO customers1 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders1 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
SELECT 
    *
FROM
    orders1;
SELECT 
    *
FROM
    orders1
WHERE
    customer_id = (SELECT 
            id
        FROM
            customers1
        WHERE
            last_name = 'George');
SELECT 
    *
FROM
    orders1 o,
    customers1 c
WHERE
    o.customer_id = c.id;
SELECT 
    *
FROM
    customers1 c
        INNER JOIN
    orders1 o ON c.id = o.customer_id;
CREATE TABLE test (
    A INT DEFAULT NULL,
    B INT DEFAULT NULL
);
insert into test (A,B)
values (3,4),
(3,null),
(3,null),
(4,2),
(null,2),
(1,3),
(null,3);
SELECT 
    *
FROM
    test
GROUP BY A , B;
SELECT 
    c.first_name, c.last_name, SUM(amount) AS total
FROM
    customers1 c
        JOIN
    orders1 o ON c.id = o.customer_id
GROUP BY o.customer_id
ORDER BY total DESC;
SELECT 
    c.first_name, c.last_name, IFNULL(SUM(o.amount), 0) AS total
FROM
    customers1 c
        LEFT JOIN
    orders1 o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total DESC;
SELECT 
    *
FROM
    customers1 c
        RIGHT JOIN
    orders1 o ON c.id = o.customer_id; 
# on delete cascade
drop table customers1,orders1;
CREATE TABLE customers1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers1 (id)
        ON DELETE CASCADE
);
INSERT INTO customers1 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders1 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
SELECT 
    *
FROM
    orders1;
DELETE FROM customers1 
WHERE
    email = 'george@gmail.com';
SELECT 
    *
FROM
    orders1;




