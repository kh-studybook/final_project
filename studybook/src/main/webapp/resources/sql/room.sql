create table room(
	room_code number(10) not null constraint room_room_code_pk primary key,
	room_name varchar2(50) not null unique,
	room_info varchar2(200) not null,
	room_type varchar2(200) not null,
	min_member number(2) not null,
	max_member number(3) not null,
	hour_cost number(5) not null,
	room_intro varchar2(4000) not null,
	fac_intro varchar2(4000) not null,
	hashtag varchar2(1000) not null
);
alter table room add min_hour number(10) not null;

drop table room;

select * from room;

truncate table room;

select *
		from (select rownum rnum, b.*
		from (select room.ROOM_CODE, room.ROOM_NAME, room.MIN_MEMBER, room.MAX_MEMBER,
		room.HOUR_COST, room.HASHTAG, gallery.FILE_NAME,
		reserve.reserve_date, reserve.start_time, reserve.end_time
		from room, gallery, reserve
		where room.ROOM_CODE=gallery.ROOM_CODE
		and room.ROOM_CODE=reserve.room_code
		and gallery.gallery_num=1
		and reserve.reserve_date!=TO_DATE(2020-01-01)
		and reserve.start_time not between 1 and 4
		and reserve.end_time-1 not between 1 and 4
		and 1 not between reserve.start_time and reserve.end_time-1
		and 3 not between reserve.start_time and reserve.end_time
		and room.MIN_MEMBER not between 4 and 8
		and room.MAX_MEMBER not between 4 and 8
		and 4 not between room.MIN_MEMBER and room.MAX_MEMBER
		and 8 not between room.MIN_MEMBER and room.MAX_MEMBER
		order by room.room_code) b
		)
		where rnum >= 1 and rnum <= 9;