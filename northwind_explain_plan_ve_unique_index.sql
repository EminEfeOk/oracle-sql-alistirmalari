-- tum musterilerin tum siparislerini bilgilerini barindan yeni bir tablo olusturulacak
explain plan for
select c.customer_id, c.company_name , c.contact_name,
     o.order_id, o.order_date, o.freight, o.ship_city
from customers c , orders o 
where c.customer_id = o.customer_id;

select plan_table_output
from table (dbms_xplan.display());

explain plan for
select * from customers where customer_id = 'PARIS';


-- alistirma 2
create unique index ui_emp on employees(city,postal_code);