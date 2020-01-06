create table gallery(
	room_code number(10) not null constraint gallery_room_code_fk references room(room_code) on delete cascade,
	file_name varchar2(200) not null,
	gallery_num number(10) not null
);


drop table gallery;

select * from gallery;