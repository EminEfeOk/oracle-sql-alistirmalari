-- 1. Üç dersin toplam notu 100'ün altında olan öğrenciler
SELECT si.roll_number, si.name
FROM student_information si, examination_marks em
WHERE 1 = 1
    AND si.roll_number = em.roll_number
    AND (em.subject_one + em.subject_two + em.subject_three) < 100;

-- 2. Yarınki fiyatı bugünkü fiyatından yüksek olan hisseler
SELECT ptod.stock_code
FROM price_today ptod, price_tomorrow ptom
WHERE 1 = 1
    AND ptod.stock_code = ptom.stock_code
    AND ptod.price < ptom.price
ORDER BY ptod.stock_code;
