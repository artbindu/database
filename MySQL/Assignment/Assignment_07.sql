-- ## DBMS Assignment - 7 (DB Custom Function ROW_NUMBER())
-- ---

-- ####  Table Info:
-- - empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno )
-- - deptinfo (deptno, dname, location)

-- #### Assignment List
-- 1. List the names, jobs and salaries of employees whose salary is greater than the highest salary in Operations department.
select deptno, max(sal) from empinfo group by deptno having deptno is not null order by deptno;
-- create a separate table 'dept_wise_sal_indexing' for 'dept-wise-sal-indexing'
SELECT *, row_number() OVER (PARTITION BY deptno ORDER BY sal DESC) as row_index_by_sal
		FROM empinfo where deptno is not null;
WITH dept_wise_sal_indexing AS (
		SELECT *, row_number() OVER (PARTITION BY deptno ORDER BY sal DESC) as row_index_by_sal
		FROM empinfo where deptno is not null
	)
	SELECT ename, sal, deptno
		FROM dept_wise_sal_indexing
		WHERE row_index_by_sal = 1;
-- or
select ename, sal, deptno from empinfo 
	where (sal, deptno) in (select max(sal), deptno from empinfo group by deptno) 
    order by deptno asc;

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
select REGEXP_SUBSTR(hiredate, '\\d{4}') as year, count(empno) as "No of Employeee" from empinfo group by year order by year asc;

-- 6. Give an increment of 20% to all employee who have joined before 1/1/03 or earner less than Rs. 4000/-
select empno, ename, hiredate, sal, round(sal * 20/100) as increment, round(sal * 120/100) as "New Salary" from empinfo where REGEXP_SUBSTR(hiredate, '\\d{4}') < 2003 and sal < 4000;
select empno, ename, hiredate, sal, round(sal * 20/100) as increment, round(sal * 120/100) as "New Salary" from empinfo where hiredate < '2003-01-01' and sal < 4000;

-- 7. Display the name of the employees who subordinate has subordinates.
select E1.empno, E1.ename, 
	   E2.empno as sub1_id, E2.ename as sub1_name, E2.mgrid as sub1_mgr, 
       E3.empno as sub2_id, E3.ename as sub2_name, E3.mgrid as sub2_mgr
	from empinfo E1 inner join empinfo E2 inner join empinfo E3 
		on E1.empno = E2.mgrid and E2.empno = E3.mgrid;
select E1.empno, E1.ename as "Emps whose Subordinate has subordinate"
	from empinfo E1 inner join empinfo E2 inner join empinfo E3 
		on E1.empno = E2.mgrid and E2.empno = E3.mgrid
        group by E1.empno;
        
-- 8. Display the name of the employees and their subordinate has not subordinates.
select E1.empno as sub1_id, E1.ename as sub1_name, E1.mgrid as sub1_mgr, 
	   E2.empno, E2.ename, E2.mgrid 
	from empinfo E2 inner join empinfo E1
		on E1.mgrid = E2.empno and E2.mgrid is null
        and E1.empno not in (select mgrid from empinfo group by mgrid having mgrid is not null order by mgrid)
        order by E1.empno;

-- 9.  Display the name of the employees and their subordinate's subordinates. (same as Q7)
select E1.empno, E1.ename,  
       E3.empno as sub2_id, E3.ename as sub2_name
	from empinfo E1 inner join empinfo E2 inner join empinfo E3 
		on E1.empno = E2.mgrid and E2.empno = E3.mgrid;
        
-- 10. Display the name, salary of the employees who has got maximum and minimum salary in one row with proper heading.
-- create a dummy index, 'row_count()' to join both max_sal & min_sal table.
SELECT E_max_sal.ename as 'Max Sal Emp Name', E_max_sal.sal as 'Max Sal', 
	   E_min_sal.ename as 'Min Sal Emp Name', E_min_sal.sal as 'Min Sal'
	from (select ename, sal, row_count() as rc from empinfo order by sal desc limit 1) E_max_sal 
		inner join
        (select ename, sal, row_count() as rc from empinfo order by sal asc limit 1) E_min_sal
        on E_max_sal.rc = E_min_sal.rc;
-- or
select (select ename from empinfo where sal = (select max(sal) from empinfo) limit 1) as  'Max Sal Emp Name',
		(select max(sal) from empinfo) as 'Max Sal',
        (select ename from empinfo where sal = (select min(sal) from empinfo) limit 1) as  'Min Sal Emp Name',
		(select min(sal) from empinfo) as 'Min Sal';
-- or
select ename, sal from empinfo where sal in ((select max(sal) from empinfo), (select min(sal) from empinfo));

-- 11. Display the department number, member of employees in each department and the total number of employees in the company.
select deptno, count(empno) as "employees in department", 
	   (select count(empno) from empinfo) AS "Total Employees in Company" 
		from empinfo group by deptno having deptno is not null order by deptno;
