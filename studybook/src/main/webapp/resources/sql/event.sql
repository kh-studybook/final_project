create table event(
	event_num number(10) constraint event_event_num_pk primary key,
	mem_key number(10) not null constraint event_mem_key_fk references member(key),
	title varchar2(200) not null,
	content varchar2(4000) not null,
	event_date date not null,
	event_start varchar2(10) not null,
	event_end varchar2(10) not null,
	event_room varchar2(50) not null,
	event_pic varchar2(200) not null
);

alter table event add event_status number(10) default 0;

drop table event;

select * from event;
delete from event;
delete from event where event_num = 1

select name from member where key = (select mem_key from event) and num

select me.name 
from member me, event ev
where me.key=ev.mem_key and ev.event_num=5

select name from member, event where member.key = event.mem_key and event.event_num = event.event_num
