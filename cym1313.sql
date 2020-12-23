create table dv_member(
memberid varchar2(30) not null,
passwd varchar2(20) not null,
mem_name varchar2(30) not null,
mem_address varchar2(40) not null,
constraint mem_memberid_pk PRIMARY key(memberid)
);

create table dv_product(
productid varchar2(40) not null,
productname varchar2(40) not null,
productstock number,
price number not null,
constraint product_id_pk PRIMARY key(productid)
);

create table dv_board(
boardid number not null,
brdtitle varchar2(40) not null,
brdcontents varchar2(1000) not null,
brddate date default sysdate not null,
memberid varchar2(30) not null,
constraint board_boardid_pk PRIMARY key(boardid),
constraint board_memberid_fk foreign key(memberid)
references dv_member(memberid)
);

create table dv_oders(
orderno number not null,
memberid varchar2(30) not null,
productid varchar2(40) not null,
ordercnt number default 1 not null,
address varchar2(100) not null,
orderdate date default sysdate not null,
constraint oders_orderno_pk PRIMARY key(orderno),
constraint oders_memberid_fk foreign key(memberid)
references dv_member(memberid),
constraint oders_productid_fk foreign key(productid)
references dv_product(productid)
);

select * from dv_member;
select * from dv_product;
select * from dv_board;
select * from dv_oders;

INSERT into dv_member values('drt2343', '34585', 'ȫ�浿', '������');
INSERT into dv_member values('hyt2323', '4567', '����ö', '����');
INSERT into dv_member values('bgku98', '8998', '�ڼ���', '�뱸');
INSERT into dv_member values('mnht651', '0912', '���', '�λ�');
INSERT into dv_member values('wwq2321', '4565', '��浿', '�뱸');

INSERT into dv_member values('1232', '��ǰ1', 20, 2600);
INSERT into dv_member values('4527', '��ǰ2', 65, 7800);
INSERT into dv_member values('5421', '��ǰ3', 35, 25700);
INSERT into dv_member values('8745', '��ǰ4', 89, 42800);

INSERT into dv_member values(234, '�����ͺ��̽�', '��¼����¼��', '20/12/18', 'drt2343');
INSERT into dv_member values(543, '�⸻����', '��¼����¼��', '20/12/08', 'hyt2323');
INSERT into dv_member values(735, '�����մϴ�', '��¼����¼��', '20/12/13', 'bgku98');
INSERT into dv_member values(467, '����Ŭ', '��¼����¼��', '20/11/15', 'mnht651');

INSERT into dv_member values(678, 'drt2343', '1232', 1, '�λ�', '20/12/17');
INSERT into dv_member values(123, 'hyt2323', '4527', 1, '����', '20/12/08');
INSERT into dv_member values(982, 'bgku98', '5421', 2, '�뱸', '20/12/13');
INSERT into dv_member values(347, 'mnht651', '8745', 1, '�λ�', '20/11/15');
INSERT into dv_member values(321, 'drt2343', '8745', 1, '�λ�', '20/12/23');

select memberid, mem_name
from dv_member
where memberid in (select memberid from dv_board);

select dm.memberid, dm.mem_name, dp.productname, do.ordercnt, dp.price
from dv_product dp, dv_member dm, dv_oders do
where dp.productid=do.productid and dm.memberid=do.memberid
order by dp.price;

select db.boardid, dm.mem_name, db.brdtitle, db.brdcontents, db.brddate
from dv_member dm, dv_board db
where db.memberid=dm.memberid
order by db.brddate desc;

