select * from tbluser;
select id, firstname from tbluser;

drop procedure if exists fun2(in n int, out m int);
create or replace procedure fun2(in n int, out m int)
language plpgsql as
$$
declare
begin
	m := n * 10;
end;
$$;

drop procedure if exists fun();
CREATE OR REPLACE procedure fun()
-- RETURNS SETOF RECORD 
language plpgsql AS
$$
declare
	rec RECORD;
	cl cursor for 
		select id, firstname, 0 as newId from tbluser;
begin
	create table tbluser1 as select *, 0 as newId from tbluser;
	open cl;
		loop
			fetch next from cl into rec;
			EXIT WHEN NOT FOUND;
			call fun2(rec.id, rec.newId);
			update tbluser1 set newId = rec.newId where id = rec.id;
			raise notice 'Fetch data: %, %', rec.newId, rec.firstname;
			
		end loop;
	close cl;
end;
$$;

call fun();
select * from tbluser1;