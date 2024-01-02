MySQL Repo Path: C:\Program Files\MySQL\MySQL Server 8.0\bin
mysql -u root -p


Basic Query  Query
### 1. Data base Creation & Update:
Query Details | Query
-|-
Show All Database Name | `show databases;`
Create new data base | `create database <database_name>;`
Move to a data base | `use <database_name>;`
Delete a data base| ``

### 2. Table Creation & UPdate
Query Details | Query
-|-
Create Table | `Crate table <table_name> (<key1> <key_dataType> Primary key, <key2> <key_dataType>, <key3> <key_datatype>, ... );`
Show Table Information | `desc <table_name>;`
Delete a Table| ``

### 3. Insert/Update data into table
Query Details | Query
-|-
Insert data into table | `insert into <table_name> values (<value_of_key1>, <value_of_key2>, <value_of_key3>, ...)` <br> or <br> `insert into <table_name> (<key1>, <key2>, <key3>) values (<value_of_key1>, <value_of_key2>, <value_of_key3>);`
Update data in sql table | `update <table_name> set <key5> = <value_of_key5> where <key1> = <value_of_key1>;`
Delete a data in sql table | ``
Show data with some condition | `select * from <table_name> where <condition_info_in_sql_format>;`

