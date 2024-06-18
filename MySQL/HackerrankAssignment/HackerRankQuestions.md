# Important HackerRank Question & Answer

### 1. [Show Selected OCCUPATIONS Person Name with selective way](https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true)
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

```sql
WITH RECURSIVE cte AS (
    -- Create a mysql table from 1 to n numbers
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM cte 
    WHERE n < (
        select max(rn) from ( 
            SELECT Name,  Occupation,
                ROW_NUMBER()  OVER (PARTITION BY Occupation ORDER BY Name) as rn
            FROM OCCUPATIONS 
            WHERE LOWER(Occupation) in ('doctor' , 'professor',  'singer', 'actor' )
            ORDER BY Name
        ) t 
    )
),
t1 as (
    SELECT Name,  
    ROW_NUMBER()  OVER (PARTITION BY NULL ORDER BY Name) as rn
    FROM OCCUPATIONS 
    WHERE LOWER(Occupation) = 'doctor' 
    ORDER BY Name
),
 t2 as (
     SELECT Name,  
    ROW_NUMBER()  OVER (PARTITION BY NULL ORDER BY Name) as rn
    FROM OCCUPATIONS 
    WHERE LOWER(Occupation) = 'professor' 
    ORDER BY Name
 ),
 t3 as (
     SELECT Name,  
    ROW_NUMBER()  OVER (PARTITION BY NULL ORDER BY Name) as rn
    FROM OCCUPATIONS 
    WHERE LOWER(Occupation) = 'singer' 
    ORDER BY Name
 ),
 t4 as (
     SELECT Name,  
    ROW_NUMBER()  OVER (PARTITION BY NULL ORDER BY Name) as rn
    FROM OCCUPATIONS 
    WHERE LOWER(Occupation) = 'actor' 
    ORDER BY Name
 )
 select 
 -- cte.n, 
    t1.name as doctor_name,
    t2.name as professor_name,
    t3.name as singer_name,
    t4.name as actor_name
from cte
left join t1
    on cte.n = t1.rn
left join t2
    on cte.n = t2.rn
left join t3
    on cte.n = t3.rn
left join t4
    on cte.n = t4.rn