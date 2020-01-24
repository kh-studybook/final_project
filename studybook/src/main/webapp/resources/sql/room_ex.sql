create table room_ex(
	room_code number(10) not null constraint room_ex_room_code_fk references room(room_code) on delete cascade,
	alcohol number(1) default 0,
	mic number(1) default 0,
	chair number(1) default 0,
	food number(1) default 0,
	toilet number(1) default 0,
	smoking number(1) default 0,
	parking number(1) default 0,
	tv number(1) default 0,
	board number(1) default 0,
	wifi number(1) default 0	
);

drop table room_ex;

select * from room_ex;

truncate table room_ex;
