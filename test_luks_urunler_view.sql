create view vw_product_grand_lux as
select id, name , price from product
where segment_id =1;

update vw_product_grand_lux
set price = price * 1.3;

delete from vw_product_grand_lux
where id = 11;

insert into vw_product_grand_lux (id, name , price, segment_id)
values (21, 'Air Cleaner', 1200, 1); -- segment_id not null oldugu icin ekleyemiyoruz
-- uste segment_id eklersek viewe oyle yapabiliriz

create or replace view vw_product_grand_lux as
select id, name , price , segment_id from product
where segment_id =1;


select * from vw_product_grand_lux order by 1;

select id, name , price from product
where segment_id =1;