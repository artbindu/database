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
Delete a Table| `drop table <table_name>`

### 3. Insert/Update data into table
Query Details | Query
-|-
Insert data into table | `insert into <table_name> values (<value_of_key1>, <value_of_key2>, <value_of_key3>, ...)` <br> or <br> `insert into <table_name> (<key1>, <key2>, <key3>) values (<value_of_key1>, <value_of_key2>, <value_of_key3>);`
Update data in sql table | `update <table_name> set <key5> = <value_of_key5> where <key1> = <value_of_key1>;`
Delete a data in sql table | ``
Show data with some condition | `select * from <table_name> where <condition_info_in_sql_format>;`


### Joining 
Query Details | Query
-|-
Inner Join | `SELECT * FROM <table_1> T1 INNER JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;` <br> or <br> `SELECT * FROM <table_1> T1 JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;`
Left Outer Join | `SELECT * FROM <table_1> T1 LEFT OUTER JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;` <br> or <br> `SELECT * FROM <table_1> T1 LEFT JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;`
Right Outer Join | `SELECT * FROM <table_1> T1 RIGHT OUTER JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;` <br> or <br> `SELECT * FROM <table_1> T1 RIGHT JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>;`
Full/Both Outer Join | `(SELECT * FROM <table_1> T1 LEFT OUTER JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>)    UNION       (SELECT * FROM <table_1> T1 RIGHT OUTER JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>);`
Cross Join | `SELECT T1.<key_i> T2.<key_j> FROM <table_1> T1 CROSS JOIN <table_2> T2 ON T1.<Foregian_Key> = T2.<Foregian_Key>`
