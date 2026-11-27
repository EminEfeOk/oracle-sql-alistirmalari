CREATE TABLE personel_egitim
(
    personel_id number not null,
    egitim_adi varchar2(100) not null,
    baslangic date,
    bitis date,
    egitim_turu integer
);

INSERT INTO personel_egitim
(
    personel_id , egitim_adi , baslangic , bitis , egitim_turu
) values
(
    5555, null, sysdate + 10 , sysdate + 15, 1
); -- null egitim adi girdigimiz icin hata verir
INSERT INTO personel_egitim
(
    personel_id , egitim_adi
) values
(
    6666, ''
); -- '' bunu da oracle null kabul eder ondan hata verir
