-- tum musterilerin tum siparislerini bilgilerini barindan yeni bir tablo olusturulacak
create table personel_orderlari as
select c.customer_id, c.company_name , o.order_id
from customers c , orders o 
where c.customer_id = o.customer_id;