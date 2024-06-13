-- use artbindu;
drop table if exists TT;
CREATE TABLE TT (
    col1 int,
    col2 varchar(255),
    col3 varchar(255)
);
-- SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\tt.csv'
INTO TABLE TT
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Select * from TT;

