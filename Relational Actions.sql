-- CREATE TABLE students (
--     student_id INT PRIMARY KEY,
--     student_name VARCHAR(50),
--     student_marks INT
-- );

-- CREATE TABLE exam_results (
--     result_id INT PRIMARY KEY,
--     student_id INT,
--     score INT,
--     FOREIGN KEY (student_id) REFERENCES students(student_id)
--         ON UPDATE CASCADE
--         ON DELETE CASCADE
-- );
-- UPDATE students
-- SET student_id = 999
-- WHERE student_id = 111;


create table students1(
     student_id int primary key,
     student_name varchar(50),
     student_marks int);

create table courses(
cid int primary key,
cname varchar(50),
ccost decimal(50,2),
student_id int,
foreign key(student_id) references students1(student_id) on delete cascade on update cascade);

insert into students1 values(111,'Ganesh',95),(222,'Sai',88),(333,'GGSS',75);
insert into courses values(101, 'mysql', 20000, 111),(102,'Java',30000,222), (103, 'Python', 40000, 333), (104,'Front-end',50000,222);
select * from students1;
update students1 set student_id = 999 where student_id = 111;
select * from courses;
delete from students1 where student_id = 222;
select * from students1;


