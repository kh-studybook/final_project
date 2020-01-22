create table reserve(
	r_code number(10) not null constraint reserve_r_code_pk primary key,
	mem_key number(10) not null constraint reserve_mem_key_fk references member(key) on delete cascade,
	room_code number(10) not null constraint reserve_room_code_fk references room(room_code) on delete cascade,
	reserve_date date not null,
	start_time varchar2(10) not null,
	end_time  varchar2(10) not null,
	total_cost number(10) not null,
	require varchar2(1000) ,
	status number(1)  default 1,
	extra_num number(2),
	reserver_name varchar2(30) not null,
	reserver_phone varchar2(11) not null,
	reserver_email varchar2(40) not null
);

alter table reserve add pay_date date;

drop table reserve;

select * from reserve;