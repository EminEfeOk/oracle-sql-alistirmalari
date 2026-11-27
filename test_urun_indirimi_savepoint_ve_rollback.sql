-- TUM SEGMENTDEKI URUNLERIN INDIRIM ORANI GUNCELLEMEK
UPDATE product_segment 
SET discount = discount + 0.08;

-- TUM URUNLERIN INDIRIM MIKTARLARINI HESAPLANARAK NET UCRET GUNCELLEME
UPDATE product p
SET net_price = price - price * (SELECT s.discount FROM product_segment s WHERE s.id = p.segment_id);

SAVEPOINT all_segment; -- 1. save noktasi

-- luks segmentdeki urunlerin indirim orani guncelleme
UPDATE product_segment
SET discount = discount + 0.15
WHERE INITCAP(segment) like '%Luxury%';

-- LUKS SEGMENTDEKI URUNLERIN NET UCRETI GUNCELEME
UPDATE product p
SET net_price = price - price * (SELECT s.discount FROM product_segment s WHERE s.id = p.segment_id)
WHERE p.segment_id in 
    (SELECT ps.id FROM product_segment ps WHERE INITCAP(segment) like '%Luxury%');

SAVEPOINT luxury_segment; --2. save noktasi

-- LUKS olmayan SEGMENTDEKI URUNLERIN indirim orani guncelleme

UPDATE product_segment
SET discount = discount + 0.05
WHERE INITCAP(segment) like '%Mass%';

-- LUKS olmayan SEGMENTDEKI URUNLERIN NET UCRETI GUNCELEME
UPDATE product p
SET net_price = price - price * (SELECT s.discount FROM product_segment s WHERE s.id = p.segment_id)
WHERE p.segment_id in 
    (SELECT ps.id FROM product_segment ps WHERE INITCAP(segment) like '%Mass%');

SELECT SUM(net_price) FROM product;

-- HIC BIR UPDATE YAPILMADAN ONCEKI TOPLAM NET PRICE 10568.81
-- ilk savepoint net price 9661.46 
-- 2.savepoint noktasi 8149.12
-- son luks olmayan net ucret 8086.12


rollback; -- en basa donebilir 
rollback to luxury_segment; -- 8149 a doner usteki 2 update gider 
rollback to all_segment; -- 9661.46 a doner bunu rollback yapip ustekine de basarsan bu hata verir
--Error starting at line : 1 in command -ORA-01086: savepoint 'LUXURY_SEGMENT' never established 

SELECT * FROM product;

SELECT * FROM  product_segment;