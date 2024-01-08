-- =======================Exercise-01===============
/*
Merit Rewards
On the basis of Merit, a company decides to promote some of its employee in its HR division at the end of the quarter 
because of their high performace. Write a query to find the employee IDs along with the names of all its employees 
who work in the HR department who earned a bonus of 5000 dollars or more in the last quarter.

There are two tables: 
		employee_information(employee_ID pk (int), name (string), division (string)) 
		last_quarter_bonus(employee_ID pk(int), bonus(int))
*/

create table employee_information (employee_ID int(5) primary key, name varchar(30), division varchar(50));
create table last_quarter_bonus (employee_ID int(5) primary key, bonus int(10));

insert into employee_information values (1, 'Julia', 'HR');
insert into employee_information values (2, 'Samantha', 'Tech');
insert into employee_information values (3, 'Richard', 'HR');
select * from employee_information;

insert into last_quarter_bonus values (1, 2000);
insert into last_quarter_bonus values (2, 5500);
insert into last_quarter_bonus values (3, 6240);
select * from last_quarter_bonus;

select E.employee_ID, E.name from employee_information E inner join last_quarter_bonus QB on E.employee_ID = QB.employee_ID 
where E.division = "HR" and QB.bonus > 5000;


-- =======================Exercise-02===============

/*
Student Analysis
A school recently conducted its annual examination and wishes to know the list of academically low performing students to 
organize extra classes for them. Write a query to return the rolll number and names of students who have a total of less than 
100 marks including all 3 subjects.
There are two tables: 
		student_information(roll_number pk (int), name string)) 
		examination_marks(roll_number pk(int), subject_one(int), subject_two(int), subject_three(int)
*/

create table student_information (roll_number int(5) primary key, name varchar(30));
create table examination_marks (roll_number int(5) primary key, subject_one int(10), subject_two int(10), subject_three int(10));

insert into student_information values (1, 'Sheila');
insert into student_information values (2, 'Rachel');
insert into student_information values (3, 'Christopher');
select * from student_information;

insert into examination_marks values (1, 32, 48, 64);
insert into examination_marks values (2, 24, 21, 25);
insert into examination_marks values (3, 55, 12, 10);
select * from examination_marks;


select SI.roll_number, SI.name
from student_information SI inner join examination_marks EM on SI.roll_number = EM.roll_number
where (EM.subject_one + EM.subject_two + EM.subject_three) < 100;
