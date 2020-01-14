create table member(
	name VARCHAR2(40) NOT NULL ,
	password VARCHAR2(20) NOT NULL,
	email VARCHAR2(40) NOT NULL UNIQUE,
	phone VARCHAR2(11) NOT NULL,
	key number(10) NOT NULL constraint member_key_pk primary key
);

drop table member;

select * from member;

delete from member where name = 'admin'

insert into member values('admin', 1234, 'admin@naver.com', '0101111111', 0);