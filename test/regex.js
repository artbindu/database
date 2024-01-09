const fs = require('fs')


function filterData(_st) {
// Data which will write in a file.
let data = _st.match(/(?<=\"\>)[a-z ]+(?=\<\/)/gim).toString();
data = data.split(',').join(', #### ');
// Write data in 'Output.txt' .
fs.writeFile('textFilter.txt', data, (err) => {
 
    // In case of a error throw err.
    if (err) throw err;
});

}

 

var st = `<div id="leftmenuinnerinner">
<!--  <a href='javascript:void(0)' onclick='close_menu()' class='w3-button w3-hide-large w3-large w3-display-topright' style='right:16px;padding:3px 12px;font-weight:bold;'>&times;</a>-->
<h2 class="left"><span class="left_h2">SQL</span> Tutorial</h2>
<a target="_top" href="default.asp">SQL HOME</a>
<a target="_top" href="sql_intro.asp">SQL Intro</a>
<a target="_top" href="sql_syntax.asp">SQL Syntax</a>
<a target="_top" href="sql_select.asp">SQL Select</a>
<a target="_top" href="sql_distinct.asp">SQL Select Distinct</a>
<a target="_top" href="sql_where.asp">SQL Where</a>
<a target="_top" href="sql_orderby.asp">SQL Order By</a>
<a target="_top" href="sql_and_or.asp">SQL And</a>
<a target="_top" href="sql_or.asp">SQL Or</a>
<a target="_top" href="sql_not.asp">SQL Not</a>
<a target="_top" href="sql_insert.asp">SQL Insert Into</a>
<a target="_top" href="sql_null_values.asp">SQL Null Values</a>
<a target="_top" href="sql_update.asp">SQL Update</a>
<a target="_top" href="sql_delete.asp">SQL Delete</a>
<a target="_top" href="sql_top.asp">SQL Select Top</a>
<a target="_top" href="sql_min_max.asp">SQL Min and Max</a>
<a target="_top" href="sql_count.asp">SQL Count</a>
<a target="_top" href="sql_sum.asp">SQL Sum</a>
<a target="_top" href="sql_avg.asp">SQL Avg</a>
<a target="_top" href="sql_like.asp">SQL Like</a>
<a target="_top" href="sql_wildcards.asp">SQL Wildcards</a>
<a target="_top" href="sql_in.asp">SQL In</a>
<a target="_top" href="sql_between.asp">SQL Between</a>
<a target="_top" href="sql_alias.asp">SQL Aliases</a>
<a target="_top" href="sql_join.asp">SQL Joins</a>
<a target="_top" href="sql_join_inner.asp">SQL Inner Join</a>
<a target="_top" href="sql_join_left.asp">SQL Left Join</a>
<a target="_top" href="sql_join_right.asp">SQL Right Join</a>
<a target="_top" href="sql_join_full.asp">SQL Full Join</a>
<a target="_top" href="sql_join_self.asp">SQL Self Join</a>
<a target="_top" href="sql_union.asp">SQL Union</a>
<a target="_top" href="sql_groupby.asp">SQL Group By</a>
<a target="_top" href="sql_having.asp">SQL Having</a>
<a target="_top" href="sql_exists.asp">SQL Exists</a>
<a target="_top" href="sql_any_all.asp">SQL Any, All</a>
<a target="_top" href="sql_select_into.asp">SQL Select Into</a>
<a target="_top" href="sql_insert_into_select.asp">SQL Insert Into Select</a>
<a target="_top" href="sql_case.asp">SQL Case</a>
<a target="_top" href="sql_isnull.asp">SQL Null Functions</a>
<a target="_top" href="sql_stored_procedures.asp">SQL Stored Procedures</a>
<a target="_top" href="sql_comments.asp">SQL Comments</a>
<a target="_top" href="sql_operators.asp">SQL Operators</a>
<br>
<h2 class="left"><span class="left_h2">SQL</span> Database</h2>
<a target="_top" href="sql_create_db.asp" class="active">SQL Create DB</a>
<a target="_top" href="sql_drop_db.asp">SQL Drop DB</a>
<a target="_top" href="sql_backup_db.asp">SQL Backup DB</a>
<a target="_top" href="sql_create_table.asp">SQL Create Table</a>
<a target="_top" href="sql_drop_table.asp">SQL Drop Table</a>
<a target="_top" href="sql_alter.asp">SQL Alter Table</a>
<a target="_top" href="sql_constraints.asp">SQL Constraints</a>
<a target="_top" href="sql_notnull.asp">SQL Not Null</a>
<a target="_top" href="sql_unique.asp">SQL Unique</a>
<a target="_top" href="sql_primarykey.asp">SQL Primary Key</a>
<a target="_top" href="sql_foreignkey.asp">SQL Foreign Key</a>
<a target="_top" href="sql_check.asp">SQL Check</a>
<a target="_top" href="sql_default.asp">SQL Default</a>
<a target="_top" href="sql_create_index.asp">SQL Index</a>
<a target="_top" href="sql_autoincrement.asp">SQL Auto Increment</a>
<a target="_top" href="sql_dates.asp">SQL Dates</a>
<a target="_top" href="sql_view.asp">SQL Views</a>
<a target="_top" href="sql_injection.asp">SQL Injection</a>
<a target="_top" href="sql_hosting.asp">SQL Hosting</a>
<a target="_top" href="sql_datatypes.asp">SQL Data Types</a>
<br>
<h2 class="left"><span class="left_h2">SQL</span> References</h2>

<a target="_top" href="sql_ref_keywords.asp">SQL Keywords</a>
<div class="ref_overview" style="margin-left:10px;">
  <a target="_top" href="sql_ref_add.asp">ADD</a>
  <a target="_top" href="sql_ref_add_constraint.asp">ADD CONSTRAINT</a>
  <a target="_top" href="sql_ref_all.asp">ALL</a>
  <a target="_top" href="sql_ref_alter.asp">ALTER</a>
  <a target="_top" href="sql_ref_alter_column.asp">ALTER COLUMN</a>
  <a target="_top" href="sql_ref_alter_table.asp">ALTER TABLE</a>
  <a target="_top" href="sql_ref_and.asp">AND</a>
  <a target="_top" href="sql_ref_any.asp">ANY</a>
  <a target="_top" href="sql_ref_as.asp">AS</a>
  <a target="_top" href="sql_ref_asc.asp">ASC</a>
  <a target="_top" href="sql_ref_backup_database.asp">BACKUP DATABASE</a>
  <a target="_top" href="sql_ref_between.asp">BETWEEN</a>
  <a target="_top" href="sql_ref_case.asp">CASE</a>
  <a target="_top" href="sql_ref_check.asp">CHECK</a>
  <a target="_top" href="sql_ref_column.asp">COLUMN</a>
  <a target="_top" href="sql_ref_constraint.asp">CONSTRAINT</a>
  <a target="_top" href="sql_ref_create.asp">CREATE</a>
  <a target="_top" href="sql_ref_create_database.asp">CREATE DATABASE</a>
  <a target="_top" href="sql_ref_create_index.asp">CREATE INDEX</a>
  <a target="_top" href="sql_ref_create_or_replace_view.asp">CREATE OR REPLACE VIEW</a>
  <a target="_top" href="sql_ref_create_table.asp">CREATE TABLE</a>
  <a target="_top" href="sql_ref_create_procedure.asp">CREATE PROCEDURE</a>
  <a target="_top" href="sql_ref_create_unique_index.asp">CREATE UNIQUE INDEX</a>
  <a target="_top" href="sql_ref_create_view.asp">CREATE VIEW</a>
  <a target="_top" href="sql_ref_database.asp">DATABASE</a>
  <a target="_top" href="sql_ref_default.asp">DEFAULT</a>
  <a target="_top" href="sql_ref_delete.asp">DELETE</a>
  <a target="_top" href="sql_ref_desc.asp">DESC</a>
  <a target="_top" href="sql_ref_distinct.asp">DISTINCT</a>
  <a target="_top" href="sql_ref_drop.asp">DROP</a>
  <a target="_top" href="sql_ref_drop_column.asp">DROP COLUMN</a>
  <a target="_top" href="sql_ref_drop_constraint.asp">DROP CONSTRAINT</a>
  <a target="_top" href="sql_ref_drop_database.asp">DROP DATABASE</a>
  <a target="_top" href="sql_ref_drop_default.asp">DROP DEFAULT</a>
  <a target="_top" href="sql_ref_drop_index.asp">DROP INDEX</a>
  <a target="_top" href="sql_ref_drop_table.asp">DROP TABLE</a>
  <a target="_top" href="sql_ref_drop_view.asp">DROP VIEW</a>
  <a target="_top" href="sql_ref_exec.asp">EXEC</a>
  <a target="_top" href="sql_ref_exists.asp">EXISTS</a>
  <a target="_top" href="sql_ref_foreign_key.asp">FOREIGN KEY</a>
  <a target="_top" href="sql_ref_from.asp">FROM</a>
  <a target="_top" href="sql_ref_full_outer_join.asp">FULL OUTER JOIN</a>
  <a target="_top" href="sql_ref_group_by.asp">GROUP BY</a>
  <a target="_top" href="sql_ref_having.asp">HAVING</a>
  <a target="_top" href="sql_ref_in.asp">IN</a>
  <a target="_top" href="sql_ref_index.asp">INDEX</a>
  <a target="_top" href="sql_ref_inner_join.asp">INNER JOIN</a>
  <a target="_top" href="sql_ref_insert_into.asp">INSERT INTO</a>
  <a target="_top" href="sql_ref_insert_into_select.asp">INSERT INTO SELECT</a>
  <a target="_top" href="sql_ref_is_null.asp">IS NULL</a>
  <a target="_top" href="sql_ref_is_not_null.asp">IS NOT NULL</a>
  <a target="_top" href="sql_ref_join.asp">JOIN</a>
  <a target="_top" href="sql_ref_left_join.asp">LEFT JOIN</a>
  <a target="_top" href="sql_ref_like.asp">LIKE</a>
  <a target="_top" href="sql_ref_limit.asp">LIMIT</a>
  <a target="_top" href="sql_ref_not.asp">NOT</a>
  <a target="_top" href="sql_ref_not_null.asp">NOT NULL</a>
  <a target="_top" href="sql_ref_or.asp">OR</a>
  <a target="_top" href="sql_ref_order_by.asp">ORDER BY</a>
  <a target="_top" href="sql_ref_outer_join.asp">OUTER JOIN</a>
  <a target="_top" href="sql_ref_primary_key.asp">PRIMARY KEY</a>
  <a target="_top" href="sql_ref_procedure.asp">PROCEDURE</a>
  <a target="_top" href="sql_ref_right_join.asp">RIGHT JOIN</a>
  <a target="_top" href="sql_ref_rownum.asp">ROWNUM</a>
  <a target="_top" href="sql_ref_select.asp">SELECT</a>
  <a target="_top" href="sql_ref_select_distinct.asp">SELECT DISTINCT</a>
  <a target="_top" href="sql_ref_select_into.asp">SELECT INTO</a>
  <a target="_top" href="sql_ref_select_top.asp">SELECT TOP</a>
  <a target="_top" href="sql_ref_set.asp">SET</a>
  <a target="_top" href="sql_ref_table.asp">TABLE</a>
  <a target="_top" href="sql_ref_top.asp">TOP</a>
  <a target="_top" href="sql_ref_truncate_table.asp">TRUNCATE TABLE</a>
  <a target="_top" href="sql_ref_union.asp">UNION</a>
  <a target="_top" href="sql_ref_union_all.asp">UNION ALL</a>
  <a target="_top" href="sql_ref_unique.asp">UNIQUE</a>
  <a target="_top" href="sql_ref_update.asp">UPDATE</a>
  <a target="_top" href="sql_ref_values.asp">VALUES</a>
  <a target="_top" href="sql_ref_view.asp">VIEW</a>
  <a target="_top" href="sql_ref_where.asp">WHERE</a>
</div>

<a target="_top" href="sql_ref_mysql.asp">MySQL Functions</a>
<div class="ref_overview" style="margin-left:10px;">
  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:2px;font-style:italic;">String Functions:</span>
  <a target="_top" href="func_mysql_ascii.asp">ASCII</a>
  <a target="_top" href="func_mysql_char_length.asp">CHAR_LENGTH</a>
  <a target="_top" href="func_mysql_character_length.asp">CHARACTER_LENGTH</a>
  <a target="_top" href="func_mysql_concat.asp">CONCAT</a>
  <a target="_top" href="func_mysql_concat_ws.asp">CONCAT_WS</a>
  <a target="_top" href="func_mysql_field.asp">FIELD</a>
  <a target="_top" href="func_mysql_find_in_set.asp">FIND_IN_SET</a>
  <a target="_top" href="func_mysql_format.asp">FORMAT</a>
  <a target="_top" href="func_mysql_insert.asp">INSERT</a>
  <a target="_top" href="func_mysql_instr.asp">INSTR</a>
  <a target="_top" href="func_mysql_lcase.asp">LCASE</a>
  <a target="_top" href="func_mysql_left.asp">LEFT</a>
  <a target="_top" href="func_mysql_length.asp">LENGTH</a>
  <a target="_top" href="func_mysql_locate.asp">LOCATE</a>
  <a target="_top" href="func_mysql_lower.asp">LOWER</a>
  <a target="_top" href="func_mysql_lpad.asp">LPAD</a>
  <a target="_top" href="func_mysql_ltrim.asp">LTRIM</a>
  <a target="_top" href="func_mysql_mid.asp">MID</a>
  <a target="_top" href="func_mysql_position.asp">POSITION</a>
  <a target="_top" href="func_mysql_repeat.asp">REPEAT</a>
  <a target="_top" href="func_mysql_replace.asp">REPLACE</a>
  <a target="_top" href="func_mysql_reverse.asp">REVERSE</a>
  <a target="_top" href="func_mysql_right.asp">RIGHT</a>
  <a target="_top" href="func_mysql_rpad.asp">RPAD</a>
  <a target="_top" href="func_mysql_rtrim.asp">RTRIM</a>
  <a target="_top" href="func_mysql_space.asp">SPACE</a>
  <a target="_top" href="func_mysql_strcmp.asp">STRCMP</a>
  <a target="_top" href="func_mysql_substr.asp">SUBSTR</a>
  <a target="_top" href="func_mysql_substring.asp">SUBSTRING</a>
  <a target="_top" href="func_mysql_substring_index.asp">SUBSTRING_INDEX</a>
  <a target="_top" href="func_mysql_trim.asp">TRIM</a>
  <a target="_top" href="func_mysql_ucase.asp">UCASE</a>
  <a target="_top" href="func_mysql_upper.asp">UPPER</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Numeric Functions:</span>
  <a target="_top" href="func_mysql_abs.asp">ABS</a>
  <a target="_top" href="func_mysql_acos.asp">ACOS</a>
  <a target="_top" href="func_mysql_asin.asp">ASIN</a>
  <a target="_top" href="func_mysql_atan.asp">ATAN</a>
  <a target="_top" href="func_mysql_atan2.asp">ATAN2</a>
  <a target="_top" href="func_mysql_avg.asp">AVG</a>
  <a target="_top" href="func_mysql_ceil.asp">CEIL</a>
  <a target="_top" href="func_mysql_ceiling.asp">CEILING</a>
  <a target="_top" href="func_mysql_cos.asp">COS</a>
  <a target="_top" href="func_mysql_cot.asp">COT</a>
  <a target="_top" href="func_mysql_count.asp">COUNT</a>
  <a target="_top" href="func_mysql_degrees.asp">DEGREES</a>
  <a target="_top" href="func_mysql_div.asp">DIV</a>
  <a target="_top" href="func_mysql_exp.asp">EXP</a>
  <a target="_top" href="func_mysql_floor.asp">FLOOR</a>
  <a target="_top" href="func_mysql_greatest.asp">GREATEST</a>
  <a target="_top" href="func_mysql_least.asp">LEAST</a>
  <a target="_top" href="func_mysql_ln.asp">LN</a>
  <a target="_top" href="func_mysql_log.asp">LOG</a>
  <a target="_top" href="func_mysql_log10.asp">LOG10</a>
  <a target="_top" href="func_mysql_log2.asp">LOG2</a>
  <a target="_top" href="func_mysql_max.asp">MAX</a>
  <a target="_top" href="func_mysql_min.asp">MIN</a>
  <a target="_top" href="func_mysql_mod.asp">MOD</a>
  <a target="_top" href="func_mysql_pi.asp">PI</a>
  <a target="_top" href="func_mysql_pow.asp">POW</a>
  <a target="_top" href="func_mysql_power.asp">POWER</a>
  <a target="_top" href="func_mysql_radians.asp">RADIANS</a>
  <a target="_top" href="func_mysql_rand.asp">RAND</a>
  <a target="_top" href="func_mysql_round.asp">ROUND</a>
  <a target="_top" href="func_mysql_sign.asp">SIGN</a>
  <a target="_top" href="func_mysql_sin.asp">SIN</a>
  <a target="_top" href="func_mysql_sqrt.asp">SQRT</a>
  <a target="_top" href="func_mysql_sum.asp">SUM</a>
  <a target="_top" href="func_mysql_tan.asp">TAN</a>
  <a target="_top" href="func_mysql_truncate.asp">TRUNCATE</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Date Functions:</span>
  <a target="_top" href="func_mysql_adddate.asp">ADDDATE</a>
  <a target="_top" href="func_mysql_addtime.asp">ADDTIME</a>
  <a target="_top" href="func_mysql_curdate.asp">CURDATE</a>
  <a target="_top" href="func_mysql_current_date.asp">CURRENT_DATE</a>
  <a target="_top" href="func_mysql_current_time.asp">CURRENT_TIME</a>
  <a target="_top" href="func_mysql_current_timestamp.asp">CURRENT_TIMESTAMP</a>
  <a target="_top" href="func_mysql_curtime.asp">CURTIME</a>
  <a target="_top" href="func_mysql_date.asp">DATE</a>
  <a target="_top" href="func_mysql_datediff.asp">DATEDIFF</a>
  <a target="_top" href="func_mysql_date_add.asp">DATE_ADD</a>
  <a target="_top" href="func_mysql_date_format.asp">DATE_FORMAT</a>
  <a target="_top" href="func_mysql_date_sub.asp">DATE_SUB</a>
  <a target="_top" href="func_mysql_day.asp">DAY</a>
  <a target="_top" href="func_mysql_dayname.asp">DAYNAME</a>
  <a target="_top" href="func_mysql_dayofmonth.asp">DAYOFMONTH</a>
  <a target="_top" href="func_mysql_dayofweek.asp">DAYOFWEEK</a>
  <a target="_top" href="func_mysql_dayofyear.asp">DAYOFYEAR</a>
  <a target="_top" href="func_mysql_extract.asp">EXTRACT</a>
  <a target="_top" href="func_mysql_from_days.asp">FROM_DAYS</a>
  <a target="_top" href="func_mysql_hour.asp">HOUR</a>
  <a target="_top" href="func_mysql_last_day.asp">LAST_DAY</a>
  <a target="_top" href="func_mysql_localtime.asp">LOCALTIME</a>
  <a target="_top" href="func_mysql_localtimestamp.asp">LOCALTIMESTAMP</a>
  <a target="_top" href="func_mysql_makedate.asp">MAKEDATE</a>
  <a target="_top" href="func_mysql_maketime.asp">MAKETIME</a>
  <a target="_top" href="func_mysql_microsecond.asp">MICROSECOND</a>
  <a target="_top" href="func_mysql_minute.asp">MINUTE</a>
  <a target="_top" href="func_mysql_month.asp">MONTH</a>
  <a target="_top" href="func_mysql_monthname.asp">MONTHNAME</a>
  <a target="_top" href="func_mysql_now.asp">NOW</a>
  <a target="_top" href="func_mysql_period_add.asp">PERIOD_ADD</a>
  <a target="_top" href="func_mysql_period_diff.asp">PERIOD_DIFF</a>
  <a target="_top" href="func_mysql_quarter.asp">QUARTER</a>
  <a target="_top" href="func_mysql_second.asp">SECOND</a>
  <a target="_top" href="func_mysql_sec_to_time.asp">SEC_TO_TIME</a>
  <a target="_top" href="func_mysql_str_to_date.asp">STR_TO_DATE</a>
  <a target="_top" href="func_mysql_subdate.asp">SUBDATE</a>
  <a target="_top" href="func_mysql_subtime.asp">SUBTIME</a>
  <a target="_top" href="func_mysql_sysdate.asp">SYSDATE</a>
  <a target="_top" href="func_mysql_time.asp">TIME</a>
  <a target="_top" href="func_mysql_time_format.asp">TIME_FORMAT</a>
  <a target="_top" href="func_mysql_time_to_sec.asp">TIME_TO_SEC</a>
  <a target="_top" href="func_mysql_timediff.asp">TIMEDIFF</a>
  <a target="_top" href="func_mysql_timestamp.asp">TIMESTAMP</a>
  <a target="_top" href="func_mysql_to_days.asp">TO_DAYS</a>
  <a target="_top" href="func_mysql_week.asp">WEEK</a>
  <a target="_top" href="func_mysql_weekday.asp">WEEKDAY</a>
  <a target="_top" href="func_mysql_weekofyear.asp">WEEKOFYEAR</a>
  <a target="_top" href="func_mysql_year.asp">YEAR</a>
  <a target="_top" href="func_mysql_yearweek.asp">YEARWEEK</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Advanced Functions:</span>
  <a target="_top" href="func_mysql_bin.asp">BIN</a>
  <a target="_top" href="func_mysql_binary.asp">BINARY</a>
  <a target="_top" href="func_mysql_case.asp">CASE</a>
  <a target="_top" href="func_mysql_cast.asp">CAST</a>
  <a target="_top" href="func_mysql_coalesce.asp">COALESCE</a>
  <a target="_top" href="func_mysql_connection_id.asp">CONNECTION_ID</a>
  <a target="_top" href="func_mysql_conv.asp">CONV</a>
  <a target="_top" href="func_mysql_convert.asp">CONVERT</a>
  <a target="_top" href="func_mysql_current_user.asp">CURRENT_USER</a>
  <a target="_top" href="func_mysql_database.asp">DATABASE</a>
  <a target="_top" href="func_mysql_if.asp">IF</a>
  <a target="_top" href="func_mysql_ifnull.asp">IFNULL</a>
  <a target="_top" href="func_mysql_isnull.asp">ISNULL</a>
  <a target="_top" href="func_mysql_last_insert_id.asp">LAST_INSERT_ID</a>
  <a target="_top" href="func_mysql_nullif.asp">NULLIF</a>
  <a target="_top" href="func_mysql_session_user.asp">SESSION_USER</a>
  <a target="_top" href="func_mysql_system_user.asp">SYSTEM_USER</a>
  <a target="_top" href="func_mysql_user.asp">USER</a>
  <a target="_top" href="func_mysql_version.asp">VERSION</a>
</div>

<a target="_top" href="sql_ref_sqlserver.asp">SQL Server Functions</a>
<div class="ref_overview" style="margin-left:10px;">
  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:2px;font-style:italic;">String Functions:</span>
  <a href="func_sqlserver_ascii.asp">ASCII</a>
  <a href="func_sqlserver_char.asp">CHAR</a>
  <a href="func_sqlserver_charindex.asp">CHARINDEX</a>
  <a href="func_sqlserver_concat.asp">CONCAT</a>
  <a href="func_sqlserver_concat_with_plus.asp">Concat with +</a>
  <a href="func_sqlserver_concat_ws.asp">CONCAT_WS</a>
  <a href="func_sqlserver_datalength.asp">DATALENGTH</a>
  <a href="func_sqlserver_difference.asp">DIFFERENCE</a>
  <a href="func_sqlserver_format.asp">FORMAT</a>
  <a href="func_sqlserver_left.asp">LEFT</a>
  <a href="func_sqlserver_len.asp">LEN</a>
  <a href="func_sqlserver_lower.asp">LOWER</a>
  <a href="func_sqlserver_ltrim.asp">LTRIM</a>
  <a href="func_sqlserver_nchar.asp">NCHAR</a>
  <a href="func_sqlserver_patindex.asp">PATINDEX</a>
  <a href="func_sqlserver_quotename.asp">QUOTENAME</a>
  <a href="func_sqlserver_replace.asp">REPLACE</a>
  <a href="func_sqlserver_replicate.asp">REPLICATE</a>
  <a href="func_sqlserver_reverse.asp">REVERSE</a>
  <a href="func_sqlserver_right.asp">RIGHT</a>
  <a href="func_sqlserver_rtrim.asp">RTRIM</a>
  <a href="func_sqlserver_soundex.asp">SOUNDEX</a>
  <a href="func_sqlserver_space.asp">SPACE</a>
  <a href="func_sqlserver_str.asp">STR</a>
  <a href="func_sqlserver_stuff.asp">STUFF</a>
  <a href="func_sqlserver_substring.asp">SUBSTRING</a>
  <a href="func_sqlserver_translate.asp">TRANSLATE</a>
  <a href="func_sqlserver_trim.asp">TRIM</a>
  <a href="func_sqlserver_unicode.asp">UNICODE</a>
  <a href="func_sqlserver_upper.asp">UPPER</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Numeric Functions:</span>
  <a href="func_sqlserver_abs.asp">ABS</a>
  <a href="func_sqlserver_acos.asp">ACOS</a>
  <a href="func_sqlserver_asin.asp">ASIN</a>
  <a href="func_sqlserver_atan.asp">ATAN</a>
  <a href="func_sqlserver_atn2.asp">ATN2</a>
  <a href="func_sqlserver_avg.asp">AVG</a>
  <a href="func_sqlserver_ceiling.asp">CEILING</a>
  <a href="func_sqlserver_count.asp">COUNT</a>
  <a href="func_sqlserver_cos.asp">COS</a>
  <a href="func_sqlserver_cot.asp">COT</a>
  <a href="func_sqlserver_degrees.asp">DEGREES</a>
  <a href="func_sqlserver_exp.asp">EXP</a>
  <a href="func_sqlserver_floor.asp">FLOOR</a>
  <a href="func_sqlserver_log.asp">LOG</a>
  <a href="func_sqlserver_log10.asp">LOG10</a>
  <a href="func_sqlserver_max.asp">MAX</a>
  <a href="func_sqlserver_min.asp">MIN</a>
  <a href="func_sqlserver_pi.asp">PI</a>
  <a href="func_sqlserver_power.asp">POWER</a>
  <a href="func_sqlserver_radians.asp">RADIANS</a>
  <a href="func_sqlserver_rand.asp">RAND</a>
  <a href="func_sqlserver_round.asp">ROUND</a>
  <a href="func_sqlserver_sign.asp">SIGN</a>
  <a href="func_sqlserver_sin.asp">SIN</a>
  <a href="func_sqlserver_sqrt.asp">SQRT</a>
  <a href="func_sqlserver_square.asp">SQUARE</a>
  <a href="func_sqlserver_sum.asp">SUM</a>
  <a href="func_sqlserver_tan.asp">TAN</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Date Functions:</span>
  <a href="func_sqlserver_current_timestamp.asp">CURRENT_TIMESTAMP</a>
  <a href="func_sqlserver_dateadd.asp">DATEADD</a>
  <a href="func_sqlserver_datediff.asp">DATEDIFF</a>
  <a href="func_sqlserver_datefromparts.asp">DATEFROMPARTS</a>
  <a href="func_sqlserver_datename.asp">DATENAME</a>
  <a href="func_sqlserver_datepart.asp">DATEPART</a>
  <a href="func_sqlserver_day.asp">DAY</a>
  <a href="func_sqlserver_getdate.asp">GETDATE</a>
  <a href="func_sqlserver_getutcdate.asp">GETUTCDATE</a>
  <a href="func_sqlserver_isdate.asp">ISDATE</a>
  <a href="func_sqlserver_month.asp">MONTH</a>
  <a href="func_sqlserver_sysdatetime.asp">SYSDATETIME</a>
  <a href="func_sqlserver_year.asp">YEAR</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Advanced Functions</span>
  <a href="func_sqlserver_cast.asp">CAST</a>
  <a href="func_sqlserver_coalesce.asp">COALESCE</a>
  <a href="func_sqlserver_convert.asp">CONVERT</a>
  <a href="func_sqlserver_current_user.asp">CURRENT_USER</a>
  <a href="func_sqlserver_iif.asp">IIF</a>  
  <a href="func_sqlserver_isnull.asp">ISNULL</a>
  <a href="func_sqlserver_isnumeric.asp">ISNUMERIC</a>
  <a href="func_sqlserver_nullif.asp">NULLIF</a>
  <a href="func_sqlserver_session_user.asp">SESSION_USER</a>
  <a href="func_sqlserver_sessionproperty.asp">SESSIONPROPERTY</a>
  <a href="func_sqlserver_system_user.asp">SYSTEM_USER</a>
  <a href="func_sqlserver_user_name.asp">USER_NAME</a>
</div>

<a target="_top" href="sql_ref_msaccess.asp">MS Access Functions</a>
<div class="ref_overview" style="margin-left:10px;">
  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:2px;font-style:italic;">String Functions:</span>
  <a href="func_msaccess_asc.asp">Asc</a>
  <a href="func_msaccess_chr.asp">Chr</a>
  <a href="func_msaccess_concat.asp">Concat with &amp;</a>
  <a href="func_msaccess_curdir.asp">CurDir</a>
  <a href="func_msaccess_format.asp">Format</a>
  <a href="func_msaccess_instr.asp">InStr</a>
  <a href="func_msaccess_instrrev.asp">InstrRev</a>
  <a href="func_msaccess_lcase.asp">LCase</a>
  <a href="func_msaccess_left.asp">Left</a>
  <a href="func_msaccess_len.asp">Len</a>
  <a href="func_msaccess_ltrim.asp">LTrim</a>
  <a href="func_msaccess_mid.asp">Mid</a>
  <a href="func_msaccess_replace.asp">Replace</a>
  <a href="func_msaccess_right.asp">Right</a>
  <a href="func_msaccess_rtrim.asp">RTrim</a>
  <a href="func_msaccess_space.asp">Space</a>
  <a href="func_msaccess_split.asp">Split</a>
  <a href="func_msaccess_str.asp">Str</a>
  <a href="func_msaccess_strcomp.asp">StrComp</a>
  <a href="func_msaccess_strconv.asp">StrConv</a>
  <a href="func_msaccess_strreverse.asp">StrReverse</a>
  <a href="func_msaccess_trim.asp">Trim</a>
  <a href="func_msaccess_ucase.asp">UCase</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Numeric Functions:</span>
  <a href="func_msaccess_abs.asp">Abs</a>
  <a href="func_msaccess_atn.asp">Atn</a>
  <a href="func_msaccess_avg.asp">Avg</a>
  <a href="func_msaccess_cos.asp">Cos</a>
  <a href="func_msaccess_count.asp">Count</a>
  <a href="func_msaccess_exp.asp">Exp</a>
  <a href="func_msaccess_fix.asp">Fix</a>
  <a href="func_msaccess_format_number.asp">Format</a>
  <a href="func_msaccess_int.asp">Int</a>
  <a href="func_msaccess_max.asp">Max</a>
  <a href="func_msaccess_min.asp">Min</a>
  <a href="func_msaccess_randomize.asp">Randomize</a>
  <a href="func_msaccess_rnd.asp">Rnd</a>
  <a href="func_msaccess_round.asp">Round</a>
  <a href="func_msaccess_sgn.asp">Sgn</a>
  <a href="func_msaccess_sqr.asp">Sqr</a>
  <a href="func_msaccess_sum.asp">Sum</a>
  <a href="func_msaccess_val.asp">Val</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Date Functions:</span>
  <a href="func_msaccess_date.asp">Date</a>
  <a href="func_msaccess_dateadd.asp">DateAdd</a>
  <a href="func_msaccess_datediff.asp">DateDiff</a>
  <a href="func_msaccess_datepart.asp">DatePart</a>
  <a href="func_msaccess_dateserial.asp">DateSerial</a>
  <a href="func_msaccess_datevalue.asp">DateValue</a>
  <a href="func_msaccess_day.asp">Day</a>
  <a href="func_msaccess_format_date.asp">Format</a>
  <a href="func_msaccess_hour.asp">Hour</a>
  <a href="func_msaccess_minute.asp">Minute</a>
  <a href="func_msaccess_month.asp">Month</a>
  <a href="func_msaccess_monthname.asp">MonthName</a>
  <a href="func_msaccess_now.asp">Now</a>
  <a href="func_msaccess_second.asp">Second</a>
  <a href="func_msaccess_time.asp">Time</a>
  <a href="func_msaccess_timeserial.asp">TimeSerial</a>
  <a href="func_msaccess_timevalue.asp">TimeValue</a>
  <a href="func_msaccess_weekday.asp">Weekday</a>
  <a href="func_msaccess_weekdayname.asp">WeekdayName</a>
  <a href="func_msaccess_year.asp">Year</a>

  <span style="display:inline-block;margin-left:10px;padding:5px;margin-top:10px;font-style:italic">Other Functions:</span>
  <a href="func_msaccess_currentuser.asp">CurrentUser</a>
  <a href="func_msaccess_environ.asp">Environ</a>
  <a href="func_msaccess_isdate.asp">IsDate</a>
  <a href="func_msaccess_isnull.asp">IsNull</a>
  <a href="func_msaccess_isnumeric.asp">IsNumeric</a>
</div>
<a target="_top" href="sql_quickref.asp">SQL Quick Ref</a>
<br>
<h2 class="left"><span class="left_h2">SQL</span> Examples</h2>
<a target="_top" href="sql_examples.asp">SQL Examples</a>
<a target="_top" href="sql_editor.asp">SQL Editor</a>
<a target="_top" href="sql_quiz.asp">SQL Quiz</a>
<a target="_top" href="sql_exercises.asp">SQL Exercises</a>
<a target="_top" href="sql_server.asp">SQL Server</a>
<a target="_top" href="sql_bootcamp.asp">SQL Bootcamp</a>
<a target="_top" href="sql_exam.asp">SQL Certificate</a>
      <br><br>
    </div>`;


filterData(st);