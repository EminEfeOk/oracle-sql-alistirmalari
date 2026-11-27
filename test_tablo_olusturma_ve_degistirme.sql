create table dersler
(
    ders_id number,
    ders_ismi varchar2(50),
    ders_aciklamasi varchar2(200),
    ilk_ders_tarihi date,
    ders_kapasitesi integer default 20,
    ders_hocasi varchar2(70) default 'Henuz atama yapilmamis'
);


create table filmoyuncu
(
    filmid int,
    oyuncuismi varchar2(70),
    oyuncusoyadi varchar2(70)
);

-- kolon isimlere _ koyunuz , dogum gunu kolonu ekle , 250 karakterlik adres kolonu ekle 
-- null olmayacak sekilde bir sehir kolonu ekle
-- default deger 'Warner Bros' olacak sekilde sirket kolonu ekle  , adress kolonu 500 karakterlige cikar 
-- tablo ismini film oyuncu olarak degistir

alter table filmoyuncu rename column filmid to film_id;
alter table filmoyuncu rename column oyuncuismi to oyuncu_ismi;
alter table filmoyuncu rename column oyuncusoyadi to oyuncu_soyadi;
alter table filmoyuncu add (dogum_gunu date);
alter table filmoyuncu add (adres varchar2(250));
alter table filmoyuncu add (sehir varchar2(50) not null);
alter table filmoyuncu add (sirket varchar2(200) default 'Warner Bros');
alter table filmoyuncu modify (adres varchar2(500));
alter table filmoyuncu rename to film_oyuncu;


CREATE TABLE kitap
(
    kitap_id integer not null,
    kitap_adi varchar2(120) not null,
    yazar_adi varchar2(100),
    isbn varchar2(40),
    basim_yili integer,
    sayfa_adedi integer
);

INSERT INTO kitap 
(
    kitap_id , kitap_adi , yazar_adi, isbn , basim_yili, sayfa_adedi
) VALUES
(
    1, 'Oracle Ogreniyorum', null , null, 2023 ,345
);

SELECT * FROM kitap;

ALTER TABLE kitap MODIFY (yazar_adi varchar2(100) not null); -- null value oldugu icin hata verdi
rollback;
-- ek not alter table bastigin icin oto commit yapti ddl komutlari oto commit yapar ondan rollback yapsanda insert gitmez
delete from kitap; -- diyerek sorun cikarani silip altertable kullanabilir


