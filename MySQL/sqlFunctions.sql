
drop function if exists fact;
drop procedure if exists factFun;
DELIMITER $$

create procedure factFun(IN n int, OUT m int)
BEGIN
    if(n=0 or n=1) then set m = 1;
    else call factFun(n-1, m);
    end if;
END$$
create function fact(n int) returns int no sql
BEGIN
	declare res int default 0;
    call factFun(n, res);
    return res;
END$$
DELIMITER ;

select fact(5) as fact_val;


show function status WHERE db = 'artbindu';







