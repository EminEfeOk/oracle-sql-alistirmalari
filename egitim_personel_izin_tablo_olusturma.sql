create table personel_izin
(
    personel_id number,
    izin_turu varchar2(10),
    bas_tarihi date default sysdate,
    bit_tarihi date

);

select * from personel_izin;

rollback;