-- Show All Database details
use artbindu;

-- ===========================================================
-- ===========================================================
-- delete table
drop table if exists empinfo;
-- empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno )
create table empinfo (
            empno int(10) primary key, ename varchar(30), hiredate date, 
            job varchar(20), mgrid int(10), sal int, comm BOOLEAN, deptno int(5));
-- view table info
desc empinfo;

-- ===========================================================
-- Insert data into 'empinfo' table
insert into empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno) 
            values (7001, 'Koushik Dutta', '1981-01-20', 'manager', null, 7777, 1, 25);
insert into empinfo values(7002, 'Goutam Guha', '2008-01-20', 'manager', 7001, 2999, 0, 35);
insert into empinfo values(7003, 'fatema Bibi', '2008-01-20', 'manager', 7002, 7777, 0, 35);
insert into empinfo values(7004, 'Ab Cd', '2008-01-20', 'salesman', null, 7777, 1, 30);
insert into empinfo values(7007, 'Pujari Gupta', '1983-01-20', 'manager', 7001, 4567, 1, 30);
insert into empinfo (empno, ename, hiredate, job, mgrid, sal, comm, deptno) values
                    (7369, 'Biswasindhu Man', '2019-01-15', 'salesman', 7001, 2450, 0, 10);
insert into empinfo values(7934, 'Kriti Prk', '2019-01-20', 'analysts', 7001, 888, 0, 15);
insert into empinfo values(7788, 'Puspendu Sarkar', '2019-01-20', 'clerk', 7007, 800, 0, 10);
insert into empinfo values(7943, 'Debarati Bera', '2019-01-20', 'clerk', 7002, 5677, 1, 20);
insert into empinfo values(7839, 'Tanmoy Giri', '2019-01-20', 'security', 7007, 1650, 0, 20);
insert into empinfo values(7052, 'Firoz Maaan', '2000-01-12', 'security', 7003, 111, 0, 15);
insert into empinfo values(7042, 'Anna Maliya', '2002-01-12', 'salesman', 7007, 3333, 0, 10);
insert into empinfo values(7342, 'Gulap Nabi', '2007-12-31', 'clerk', 7007, 2999, 0, null);
insert into empinfo values(7521, 'Gopal Dhar', '2007-01-12', 'clerk', 7002, 2999, 0, null);
insert into empinfo values(7840, 'Sanjoy Man', '2019-01-20', 'clerk', 7007, 1650, 0, 20);
insert into empinfo values(7860, 'Suresh Das', '2015-05-20', 'salesman', 7007, 150, 0, 20);
insert into empinfo values(7861, 'Susmita Jana', '2022-05-20', 'clerk', 7002, 150, 0, 20);
insert into empinfo values(7862, 'Susovan Das', '2001-05-20', 'salesman', 7003, 150, 0, 20);
insert into empinfo values(7865, 'Mrinmoy Jana', '2023-05-20', 'Engineer', 7007, 1500, 0, 55);
insert into empinfo values(7866, 'Tilam Vamra', '2023-05-20', 'Engineer', 7002, 1800, 0, 55);
insert into empinfo values(7867, 'Subhas Jana', '2023-12-31', 'salesman', 7001, 1590, 0, 20);
-- show all data in table
select * from empinfo;

-- ===========================================================
-- update some data in table
update empinfo set mgrid = 7001  where empno=7007;
update empinfo set hiredate = '2023-12-31' where empno=7867;