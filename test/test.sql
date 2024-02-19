create table EMPS (id int(5) primary key, name varchar(30), salary int(10));
insert into  EMPS values (1, 'Kristeen', 1420);
insert into  EMPS value (2, 'abs', 2006);
insert into  EMPS value (3, 'Julia', 2210);
insert into  EMPS value (4, 'Maria', 3000);

use artbindu;
select * from EMPS;
Desc EMPS;

select * from EMPS
	where salary > 1500 and name like "%i%";
    











select sum(salary)/count(id), sum(REPLACE(salary, '0', ''))/count(id), 
    (sum(salary)-sum(REPLACE(salary, '0', '')))/count(id) as diff 
    from EMPS;
    
select CEILING(23/7), FLOOR(23/7), ROUND(23/7) as sal
    from EMPS;
SELECT ROUND(SQRT(
    SQUARE(abs(P1.LAT_N - P2.LAT_N)) + SQUARE(abs(P1.LONG_W - P2.LONG_W))
    ),2)
    FROM STATION P1 INNER JOIN STATION P2 ON P1.ID = P2.ID;