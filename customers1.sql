use testing;
create table customers1(id int PRIMARY key AUTO_INCREMENT,
first_name varchar(100),
last_name varchar(100),
email varchar(100));
create table orders1 (id int AUTO_INCREMENT PRIMARY key,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key(customer_id) REFERENCES customers1(id));
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
select * from orders1;
select * from orders1 where customer_id=(select id from customers1 where last_name='George');
#implicit inner join
select * from orders1 o, customers1 c where o.customer_id=c.id;
#explicit inner join
select * from customers1 c
inner join orders1 o
on c.id=o.customer_id;
create table test(A int default null, B int DEFAULT null);
insert into test (A,B)
values (3,4),
(3,null),
(3,null),
(4,2),
(null,2),
(1,3),
(null,3);
select * from test group by A,B;
select c.first_name,c.last_name,sum(amount) as total from customers1 c
join orders1 o
on c.id=o.customer_id
group by o.customer_id
order by total desc;
#left join
select c.first_name,
	   c.last_name,
       ifnull(sum(o.amount),0) as total
       from customers1 c
left join orders1 o 
on c.id=o.customer_id
group by c.id
order by total desc;
#right join
select * from customers1 c
right join orders1 o
on c.id=o.customer_id; 
# on delete cascade
drop table customers1,orders1;
create table customers1(id int PRIMARY key AUTO_INCREMENT,
first_name varchar(100),
last_name varchar(100),
email varchar(100));
create table orders1 (id int AUTO_INCREMENT PRIMARY key,
order_date date,
amount decimal(8,2),
customer_id int,
foreign key(customer_id) 
REFERENCES customers1(id)
on delete cascade);
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
select * from orders1;
delete from customers1 where email='george@gmail.com';
select * from orders1;




