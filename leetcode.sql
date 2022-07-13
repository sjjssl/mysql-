#595. Big Countries
SELECT 
    name, population, area
FROM
    world
WHERE
    area >= 3000000
        OR population >= 25000000;
        
#1757. Recyclable and Low Fat Products
SELECT 
    product_id
FROM
    Products
WHERE
    low_fats = 'Y' AND recyclable = 'Y';
    
#584. Find Customer Referee
SELECT 
    name
FROM
    customer
WHERE
    referee_id != 2 OR referee_id IS NULL;
    
#183. Customers Who Never Order
SELECT 
    c.name AS Customers
FROM
    customers c
        LEFT JOIN
    orders o ON c.id = o.customerId
WHERE
    o.id IS NULL;
    
#1873. Calculate Special Bonus
SELECT 
    employee_id,
    IF(employee_id % 2 = 1
            AND name NOT LIKE 'M%',
        salary,
        0) AS bonus
FROM
    employees
ORDER BY employee_id;

#627. Swap Salary
UPDATE salary 
SET 
    sex = IF(sex = 'm', 'f', 'm');
    
#196. Delete Duplicate Emails
DELETE n1 FROM person n1,
    person n2 
WHERE
    n1.id > n2.id AND n1.email = n2.email;
#1667. Fix Names in a Table
SELECT 
    user_id,
    CONCAT(UPPER(SUBSTR(name, 1, 1)),
            LOWER(SUBSTR(name, 2))) AS name
FROM
    users
ORDER BY user_id;

#1527. Patients With a Condition
#method1
SELECT 
    *
FROM
    PATIENTS
WHERE
    conditions REGEXP '\bDIAB1.*\b';
#method2
SELECT * FROM PATIENTS
WHERE conditions REGEXP '(^DIAB1| DIAB1)';
#method3
SELECT * FROM PATIENTS
WHERE CONDITIONS rlike '^DIAB1|\\sDIAB1';
#1484. Group Sold Products By The Date
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product
        ORDER BY product) AS products
FROM
    activities
GROUP BY sell_date;