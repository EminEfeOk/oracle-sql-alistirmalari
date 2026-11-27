-- soru1
SELECT personel_id , 
    INITCAP(ad || ' '|| soyad) AS AD_SOYAD,
    unvan, maas,
    nvl(prim , 0) AS prim ,
    (nvl(prim , 0) + maas) AS TOPLAM_ODEME
FROM personel 
WHERE (nvl(prim , 0) + maas) > 5000
ORDER BY toplam_odeme DESC ,personel_id;

--soru 4
SELECT personel_id,
    INITCAP(ad || ' ' || soyad) AS AD_SOYAD,
    unvan,
    giris_tarihi,
    TRUNC(MONTHS_BETWEEN(sysdate ,giris_tarihi)) AS CALISMA_AYI
FROM personel
WHERE cikis_tarihi is null and giris_tarihi is not null
ORDER BY CALISMA_AYI DESC;

--soru 6
SELECT P.personel_id,
    INITCAP(P.ad || ' ' || P.soyad) AS AD_SOYAD,
    P.konum_id,
    k.konum_adi
FROM personel P inner join konum K
    on P.konum_id = K.konum_id
ORDER BY konum_adi, AD_SOYAD;


-- seviyesi 1 olan yoneticilerin personeli kimlerdin
SELECT personel_id, ad, soyad , ps.yonetici_id FROM personel pr
    WHERE pr.yonetici_id in (
        SELECT yn.yonetici_id
        FROM yonetici yn
        WHERE seviye = 1);
        
-- seviyesi 1 olan yoneticilerin personeli kimlerdin
SELECT personel_id, ad, soyad , yonetici_id FROM personel ps
WHERE EXISTS
(
    SELECT 1 FROM yonetici yn 
    WHERE ps.yonetici_id = yn.yonetici_id AND seviye = 1    
);
-- 5001 idli personelin yonetici ve unvan bilgisi ayni olan diger personelleri bulalim
SELECT personel_id, ad, soyad , unvan , yonetici_id, maas FROM personel 
WHERE (yonetici_id, unvan) in 
        (
            SELECT yonetici_id, unvan FROM personel 
            WHERE personel_id = 5001
        );
        
-- ortalama maasi 4000 gecen yoneticilere bagli personeller kimlerdir
WITH ort_maas As
(
    SELECT yonetici_id , ROUND(AVG(maas),2) ortalama
    FROM personel
    WHERE yonetici_id is not null
    GROUP BY yonetici_id
)
SELECT ad , soyad , maas , ps.yonetici_id
FROM personel ps, ort_maas
WHERE ps.yonetici_id = ort_maas.yonetici_id AND ort_maas.ortalama > 4000
order by 4;

-- with olmadan kullanmak istersek
SELECT ad , soyad , maas , ps.yonetici_id
FROM personel ps, 
(
    SELECT yonetici_id , ROUND(AVG(maas),2) ortalama
    FROM personel
    WHERE yonetici_id is not null
    GROUP BY yonetici_id    
) om
WHERE ps.yonetici_id = om.yonetici_id AND om.ortalama > 4000
order by 4;

-- konum tablosuna yeni kayit ekleme implicit yontemi
INSERT into konum(konum_id,konum_adi,il_kodu)
VALUES (10,'Ankara-Yenimahalle',6);

-- expcilit yontemi konum sirasi bilinmesi lazim butun kolonlar yazilmali 
INSERT INTO konum
VALUES (11,'İstanbul-Pendik',34);

SELECT KONUM_ID , KONUM_ADI , IL_KODU  FROM konum;

SELECT * FROM personel WHERE personel_id = 5012;
SELECT * FROM personel WHERE yonetici_id = 919;
SELECT * FROM personel WHERE personel_id in (5005, 5004);

UPDATE personel
SET maas = 2800
WHERE personel_id = 5012;

UPDATE personel
SET giris_tarihi = TO_DATE(10,12,2018, 'dd,mm,yyyy')
WHERE yonetici_id = 919;

UPDATE personel
SET maas = (SELECT maas FROM personel WHERE personel_id = 5004),
   unvan = (SELECT unvan FROM personel WHERE personel_id = 5004)
WHERE personel_id = 5005;
-- daha optimize
UPDATE personel
SET (maas,unvan) = (SELECT maas , unvan FROM personel WHERE personel_id = 5004)
WHERE personel_id = 5005;

-- icerisinde CRM gecen departmanlarda calisan personellerin %25 maas zammi yapan sorgu
UPDATE personel 
SET maas = maas * 1.25
WHERE dept_id in (
    SELECT dept_id FROM departman WHERE UPPER(dept_ismi) like '%CRM%'
);

-- iller tablosunda bulunan bolge_adi kolonun tum satirlar icin guncelleyen kodu yaziniz
UPDATE iller i
SET bolge_adi = 
(   
    SELECT Bolge_adi 
    FROM bolgeler b 
    WHERE i.bolge_kodu = b.bolge_kodu

);


