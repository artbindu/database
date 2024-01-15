-- ## DBMS Assignment - 10 ()
-- ---
use artbindu;

-- ####  Table Info:
-- - Employee (Id, Name, Salary)
-- - Department (Id, Name, Manager_Id, Floor_No)
-- - Works (Eid, Did)

create table Employee (id varchar(5) primary key, name varchar(20), salary int(7));
create table Department (id varchar(3)  primary key, name varchar(20), manager_id varchar(5), floor_no int(3));
create table Works (eid varchar(5), did varchar(3));


insert into employee (id, name, salary) values ('e01', 'P. Mishra', 20000);
insert into employee values ('e02', 'Dipshikha Roy', 17000);
insert into employee values ('e03', 'Nayana Sau', 18000);
insert into employee values ('e04', 'Ayan Route', 21000);
insert into employee values ('e05', 'Rohit Sharma', 50000);
insert into employee values ('e06', 'Rohit Sharma', 50000);
insert into employee values ('e07', 'Virat Barman', 15000);
insert into employee values ('e08', 'Rajesh Khann', 8000);
insert into employee values ('e09', 'V Sing', 80000);
insert into employee values ('e10', 'R Jana', 9000);
insert into employee values ('e11', 'PR Roy', 8500);
insert into employee values ('e12', 'Prakash Khanna', 76600);
insert into employee values ('e13', 'Asutosh Banerjee', 55000);
insert into employee values ('e14', 'Rajesh Mahato', 12000);

insert into Department(id, name, manager_id, floor_no) values ('d01', 'Sales', 'e01', 7);
insert into Department(id, name, manager_id, floor_no) values ('d02', 'Developer', 'e02', 3);
insert into Department(id, name, manager_id, floor_no) values ('d03', 'HR', 'e03', 3);
insert into Department(id, name, manager_id, floor_no) values ('d04', 'Testing', 'e04', 9);
insert into Department(id, name, manager_id, floor_no) values ('d05', 'Finance', 'e05', 1);
insert into Department(id, name, manager_id, floor_no) values ('d06', 'IT', 'e06', 2);
insert into Department(id, name, manager_id, floor_no) values ('d07', 'Production', 'e02', 5);
insert into Department(id, name, manager_id, floor_no) values ('d08', 'Marketing', 'e01', 9);
insert into Department(id, name, manager_id, floor_no) values ('d09', 'Administration', 'e03', 2);
insert into Department(id, name, manager_id, floor_no) values ('d10', 'Quality Management', 'e04', 3);

insert into Works (eid, did) values ();


-- #### Assignment List
-- Define all the integrity constrains and execute the following queries:

-- 1. Find out the department name where 'Dipshikha' and 'Nayana' work together.
-- 2. Find out the names of all the employees who work in the department where 'Ayan' works.
-- 3. Find out the employee names who work on the floor and earn less than Rs. 15,000/-
-- 4. Find out the names of all the managers who earn less than Rs. 50,000/-.
-- 5. Find out the names of all the departments on the same floor where 'Rohit' works.


