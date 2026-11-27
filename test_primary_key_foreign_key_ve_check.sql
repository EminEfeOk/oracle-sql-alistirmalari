CREATE TABLE musteri
(
    musteri_id number,
    musteri_ismi varchar2(255) not null
);

CREATE TABLE yetkili 
(
    yetkili_id number primary key,
    musteri_id number,
    yetkili_ismi varchar2(255) not null,
    constraint fk_musteri foreign key (musteri_id) references musteri(musteri_id) 
);

ALTER TABLE musteri ADD CONSTRAINT pk_musteri primary key (musteri_id);

------------------------------------------------------------------------

insert into musteri (musteri_id,musteri_ismi) values (1, 'Apple');
insert into musteri (musteri_id,musteri_ismi) values (2, 'Google');
insert into musteri (musteri_id, musteri_ismi) values (3, 'Amazon');

insert into yetkili (yetkili_id , musteri_id, yetkili_ismi) values (1 ,1 ,'Alex');
insert into yetkili (yetkili_id , musteri_id, yetkili_ismi) values (2 ,2 ,'Micheal');
insert into yetkili (yetkili_id , musteri_id, yetkili_ismi) values (3 ,3 , 'Jane');
insert into yetkili (yetkili_id , musteri_id, yetkili_ismi) values (4 ,3 , 'Judi');

SELECT * FROM musteri;

SELECT * FROM yetkili;

-- cars tablosuna segment adinda kolon ekle ve sadece a b c d e degerleri alabilsin

alter table cars
ADD (
    segment varchar2(255) check (segment in ('A','B','C','D','E'))
);

-- bolge tablosu
CREATE TABLE bolge 
(
    bolge_kodu integer primary key,
    bolge_adi varchar2(100 byte) not null
);

-- il tablosu
CREATE TABLE il
(
    il_kodu integer not null,
    il_adi  varchar2(50 byte) not null,
    bolge_kodu integer,
    constraint fk_il1 foreign key (bolge_kodu) references bolge(bolge_kodu)
);

-- hangi insertlar hata  verir 

--bolge eklenen insertlar
insert into bolge values (1, 'ic anadolu'); -- calisir 
insert into bolge values (1, 'Marmara'); -- hata verir ilkde primary key var cunku 
insert into bolge values (2, ''); -- null oldugu icin hata verir
insert into bolge values (2, 'Marmara'); -- calisir 

-- iller ekleniyor
insert into il values (6 , 'Ankara', 1); -- calisir 
insert into il values (61 , 'trabzon', 5); -- 5 numarali bolge kodu yok hata verir

-- bolge siliniyor
delete from bolge 
where bolge_kodu = 1;