USE artbindu;


create table Person (
	regno varchar(12) primary key, 
    fname varchar(25), lname varchar(25), dob date, sex varchar(1),
    phoneno int(10), mailid varchar(20),
    address varchar(60), vid varchar(20)
);

drop table Person;
DESC Person;

-- regno format: {4}:instid, {2}:year(last_2_digit), {3}:course_code, {3}:sl_no
-- insert into Person values( regno,      fname, lname,         dob,        sex,  phoneno,    mailid,        address,      vid )
insert into Person values('17291900001', 'Suman', 'Baasu', '2002-12-15', 'M', 987643210, 'm01@mail.com', 'Kolkata-86', '1111-2222-4444-3333');
insert into Person values('17291900002', 'Jagannath', 'Baasu', '1985-02-15', 'M', 987543210, 'jb@gmail.com', 'Kolkata-86', '1111-3333-2222-4444');
insert into Person values('17292000003', 'Malati', 'Baasu','1977-02-10', 'F', 987133211, 'mb@outlook.com', 'Kolkata-77', '1111-2222-3333-4444');
insert into Person values('17292000004', 'Hari', 'Baasu', '2002-09-19', 'M', 887623210, 'kk@rediffmail.com', 'Kolkata-65', '3333-1111-2222-4444');
insert into Person values('17292100005', 'Ambika', 'Kour', '2002-12-13', 'F', 887333210, 'kk1@gmail.com', 'Delhi-65', '1111-2222-4444-5555');
insert into Person values('17292100006', 'Akash', 'Maji', '2002-01-22', 'M', 887643210, 'addd@outlook.com', 'Kolkata-66', '1111-5555-2222-4444');
insert into Person values('17292100007', 'Suresh', 'Baasu', '2002-08-14', 'M', 887443210, 'adf45@outlook.com', 'Kolkata-56', '1111-2222-5555-4444');
insert into Person values('17292100008', 'Rahul', 'Roy', '2002-09-21', 'M', 887654210, 'hnfgh@rediffmail.com', 'Kolkata-23', '6666-1111-2222-4444');
insert into Person values('17292100010', 'Susmita', 'Kour', '2002-05-18', 'F', 887003210, 'db124kk@gmail.com', 'Mumbai-635', '1111-6666-2222-4444');
insert into Person values('17291500012', 'NP', 'Maji', '2002-09-14', 'F', 887652341, 'hfghj@rediffmail.com', 'Delhi-65', '1111-2222-6666-4444');
insert into Person values('17291000456', 'Rahul', 'Kour', '2002-09-17', 'M', 8543210, 'adsfasd@gmail.com', 'Delhi-65', '1111-2222-4444-7777');
insert into Person values('17292200123', 'JP', 'Baasu', '2002-08-11', 'M', 88653210, 'adf@yahoo.com', 'Mumbai-75', '1111-7777-2222-4444');
insert into Person values('17292431232', 'TK', 'Maji', '2002-02-16', 'F', 12345, 'ddde@mail.com', 'Mumbai-625', '1111-2222-7777-4444');
select * from Person;

select ROUND(123.455575255, 4);


/*
		================ Basic Query ====================
*/
select fname as "Name start with 's'" from Person where fname like 's%';
select fname as "Name end with 'a'" from Person where fname like '%a';
select concat(fname, " ", lname) as "Full Name end with i" from Person where lname like '%i';
select fname as "Name\'s 2nd letter 'u'" from Person where fname like '_u%';
select concat(fname, " ", lname) as "Name" from Person where lname not like'%ou%' and lname not like '%su%';
select mailid as 'Yahoo Mail' from Person where mailid like "%@yahoo%";

select fname, REGEXP_SUBSTR(fname, '[a-zA-Z]{1}') as sort from Person;




-- 	https://www.hackerrank.com/challenges/weather-observation-station-19/problem
--  Euclidean Distance 
SELECT ROUND(SQRT(
                POWER(min(LAT_N)-max(LAT_N), 2) + 
                POWER(min(LONG_W)-max(LONG_W), 2)
            ), 4)
    from STATION;
-- 	https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
-- 	Manhattan Distance
SELECT ROUND(
	(min(LAT_N)-max(LAT_N)) + (min(LONG_W)-max(LONG_W))
, 4)
    from STATION;


/*
	REGEX_LIKE(Search_Column, pattern, [case])
            case: (i/c) - optional, default case i(ignore case)
*/ 
select fname as "Name start with 's'" 
    from Person where fname like 's%';
select fname as "Name start with 's'"
    from Person where REGEXP_LIKE(fname, '^s');
select fname as "Name start with 's'" 
	from Person where fname REGEXP '^s';
-- -------------------------------
select fname as "Name end with 'a'" 
      from Person where fname like '%a';
select fname as "Name end with 'a'" 
      from Person where fname REGEXP 'a$';
select fname as "Name end with 'a'"
      from Person where REGEXP_LIKE(fname, 'a$');
-- ------------------------------
select fname as "Name\'s 2nd letter \'u\'" 
      from Person where fname like '_u%';
select fname as "Name\'s 2nd letter \'u\'" 
      from Person where fname REGEXP '^[a-zA-Z]{1}u'; 
select fname as "Name\'s 2nd letter \'u\'" 
      from Person where REGEXP_LIKE(fname, '^[a-zA-Z]{1}u');
-- ----------------------------
select mailid as "Yahoo Mail" 
    from Person where mailid like "%@yahoo.%";
select mailid as "Yahoo Mail" 
    from Person where mailid REGEXP "[a-zA-Z0-9_\\-\.]+(\@yahoo)+?(\.[a-z]+){1,}";
select mailid as "Yahoo Mail" 
    from Person where REGEXP_LIKE(mailid, '[a-zA-Z0-9_\\-\.]+(\@yahoo)+?(\.[a-z]+){1,}');
-- ------------Name Start End with Vowels----------------
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where fname LIKE '(a|e|i|o|u|A|E|I|O|U)%' and lname REGEXP '[aeiouAEIOU]$';
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where fname REGEXP '^[aeiouAEIOU]' and lname REGEXP '[aeiouAEIOU]$';
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where concat(fname, " ", lname) REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where REGEXP_LIKE(concat(fname, " ", lname), '^[aeiouAEIOU].*[aeiouAEIOU]$');
-- ------------Name don't Start or End with Vowels----------------
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where concat(fname, " ", lname) NOT REGEXP '(^[aeiouAEIOU]|[aeiouAEIOU]$)';
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where concat(fname, " ", lname) NOT RLIKE  '(^[aeiouAEIOU]|[aeiouAEIOU]$)';
select concat(fname, " ", lname) as "Full Name end with vowels" 
      from Person where not REGEXP_LIKE(concat(fname, " ", lname), '(^[aeiouAEIOU]|[aeiouAEIOU]$)');


select ename from empinfo where ename like '%a';
select ename from empinfo where REGEXP_LIKE(ename, 'a$');
select ename from empinfo where REGEXP_LIKE(ename, '^S');
-- start name with s (small letter), case sensitive
select ename from empinfo where REGEXP_LIKE(ename, '^S', 'c');
-- start name with s (small letter), case sensitive
select ename from empinfo where REGEXP_LIKE(ename, '^s', 'c');
-- start name with s (small letter), ignore case
select ename from empinfo where REGEXP_LIKE(ename, '^s', 'i');

/*
	REGEX_INSTR(Search_Column, pattern, [match_paremeter], [case])
			match_paremeter: optional
            case: (i/c) - optional, default case i(ignore case)
*/
set @st = 'Database Management System';
set @sst = 'base';
SELECT @st as text, @sst as search_text, REGEXP_INSTR(@st, @sst) as fIndex;
-- Display name of person, where last_name contains 'u' and show the index of 'su' in person full_name.
SELECT concat(fname, ' ', lname) as "Name", REGEXP_INSTR(concat(fname, ' ', lname), 'su') as "\'su\' index" 
	from Person where lname REGEXP '.*u.*';
SELECT concat(fname, ' ', lname) as "Name", 
		REGEXP_INSTR(concat(fname, ' ', lname), 'su') as "su index",  
        not REGEXP_INSTR(concat(fname, ' ', lname), 'su') as status
	from Person where lname REGEXP '.*u.*';
    
/*
	REGEXP_REPLACE(expr, pat, repl[, pos[, occurrence[, match_type]]])
*/
SELECT REGEXP_REPLACE('2024-09-12', '(?<=(\\d{4}))(\-\\d{2}){2}', '%');
SELECT REGEXP_SUBSTR('2024-09-12', '^\\d{4}(?=(\-\\d{2}){2})');
select ename, hiredate from empinfo 
	where hiredate like (select REGEXP_REPLACE(hiredate, '(?<=(\\d{4}))(\-\\d{2}){2}', '%') as hireyear from empinfo where ename like 'Gopal%');

SELECT REGEXP_REPLACE('Doctor', '(?<=[a-zA-Z]{1}).*', '');
select concat('biswa Mandal', ' (', REGEXP_REPLACE('Doctor', '(?<=[a-zA-Z]{1}).', ''), ')');

/*
	REGEXP_SUBSTR(expr, pat[, pos[, occurrence[, match_type]]])
*/

/*
	RLIKE(expr, pat, repl[, pos[, occurrence[, match_type]]])
*/
SELECT concat(fname, ' ', lname) as name, mailid FROM Person WHERE mailid RLIKE '\@(outlook|yahoo)\.com';
SELECT concat(fname, ' ', lname) as name, mailid FROM Person WHERE mailid REGEXP '\@(outlook|yahoo)\.com'; 
/*
==============================HackerRank==Query====================
*/
-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
-- OCCUPATIONS (name (string), occupation(string))
select concat(name, '(', Upper(REGEXP_SUBSTR(occupation, '[a-zA-Z]{1}')), ')') 
    from OCCUPATIONS 
    order by name asc;
select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') 
    from OCCUPATIONS 
    group by occupation 
    order by count(occupation) asc, occupation asc;
    
-- ========================================================================
-- New Line Validation Mode with Parameter full-stop(.): 'n'
-- ========================================================================
set @line1 = "First Line match.
Second Line db.
Third Line code
Fourth Line extra123455";

set @line2 = "First Line.\nSecond Line db.\nThird Line Code.";


select REGEXP_LIKE(@line1, 'DB.', 'n') as 'Should return Ture';
select REGEXP_LIKE(@line1, 'DB', 'n') as 'Should return Ture';

select REGEXP_LIKE(@line1, 'SECOND', 'n') as 'Should return Ture';
select REGEXP_LIKE(@line1, 'SECOND', 'n') as 'Should return Ture';

select REGEXP_LIKE(@line1, 'extra', 'n') as 'Should return Ture';
select REGEXP_LIKE(@line1, 'extra$', 'n') as 'Should return Ture';

select REGEXP_LIKE(@line1, 'code', 'n');
select REGEXP_LIKE(@line1, 'code', 'in');
select REGEXP_LIKE(@line1, 'first', 'in');



