

DELIMITER $$
CREATE FUNCTION Func_Cube
(
 Num INT
)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE TotalCube INT;
    SET TotalCube = Num * Num * Num;
    RETURN TotalCube; 
END$$
DELIMITER ;

select Func_Cube(2);
