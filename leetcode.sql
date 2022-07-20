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
SELECT * FROM PATIENTS
WHERE conditions REGEXP '(^DIAB1| DIAB1)';
#method2
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

#1965. Employees With Missing Information

(SELECT 
    employee_id
FROM
    employees e
        LEFT JOIN
    salaries s USING (employee_id)
WHERE
    salary IS NULL) UNION (SELECT 
    employee_id
FROM
    employees e
        RIGHT JOIN
    salaries s USING (employee_id)
WHERE
    name IS NULL) ORDER BY employee_id;
    
    
#1795. Rearrange Products Table
(SELECT 
    product_id, 'store1' store, store1 price
FROM
    products
WHERE
    store1 IS NOT NULL) UNION ALL (SELECT 
    product_id, 'store2' store, store2 price
FROM
    products
WHERE
    store2 IS NOT NULL) UNION ALL (SELECT 
    product_id, 'store3' store, store3 price
FROM
    products
WHERE
    store3 IS NOT NULL)
;

#608. Tree Node
SELECT 
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN
            t1.id IN (SELECT 
                    p_id
                FROM
                    tree)
        THEN
            'Inner'
        ELSE 'Leaf'
    END AS type
FROM
    tree t1
ORDER BY id;

#176. Second Highest Salary
SELECT 
    MAX(salary) AS 'SecondHighestSalary'
FROM
    employee
WHERE
    salary < (SELECT 
            MAX(salary)
        FROM
            employee);
            
#197. Rising Temperature
SELECT 
    w2.id
FROM
    weather w1
        JOIN
    weather w2 ON w1.recordDate = SUBDATE(w2.recordDate, 1)
WHERE
    w1.temperature < w2.temperature;
    
#607. Sales Person
SELECT 
    name
FROM
    salesPerson
WHERE
    sales_id NOT IN (SELECT 
            sales_id
        FROM
            orders o
                LEFT JOIN
            company c USING (com_id)
        WHERE
            c.name = 'RED');
#1141. User Activity for the Past 30 Days I
SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    activity
WHERE
    activity_date > SUBDATE('2019-07-27', 30)
        AND activity_date <= '2019-07-27'
GROUP BY activity_date
HAVING COUNT(DISTINCT user_id) > 0;
#1693. Daily Leads and Partners
SELECT 
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM
    dailysales
GROUP BY date_id , make_name;
#1729. Find Followers Count
SELECT 
    user_id, COUNT(follower_id) AS followers_count
FROM
    followers
GROUP BY user_id
ORDER BY user_id;
#596. Classes More Than 5 Students
SELECT 
    class
FROM
    courses
GROUP BY class
HAVING (COUNT(DISTINCT student)) >= 5;
#620. Not Boring Movies
SELECT 
    id, movie, description, rating
FROM
    cinema
WHERE
    id % 2 = 1 AND description <> 'boring'
ORDER BY rating DESC;
#586. Customer Placing the Largest Number of Orders
SELECT 
    customer_number
FROM
    orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

#511. Game Play Analysis I
SELECT 
    player_id, MIN(event_date) AS first_login
FROM
    activity
GROUP BY player_id;

#1890. The Latest Login in 2020
SELECT 
    user_id, MAX(time_stamp) AS last_stamp
FROM
    logins
WHERE
    SUBSTR(time_stamp, 1, 4) = '2020'
GROUP BY user_id;
#1741. Find Total Time Spent by Each Employee
SELECT 
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM
    employees
GROUP BY event_day , emp_id;
#1393. Capital Gain/Loss
SELECT 
    stock_name, SUM(price) AS capital_gain_loss
FROM
    (SELECT 
        stock_name,
            CASE
                WHEN operation = 'Buy' THEN - 1 * price
                WHEN operation = 'Sell' THEN price
            END AS price
    FROM
        stocks) AS t
GROUP BY stock_name;

SELECT 
    stock_name,
    SUM(IF(operation = 'Buy',
        - 1 * price,
        price)) AS capital_gain_loss
FROM
    stocks
GROUP BY stock_name;

#1407. Top Travellers
SELECT 
    u.name, IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM
    users u
        LEFT JOIN
    rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY travelled_distance DESC , u.name;
#182. Duplicate Emails
SELECT 
    email
FROM
    person
GROUP BY email
HAVING COUNT(*) > 1;

#1050. Actors and Directors Who Cooperated At Least Three Times
SELECT 
    actor_id, director_id
FROM
    actordirector
GROUP BY actor_id , director_id
HAVING COUNT(*) >= 3;

#1587. Bank Account Summary II
SELECT 
    name, SUM(amount) AS balance
FROM
    users u
        JOIN
    transactions t USING (account)
GROUP BY account
HAVING balance > 10000;

#1084. Sales Analysis III
SELECT DISTINCT
    product_id, product_name
FROM
    product p
        JOIN
    sales s USING (product_id)
WHERE
    sale_date BETWEEN '2019-01-01' AND '2019-03-31'
        AND product_id NOT IN (SELECT 
            product_id
        FROM
            sales
        WHERE
            sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');
            
#1158. Market Analysis I
WITH t AS
(SELECT 
    order_id, order_date, buyer_id
FROM
    orders
WHERE
    YEAR(order_date) = '2019')
SELECT 
    user_id AS buyer_id,
    join_date,
    SUM(status1) AS orders_in_2019
FROM
    (SELECT 
        user_id, join_date, IF(order_id IS NULL, 0, 1) AS status1
    FROM
        users u
    LEFT JOIN t ON u.user_id = t.buyer_id) AS d
GROUP BY user_id;


#1083. Sales Analysis II
SELECT 
    s.buyer_id
FROM
    sales s
        JOIN
    product p USING (product_id)
WHERE
    p.product_name = 'S8'
        AND s.buyer_id NOT IN (SELECT 
            s1.buyer_id
        FROM
            sales s1
                JOIN
            product p1 USING (product_id)
        WHERE
            p1.product_name = 'iPhone');
            
#1179. Reformat Department Table
SELECT 
    id,
    SUM(IF(month = 'Jan', revenue, NULL)) AS 'Jan_Revenue',
    SUM(IF(month = 'Feb', revenue, NULL)) AS 'Feb_Revenue',
    SUM(IF(month = 'Mar', revenue, NULL)) AS 'Mar_Revenue',
    SUM(IF(month = 'Apr', revenue, NULL)) AS 'Apr_Revenue',
    SUM(IF(month = 'May', revenue, NULL)) AS 'May_Revenue',
    SUM(IF(month = 'Jun', revenue, NULL)) AS 'Jun_Revenue',
    SUM(IF(month = 'Jul', revenue, NULL)) AS 'Jul_Revenue',
    SUM(IF(month = 'Aug', revenue, NULL)) AS 'Aug_Revenue',
    SUM(IF(month = 'Sep', revenue, NULL)) AS 'Sep_Revenue',
    SUM(IF(month = 'Oct', revenue, NULL)) AS 'Oct_Revenue',
    SUM(IF(month = 'Nov', revenue, NULL)) AS 'Nov_Revenue',
    SUM(IF(month = 'Dec', revenue, NULL)) AS 'Dec_Revenue'
FROM
    department
GROUP BY id;
#626. Exchange Seats
SELECT 
    IF(id < (SELECT 
                MAX(id)
            FROM
                seat),
        IF(id % 2 = 0, id - 1, id + 1),
        IF(id % 2 = 1, id, id - 1)) AS id,
    student
FROM
    seat
ORDER BY id;