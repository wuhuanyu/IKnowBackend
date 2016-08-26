


delimiter $


create procedure insertUser(in name varchar(255),in password varchar(255))
begin
    insert into usertest(usertest.Name,usertest.password)values(name,password);
end $
delimiter ;
