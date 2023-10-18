select *
from member_tbl_02;
DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02 (
						custno number(6) PRIMARY KEY,
						custname varchar2(20),
						phone varchar2(13),
						address varchar2(60),
						joindate date,
						grade char(1),
						city char(2)
);
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100001, '���ູ', '010-1111-2222', '���� ���빮�� �ְ�1��', '20151202', 'A', '01');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100002, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '20151206', 'B', '01');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100003, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '20151001', 'B', '30');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100004, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '20151113', 'A', '30');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100005, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '20151225', 'B', '60');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city) 
VALUES(100006, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151211', 'C', '60');

select *  
from money_tbl_02;

DROP TABLE money_tbl_02;
CREATE TABLE money_tbl_02 (
						custno number(6),
						salenol number(8),
						pcost number(8),
						amount number(4),
						price number(8),
						pcode varchar2(4),
						sdate date,
						PRIMARY KEY(custno, salenol)
);

INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100002, 20160005, 500, 1, 500, 'A001', '20160103');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100004, 20160008, 300, 1, 300, 'A005', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100004, 20160009, 600, 1, 600, 'A006', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate) 
VALUES(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');


select tbl.custno, custname, case when grade = 'A' then 'VIP' when grade='B' then '�Ϲ�' else '����' end as grade, sum(price)
from member_tbl_02 tbl, money_tbl_02 mon
where tbl.custno = mon.custno and price is not null
group by tbl.custno, tbl.custname, tbl.grade
order by sum(price);
