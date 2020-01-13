create table room(
	room_code number(10) not null constraint room_room_code_pk primary key,
	room_name varchar2(50) not null unique,
	room_info varchar2(100) not null,
	room_type varchar2(100) not null,
	min_member number(2) not null,
	max_member number(3) not null,
	min_hour number(2) not null,
	hour_cost number(5) not null,
	room_intro varchar2(4000) not null,
	fac_intro varchar2(4000) not null,
	hashtag varchar2(1000) not null
);


drop table room;

select * from room;

truncate table room;