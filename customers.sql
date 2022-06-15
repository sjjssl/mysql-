drop database if EXISTS customers;
create database customers;
create table customers(customer_id int PRIMARY key AUTO_INCREMENT,
customer_name varchar(50));
CREATE TABLE orders(order_id int PRIMARY key,
customer_id int, product_name varchar(15));
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
select customer_id,customer_name from
customers where customer_id in
(select distinct customer_id
from orders 
where customer_id IN
(select distinct customer_id from orders where product_name='A')
and customer_id in
(select distinct customer_id from orders where product_name='B')
and customer_id not in
(select distinct customer_id from orders where product_name='C'));
SELECT customer_id,customer_name from orders o 
join customers c using(customer_id)
where customer_id not in (select distinct customer_id from orders where product_name ='C') and customer_id  in (select distinct customer_id from orders where product_name ='A') and customer_id in (select distinct customer_id from orders where product_name ='B')
GROUP BY customer_id 
having count(*)>=2;
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
select * from orders;
select * from customers;

select s.customer_id,s.customer_name from (
select c.customer_name, c.customer_id,
(select count(1) from orders o2 where o2.customer_id=c.customer_id and product_name='c') as prod_c_cnt
 from customers c, orders o 
where c.customer_id = o.customer_id and product_name in ('A','B')
group by c.customer_name, c.customer_id having max(o.product_name)<>min(o.product_name)) as s where s.prod_c_cnt=0;



