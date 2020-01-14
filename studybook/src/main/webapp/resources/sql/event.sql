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


drop table event;

select * from event;
delete from event;

		select * from (select rownum rnum, event.event_num, event.mem_key, event.title,
					   	event.content, event.event_pic, event_comment.com_re_ref, 
					   	event_comment.com_re_lev, event_comment.com_re_seq, event_comment.com_date
						from (select * from event, event_comment order by com_re_ref desc, com_re_seq asc))