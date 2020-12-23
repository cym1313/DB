select *
from dv_member
where memberid in (select memberid from dv_board);

select memberid, mem_name
from dv_member
where memberid in (select memberid from dv_oders
where productid = 1232);

select memberid, mem_name
from dv_member
where memberid in (select  memberid from dv_oders
where productid in (select productid from dv_product
where dv_product.productname='»óÇ°4'));


select dm.memberid, dm.mem_name, dp.productname, do.ordercnt, dp.price
from dv_product dp, dv_member dm, dv_oders do
where dp.productid=do.productid and dm.memberid=do.memberid
and dm.mem_name like 'È«±æµ¿'
order by dp.price;

select db.boardid, dm.mem_name, db.brdtitle, db.brdcontents, db.brddate
from dv_member dm, dv_board db
where db.memberid=dm.memberid
order by db.brddate;

select do.memberid, sum(price)
from dv_oders do, dv_product dp
where dp.productid=do.productid
group by memberid
having sum(price) >10000;

select *
from dv_member
where mem_name like '±è%';

SELECT *
FROM dv_member
order by memberid;

