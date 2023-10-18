create table tbl_vote_202005 (
			v_jumin char(13) primary key,
			v_name varchar2(20),
			m_no char(1),
			v_time char(4),
			v_area char(20),
			v_confirm char(1)
);

select * from tbl_vote_202005
insert into tbl_vote_202005 values('99010110001', '������', '1', '0930', '��1��ǥ��', 'N');
insert into tbl_vote_202005 values('89010120002', '������', '2', '0930', '��1��ǥ��', 'N');
insert into tbl_vote_202005 values('69010110003', '������', '3', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('59010120004', 'ȫ����', '4', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110005', '������', '5', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('89010120006', '������', '1', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('59010110007', '������', '1', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('49010120008', '������', '3', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110009', '������', '3', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('89010120010', '������', '4', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('99010110011', '������', '5', '0930', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010120012', '������', '1', '1330', '��1��ǥ��', 'Y');
insert into tbl_vote_202005 values('69010110013', '������', '4', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('89010110014', '������', '2', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('99010110015', '������', '3', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110016', '������', '2', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('89010110017', '������', '4', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('99010110018', '������', '2', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110019', '������', '4', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('69010110020', 'Ȳ����', '5', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110021', '������', '3', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('79010110022', '������', '3', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('99010110023', '������', '1', '1330', '��2��ǥ��', 'Y');
insert into tbl_vote_202005 values('59010110024', '������', '3', '1330', '��2��ǥ��', 'Y');

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
insert into tbl_member_202005 values('1', '���ĺ�', 'P1', '1', '6603011999991', '����ȭ��');
insert into tbl_member_202005 values('2', '���ĺ�', 'P2', '3', '5503011999992', '�ε鷡��');
insert into tbl_member_202005 values('3', '���ĺ�', 'P3', '2', '7703011999993', '���Ȳɵ�');
insert into tbl_member_202005 values('4', '���ĺ�', 'P4', '2', '8803011999994', '���޷���');
insert into tbl_member_202005 values('5', '���ĺ�', 'P5', '3', '9903011999995', '��������');

create table tbl_party_202005 (
			p_code char(2) primary key,
			p_name varchar2(20),
			p_indate date,
			p_reader varchar2(20),
			p_tel1 char(3),
			p_tel2 char(4),
			p_tel3 char(4)
);

insert into tbl_party_202005 values('P1', 'A����', '2010-01-01', '����ǥ', '02', '1111', '0001');
insert into tbl_party_202005 values('P2', 'B����', '2010-02-01', '���ǥ', '02', '1111', '0002');
insert into tbl_party_202005 values('P3', 'C����', '2010-03-01', '���ǥ', '02', '1111', '0003');
insert into tbl_party_202005 values('P4', 'D����', '2010-04-01', '����ǥ', '02', '1111', '0004');
insert into tbl_party_202005 values('P5', 'E����', '2010-05-01', '�Ӵ�ǥ', '02', '1111', '0005');

select m_no, m_name, 
case when p_code = 'P1' then 'A����', when p_code = 'P2' then 'B����', 
					
select M_NO, M_NAME, 
		     case when mem.P_CODE ='P1' then 'A����' when mem.P_CODE ='P2' then 'B����' when mem.P_CODE ='P3' then 'C����' when mem.P_CODE ='P4' then 'D����' when P_CODE ='P5' then 'E����' end as P_CODE, 
		     case when P_SCHOOL = '1' then '����' when P_SCHOOL = '2' then '�л�' when P_SCHOOL = '3' then '����' else '�ڻ�' end as P_SCHOOL,
		     M_JUMIN, M_CITY, CONCAT(p_tel1, p_tel2, p_tel3) 
		     from TBL_MEMBER_202005 mem, tbl_party_202005 par
		     where mem.p_code = par.p_code;
		     
select  P_TEL1 || '-' || P_TEL2 || '-' || P_TEL3
from tbl_party_202005;





select v_name, v_jumin, m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time, v_confirm
from tbl_vote_202005
where v_area = '��1��ǥ��' 

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
			 when substr(tj.jumin, 8, 1) = '1' then '��' 
			 else '��' end as gender, 
			 tv.hospcode, tv.resvdate, tv.resvtime, 
			 
			 case 
			 when tv.vcode = 'V001' then 'A���'
			 when tv.vcode = 'V002' then 'B���'
			 else 'C���'
			 end as vcode,
			 
			 case 
			 when hospaddr = '10' then '����'
			 when hospaddr = '20' then '����'
			 when hospaddr = '30' then '�뱸'
			 else '����'
			 end as hospaddr
			 from tbl_jumin_202108 tj, tbl_vaccresv_202108 tv, tbl_hosp_202108 th
			 where tj.jumin = tv.jumin and tv.hospcode = th.hospcode
			 
select th.hospaddr,
		case 
		when th.hospaddr = '10' then '����'
		when th.hospaddr = '20' then '����'
		when th.hospaddr = '30' then '�뱸'
		else '����'
		end as hospaddr,
		nvl(count(tv.hospcode),0) as count1
		from tbl_hosp_202108 th, tbl_vaccresv_202108 tv
		where th.hospcode = tv.hospcode(+)
		group by th.hospaddr
		order by count1 desc
		
	
			