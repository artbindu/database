-- ## DBMS Assignment - 6 ()
-- ---

-- ####  Table Info:
-- - empinfo (empno, ename, hiredate, job, mgr, sal, comm, deptno )
-- - deptinfo (deptno, dname, location)

-- #### Assignment List
-- 1. List all employee who work in 'Guwahati' or have joined the company as manager before 1980.
select ename, hiredate, REGEXP_REPLACE(hiredate, '(\-\\d{2}){2}', '') as hireyear, job from empinfo;
select E.ename, D.location, E.job, E.hiredate, E.hireyear
	from 
		(select deptno, ename, hiredate, REGEXP_REPLACE(hiredate, '(\-\\d{2}){2}', '') as hireyear, job from empinfo) E 
    inner join 
		deptinfo D on E.deptno = D.deptno
    where 
		D.location like 'Guwahati' or
        (E.job like 'manager' and E.hireyear >= 1980);
		
-- 2. List all employees who work in 'Bengaluru' and earn more than any employee working in 'Guwahati'
select max(E1.sal) as maxSal from empinfo E1 inner join deptinfo D1 on E1.deptno = D1.deptno where D1.location like 'Guwahati';
select E.ename, D.location, E.sal 
	from empinfo E inner join deptinfo D on E.deptno = D.deptno
    where
		D.location like 'Bengaluru'
        and 
        E.sal > (select max(E1.sal) as maxSal 
					from empinfo E1 inner join deptinfo D1 on E1.deptno = D1.deptno 
					where D1.location like 'Guwahati');

-- 3. List name of the employee who earns the minimum salary
select ename, sal from empinfo where sal = (select min(sal) as minsal from empinfo);

-- 4. List all employees who work in the same post as 'Biswa'
select E.ename, E.job from empinfo E 
		where E.job like (select job from empinfo where ename like 'Biswa%') 
            and E.ename not like 'Biswa%';

-- 5. List all employees who earn more that every employee in the 'dept01' department
-- max sal of dept: 'dept10'
select max(E.sal) from empinfo E inner join deptinfo D on E.deptno = D.deptno where D.dname like 'dept01';
select ename, sal from empinfo  where sal > 
			(select max(E.sal) as 'maxSaldept_1' from empinfo E inner join deptinfo D on E.deptno = D.deptno where D.dname like 'dept01'); 

-- 6. Find the job with the highest average salary
select job, avg(sal) as maxAvgSalByJob from empinfo group by job limit 1;

-- 7. Find the highest salary of each job.
select job, max(sal) as hightestSalByJob from empinfo group by job order by job;
