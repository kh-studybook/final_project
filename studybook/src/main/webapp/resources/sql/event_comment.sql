create table event_comment(
	event_com_num number(10) constraint event_com_num primary key,
	mem_key number(10) not null constraint event_comment_mem_key references member(key),
	event_num number(10) not null constraint event_comment_event_num references event(event_num) on delete cascade,
	com_content varchar2(4000) not null,
	com_date date not null,
	com_re_ref number(10) not null,
	com_re_lev number(10) not null,
	com_re_seq number(10) not null
);

drop table event_comment;

select * from event_comment;