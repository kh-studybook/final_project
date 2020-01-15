create table notice(
	notice_num number(5) not null constraint notice_notice_num primary key,
	notice_title varchar2(200) not null,
	notice_content varchar2(4000) not null,
	notice_date date
);


 
drop table notice;
 
select * from notice;