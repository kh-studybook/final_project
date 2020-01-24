create table food(
	food_code number(10) constraint food_food_code_pk  primary key,
	food_name varchar2(45) not null,
	food_cost number(5) not null,
	food_pic varchar2(200) not null
);

drop table food;

select * from food;