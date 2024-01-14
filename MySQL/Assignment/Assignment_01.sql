-- ===========================================================
-- Assignment-1 (Basic Query)
-- ===========================================================
-- Assignment Works:
-- 1. List the names and code of all employees.
select ename as names, empno as code from empinfo;
-- 2. List the names, employee code and department code of all clerks.
select ename as names, empno as "employee code", deptno as 'department code' from empinfo where job = 'clerk';  
-- 3. List the names, employee code and salary of all managers.
select ename as names, empno as code, sal as salary from empinfo where job='manager';
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
select ename as names from empinfo where job in ('clerks', 'salesman', 'analysts');
-- 9. List the employees those who are not getting commission (boolean value 1/0, True/False)
select ename as names from empinfo where comm = 0;
-- 10. List the employees those who are getting commission
select ename as names from empinfo where comm = 1;
-- 11. List the employees name start with 'F'
select ename as names from empinfo where ename like 'F%';
-- 12. List the employees whose names start with 'G'
select ename as names from empinfo where ename like 'G%';
-- 13. List the employees whose names end with 'N'
select ename as names from empinfo where ename like '%N';
-- 14. List the employees whose job does not start with 'CL'
select ename as names from empinfo where job not like 'CL%';
-- 15. List all managers who earn more than Rs. 4000/-
select ename as 'manager name' from empinfo where job like 'manager' and sal > 4000;
-- 16. List all clerks and salesman who earn more than Rs. 1600/-
select ename as name from empinfo where job in ('clerk', 'salesman') and sal > 1600;
-- 17. List the names and salaries of all employees who were joined as manager during 1981.
select ename as name, sal as salary from empinfo where job = 'manager' and hiredate like '1981%';
select ename as name, sal as salary from empinfo where job = 'manager' and hiredate between '1981-01-01' and '1981-12-31';
-- 18. List the names and salaries of all employees whose salary is even
select ename as name, sal as salary from empinfo where (sal %2 = 0);
