create table notice(
	notice_num number(5) not null constraint notice_notice_num primary key,
	notice_title varchar2(200) not null,
	notice_content varchar2(4000) not null,
	notice_date date
);
 
drop table notice;
 
select * from notice;

insert into notice
values ('1', '안녕하세요', '내용내용내용넹ㅇ', '2020-01-20'); 