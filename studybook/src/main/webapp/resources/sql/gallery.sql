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