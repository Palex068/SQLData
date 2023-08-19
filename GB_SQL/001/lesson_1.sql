use lesson_1;

create table if not exists teacher
(
teacher_id int primary key auto_increment,
name varchar(50),
post varchar(50)
);

insert into teacher(name, post) values 
('Смит', 'Профессор'), 
('Адамс', 'Ассистент');

create table if not exists student
(
student_id int primary key auto_increment,
name varchar(50),
course_name varchar(50),
email varchar(50),
phone_number varchar(50)
);

insert into student(name, course_name, email, phone_number) values 
('Том', 'Математика', 'tom@tom.com', '983-2842-22'), 
('Сэм', 'Математика', 'sem@sem.com', '983-4342-42'), 
('Боб', 'Алгоритмы', 'bob@bob.com', '393-2842-22');

create table if not exists course
(
name varchar(50),
student_name varchar(50),
teacher_name varchar(50)
);

insert into course(name, student_name, teacher_name) values 
('Математика', 'Том', 'Смит'), 
('Математика', 'Сэм', 'Смит'), 
('Алгоритмы', 'Боб', 'Адамс');

select * from student;

select * from student
where name = 'Сэм';

select name, course_name
from student;

select *
from student
where name like 'С%';


