# SQL Custom Function

### MySQL data types
DataType | Description | Example
-|-|-
CHAR(size)|string

### How to Declare a function
```sql
DELIMITER $$
    -- Function Heading
    CREATE FUNCTION <function_name> (  
                -- Function Parameter Information                             
                                        <params1> <dataType>,       
                                        <params2> <dataType>, 
                                        ...
                                    )
    -- Function return data type
    RETURNS <dataType>   
     -- Mention function type, DETERMINISTIC or NON-DETERMINISTIC                                           
    [NOT] DETERMINISTIC  

    -- Function Body block            
    BEGIN                              
        <Write Function Body>
        -- return function output
        RETURN <return_value> 
    END$$
DELIMITER ;
```
- A DETERMINISTIC function always return same result
- A NON-DETERMINISTIC function returns different result

### How to Delete a function
```sql
drop function <function_name>
```

### How to check all functions
```sql
-- Show all custom function in your MYSQL server
show function status;
-- Show all custom function in your database: artbindu
show function status WHERE db = 'artbindu';
-- Show searching function. Need to find function name start with 'add'
show function status like 'add%';
```

### Example of SQL Function

#### 1. Return 'Hello World' through SQL function
```sql
drop function if exists welcome;
DELIMITER $$
CREATE function welcome ( )
returns varchar(20)
DETERMINISTIC
BEGIN
	return 'Hello World';
END$$
DELIMITER ;

select welcome() as message;
```
#### 2. Addition of two number
```sql
drop function if exists addition;
DELIMITER $$
CREATE FUNCTION addition(a double, b double)
RETURNS double
DETERMINISTIC
BEGIN
	return round(a+b, 2);
END$$
DELIMITER ;

select addition(12.34,13.34567);
-- output: 25.69
select addition(18, -12);
-- output: 6
```

### 3. Verify a number is even or odd

```sql
drop function if exists isEvenNumber;
DELIMITER $$
create function isEvenNumber(n int(10))
returns bool
DETERMINISTIC
BEGIN
	if(n%2 = 0) 
        then    return True;
	else 	    return False;
    end if;
END$$
DELIMITER ;

select isEvenNumber(12);
-- Output: 1 (True)
select isEvenNumber(13);
-- Output: 0 (False)
```

#### Check Leap year
#### Find GCD of two numbers
#### Find age
#### Find Factorial
- MySQL does not allow recursive FUNCTIONs, even if you set max_sp_recursion_depth (upto 255 steps).
```sql
-- Need to config recursive
-- https://bugs.mysql.com/bug.php?id=88840
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
```