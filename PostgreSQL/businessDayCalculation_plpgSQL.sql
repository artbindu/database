-- **************************************************************************************
-- *********** PLpg/SQL Function : Find Range of Business Day Expiration ****************
-- **************************************************************************************
drop function if exists businessTime_Expiration(TIMESTAMP, int, VARCHAR);
create or replace function businessTime_Expiration(input_start_dt TIMESTAMP, duration int, duration_type VARCHAR(20))
returns TIMESTAMP
language plpgsql AS $$
	DECLARE
		start_dt TIMESTAMP := input_start_dt; 
		sla_expiration_time TIMESTAMP := input_start_dt; 
		nonWorkingDayCount int := 0;
		-- static data
		business_hr_st_time time := '08:00:00'::time;
		business_hr_ed_time time := '16:59:59'::time;
		
		BEGIN
			if((to_timestamp(start_dt::VARCHAR(20), 'YYYY-MM-DD HH24:MI:SS.s')::time) < business_hr_st_time) then
				sla_expiration_time := concat(start_dt::date, ' ', business_hr_st_time)::TIMESTAMP;
			else sla_expiration_time := start_dt;
			end if;
			CASE (lower(duration_type))
				WHEN('businessdays') THEN
					sla_expiration_time := sla_expiration_time + (duration || ' DAY')::INTERVAL;
					-- raise notice 'sla_expiration_time: %', sla_expiration_time;
					-- Validate End Time
					if(to_timestamp(sla_expiration_time::VARCHAR(20), 'YYYY-MM-DD HH24:MI:SS.s')::time > business_hr_ed_time) then
						sla_expiration_time := concat(sla_expiration_time::date, ' ', business_hr_ed_time)::TIMESTAMP;
					end if;
					if(to_timestamp(sla_expiration_time::VARCHAR(20), 'YYYY-MM-DD HH24:MI:SS.s')::time = business_hr_st_time) then
						sla_expiration_time := sla_expiration_time + (-1 || ' DAY')::INTERVAL;
						sla_expiration_time := concat(sla_expiration_time::date, ' ', business_hr_ed_time)::TIMESTAMP;
					end if;
					-- Holiday Validation
					nonWorkingDayCount := count(*) from ContractHolidayList_test1 DD
								where DD.full_date between date_trunc('day', start_dt) and date_trunc('day', sla_expiration_time);
					-- raise notice 'nonWorkingDayCount: %', nonWorkingDayCount;
					sla_expiration_time := sla_expiration_time + (nonWorkingDayCount || ' DAY')::INTERVAL;
					LOOP
						nonWorkingDayCount := count(*) from ContractHolidayList_test1 DD
									where DD.full_date = date_trunc('day', sla_expiration_time);
						-- raise notice '% is Holiday: %', sla_expiration_time, (nonWorkingDayCount::bool)::varchar(10);
						EXIT WHEN(nonWorkingDayCount::bool = false);
						sla_expiration_time := sla_expiration_time + (1 || ' DAY')::INTERVAL;
					END LOOP;
				ELSE
					return NULL::TIMESTAMP;
			END CASE;
			raise notice '::::::::::::::::start_data: %, (%), Exp_date:% ::::::::::::::::', start_dt,duration,sla_expiration_time;
			return sla_expiration_time;
		END;
$$;
-- Select businessTime_Expiration('2024-02-29 09:00:00 AM'::timestamp, 2, 'BusinessDays');


-- select * from ContractHolidayList_test1 DD
-- 			where DD.full_date > date_trunc('day', '2024-03-03 09:00:00'::timestamp);
								
Select businessTime_Expiration('2024-02-28 07:00:00 AM'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 08:00:00 AM'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 08:00:01 AM'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 02:30:00 PM'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 16:59:59'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 17:00:00'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 17:00:01'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-28 23:00:01'::timestamp, 3, 'BusinessDays'),
	businessTime_Expiration('2024-02-29 7:00:01'::timestamp, 3, 'BusinessDays');
	
-- 	select * from ContractHolidayList_test1