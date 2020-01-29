
create table event_comment(
	event_com_num number(10) constraint event_com_num primary key, -- 이벤트 댓글 번호
	mem_key number(10) not null constraint event_comment_mem_key references member(key),
	event_num number(10) not null constraint event_comment_event_num references event(event_num) on delete cascade,
	com_content varchar2(4000) not null,
	com_date date not null, --날짜
	com_re_ref number(10) not null,  -- 댓글 참조 번호 : 답변 글 작성시 참조되는 글의 번호
	com_re_lev number(10) not null,  -- 답변 글의 깊이(원문글:0, 답변:1, 답변의 답변2, 답변의 답변의 답변 :3)
	com_re_seq number(10) not null   --<!--  추후 확인!! -->답변 글의 순서(원문글 기준으로 보여주는 순서)
);

		
select * from event_comment, member where event_comment.mem_key = member.key and event_comment.event_num = 5 
	
		

delete from event_comment;


select event_comment.*, me.name from event_comment, member me where event_num = 5
and me.key= 1000 order by com_date desc

drop table event_comment;
select * from event_comment;
create sequence event_com_seq;
drop sequence event_com_seq;

update event_comment set com_content='dddddddddd' where event_num = 5 and event_com_num = 14