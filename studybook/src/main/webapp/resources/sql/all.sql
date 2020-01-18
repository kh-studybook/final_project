-- 연수
-- 누구나 수정 가능 :)

drop table member;
create table member(
	name VARCHAR2(40) NOT NULL , 
	password VARCHAR2(20) NOT NULL,
	email VARCHAR2(40) NOT NULL UNIQUE,
	phone VARCHAR2(11) NOT NULL,
	key number(10) NOT NULL constraint member_key_pk primary key,
	profile varchar2(200)
);

select * from member;

--delete from member where name = '손연수';






create table notice(
	notice_num number(5) not null constraint notice_notice_num primary key,
	notice_title varchar2(200) not null,
	notice_content varchar2(4000) not null,
	notice_date date
);
 
drop table notice;
 
select * from notice;





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

delete from event where event_num = 3;
select * from (select rownum rnum, event_num, mem_key, title, content, event_pic from event) 
	order by event_num desc
	
	
	
	
drop table event_comment;	

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

select * from event_comment;




create table food(
	food_code number(10) constraint food_food_code_pk  primary key,
	food_name varchar2(45) not null,
	food_cost number(5) not null,
	food_pic varchar2(200) not null
);

drop table food;

select * from food;





create table food_reserve(
	r_code number(10) not null constraint food_reserve_r_code_fk references reserve(r_code) on delete cascade,
	food_code number(10) not null constraint food_reserve_food_code_fk references food(food_code) on delete cascade,
	mem_key number(10) not null constraint food_reserve_mem_key_fk references member(key) on delete cascade,
	count number(5) not null,
	total_cost number(10) not null
);


drop table food_reserve;

select * from food_reserve;





create table gallery(
	room_code number(10) not null constraint gallery_room_code_fk references room(room_code) on delete cascade,
	file_name varchar2(200) not null,
	gallery_num number(10) not null
);

--이미지 업로드 테스트용 --추후 반드시 위 테이블로 생성해야함
create table gallery(
	room_code number(10) not null,
	file_name varchar2(200) not null,
	gallery_num number(10) not null
);



drop table gallery;

select * from gallery;

truncate table gallery;






create table reserve(
	r_code number(10) not null constraint reserve_r_code_pk primary key,
	mem_key number(10) not null constraint reserve_mem_key_fk references member(key) on delete cascade,
	room_code number(10) not null constraint reserve_room_code_fk references room(room_code) on delete cascade,
	reserve_date date not null,
	start_time varchar2(10) not null,
	end_time  varchar2(10) not null,
	total_cost number(10) not null,
	require varchar2(1000) ,
	status number(1)  default 1
);


drop table reserve;

select * from reserve;






create table review(
	review_code number(10) not null constraint review_review_code_pk primary key,
	r_code number(10) not null constraint review_r_code_fk references reserve(r_code),
	content varchar2(4000) not null,
	review_date date not null
);

drop table review;

select * from review;






create table room(
	room_code number(10) not null constraint room_room_code_pk primary key,
	room_name varchar2(50) not null unique,
	room_info varchar2(100) not null,
	room_type varchar2(100) not null,
	min_member number(2) not null,
	max_member number(3) not null,
	min_hour number(2) not null,
	hour_cost number(5) not null,
	room_intro varchar2(4000) not null,
	fac_intro varchar2(4000) not null,
	hashtag varchar2(1000) not null
);


drop table room;

select * from room;

truncate table room;







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
