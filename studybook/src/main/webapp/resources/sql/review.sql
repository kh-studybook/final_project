create table review(
	review_code number(10) not null constraint review_review_code_pk primary key,
	room_code number(10) not null constraint review_room_code_fk references room(room_code),
	content varchar2(4000) not null,
	review_date date not null,
	mem_key number(10) not null constraint review_mem_key_fk references member(key)
);

alter table review add r_code number(10) not null constraint review_r_code_fk references reserve(r_code);

drop table review;

select * from review;

insert into review values(2,2,'공부하기 좋은 분위기였습니다 너무조았아용','2019/12/31',1000);