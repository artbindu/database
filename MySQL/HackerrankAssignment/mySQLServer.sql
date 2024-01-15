-- Important SQL Query from HackerRank Practice

-- Draw The Triangle 1 (MS SQL Server)
-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
DECLARE @var int              
    SELECT @var = 20               
    WHILE @var > 0                 
    BEGIN                         
    PRINT replicate('* ', @var)   
    SET @var = @var - 1           
END  


-- Draw The Triangle 2 (MS SQL Server)
-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
DECLARE @var int              
    SELECT @var = 1               
    WHILE @var <= 20                 
    BEGIN                         
    PRINT replicate('* ', @var)   
    SET @var = @var + 1           
END

-- The Reports (MS SQL)
-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

SELECT 
    CASE WHEN G.Grade >= 8
        THEN S.Name
        ELSE NULL
    END AS Name, 
    G.Grade AS Grade, S.Marks AS Mark
    FROM Students S JOIN Grades G
         ON Mark >= G.Min_Mark
         AND Mark <=  G.Max_Mark
    ORDER BY Grade DESC, Name ASC;

-- Occupations (INPROGRESS)
--   https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

-- select name from OCCUPATIONS where occupation like 'Doctor' order by name;
-- select name from OCCUPATIONS where occupation like 'Professor' order by name;
-- select name from OCCUPATIONS where occupation like 'Singer' order by name;  
-- select name from OCCUPATIONS where occupation like 'Actor' order by name;
-- select count(*), CEIL(count(*)/4) from OCCUPATIONS;

-- select count(*) from OCCUPATIONS where occupation like 'Doctor';
-- select count(*) from OCCUPATIONS where occupation like 'Professor';
-- select count(*) from OCCUPATIONS where occupation like 'Singer';  
-- select count(*) from OCCUPATIONS where occupation like 'Actor';
    
-- select 
--     (select name from OCCUPATIONS where occupation like 'Doctor' 
--         order by name limit (select CEIL(count(*)/4) from OCCUPATIONS)) as Doctor,
--     (select name from OCCUPATIONS where occupation like 'Professor' 
--         order by name limit (select CEIL(count(*)/4) from OCCUPATIONS)) as Professor,
--     (select name from OCCUPATIONS where occupation like 'Singer' 
--         order by name limit (select CEIL(count(*)/4) from OCCUPATIONS)) as Singer,  
--     (select name from OCCUPATIONS where occupation like 'Actor' 
--         order by name limit (select CEIL(count(*)/4) from OCCUPATIONS)) as Actor;


-- select name from OCCUPATIONS where occupation like 'Professor' 
--         order by name limit (select CEIL(count(*)/4) from OCCUPATIONS);


select GREATEST(
    select count(*) from OCCUPATIONS where occupation like 'Doctor',
    select count(*) from OCCUPATIONS where occupation like 'Professor',
    select count(*) from OCCUPATIONS where occupation like 'Singer',  
    select count(*) from OCCUPATIONS where occupation like 'Actor'    
) as max_row;


-- weather-observation-station-20 (Find Medium of Latitude values)
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
select ROUND((
    (SELECT MAX(LAT_N) from (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N ASC) as half_min_max_val)
        +
    (SELECT MIN(LAT_N) from (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N DESC) as half_max_min_val)
    )/2, 4) as medium_val;

