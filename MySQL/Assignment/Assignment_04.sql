-- ===========================================================
-- Assignment-04 (Master in Nested Query and Grouping)
-- ===========================================================
-- Assignment Works:
-- 1. List the employees belonging to the department 20
SELECT ename as Name FROM empinfo WHERE deptno = 20;
-- 2. List the name and salary of the employees whose salary is more than 1000
sELECT ename as Name, sal as Salary from EMPINFO where sal > 1000;
-- 3. List the employee no and the name of the manager
select empno as 'Employee No', ename as Name from empinfo where job = 'manager';
-- 4. List the no of the clerks working in the department 20
select ename as Name from empinfo where job = 'clerk' and deptno = 20;
-- 5. List the name of the analysts and salesman
select ename as Name from empinfo where job in ('analysts', 'salesman');
-- 6. List the name of the employees whose employee numbers 7369, 7521, 7839, 7934, 7788
select ename as Name from empinfo where empno in (7369, 7521, 7839, 7934, 7788);
-- 7. List the name of the employee detail not belonging to the department 10, 30 and 40
select ename as name from empinfo where deptno not in (10, 30, 40);
-- 8. List the different jobs available in the emp table.
select job as "Job Name" from empinfo group by job;
-- 9. List the employee not assigned to any department
select ename as Name from empinfo where deptno is NULL;
-- 10. List the details of the employees whose salary is greater than 2000 and not eligible for commission.
select ename as name from empinfo where sal > 2000 and comm = 0;
-- 11. List the employee names having 'I' as second character
select ename as name from empinfo where ename like '_i%';
-- 12. List the employee names, salary, PF, HRA, DA and gross salary_order the result in ascending order of gross HRA is 50% of salary and DA is 30% of salary
select ename as name, sal as salary, sal * 12/100 as PF, sal * 50/100 as HRA, sal * 30/100 as DA, sal * (12 + 50 + 30)/100 as "Gross Salary" from empinfo order by (sal * (12 + 50 + 30)/100) asc;
-- 13. List the name, salary and PF amount of all the employee (PF is calculated as 12% of salary)
select ename as name, sal as Salary, sal * 12/100 as "PF Amt" from empinfo;
-- 14. List the employee number, name and salary in ascending order of salary
select empno as "Employee Number", ename as name, sal as Salary from empinfo order by sal asc;
-- 15. Lists the employee name and hiredate in descending order of hiredate
select ename as "Employee Name", hiredate from empinfo order by hiredate;
-- 16. List the department number and the total salary payable in each department.
select deptno, sum(sal) from empinfo where deptno is not NULL group by deptno ;
-- 17. List the jobs and number of employees in each job. The result should be in descending order of the number of employees. 
select job as "Job Type", count(empno) as "Number of Employee" from empinfo group by job order by count(empno) desc;
select job as "Job Type", count(empno) as emp_no from empinfo group by job order by emp_no desc;
-- 18. List the total salary, maximum, minimum and average salary of the employee's jobwise
select sum(sal), max(sal), min(sal), avg(sal) from empinfo order by job;
-- 19. List the average salary from each job excluding MANAGER
select job, avg(sal) from empinfo where job <> 'manager' group by job;
-- 20. List average salary for all departments employing more than five people.
select avg(sal), count(empno), deptno from empinfo group by deptno having count(empno) >= 5; 
-- 21. List job of all the employees where maximum salary is greater than or equal to 3000
select job, max(sal) from empinfo group by job having max(sal) > 3000;
-- 22. List the total salary, maximum and minimum salary and the average salary of employees job wise for department number 20 and display only those rows having average salary greater than 1000.
select job, sum(sal), max(sal), min(sal), avg(sal) from empinfo where deptno = 20 group by job having avg(sal) > 1000;
-- 23. Find the difference of total jobs and distict jobs in employee table.
-- Total Job count in employee table
select count(job) as tjobcount from empinfo diff;
-- Total number of Unique jobs in employee table
select count(job) as uniquejobcount from (select job, count(job) from empinfo group by job) as JobCount;
-- Difference of job and distinct city
select (
(select count(job) as tjobcount from empinfo diff) -
(select count(job) as uniquejobcount from (select job, count(job) from empinfo group by job) as JobCount)
) as result;
-- 24. Find distict job names do not start and end with vowels.
select job from empinfo where ename REGEXP '^[^(AEIOUaeiou)].*[^(AEIOUaeiou)]$' group by job;
select job from empinfo group by job having job REGEXP '^[^(AEIOUaeiou)].*[^(AEIOUaeiou)]$';
-- 25. Find distict job names either do not start with vowels or do not end with vowels.
select job from empinfo where job REGEXP '(^[^(AEIOUaeiou)].*)|(.*[^(AEIOUaeiou)]$)' group by job;
select job from empinfo group by job having job REGEXP '(^[^(AEIOUaeiou)].*)|(.*[^(AEIOUaeiou)]$)';
