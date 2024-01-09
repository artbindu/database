### 'Replace'
`select sal, REPLACE(sal, '0', '') from empinfo;`
- Print salary without '0'

### 'Regex'
- Find Employee name not starting & ending with vowels

    `select ename from empinfo where ename REGEXP '^[^(AEIOUaeiou)].*[^(AEIOUaeiou)]$';`

### 'SQL String Function'
- ASCII
- UPPER, LOWER
- 
### 'SQL Numerical Function'
- RAND
- ROUND, CELLING, FLOOR
- SUM, AVG, COUNT
- MAX, MIN, ABS
- LOG, LOG10, EXP
- POWER, SQRT, SQUARE
- PI, RADIANS, DEGREES
- SIN, COS, TAN, COT, ASIN, ACOS, ATAN