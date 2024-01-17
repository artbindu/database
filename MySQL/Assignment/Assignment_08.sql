-- ## DBMS Assignment - 8 ()
-- ---

-- ####  Table Info:
-- - empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno )
-- - deptinfo (deptno, dname, location)

-- #### Assignment List
-- 1. Find the job which exist in department no 30 but not in 10
select job from empinfo where deptno = 20 group by job;
select job from empinfo where deptno = 10 group by job;
select job from empinfo where deptno = 20 and job not in (select job from empinfo where deptno = 10 group by job) group by job;
select job from empinfo where deptno = 30 and job not in (select job from empinfo where deptno = 10 group by job) group by job order by job;

-- 2. Find the job employees who earn the highest salary in each job type
select *, row_number() over (partition by job order by sal desc) as job_sal_index from empinfo order by job;
With job_sal_partition as (
		select *, row_number() over (partition by job order by sal desc) as job_sal_index from empinfo order by job
	)
    select ename, job, sal 
		from job_sal_partition
        where job_sal_index = 1;
-- or
select ename, job, sal from empinfo where (sal, job) in (select max(sal), job from empinfo group by job);

-- 3. Find the most recently hired employees in each department
select ename, hiredate from empinfo where hiredate like (select max(hiredate) from empinfo);

-- 4. List the department having no employees(using sub query, using outer join, using correlated sub query, and using set operation.)
-- outer join -- 
select D.deptno, D.dname as "No Emps under dept" 
	from empinfo E right outer join deptinfo D 
		on E.deptno = D.deptno where E.deptno is null;

-- 5. Display the employee names getting salaries greater than their managers.
select E.ename, E.sal, M.sal as "mgr sal", M.ename as "mgr name"
	from empinfo E inner join empinfo M on E.mgrid = M.empno
    where E.sal > M.sal;

-- 6. Select the third highest earner in the emp table.
select ename, sal, row_number() over (order by sal desc) as row_num from empinfo;
with sal_indexing_table as (select *, row_number() over (order by sal desc) as row_num from empinfo)
	select ename, sal from sal_indexing_table where row_num = 3;
-- or
with filter_first_three_sal as (select ename, sal from empinfo order by sal desc limit 3)
	select ename, sal from filter_first_three_sal order by sal asc limit 1;
-- or
select ename, sal 
	from (select *, 
				row_number() over (order by sal desc) as row_num from empinfo
		) as emp_sal_indexing
	where row_num = 3;

-- 7. Display the name of the employees whose boss has a boss.
select E.empno, E.ename
	from empinfo E inner join empinfo Boss inner join empinfo BossBoss
		on E.mgrid = Boss.empno and Boss.mgrid = BossBoss.empno
	order by E.empno;

-- 8. Check the uniqueness of the empno of the emp table.
-- Uniqueness: 
-- 1. Empno is palindrom number
-- 2. Empno is in ASC or DESC order with same difference
-- 3. Empno contains same number

-- 9. Display the name of the employees who has more than two subordinates (solving two ways)
select E.empno, E.ename
	from empinfo E inner join empinfo S1 inner join empinfo S2 inner join empinfo S3
		on E.empno = S1.mgrid and S1.empno = S2.mgrid and S2.empno = S3.mgrid
	group by E.empno;

-- 10. Delete the duplicate records from a table to make it single occurrence.
-- Find Duplicate Value: deptinfo (deptno, dname, location)
SELECT dname, location, COUNT(deptno)
	FROM deptinfo GROUP BY dname, location
	HAVING COUNT(deptno) > 1
-- Find duplicate value: empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno )
Select ename, hiredate, job, mgrid, deptno, count(empno)
	from empinfo group by ename, hiredate, job, mgrid, deptno
	having count(empno) > 1;
	
-- 11. Add a new column in the dept table called no_of_emp (represents the number of employees)
--     Now update this column value using the single command.
Alter table deptinfo add no_of_emp int(3);
desc deptinfo;
select * from deptinfo;
select D.deptno, count(*) from empinfo E right outer join deptinfo D on E.deptno = D.deptno group by D.deptno order by D.deptno;

with dept_wise_emp_count as (
			select D.deptno as deptid, count(*) as total_emps from empinfo E right outer join deptinfo D on E.deptno = D.deptno group by D.deptno order by D.deptno
	) 
    update deptinfo set no_of_emp = total_emps
        where deptno = deptid;
        
select (select D.deptno as deptid, count(*) as total_emps 
			from empinfo E right outer join deptinfo D on E.deptno = D.deptno 
            group by D.deptno order by D.deptno);
        
update deptinfo D,
	(select D.deptno as deptid, count(*) as total_emps 
			from empinfo E right outer join deptinfo D on E.deptno = D.deptno 
            group by D.deptno order by D.deptno) as EmpsByDept
	set D.no_of_emp = EmpsByDept.total_emps
	where D.deptno = EmpsByDept.deptid;
    
    
