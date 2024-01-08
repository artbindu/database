-- ===========================================================
-- Assignment-03 (Joining Query)
-- ===========================================================
-- Assignment Works:
-- 1. List all employee names, dept name and the city in department name order.
select E.ename as name, D.dname as 'Dept Name', D.location as City from empinfo E join deptinfo D on E.deptno = D.deptno;
-- 2. List all employee name, dept number, dept name and salary, in order of salary
select E.ename as name, D.deptno as dept_number, D.dname as dept_name, E.sal as salary from empinfo E join deptinfo D on E.deptno = D.deptno order by E.sal;
-- 3. List all employees working in Kolkata in descending order of salary
select E.ename as name from empinfo E inner join deptinfo D on E.deptno = D.deptno where D.location like 'Kolkata';
-- 4. List all employee's name, job, salary and department name for everyone in the company except clerks. Sort the report with respect to job and salary.
select E.ename as name, E.job, E.sal as salary, D.dname as dept_name from empinfo E inner join deptinfo D on E.deptno = D.deptno where E.job not like 'cleark' order by E.job asc, E.sal desc;
-- 5. List all employee names who work in the same city as an employee named "Biswasindhu".
-- -- Check 'Biswasindhu' job location 
select D.location as name from empinfo E inner join deptinfo D on E.deptno = D.deptno where E.ename like 'Biswasindhu%';
select E.ename as name from empinfo E inner join deptinfo D on E.deptno = D.deptno 
and 
D.location = (select D.location as name from empinfo E inner join deptinfo D on E.deptno = D.deptno where E.ename like 'Biswasindhu%'); 
-- 6. Display the name of the dept that has no employee
select D.dname from empinfo E right outer join deptinfo D on E.deptno = D.deptno where E.deptno is null;


-- ============================================================================
-- ========================How to Use Joining: Example=========================
select * from empinfo E, deptinfo D where E.deptno =  D.deptno and E.job = 'security';
-- Inner Join
select * from empinfo E inner join deptinfo D on E.deptno =  D.deptno order by E.empno;
select * from empinfo E join deptinfo D on E.deptno = D.deptno;
-- Left Outer Join
select * from empinfo E left outer join deptinfo D on E.deptno =  D.deptno order by E.deptno;
select * from empinfo E left join deptinfo D on E.deptno =  D.deptno order by E.deptno;
-- Right Outer Join
select * from empinfo E right outer join deptinfo D on E.deptno =  D.deptno order by E.deptno;
select * from empinfo E right join deptinfo D on E.deptno =  D.deptno order by E.deptno;
-- Full Outer Join
select * from empinfo E left outer join deptinfo D on E.deptno = D.deptno 
union 
select * from empinfo E right outer join deptinfo D on E.deptno =  D.deptno;
-- Cross Join
select E.empno, D.deptno from empinfo E CROSS JOIN deptinfo D on E.deptno = D.deptno;