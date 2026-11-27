create view vw_konum_bilgisi as
select ad , soyad , semt , konum_adi
from personel pr, konum kn 
where kn.konum_id = pr.konum_id;

select * from vw_konum_bilgisi;

create view vw_yoneticiler as
select yn.yonetici_id , ps.ad , ps.soyad,
    ps.unvan, pk.konum_id,
    (ps.maas + nvl(ps.prim,0)) as gelir
from yonetici yn , personel ps , konum pk
where ps.personel_id = yn.personel_id 
    and ps.konum_id = pk.konum_id;

select * from vw_yoneticiler; 
-- veriyi disari karsi guvenlikli hale getirir 
--mesela onemli tablolari buradan hangilerden cektigi goremez

-- usteki tablo degistirmek icin 
create or replace view vw_konum_bilgisi as
select ad || ' ' ||soyad  as adi_soyadi,
 semt , konum_adi, il_kodu
from personel pr, konum kn 
where kn.konum_id = pr.konum_id;

-- view uzerinde DML
create view vw_uzman as
select * from personel where unvan = 'UZMAN';

select * from vw_uzman;

update vw_uzman set konum_id = 5 where prim > 0; -- personel tablosunda guncelleme yapar 
select * from personel where unvan = 'UZMAN'; -- o yuzden buradada da degistigini goruruz

-- with read only eklersek
create or replace view vw_uzman as
select * from personel where unvan = 'UZMAN'
with read only; -- update calismaz

update vw_uzman set unvan = 'ŞEF'; -- bu gunceller ama biz bunu istemiyoruz 
-- o yuzden with check option ekleriz
create or replace view vw_uzman as
select * from personel where unvan = 'UZMAN'
with check option;
-- bu sayede update vw_uzman set unvan = 'ŞEF'; bu kisim calismaz 