create table review(
	review_code number(10) not null constraint review_review_code_pk primary key,
	r_code number(10) not null constraint review_r_code_fk references reserve(r_code),
	content varchar2(4000) not null,
	review_date date not null
);

drop table review;

select * from review;