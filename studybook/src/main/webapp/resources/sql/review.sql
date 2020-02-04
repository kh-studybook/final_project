create table review(
	review_code number(10) not null constraint review_review_code_pk primary key,
	room_code number(10) not null constraint review_room_code_fk references room(room_code),
	content varchar2(4000) not null,
	review_date date not null,
	mem_key number(10) not null constraint review_mem_key_fk references member(key)
);

alter table review add r_code number(10) not null constraint review_r_code_fk references reserve(r_code);

delete review where r_code = '1005';
drop table review;

select * from review;

select rv.content, rv.review_code, rv.room_code, ro.room_name from review rv join room ro on ro.room_code=rv.room_code where rv.review_code=6

delete review;
insert into review values(1,2,'이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요. 이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다.','2019/12/31',999,1004);
insert into review values(2,1,'편안한 분위기와 와이파이 제공이 좋았어요','2019/10/30',998,'1003');
insert into review values(3,3,'분위기와 와이파이 제공이 좋았어요','2019/11/01',999,'1002');
insert into review values(4,4,'편안한 와이파이 제공이 좋았어요','2019/03/30',999,'1001');
insert into review values(5,5,'편안한 분위기 제공이 좋았어요','2019/02/15',999,'1000');
insert into review values(6,7,'편안한 와이파이 제공이 좋았어요','2019/09/30',999,1005);
insert into review values(7,8,'편안한 분위기와 와이파이 제공이 좋았어요','2019/10/30',999,1006);

insert into review values(1,1,'이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요. 이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다. 다음에 또 방문할 의사 있어요.이번에 스터디 모임있어서 이용해봤는데 시설 깔끔하고 좋았습니다.','2019/12/31',999,1008);
insert into review values(2,1,'편안한 분위기와 와이파이 제공이 좋았어요','2019/10/30',999,1009);
insert into review values(3,1,'분위기와 와이파이 제공이 좋았어요','2019/11/01',999,10010);
insert into review values(4,1,'편안한 와이파이 제공이 좋았어요','2019/03/30',999,1004);
insert into review values(5,1,'편안한 분위기 제공이 좋았어요','2019/02/15',999,1005);
insert into review values(6,1,'편안한 와이파이 제공이 좋았어요','2019/09/30',999,1006);
insert into review values(7,1,'편안한 분위기와 와이파이 제공이 좋았어요','2019/10/30',999,1007);


