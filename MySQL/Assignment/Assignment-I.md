## DBMS Assignment - 1
---

### 1. Table Info:
- empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno )
- deptinfo (deptno, dname, location)

1. List the names and code of all employees.
2. List the names, employee code and department code of all clerks.
3. List the names, employee code and salary of all managers.
4. List the names, employee code and hire data of all analysts.
5. List the employees whose salary lies between 2000 and 3000
6. List the employees whose salary less than 1000
7. List the employees whose salaries are 800, 1600 or 2450.
8. List the names of all employee who are either clerks or salesman or analysts.
9. List the employees those who are not getting commission
10. List the employees those who are getting commission
11. List the employees name start with 'F'
12. List the employees whose names start with 'G'
13. List the employees whose names end with 'N'
14. List the employees whose job does not start with 'CL'
15. List all managers who earn more than Rs. 4000/-
16. List all clerks and salesman who earn more than Rs. 1600/-
17. List the names and salaries of all employees who were joined as manager during 1981.

-----
----

### Solution:
- create table empinfo (empno varchar(10) primary key, ename varchar(30), hiredate date, job varchar(20), mgr varchar(30), sal int, comm BOOLEAN, deptno varchar(10));
- create table deptinfo (deptno varchar(10) primary key, dname varchar(30), location varchar(50));

Entry Dummy Data:
- insert into empinfo (empno, ename, hiredate, job, mgr, sal, deptno)
  values('emp01', 'Employee Name', '2022-11-23', 
  'Job Name', 'Manager Name', 12345, 'dept01')
  

https://www.youtube.com/watch?v=TvLcjWnJWh4&t=140