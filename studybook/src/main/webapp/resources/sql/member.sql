create table member(
	email VARCHAR2(40) NOT NULL UNIQUE,
	password VARCHAR2(20) NOT NULL,
	name VARCHAR2(40) NOT NULL ,
	phone VARCHAR2(11) NOT NULL,
	key number(10) NOT NULL constraint member_key_pk primary key,
	profile varchar2(200)
);

alter table member add profile varchar2(200);

drop table member;

select * from member;

delete member where email='admin@studybook.com';
delete member where key=999;

delete from member where name = '관리자';

delete from member where name = '연수'


insert into member values('관리자', '1234', 'admin@studybook.com', '0101111111', 999, 'default.png');


insert into member values('관리자', 1234, 'admin@studybook.com', '0101111111', 999,'');

insert into member values('admin@studybook.com', 1234,'관리자' , '0101111111', 998,'');
insert into member values('haha@naver.com', 1234, '하하' , '01011444444', 1);
update member set key = 2 where name = 'kaka';

commit

