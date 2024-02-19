/*
https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50


Weather: id (int) | recordDate(date) | temperature (int)
Find id of table where today temperature > previous day temperature
*/


select twoDay_Weather.id from (
                select W1.id as id, W1.recordDate as today, W1.temperature as today_temp,
                    W2.id as pid, W2.recordDate as pastday, W2.temperature as pastday_temp
                    from Weather W1 inner join Weather W2
                    on W1.id = W2.id+1
                    where W1.id = (W2.id +1)
        ) as twoDay_Weather
    where twoDay_Weather.today_temp > twoDay_Weather.pastday_temp;