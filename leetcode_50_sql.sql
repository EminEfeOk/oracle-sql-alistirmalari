-- Select

-- 1757 recyclable and low fat products
SELECT product_id 
FROM products
WHERE 1=1
    AND low_fats = 'Y'
    AND recyclable = 'Y';

-- 584 find customer referee
select name
from customer
where referee_id != 2 or referee_id is null; -- not referee_id != 2 null degerleri getirmiyor

-- 595 big countries 

select name , population , area
from world
where area >= 3000000 or population >= 25000000;

-- 1148 Article Views I

select distinct author_id as id
from views
where author_id = viewer_id
order by 1;

-- 1683. Invalid Tweets

select tweet_id   
from tweets
where length(content) > 15;

-- basic Join (joinlerle birlikte grup fonksiyonu eklenince sorun yasiyorum daha cok tekrar )

-- 1378. Replace Employee ID With The Unique Identifier
select eu.unique_id, e.name
from employees e left join employeeuni eu
    on e.id = eu.id; 

-- 1068. Product Sales Analysis I

select p.product_name , s.year , s.price
from sales s , product p 
where s.product_id = p.product_id;

-- 1581. Customer Who Visited but Did Not Make Any Transactions

-- onemli zorlandim sorgulardan biri tekrar yap

-- left join yapip  nulllari getir onlari say

select customer_id , count(*) as count_no_trans
from visits v left join transactions t
    on v.visit_id = t.visit_id
where t.visit_id is null
group by customer_id 
order by 1;

-- 197. Rising Temperature

select w.id
from weather w inner join weather we
    on w.recorddate = we.recorddate + 1
where w.temperature > we.temperature;  

-- 1661. Average Time of Process per Machine
-- guzel soru buna da tekrar bak 
select a.machine_id,
        Round(AVG(ac.timestamp - a.timestamp),3) as processing_time
from activity a  inner join activity ac
    on  a.machine_id = ac.machine_id and a.process_id = ac.process_id
where 1=1
    and a.activity_type = 'start'
    and ac.activity_type = 'end'
GROUP BY a.machine_id
order by 1;

-- 577. Employee Bonus

select name, bonus 
from employee e left join bonus b
    on e.empid = b.empid
where bonus < 1000 or bonus is null;

-- 1280. Students and Examinations

-- count(*) ile count(e.subject_name) farkina bak joinleri birden fazla sartla eslestirmede sorun yasadim buna tekrar don

select s.student_id , student_name , su.subject_name, count(e.subject_name) as attended_exams
from students s cross join subjects su
    left join  examinations e
    on e.student_id = s.student_id
    and su.subject_name = e.subject_name
group by s.student_id , student_name , su.subject_name
order by 1;

-- 570. Managers with at Least 5 Direct Reports

select e.name 
from employee e, employee em
where e.id = em.managerid
group by e.name , e.id
having count(*) >= 5;

-- 1934. Confirmation Rate
-- tekrar bak 
select s.user_id,
    round(count(case when c.action = 'confirmed' then 1 end) / count(*),2) as confirmation_rate
from signups s left join confirmations c
    on s.user_id = c.user_id
group by s.user_id;
