-- Show All Database details
use artbindu;

-- empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno )
create table empinfo (empno varchar(10) primary key, ename varchar(30), hiredate date, job varchar(20), mgr varchar(30), sal int, comm BOOLEAN, deptno varchar(10));
desc empinfo;

-- deptinfo (deptno, dname, location)
create table deptinfo (deptno varchar(10) primary key, dname varchar(30), location varchar(50));
desc deptinfo;

-- Insert data into 'empinfo' table
insert into empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno) values('emp01', 'Employee Name', '2022-11-23', 'Job Name', 'Manager Name', 12345, 0, 'dept01');
insert into empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno) values('emp02', 'Biswasindhu Mandal', '2019-01-15', 'Soft Engg', 'Koushik Dutta', 7000, 0, 'dept02');
insert into empinfo values('emp03', 'Kriti Prk', '2019-01-20', 'Soft Engg', 'Kuntal Bhtta', 7001, 0, 'dept02');
insert into empinfo values('emp04', 'Puspendu Sarkar', '2019-01-20', 'Soft Engg', 'Pujari Gupta', 7777, 0, 'dept02');
insert into empinfo values('emp05', 'Debarati Bera', '2019-01-20', 'Soft Engg', 'Ab Cd', 5677, 0, 'dept06');
insert into empinfo values('emp06', 'Tanmoy Giri', '2019-01-20', 'Soft Engg', 'Pujari Gupta', 7777, 0, 'dept05');
select * from empinfo;

update empinfo set sal = 2299 where empno='emp01';

-- Insert data into 'deptinfo' table
insert into deptinfo (deptno, dname, location) values ('dept00', 'Dummy Dept', 'World');
insert into deptinfo values ('dept01', 'Javascript Developer', 'Kolkata');
insert into deptinfo values ('dept02', 'C++ Developer', 'Kolkata');
insert into deptinfo values ('dept03', 'Java Developer', 'Kolkata');
insert into deptinfo values ('dept04', 'Python Developer', 'Kolkata');
insert into deptinfo values ('dept05', 'C Developer', 'Delhi');
insert into deptinfo values ('dept06', 'Go Developer', 'Mumbai');
insert into deptinfo values ('dept07', 'SQL Developer', 'Hydrabad');
insert into deptinfo values ('dept08', 'MongoDB Developer', 'Noida');
insert into deptinfo values ('dept09', 'Typescript Developer', 'Bengaluru');
select * from deptinfo;


-- Assignment Works:
-- 1. List the names and code of all employees.
select ename as names, empno as code from empinfo;
-- 2. List the names, employee code and department code of all clerks.
select ename as names, empno as "employee code", deptno as 'department code' from empinfo where deptno = 'dept01';  
-- 3. List the names, employee code and salary of all managers.
select ename as names, empno as code, sal as salary from empinfo;
-- 4. List the names, employee code and hire data of all analysts.
select ename as names, empno as "employee code", hiredate as "hire date" from empinfo;
-- 5. List the employees whose salary lies between 2000 and 3000
select ename as names from empinfo where sal between 2000 and 3000;
select ename as names from empinfo where sal > 2000 and sal < 3000;
-- 6. List the employees whose salary less than 1000
select ename as names from empinfo where sal < 1000;
-- 7. List the employees whose salaries are 800, 1600 or 2450.
select ename as names from empinfo where sal in (800, 1600, 2450);
-- 8. List the names of all employee who are either clerks or salesman or analysts.
-- 9. List the employees those who are not getting commission
-- 10. List the employees those who are getting commission
-- 11. List the employees name start with 'F'
-- 12. List the employees whose names start with 'G'
-- 13. List the employees whose names end with 'N'
-- 14. List the employees whose job does not start with 'CL'
-- 15. List all managers who earn more than Rs. 4000/-
-- 16. List all clerks and salesman who earn more than Rs. 1600/-
-- 17. List the names and salaries of all employees who were joined as manager during 1981.