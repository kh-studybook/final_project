create table reserve(
	r_code number(10) not null constraint reserve_r_code_pk primary key,
	mem_key number(10) not null constraint reserve_mem_key_fk references member(key) on delete cascade,
	room_code number(10) not null constraint reserve_room_code_fk references room(room_code) on delete cascade,
	reserve_date date not null,
	start_time varchar2(10) not null,
	end_time  varchar2(10) not null,
	total_cost number(10) not null,
	require varchar2(1000) ,
	status number(1)  default 1,
	extra_num number(2),
	reserver_name varchar2(30) not null,
	reserver_phone varchar2(11) not null,
	reserver_email varchar2(40) not null
);

select * from reserve where reserve_date < TO_CHAR(sysdate, 'YYYY-MM-DD');

alter table reserve add pay_date date;

update reserve set status = 1 where r_code = '1011';

drop table reserve;
delete reserve

select * from reserve;

update reserve set status = 1 where r_code = 1001;

update reserve set reserve_date = '2020-01-31' where r_code = 1011;

insert into reserve values (1001, 1001, 2, '2020-02-03 00:00:00.0', '15', '17', 11000, NULL, 1, 1, lala, '01022222222', 'lala@naver.com', sysdate);

select * from reserve rv, room ro where ro.room_code=rv.room_code

select ro.room_name, rv.* from reserve rv, room ro where rv.room_code=ro.room_code
order by rv.room_code desc

select * from (select rownum rnum, b.* from (select ro.room_name, rv.* from reserve rv, room ro where rv.room_code=ro.room_code
order by rv.room_code desc) b)

select * from food_reserve


select rownum rnum, b.* from (select * 
from(select ro.room_name, rv.* from reserve rv, room ro where rv.room_code=ro.room_code
order by rv.room_code desc)b 

select * from
(select rownum rnum, c.* from (select * 
from(select ro.room_name, rv.* from reserve rv, room ro where rv.room_code=ro.room_code
and rv.r_code like 1006
order by rv.r_code desc)b left outer join food_reserve fd on fd.r_code=b.r_code)c)
where rnum >=1 and rnum <=10



insert into reserve values (1004,999,2,'2019/10/30','13','15',
26000,'요구사항',
1,1,'우지','01020014124','admin@studybook.com','2019/10/30')

insert into reserve values (1003,998,1,'2019/10/29','9','12',
12000,'없습니다.',
1,1,'기린','01020014124','kirin@naver.com','2019/01/20')

insert into reserve values (1002,999,3,'2019/10/30','11','12',
3000,'노농',
1,1,'우지','01020014124','admin@studybook.com','2019/9/30')

insert into reserve values (1001,999,4,'2019/03/15','9','12',
14000,'의자 2개만 추가해주세요',
1,2,'윤대승','01012444124','ssada@studybook.com','2019/5/14')

insert into reserve values (1000,999,5,'2019/02/14','14','16',
16000,'손님이 더 올것 같아요',
1,2,'김사랑','01014545124','love@studybook.com','2019/2/14')


insert into reserve values (1005,999,7,'2019/02/14','14','16',
16000,'손님이 더 올것 같아요',
1,2,'김사랑','01014545124','love@studybook.com','2019/2/14')

insert into reserve values (1006,999,8,'2019/02/14','14','16',
8000,'꽃보다 할배 모임',
1,2,'이서진','01014545124','love@studybook.com','2019/2/14')

		select * from (	
			select file_name from 
			(select * from member m, reserve r, gallery g
			where  m.key = r.mem_key and r.room_code = g.room_code)
		where mem_key = 1)
