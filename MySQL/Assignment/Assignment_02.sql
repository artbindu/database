-- ===========================================================
-- Assignment-02 (Nested Query)
-- ===========================================================
-- Assignment Works:
-- 1. Calculate the average salary of all employees.
select avg(sal) as 'Average Salary' from empinfo;
-- 2. Calculate the average salary of all managers
select avg(sal) as 'Average Salary' from empinfo where job = 'manager';
-- 3. Calculate the total salary of all employees
select sum(sal) as 'Total Salary' from empinfo;
-- 4. Calculate the total salary of all managers
select sum(sal) as 'Managers Total Salary' from empinfo where job = 'manager';
-- 5. Find the minimum salaries earned by the employees
select min(sal) as 'Minimum Salary' from empinfo;
-- 6. Find the minimum salaries earned by the clerks
select min(sal) as 'Clearks Min Sal' from empinfo where job='Clerk';
-- 7. Find the maximum salaries earned by a salesman
select max(sal) as 'Salesman Max Sal' from empinfo where job = 'salesman';
-- 8. Find the minimum and maximum and average salaries earned by a employees.
select min(sal) as 'Min Salary', max(sal) as 'Max Salary', avg(sal) 'Avg Salary' from empinfo;
-- 9. Find the minimum and maximum and average salaries earned by a clerks.
select min(sal) as 'Clerk Min Salary', max(sal) as 'Clerk Max Salary', avg(sal) 'Clerk Avg Salary' from empinfo where job = 'Clerk';
-- 10. List the total number of employees and the average salaries of the different departments.
select deptno as 'Dept No.', count(empno) as 'No of Employee', avg(sal) as 'Group Avg Salary' from empinfo group by deptno; 
-- having deptno is not null;
-- 11. Calculate total number of employees
select count(empno) 'Total Number of Employee' from empinfo;
-- 12. Calculate total number of managers.
select count(empno) as 'Total Number of Managers' from empinfo where job = 'manager';
-- 13. Calculate the number of employees who are not getting any commission
select count(empno) as 'Total Employee without commission' from empinfo where comm = 0;
-- 14. Calculate the number of employees who are getting any commission
select count(empno) as 'Total Employee with commisssion' from empinfo where comm = 1;
-- 15. List the details of all managers in ascending order of joining dates.
select * from empinfo order by hiredate asc;
-- 16. List the average salaries for each different job
select job as 'Job Name', count(empno) as 'No of Employee', avg(sal) as 'Average Salary' from empinfo group by job;
-- 17. Display the minimum, maximum and average salaries for each job group.
select job as 'Job Name', min(sal) as 'Mini Salary', max(sal) as 'Max Salary', avg(sal) as 'Avg Salary' from empinfo group by job;
-- 18. Find all departments which have less 3 employees
select deptno, count(empno) from empinfo where deptno is not NULL group by deptno having count(empno)<3;
-- 19. List the details of the employees in ascending order of department number and within each department in descending order of salary
select * from empinfo order by deptno asc, sal desc;
-- 20. Display the name, depatno and annual salary of each employee in order salary and deptno
select ename as name, deptno as department, sal * 12 as 'Annual Salary' from empinfo order by sal, deptno;
-- 21. Display the name of employee who earns maximum salary
select ename as name, sal as 'Max Salary' from empinfo where sal = (select max(sal) from empinfo);
-- 22. Display the name of employee who earns minimum salary
select ename as name, sal as 'Min Salary' from empinfo where sal = (select min(sal) from empinfo);
-- 23. Display the name of employee who earns maximum salary whose job is a salesman.
select ename, job, sal from empinfo where sal = (select max(sal) from empinfo where job = 'salesman') and job = 'salesman';
-- 24. Display the name of employee who earns minimum salary whose job is a clerk.
select ename from empinfo where sal = (select min(sal) from empinfo where job like 'clerk') and job = 'clerk';
-- 25. Display the department number whose average salary is maximum.
-- Find Average salary group by dept no--
select avg(sal), deptno from empinfo group by deptno order by avg(sal) desc;
-- Find max avg salary of department-- 
select max(avg_sal) from (select deptno, avg(sal) as avg_sal from empinfo group by deptno) as maxAvgSalary;
-- Find Dept of max avg salary by department --
select deptno from empinfo group by deptno having avg(sal) = (select max(avg_sal) from (select deptno, avg(sal) as avg_sal from empinfo group by deptno) as maxAvgSalary);

