-- Show All Database details
use artbindu;
-- ===========================================================
-- ===========================================================
-- delete table
drop table if exists deptinfo;
-- deptinfo (deptno, dname, location)
create table deptinfo (deptno int(5) primary key, dname varchar(30), location varchar(50));
-- view table info
desc deptinfo;

-- ===========================================================
-- Insert data into 'deptinfo' table
insert into deptinfo (deptno, dname, location) values (10, 'dept01', 'Bengaluru');
insert into deptinfo values (15, 'dept02', 'Bengaluru');
insert into deptinfo values (20, 'dept03', 'Kolkata');
insert into deptinfo values (25, 'dept04', 'Kolkata');
insert into deptinfo values (30, 'dept05', 'Bengaluru');
insert into deptinfo values (35, 'dept06', 'Delhi');
insert into deptinfo values (40, 'dept07', 'Mumbai');
insert into deptinfo values (45, 'dept08', 'Kolkata');
insert into deptinfo values (50, 'dept09', 'Kolkata');
insert into deptinfo values (55, 'dept10', 'Guwahati');
-- show all data in table
select * from deptinfo;

-- ===========================================================
-- update some data in table 
update deptinfo set location = 'Guwahati' where deptno=55;

