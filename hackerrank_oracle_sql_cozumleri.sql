SELECT si.roll_number , si.name
from student_information si ,examination_marks em
where 1=1
    and si.roll_number = em.roll_number
    and (em.subject_one + em.subject_two + em.subject_three) < 100R;

SELECT ptod.stock_code from price_today ptod, price_tomorrow ptom
where 1=1
    and ptod.stock_code = ptom.stock_code
    and ptod.price < ptom.price;
