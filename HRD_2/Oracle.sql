create table tbl_vote_202005 (
			v_jumin char(13) primary key,
			v_name varchar2(20),
			m_no char(1),
			v_time char(4),
			v_area char(20),
			v_confirm char(1)
);

select * from tbl_vote_202005
insert into tbl_vote_202005 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('79010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('69010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('79010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');

create table tbl_member_202005 (
			m_no char(1) primary key,
			m_name varchar2(20),
			p_code char(2),
			p_school char(1),
			m_jumin char(13),
			m_city varchar2(20)
);
select * from tbl_member_202005;
drop table tbl_member_202005;
insert into tbl_member_202005 values('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202005 values('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

create table tbl_party_202005 (
			p_code char(2) primary key,
			p_name varchar2(20),
			p_indate date,
			p_reader varchar2(20),
			p_tel1 char(3),
			p_tel2 char(4),
			p_tel3 char(4)
);

insert into tbl_party_202005 values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

select m_no, m_name, 
case when p_code = 'P1' then 'A정당', when p_code = 'P2' then 'B정당', 
					
select M_NO, M_NAME, 
		     case when mem.P_CODE ='P1' then 'A정당' when mem.P_CODE ='P2' then 'B정당' when mem.P_CODE ='P3' then 'C정당' when mem.P_CODE ='P4' then 'D정당' when P_CODE ='P5' then 'E정당' end as P_CODE, 
		     case when P_SCHOOL = '1' then '고졸' when P_SCHOOL = '2' then '학사' when P_SCHOOL = '3' then '석사' else '박사' end as P_SCHOOL,
		     M_JUMIN, M_CITY, CONCAT(p_tel1, p_tel2, p_tel3) 
		     from TBL_MEMBER_202005 mem, tbl_party_202005 par
		     where mem.p_code = par.p_code;
		     
select  P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3
from tbl_party_202005;





select v_name, v_jumin, m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time, v_confirm
from tbl_vote_202005
where v_area = '제1투표장' 

select m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time
from tbl_vote_202005

select 2021 - to_number(substr(v_jumin, 1, 2) + 1900) -1 as age
from tbl_vote_202005

select tv.m_no, v_name, sum(tv.m_no)
from tbl_vote_202005 tv, tbl_member_202005 tm
where tv.m_no = tm.m_no
group by tv.m_no, v_name

select tv.resvno, tj.jumin,  
			 case 
			 when substr(tj.jumin, 8, 1) = '1' then '남' 
			 else '여' end as gender, 
			 tv.hospcode, tv.resvdate, tv.resvtime, 
			 
			 case 
			 when tv.vcode = 'V001' then 'A백신'
			 when tv.vcode = 'V002' then 'B백신'
			 else 'C백신'
			 end as vcode,
			 
			 case 
			 when hospaddr = '10' then '서울'
			 when hospaddr = '20' then '대전'
			 when hospaddr = '30' then '대구'
			 else '광주'
			 end as hospaddr
			 from tbl_jumin_202108 tj, tbl_vaccresv_202108 tv, tbl_hosp_202108 th
			 where tj.jumin = tv.jumin and tv.hospcode = th.hospcode
			 
select th.hospaddr,
		case 
		when th.hospaddr = '10' then '서울'
		when th.hospaddr = '20' then '대전'
		when th.hospaddr = '30' then '대구'
		else '광주'
		end as hospaddr,
		nvl(count(tv.hospcode),0) as count1
		from tbl_hosp_202108 th, tbl_vaccresv_202108 tv
		where th.hospcode = tv.hospcode(+)
		group by th.hospaddr
		order by count1 desc
		
	
			