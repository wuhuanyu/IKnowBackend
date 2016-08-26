delimiter $

create procedure insertRelationship(in user_one_id int,in user_two_id int,in status int,in action_id int)
begin
    insert into relationshiptest(relationshiptest.user_one_id,relationshiptest.user_two_id,relationshiptest.status,relationshiptest.action_id)values
    (user_one_id,user_two_id,status,action_id);
end
$
delimiter ;
