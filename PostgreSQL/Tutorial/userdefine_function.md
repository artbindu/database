# PL-SQL custom functions

### Basic DataTypes
```sql

```

### Function: Welcome Message
```sql
-- delete function if it's exists in DB
drop function if exists welcome();
-- Create a function with function name as 'welcome'
create function welcome ()
-- Mention function return type
returns text as 
-- start function body
$BODY$
	BEGIN
		return 'Welcome to PostgerSQL Custom Function';
	END;
-- end of function body
$BODY$ 
-- mention the language
LANGUAGE plpgsql;

select welcome() as sms;
-- Output: Welcome to PostgerSQL Custom Function
```
`or`
```sql
-- delete function if it's exists in DB
drop function if exists welcome1();
-- Create function with function name as 'welcome'
create function welcome1()
-- Mention function return type
returns text 
-- mention the language
LANGUAGE plpgsql as 
-- start function body
$BODY$
	BEGIN
		return 'Welcome to PostgerSQL Custom Function';
	END;
-- end function body
$BODY$;

select welcome1() as sms;
-- Output: Welcome to PostgerSQL Custom Function
```
`or`
```sql
-- delete function if it's exists in DB
drop function if exists welcome2();
-- Create or replace function with function name as 'welcome'
create or replace function welcome2()
-- Mention function return type
returns TEXT 
-- mention the language
LANGUAGE plpgsql as 
-- start function body
$BIGBOSS$
-- declare variable with data type
    DECLARE
        txt TEXT;
        BEGIN
            txt :=  'Welcome to PostgerSQL Custom Function';
            return txt;
        END;
-- end function body
$BIGBOSS$; 

select welcome2() as sms;
-- Output: Welcome to PostgerSQL Custom Function
```
`or`
```sql
-- delete function if it's exists in DB
drop function if exists welcome3(TEXT);
-- Create or replace function with function name as 'welcome'
create or replace function welcome3(st TEXT)
-- Mention function return type
returns TEXT 
-- mention the language
LANGUAGE plpgsql as 
-- start function body
$FunctionBody$
-- declare & assign variable with data type
    DECLARE
        txt TEXT :=  'Welcome to ' || st;
        BEGIN
            return txt;
        END;
-- end function body
$FunctionBody$; 

select welcome3('PostgerSQL Custom Function') as sms;
-- Output: Welcome to PostgerSQL Custom Function
```


### Function: Sum of two number
```sql
drop function if exists addition(int, int);
create function addition(a int, b int)
returns int as $$
	BEGIN
		return a+b;
	END
$$ LANGUAGE plpgsql;

select addition(2, 3) as sumValue;
select addition(234, 124) as sumValue;
```

- alternative way to define function
```sql
drop function if exists addition(int, int);
create or replace function addition(a int, b int)
returns int
LANGUAGE plpgsql
as
$BODY$ -- write anything(without space) between two '$' symbol. But text should be identical both beginning & end position  
    BEGIN
        return a + b;
    END;
$BODY$;

select addition(2, 3) as add_data;
```
```sql
drop function if exists addition(int, int);
create or replace function addition(int, int)
returns int
LANGUAGE plpgsql
as
$FunctionBody$ -- write anything(without space) between two '$' symbol. But text should be identical both beginning & end position 
    BEGIN
        return $1 + $2;
    END;
$FunctionBody$;

select addition(2, 3) as add_data;
```

### Function:: Temperature Convertion ≡ Fahrenheit ⇄ Celsius
- Hint: C = (F - 32) * 5/9; F = (C * 9 / 5) + 32
```sql
-- Celsius to Fahrenheit
drop function if exists CtoF(real);
create or replace function CtoF(real)
returns real
language plpgsql AS
$C2F$
	BEGIN
		return (($1 * 9/5)+32)::real;
	END;
$C2F$;

select CtoF(38);
-- Output: 100.4
```
```sql
-- Fahrenheit to Celsius
drop function if exists FtoC(real);
create or replace function FtoC(real)
returns real
language plpgsql AS
$F2C$
	BEGIN
		return (($1 - 32) * 5/9)::real;
	END;
$F2C$;

select FtoC(100.4);
-- Output: 38
```

### Function: Check Even or Odd Number : **IF STATEMENT**
```sql
drop function if exists checkEven(int);
create function checkEven(a int)
returns text as $$
	BEGIN
		if(mod(a,2) = 0) then return 'Even Number';
		else return 'Odd Number';
		end if;
	END
$$ LANGUAGE plpgsql;

select checkEven(2) as EvenValidation;
select checkEven(3) as EvenValidation;
```

### Function: Calcuate Age
```sql
drop function if exists getAgeFull(date);
create function getAgeFull(dob date)
returns interval as $$
	BEGIN
		return AGE(now(), dob::date);
	END
$$ LANGUAGE plpgsql;

select 	getAgeFull('2022-12-01') as myAgeFullInfo;
-- output: 1 year 2 mons 18 days 13:07:30.019496
```
- Show age information as year & months
```sql
drop function if exists getAge(date);
create function getAge(dob date)
returns interval as $$
	BEGIN
		return REGEXP_REPLACE((AGE(now(), dob::date)::text), '\d+ days .*', '')::interval;
	END
$$ LANGUAGE plpgsql;

select 	getAge('2022-12-01') as myAge;
-- output: 1 year 2 mons
```
### Function: Gread System : **NESTED-IF STATEMENT**
`percentages 
    below 55 are below average, 
    below of 55-75 are average,
    percentages of 75-90 are Good
    while above 90 is Excellent`
```sql
drop function if exists grade(int);
create or replace function grade(int)
returns text
language plpgsql
as
$BODY$
	declare
		grd text;
		BEGIN
			if($1 <= 55) then grd := 'Below Agerage';
			else
				if($1 > 55 and $1 <= 75) then grd := 'Agerage';
				else 
					if($1 > 75 and $1 <= 90) then grd := 'Good';
					else grd := 'Excellent';
					end if;
				end if;
			end if;
			return grd;
		END;
$BODY$;

select grade(5), grade(55), grade(60), grade(75),
		grade(90), grade(99);
-- Output: "Below Agerage"	"Below Agerage"	"Agerage"	"Agerage"	"Good"	"Excellent"
```

### Function: Print All numbers between a interval: **FOR STATEMENT**
```sql
drop function if exists sumInRange(int, int);
create or replace function sumInRange( i1 int, i2 int)
returns int
Language plpgsql
AS
$BODY$
	DECLARE
		i int;
		s int := 0;
		BEGIN
			if(i2 < i1) then 
				i := i1; i1 := i2; i2 := i;
			end if;
            -- Print latest interval
			raise notice 'New Interval: (%, %)', i1, i2;
			FOR i in i1 .. i2 LOOP
				s := s + i;
			END Loop;
			return s;
		END;
$BODY$;

select sumInRange(2, 5),sumInRange(5, 2);
-- Output: 14	14
```

### Function: Check Prime Number: **BREAK FOR LOOP with condition**
```sql
drop function if exists isPrime(int);
create or replace function isPrime(n int)
returns text
Language plpgsql
as
$BODY$
	DECLARE
		res text := 'Prime Number';
		i int;
		BEGIN
			if(n <= 0) then res := 'Invalid Input';
			else
				if(n = 1) then res := 'Not a Prime or Composite';
				else 
					if(n = 2 or n = 3) then res := res;
					else
						for i in 2 .. (sqrt(n)+1)::int Loop
							raise notice 'div by: mod(%, %)', n, i;
							if(mod(n, i) = 0) then res := 'Composite Number';
							end if;
                            -- for loop break statement
							exit when res like 'Composite Number';
						end loop;
					end if;
				end if;
			end if;
			return res;
		END;
$BODY$;

select isPrime(-1), isPrime(0), isPrime(1), 
		isPrime(2), isPrime(3), isPrime(4);
-- Output: "Invalid Input"	"Invalid Input"	"Not a Prime or Composite"	"Prime Number"	"Prime Number"	"Composite Number"
select isPrime(117), isPrime(131);
-- Output: "Composite Number"	"Prime Number"
```

### Function: print n FIBONACCI Numbers : **For Loop & IF Condition**
```sql
drop function if exists print_n_FibonacciNumber(int);
create or replace function print_n_FibonacciNumber(int)
returns text
Language plpgsql
AS
$body$
	DECLARE
		f0 int := 0; f1 int := 1;
		f int; i int;
		res text := (f0::text || ', ' || f1::text);
		BEGIN
			if($1 = 0) then return f0::text;
			else
				if($1 = 1) then return res;
				else
					for i in 2 .. $1 loop
						f := f1 + f0;
						f0 := f1; f1 := f;
						res := (res || ', ' || f);
					end loop;
					return res;
				end if;
			end if;
		END;
$body$;

select print_n_FibonacciNumber(10);
-- output: "0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55"
```

### Function: Find FIBONACCI Numbers within an interval: **While Loop**
```sql
drop function if exists find_FibonacciNumber(int, int);
create or replace function find_FibonacciNumber(int, int)
returns text
Language plpgsql
AS
$body$
	DECLARE
		f0 int := 0; f1 int := 1;
		f int;
		res text := '';
		BEGIN
			-- interval validation
			if($1 > $2) then
				f := $1; $1 := $2; $2 := f;
			end if;
			
			if(f0 >= $1 and f0 <= $2) then res := (res || ', ' || f0);
			end if;
			if(f1 >= $1 and f1 <= $2) then res := (res || ', ' || f1);
			end if;
			-- While Loop
			while (f1 < $2) loop
				f := f1 + f0;
				f0 := f1; f1 := f;
				if(f >= $1 and f <= $2) then 
					if length(res) = 0 then res := f::text;
					else res := (res || ', ' || f);
					end if;
				end if;
			end loop;
			
			return res;
		END;
$body$;

select find_FibonacciNumber(1000, 100);
-- output: "144, 233, 377, 610, 987"
```

### Function: Find GCD of two integer
-- gcd(a, b) : in build function in PLSQL
```sql
drop function if exists gcdFun(int, int);
create or replace function gcdFun(m int, n int)
returns text
Language plpgsql AS
$body$
	DECLARE	
		t int;
		BEGIN
			if(m < n) then
				t := m; m := n; n := t;
			end if;

			while (mod(m, n) <> 0) loop 
				t := m%n; m := n; n := t;
			end loop;
			return n;
		END;
$body$;

select gcdFun(255, 775), gcd(775, 255);
-- output: 5	5
```

### Function: Find all primes between interval
```sql
-- Prime Number Validation
drop function if exists checkPrime(int);
create or replace function checkPrime(n int)
returns boolean
language plpgsql AS
$CHECKPRIME$
	DECLARE
		i int; _flag boolean := false;
		BEGIN
			if(n<=0 or n=1) then return false;
			else
				if(n=2 or n=3) then return true;
				else
					for i in 2 .. (sqrt(n)+1)::int LOOP
						if(mod(n, i) = 0) then 
							_flag := true;
						end if;
						exit when _flag = true;
					end LOOP;
					return _flag;
				end if;
			end if;
		END;
$CHECKPRIME$;
```
```sql
-- Pass Interval and return all Primes within that interval
drop function if exists findPrimesInInterval(int, int);
create or replace function findPrimesInInterval(int, int)
returns text
language plpgsql
AS
$findPrimesInInterval$
	DECLARE
		t int;
		res text := '';
		BEGIN 
			-- interval validation
			if($1 > $2) then
				t := $1; $1 := $2; $2 := t;
			end if;
			-- for loop
			for t in $1 .. $2 LOOP
				if(checkPrime(t) = true)
					then res := res || ' ' || t::text;
				end if;
			end LOOP;
			-- https://medium.com/@artbindu/how-to-use-regex-in-mysql-5ab60a43a883
			-- start pos: 1 (default), occurance: 0 (match globally)
			return REGEXP_REPLACE(trim(res), ' ', ', ', 1, 0);
		END;
$findPrimesInInterval$;


select findPrimesInInterval(3, 16);
-- Output: "3, 4, 6, 8, 9, 10, 12, 14, 15, 16"
```


### Function: Count number of weekdays between two date
```sql
drop function if exists getWorkingDays(timestamp, timestamp);
create or replace function getWorkingDays(timestamp, timestamp)
returns INT
language plpgsql AS
$FunctionBody$
	DECLARE
		tcount INT := 0; tWeekDays INT := 0;
		_temp timestamp; i INT; dayName TEXT := '';
		BEGIN
			-- date validation
			if($1 > $2) then
				_temp := $1; $1 := $2; $2 := _temp;
			end if;
			-- total days
			tcount := (to_date(date_trunc('day', $2::timestamp)::TEXT, 'YYYY-MM-DD') - 
					  to_date(date_trunc('day', $1::timestamp)::TEXT, 'YYYY-MM-DD')) + 1;
			-- verify working days
			for i in 1 .. tcount LOOP
				if (i = 1) then _temp := $1;
				else _temp := (_temp + INTERVAL '1 day');
				end if;
				-- get day name
				dayName := to_char(_temp::timestamptz, 'Day');
				-- check weekend
				if NOT REGEXP_LIKE(dayName, '(Saturday|Sunday)')
					then tWeekDays := tWeekDays + 1;
				end if;
			end LOOP;
			return tWeekDays;
		END;
$FunctionBody$;


select getWorkingDays('2024-02-01 14:00:00'::timestamp, '2024-03-01 13:00:00'::timestamp)
		as working_days;
-- output: 22
```

### Function: Factorial n
```sql
```

### Function: Calculate nCr & nPr
```sql
```

### Function: Leap Year Validation
```sql
```

## Recursive Function
### Function: compute F(x,y); where: if y<=x then F(x,y)=F(x-y,y) + 1 othrwise F(x,y)=0
```sql
```

### Function: F(n,r): where: F(n,r) = F(n-1,r) + F(n-1,r-1) if n=0 or r=0 or both then F(n,r)= 0
```sql
```

### Function: compute lambda(n): where if n>1 lambda(n)= lambda(n/2) + 1 else lambda(n)= 0
```sql
```

### Function: Fibonacci series using recursive Function
```sql
```

### Function: factorial of a natural number using recursive function
```sql
```

### Function: GCD(a,b) using recursive function
```sql
```

### Function: 'tower of Honai' using recursive function
```sql
```

### Function: 
```sql
```