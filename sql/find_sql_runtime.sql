analyze table xxx validate structure cascade;

select machine from v$session where schemaname = 'xxx';

begin
dbms_stats.gather_schema_stats(
ownname=> 'xxx',
options=> 'xxx');
end;

select x.sid,
x.username,
x.sql_id,
x.sql_child_number,
x.sql_hash_value,
x.sql_address,
sqlarea.optimizer_mode,
sqlarea.sql_text,
sqlarea.sql_fulltext
from v$session x, v$sqlarea sqlarea
where
x.username = 'xxx'
and 
x.sql_hash_value = sqlarea.hash_value
and x.sql_address=sqlarea.address;


select s.sql_id,
s.executions,
s.first_load_time,
s.last_load_time,
s.last_active_time,
s.elapsed_time,
s.hash_value,
s.cpu_time,
s.plan_hash_value,
round(decode(s.executions,'',0,0,0,(s.elapsed_time/s.executions)),2) avg_time,
s.sql_text,
s.sql_fulltext
from v$sql s
where 
s.sql_text like 'select xxx%' and
parsing_schema_name = 'xxx'
order by avg_time desc



select s.sql_id,
bc.position,
bc.value_string,
s.last_active_time,
bc.last_captured,
s.hash_value
from v$sqlarea s
left join v$sql_bind_capture bc
on bc.sql_id = s.sql_id
and bc.child_number = 0
and bc.hash_value = 141145
where s.sql_text like '%from ex_%'
order by s.last_active_time, bc.position;


select * from v$sql_bind_capture where hash_value=141145;

select inst_id, sid from gv$session where username='xxx';

select nvl(ses.username, 'ORACLE PROC')||' ('||ses.sid||')' USERNAME,
SID,
MACHINE,
REPLACE(SQL.SQL_TEXT,CHR(10),'') STMT,
ltrim(to_char(floor(ses.last_call_et, 3600)/60), '09')) || ':'
|| ltrim(to_char(floor(mod(ses.last_call_et, 3600)/60), '09')) || ':'
|| ltrim(to_char(mod(ses.last_call_et, 60), '09')) RUNT
from gV$session ses,
     gV$SQLtext-with_newlines SQL
where ses.status = 'ACTIVE'
and ses.username is not null
and ses.sql_address = sql.address
and ses.sql_hash_value = sql.hash_value
and ses.audsid <> userenv('SESSIONID')
order by runt desc, 1, sql.piece;
