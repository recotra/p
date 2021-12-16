DECLARE
  l_id NUMBER;
  l_version NUMBER;
begin
  FOR l_row in (select * from a_table)
  LOOP
    select max(id) into l_existing_id from a_table where status='complete';
    if l_existing_id IS NULL
    THEN
      DBMS_OUTPUT.put_line('a is not found ' || l_row.name);
    ELSE
      DBMS_OUTPUT.put_line('extract ' || l_row.name);
      select bid into l_bid from ...
      insert into btable values (sequencea.nextval, l_bid);
    END IF;
  END LOOP;
end;

