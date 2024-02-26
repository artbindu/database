-- =======================Function===========================================
drop function if exists addUnitsFuns;
create or replace function addUnitsFuns(duration int,unit varchar(20), input_date timestamp)
returns timestamp
language plpgsql as $$
    DECLARE
        output_date timestamp;
    BEGIN
        CASE (lower(unit))
            WHEN 'days' 
                THEN output_date := input_date + (duration || ' DAY')::INTERVAL;
            WHEN 'hours' 
                THEN output_date := input_date + (duration || ' HOUR')::INTERVAL;
            WHEN 'minutes' 
                THEN output_date := input_date + (duration || ' MINUTE')::INTERVAL;
            WHEN 'seconds' 
                THEN output_date := input_date + (duration || ' SECOND')::INTERVAL;
        END CASE;
        input_date := output_date;
        raise notice 'BM: %', input_date;
        return input_date::timestamp;
    END;
$$;

select * from tbluser;
select *, addUnitsFuns(id, 'days', '2024-02-23 14:30:00'::timestamp) as col11 from tbluser;
ALTER TABLE tbluser drop COLUMN col11

-- =========================procedure=========================================
drop procedure if exists addUnits(in duration int, in unit varchar(20), inout input_date timestamp);
create or replace procedure addUnits(in duration int, in unit varchar(20), inout input_date timestamp)
language plpgsql as $$
    DECLARE
        output_date timestamp;
		BEGIN
			CASE (lower(unit))
				WHEN 'days' 
					THEN output_date := input_date + (duration || ' DAY')::INTERVAL;
				WHEN 'hours' 
					THEN output_date := input_date + (duration || ' HOUR')::INTERVAL;
				WHEN 'minutes' 
					THEN output_date := input_date + (duration || ' MINUTE')::INTERVAL;
				WHEN 'seconds' 
					THEN output_date := input_date + (duration || ' SECOND')::INTERVAL;
			END CASE;
			input_date := output_date;
			raise notice 'BM: %', input_date;
		END;
$$;
-- =========================another==procedure=========================================
DROP PROCEDURE IF EXISTS AddColumnToTable(
	IN tableName VARCHAR, IN newColumnName VARCHAR,
	IN columnDefinition VARCHAR);
CREATE OR REPLACE PROCEDURE AddColumnToTable (
    IN tableName VARCHAR(20), IN newColumnName VARCHAR(20),
    IN columnDefinition VARCHAR(20))
language plpgsql as 
$$
	DECLARE
		retDate TIMESTAMP;
		drop_column_query varchar(100) := 'ALTER TABLE tbluser DROP COLUMN if exists dateColumn';
		create_column_query varchar(100) := 'ALTER TABLE tbluser ADD COLUMN dateColumn TIMESTAMP';
		BEGIN
			EXECUTE drop_column_query;
			EXECUTE create_column_query;
			drop table if exists otherTable;
			CREATE TABLE otherTable as select * from tbluser;
 			-- EXECUTE 'ALTER TABLE otherTable ADD COLUMN retDate TIMESTAMP';
			-- INSERT INTO tbluser DEFAULT VALUES RETURNING id INTO otherTable;
			PERFORM addUnits(tbluser.id::INT, 'days', '2024-02-23 14:30:00'::TIMESTAMP) INTO dateTable;
			-- UPDATE tbluser set dateColumn = PERFORM addUnits(tbluser.id, 'days', '2024-02-23 14:30:00'::TIMESTAMP);
		END;
$$;
-- first procedure function call----
call addUnits(5, 'days', '2024-02-23 14:30:00'::TIMESTAMP);
--- procedure function ---
call AddColumnToTable('tbluser', 'col12', 'TIMESTAMP');

ALTER TABLE tbluser DROP COLUMN col12;
select * from tbluser;
CREATE TABLE otherTable as select * from tbluser;
select * from otherTable;
UPDATE tbluser set col1 = 'hello world';
drop table otherTable;
select * from dateTable;





