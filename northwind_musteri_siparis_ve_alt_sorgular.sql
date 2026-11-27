-- soru2
SELECT customer_id , company_name,contact_name, city, country
FROM customers
WHERE initcap(country) in ('Germany','France','Uk') OR LOWER(company_name) LIKE '%market%'
order by country, company_name;

-- herhangi bir siparisi olan musteriler
SELECT customer_id , company_name,contact_name 
FROM customers
WHERE customer_id in (SELECT DISTINCT customer_id FROM orders);

-- 10dan fazla siparis vermis olan musterilerin listesini getiren sorgu
SELECT customer_id ,company_name,contact_name
FROM customers
WHERE customer_id in 
    (
        SELECT customer_id
        FROM orders
        GROUP BY customer_id
        HAVING COUNT(*) > 10
    )
ORDER BY 1;
-- EXIST ile cozumu
SELECT customer_id ,company_name,contact_name
FROM customers c
WHERE EXISTS
(
    SELECT 1 FROM orders o
    WHERE c.customer_id = o.customer_id
    GROUP BY customer_id
    HAVING COUNT(*) > 10
)
ORDER BY 1;
-- siparis adeti eklenmis hali
SELECT c.customer_id , c.company_name ,order_info.adet
FROM customers c,
(
    SELECT  customer_id ,COUNT(*) as adet 
    FROM orders 
    GROUP BY customer_id
    HAVING COUNT(*) > 10
)order_info
WHERE c.customer_id = order_info.customer_id;
-- Eastern bolgesinde arazisi olanlari bul
SELECT employee_id,first_name,last_name
FROM employees
WHERE employee_id in 
(
    SELECT employee_id
    FROM employee_territories
    WHERE territory_id in 
    (
        SELECT territory_id
        FROM territories
        WHERE region_id in 
        (
            SELECT region_id
            FROM region
            WHERE INITCAP(region_description) = 'Eastern'
        )
    )
);
-- mexico ulkesine gonderilen siparislerin en yuksek miktarlisindan daha yuksek miktarda siparis verilen diger sehirlerdeki siparisleri bulan sorgu yazin
SELECT ship_country , freight
FROM orders
WHERE ship_country != 'mexico' and freight > ALL 
( 
    SELECT  freight
    FROM orders 
    WHERE LOWER(ship_country) = 'mexico'
);

-- herhangi bir siparisi vermemis musteriler
SELECT customer_id , company_name,contact_name 
FROM customers cs
WHERE NOT EXISTS
(
    SELECT 1 FROM orders
    WHERE cs.customer_id = orders.customer_id
);

-- herhangi bir siparisi tasimis olan kargo sirketleri bulan sorgu yaziniz
SELECT shipper_id, company_name , phone 
FROM shippers s
WHERE EXISTS
(
    SELECT 1 FROM orders o
    WHERE s.shipper_id = o.ship_via
);

WITH order_info As
(
    SELECT o.customer_id , COUNT(*) AS order_count
    FROM orders o 
    GROUP BY customer_id
    HAVING  COUNT(*) > 10 
)
SELECT c.customer_id , c.company_name,c.contact_name, oi.order_count
FROM customers c ,order_info oi
WHERE c.customer_id = oi.customer_id;



