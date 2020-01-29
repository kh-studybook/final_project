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

			   select * from 
			   		(select rownum rnum, b.*
			   		from (select re.r_code, re.mem_key, re.room_code, re.reserve_date, re.start_time, 
							re.end_time, re.total_cost, re.require, re.status, re.extra_num, 
							re.reserver_name, re.reserver_phone, re.reserver_email, re.pay_date, go.file_name
   			 			from reserve re, member me, gallery go
  			 			where re.mem_key = me.key 
  			   			and go.room_code = ro.r_code
  			   			and re.mem_key = 1001
  			   			and go.gallery_num = 1
  			   	    	order by ro.r_code desc) b)


select * from 
          (select rownum rnum, b.*
            from (select re.*, go.file_name
             from reserve re, member me, gallery go
            where re.mem_key = me.key 
              and go.room_code = re.r_code
              and re.mem_key = 1001 
              and go.gallery_num = 1 order by re.r_code desc) b)

              
              select rownum rnum, re.r_code, re.mem_key, re.room_code, re.reserve_date, re.start_time, 
				re.end_time, re.total_cost, re.require, re.status, re.extra_num, 
				re.reserver_name, re.reserver_phone, re.reserver_email, re.pay_date, go.file_name
   			 from reserve re, member me, gallery go
  			 where re.mem_key = me.key 
  			 and go.gallery_num = 1