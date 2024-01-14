-- Hacker Rank MySQL Server FUNCTION

-- Draw The Triangle 1
-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
DECLARE @var int              
SELECT @var = 20               
WHILE @var > 0                 
BEGIN                         
PRINT replicate('* ', @var)   
SET @var = @var - 1           
END  


-- Draw The Triangle 2
-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=true
DECLARE @var int              
SELECT @var = 1               
WHILE @var <= 20                 
BEGIN                         
PRINT replicate('* ', @var)   
SET @var = @var + 1           
END