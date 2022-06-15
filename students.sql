create table students(id int PRIMARY key AUTO_INCREMENT,first_name varchar(20));
create table papers(
title varchar(150),
grade int, 
student_id int,
foreign key(student_id) 
REFERENCES students(id)
on delete cascade);
INSERT INTO students (first_name) 
VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) 
VALUES
	(1, 'My First Book Report', 60),
	(1, 'My Second Book Report', 75),
	(2, 'Russian Lit Through The Ages', 94),
	(2, 'De Montaigne and The Art of The Essay', 98),
	(4, 'Borges and Magical Realism', 89);
select * from students;
select * from papers;
select s.first_name,p.title,p.grade from papers p
join students s
on s.id=p.student_id order by p.grade desc;
select s.first_name,p.title,p.grade from students s
left join papers p on s.id=p.student_id;
select s.first_name,
       ifnull(p.title,'MISSING') as title,
       ifnull(p.grade,0) as grade
       from students s
left join papers p on s.id=p.student_id;
select s.first_name,
       ifnull(avg(p.grade),0) as average
       from students s
left join papers p on s.id=p.student_id
group by s.id order by average desc;
select s.first_name,
       ifnull(avg(p.grade),0) as average,
		case
           when avg(p.grade) is null then 'FAILING'
           when avg(p.grade)>=75 then 'PASSING'
           else 'FAILING'
	    end as passing_status
from students s
left join papers p on s.id=p.student_id
group by s.id order by average desc;