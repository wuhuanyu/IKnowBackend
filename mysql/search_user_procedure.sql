 create procedure test( in name_param varchar(255)) begin select Name,Id from usertest where Name like '%name_param%' order by(case when Name='name_param' then 0 when name like 'name_param%' then 1 when name like '%%name_param%%' then 2 when name like '%name_param' then 3 else 4 end),name_param; end$

