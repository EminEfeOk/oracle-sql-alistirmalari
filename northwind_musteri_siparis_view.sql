-- musteri ve siparis bilgilerini birlikte gosteren bir view olusturun
create view vw_musteri_siparis as
select c.customer_id, c.company_name, c.contact_name,
    o.order_id, o.order_date
from customers c, orders o
where c.customer_id = o.customer_id;

select * from VW_MUSTERI_SIPARIS;

-- bagimli view
create or replace view vw_musteri_siparis_prod_info as
select co.customer_id , co.company_name,
    co.order_date, p.product_name, p.unit_price
from vw_musteri_siparis co,
    order_details od , products p 
where 1=1
    and co.order_id = od.order_id
    and p.product_id = od.product_id;

select * from vw_musteri_siparis_prod_info;

-- droplama
drop view vw_musteri_siparis;