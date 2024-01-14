-- ## DBMS Assignment - 5 (Master in Joining, Nested Query & Regular Expression)
-- ---

-- ####  Table Info:
-- - empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno )
-- - deptinfo (deptno, dname, location)

-- #### Assignment List
-- 1. List the employees earns more than any employee in 'Guwahati';
select E.ename, E.sal, D.location as name 
	from empinfo E inner join deptinfo D on E.deptno = D.deptno 
	where E.sal > (
		select max(E1.sal) 
		from empinfo E1 inner join deptinfo D1 on E1.deptno = D1.deptno 
		where D1.location like 'Guwahati'
	);

-- 2. List the employee who works in the same department as 'Mrinmoy';
select E.ename as name, D.deptno
	from empinfo as E inner join deptinfo as D on E.deptno = D.deptno
    where D.deptno = (
		select D1.deptno
		from empinfo as E1 inner join deptinfo as D1 on E1.deptno = D1.deptno
		where E1.ename like 'Mrinmoy%'
    );

-- 3. List the name, employee number, their manager name and manager number.
select E1.ename as "Emp Name", E1.empno as 'Emp No', E1.mgrid as 'Mgr Id', E2.ename as 'Mgr Name'
	from empinfo E1 inner join empinfo E2 on E1.mgrid = E2.empno
    where E1.mgrid is not null order by E1.empno;

select E.ename as "Emp Name", E.empno as 'Emp No', E.mgrid as 'Mgr Id', E1.ename as 'Mgr Name'
	from empinfo E, empinfo E1
    where E.mgrid = E1.empno and E.mgrid is not null order by E.empno;

-- 4. List the name of the employee job is same as 'CLERK';
select ename from empinfo where job = 'clerk';
-- 5. List the name of employee whose salary is more that 'Gopal';
select ename, sal from empinfo where sal > (select sal from empinfo where ename like 'Gopal%');
-- 6. List the name of employee who joined after 'Mrinmoy';
select ename, hiredate from empinfo where hiredate > (select hiredate from empinfo where ename like 'Mrinmoy%');
-- 7. Display the name of the dept. whose job is 'SALESMAN';
select D.dname, E.ename from empinfo E, deptinfo D where E.deptno = D.deptno and E.job = 'salesman';
select D.dname, E.ename 
	from empinfo E inner join deptinfo D on E.deptno = D.deptno
    where E.job = 'salesman';
-- 8. Display the name of the dept. in which 'Tanmoy' works.
select D.dname, E.ename 
	from empinfo E inner join deptinfo D on E.deptno = D.deptno
    where D.dname = (
		select D1.dname from deptinfo D1, empinfo E1 where E1.deptno = D1.deptno and E1.ename like 'Tanmoy%'
	);
-- 9. Display the dept. whose salary is maximum.
select E.deptno, D.dname, max(E.sal) as 'max sal of dept'
	from empinfo E inner join deptinfo D on E.deptno = D.deptno
    group by D.deptno having E.deptno is not null order by E.deptno;

-- 10. Display the name of the city (location) in which 'Tanmoy' works.
select D.location
	from deptinfo D join empinfo E on E.deptno = D.deptno
    where E.ename like 'Tanmoy%';
-- 11. Display the name of the city in which manager works
select D.location, E.ename, E.job
	from deptinfo D join empinfo E on E.deptno = D.deptno
    where E.job = 'manager';
-- 12. Display the grade of the employee named in 'Suresh'
select E.ename, E.job, D.dname 
	from deptinfo D join empinfo E on E.deptno = D.deptno
    where 	E.job = (select job from empinfo where ename like 'suresh%')
		and
			D.dname like (select D1.dname 
							from empinfo E1 join deptinfo D1 on E1.deptno = D1.deptno
                            where E1.ename like 'suresh%'
						);
-- 13. List the employees earn more than every employee in 'Guwahati' (location)
select E1.ename, E1.sal, D1.location 
	from empinfo E1 join deptinfo D1 on E1.deptno = D1.deptno
    where E1.sal > (
		select max(E.sal) 
			from empinfo E join deptinfo D on D.deptno = E.deptno
			where D.location like 'Guwahati'
    );

-- 14. Display the name of the department which has no employee
select D.dname, D.deptno
	from deptinfo D left outer join empinfo E on D.deptno = E.deptno
    where E.deptno is NULL;

-- 15. List name, employee number and the name, employee number of the theirs manager
select E.ename 'Emp Name', E.empno 'Emp No', E1.ename 'Manager Name', E1.empno 'Manager Emp No'
	from empinfo E inner join empinfo E1 on E.mgrid = E1.empno;

-- 16. List the name of the employee who joined in their same year of 'Gopal'
-- select ename, hiredate from empinfo where hiredate like '2007%';
-- Find Year - Format - '^\d{4}'
select REGEXP_REPLACE(hiredate, '(?<=(\\d{4}))(\-\\d{2}){2}', '') as hireyear 
	from empinfo where ename like 'Gopal%';
select ename, hiredate from empinfo 
	where hiredate is not Null and  hiredate like (
		select REGEXP_REPLACE(hiredate, '(?<=(\\d{4}))(\-\\d{2}){2}', '%') as hireyear 
			from empinfo 
			where ename like 'Gopal%'
	);

-- 17. List the name of the employee who joined in their same month of 'Gopal'
-- Find Month - Format - '\-\\d{2}\-'
select REGEXP_REPLACE(hiredate, '(^\\d{4}(?=\-\\d{2}\-))|((?<=\-\\d{2}\-)(\\d{2}))', '') as hireyear 
	from empinfo where ename like 'Gopal%';
select ename, hiredate from empinfo 
	where hiredate is not Null and  hiredate like (
		select REGEXP_REPLACE(hiredate, '(^\\d{4}(?=\-\\d{2}\-))|((?<=\-\\d{2}\-)(\\d{2}))', '%') as hireyear 
			from empinfo 
			where ename like 'Gopal%'
	);

-- 18. List the name of the employee who joined in their same date of 'Gopal'
-- Find date - Format - '\d{2}$'
select REGEXP_REPLACE(hiredate, '(^\\d{4}\-\\d{2})?=\-\\d{2}$', '%') as hireyear 
	from empinfo where ename like 'Gopal%';
select ename, hiredate from empinfo 
	where hiredate is not Null and  hiredate like (
		select REGEXP_REPLACE(hiredate, '(^\\d{4}\-\\d{2})(?=\-\\d{2}$)', '%') as hireyear 
				from empinfo where ename like 'Gopal%'
	);   
    
-- 19. List the name of the department who gets commission.
select D.dname, D.deptno
	from 
			deptinfo D 
		inner join
			(select deptno from empinfo group by deptno having deptno is not null and sum(comm) <> 0) E
        on E.deptno = D.deptno;

