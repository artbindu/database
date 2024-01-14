-- ## DBMS Assignment - 7 (DB Custom Fruntion ROW_NUMBER())
-- ---

-- ####  Table Info:
-- - empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno )
-- - deptinfo (deptno, dname, location)

-- #### Assignment List
-- 1. List the names, jobs and salaries of employees whose salary is greater than the highest salary in Operations department.
select deptno, max(sal) from empinfo group by deptno having deptno is not null order by deptno;
-- create a separate table 'dept_wise_sal_indexing' for 'dept-wise-sal-indexing'
WITH dept_wise_sal_indexing AS (
		SELECT *, row_number() OVER (PARTITION BY deptno ORDER BY sal DESC) as row_index_by_sal
		FROM empinfo where deptno is not null
	)
	SELECT ename, sal, row_index_by_sal, deptno
		FROM dept_wise_sal_indexing
		WHERE row_index_by_sal = 1;

-- 2. Find the department is not having any employee
select D.deptno, D.dname from empinfo E right join deptinfo D on E.deptno = D.deptno where E.deptno is null;
 
-- 3. List the top 10 earners in the company
select ename, sal from empinfo order by sal desc limit 10;

-- 4. List the top 2 earners in each department
SELECT *, row_number() OVER (
			PARTITION BY deptno ORDER BY sal DESC
			) AS row_num
	FROM empinfo;
    
WITH dept_wise_sal_indexing AS (
		SELECT *, row_number() OVER (PARTITION BY deptno ORDER BY sal DESC) AS row_num
		FROM empinfo where deptno is not null
	)
	SELECT ename, sal, row_num, deptno
		FROM dept_wise_sal_indexing
		WHERE row_num <= 2;

-- 5. List the years and the number of people joining in the year
select REGEX_REPLACE(hiredate, '
-- 6. Give an increment of 20% to all employee who have joined before 1/1/82 or earner less than Rs. 3000/-
-- 7. Display the name of the employees who subordinate has subordinates.
-- 8. Display the name of the employees and their subordinate has not subordinates.
-- 9.  Display the name of the employees and their subordinate's subordinates.
-- 10. Display the name, salary of the employees who has got maximum and minimum salary in one row with proper heading.
-- 11. Display the department number, member of employees in each department and the total number of employees in the company.
