--soru 3
SELECT id, name , course_name, mark,
    Case
        WHEN mark BETWEEN 90 and 100 THEN 'EXCELLENT'
        WHEN mark BETWEEN 80 and 89 THEN 'VERY GOOD'
        WHEN mark BETWEEN 70 and 79 THEN 'GOOD'
        WHEN mark BETWEEN 60 and 69 THEN 'PASS'
        ELSE 'FAIL'
    END AS RESULT
FROM student
WHERE class_no in (4,5,6,7)
ORDER BY 4 DESC ,2;
-- soru 5
SELECT course_name,
    COUNT(name) AS STUDENT_COUNT,
    ROUND(AVG(mark),2)AS AVG_MARK,
    MAX(mark)AS MAX_MARK,
    Min(mark)AS MIN_MARK
FROM student
GROUP BY course_name
HAVING AVG(mark) >= 70 AND COUNT(name) >= 5
ORDER BY avg_mark DESC;
-- soru 7
SELECT p.name,
    ps.segment,
    p.price,
    ps.discount,
    ROUND((p.price - (p.price * ps.discount)),2) AS FINAL_PRICE
FROM product p inner join product_segment ps
    ON p.segment_id = ps.id
WHERE (p.price - (p.price * ps.discount))> 800
ORDER BY FINAL_PRICE DESC;

INSERT INTO STUDENT (id , name , class_no,mark, gender,course_name)
VALUES (36, 'Adele', default, default ,default, 'Finance');

INSERT INTO STUDENT (id , name , class_no,mark, gender,course_name)
VALUES (37, 'Tarkan', default, 78 ,'male', 'Zoology');

INSERT INTO STUDENT (id , name , mark, course_name)
VALUES (38, 'Ava Max', 85, 'History');

INSERT INTO STUDENT
VALUES (39,'Emin',default,100,'male','Computer Engineer', null);

INSERT INTO STUDENT(id,name,mark,gender,course_name)
VALUES (39,'Emin',100,'male','Computer Engineer');

SELECT * FROM STUDENT ORDER BY 1 DESC;
SELECT * FROM product;

UPDATE product p
SET net_price = price - price * (
    SELECT s.discount FROM product_segment s
    WHERE s.id = p.segment_id
);

-- kitap tablosundaki kitap id ye primary key ekleme 
alter table kitap add constraint pk_kitap_id primary key (kitap_id);




