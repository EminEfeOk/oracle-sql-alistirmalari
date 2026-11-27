create index pers_nil on personel(personel_id);

select * from personel;
-- personel tablosuna email kolonu ekleyerek bu alan uzerine uniqe index olusturma
alter table personel add (email varchar2(150));

select 
    translate(LOWER(replace(ad,' ','')), 'ıöüçşğ', 'ioucsg') || '.'||
    translate(LOWER(replace(soyad,' ','')), 'ıöüçşğ', 'ioucsg') || '@gmail.com' as email
from personel; -- parantezlere dikkat 

update personel set email =
    translate(LOWER(replace(ad,' ','')), 'ıöüçşğ', 'ioucsg') || '.'||
    translate(LOWER(replace(soyad,' ','')), 'ıöüçşğ', 'ioucsg') || '@gmail.com';

create unique index uq_personel_email on personel(email); 
-- hata veriyor ORA-01452: cannot CREATE UNIQUE INDEX; duplicate keys found

select email , count(*) 
from personel 
group by email 
having count(*) > 1;

select * from personel 
where email = 'servet.turan@gmail.com';

update personel set email = 'servet.turan2@gmail.com' where personel_id = 5084;
