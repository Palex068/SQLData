use lesson_3;

select * from staff;

select @res_out := 5;
drop procedure if exists get_status;
delimiter $$
create procedure get_status
(
in staff_number int,
out staff_status varchar(45)
)
begin
	declare staff_salary double;
    select salary into staff_salary
    from staff 
    where staff_number = id;
    if staff_salary between 0 and 49999
		then set staff_status = "Средняя ЗП";
	elseif staff_salary between 50000 and 69999
		then set staff_status = "ЗП выше средней";
	elseif staff_salary >= 70000
		then set staff_status = "Высокая ЗП";
	end if;
    
end $$
call get_status(4, @res_out);
select @res_out;

select now();

drop function if exists get_age;
delimiter $$
create function get_age
(
date_birth date,
current_t datetime
)
returns int
deterministic
return(year(current_t) - year(date_birth));
$$
select get_age('1983-09-04', now()) as 'Возраст';

drop procedure if exists print_number;
delimiter $$
create procedure print_number
(
input_number int
)
begin
declare n int;
declare result varchar(45) default "";
set n = input_number;
repeat
	set result = concat(result, n, " ");
    set n = n - 1;
    until n <= 0
end repeat;
select result;
end $$

call print_number(10);
	
    
