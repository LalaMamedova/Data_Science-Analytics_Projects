use EcommerceProject
alter table ecommerce
add correct_event_time date

UPDATE ecommerce
SET event_time = REPLACE(event_time, ' UTC', '')

UPDATE ecommerce
SET correct_event_time = TRY_CONVERT(datetime2, event_time, 126)
WHERE correct_event_time IS NULL

--Ən populyar məhsulları, məhsul kateqoriyalarını və markaları müəyyən etmək üçün alış hadisəsi məlumatlarını təhlil edin.
--Kategoriyalar
select category_code,
       event_type,
       count(event_type) as EventTypeCount from ecommerce
group by category_code,event_type
order by  count(event_type) desc

--Alan userlar sayı
DECLARE @buyersCount INT;
SET @buyersCount = (
    SELECT COUNT(DISTINCT user_id)
    FROM ecommerce
    WHERE event_type = 'purchase'
);
select @buyersCount

--UA
DECLARE @usersCount INT;
SET @usersCount = (SELECT COUNT(DISTINCT user_id) AS CountOfUniqueUser FROM ecommerce);
select @usersCount

--Conversion
SELECT (@buyersCount * 100.0) / @usersCount AS conversion;



--Səbətə Atan Userlarin Sayı
SELECT  count(distinct(user_id)) [Number of users who add at least one product to cart]
FROM ecommerce
WHERE event_type = 'cart'


--Alıcılar
SELECT user_id,count(event_type) as [Count of user purchase]
FROM ecommerce
where event_type = 'purchase'
group by user_id

--DAU
select  DATEPART(month , correct_event_time) [month],
        DATEPART(day , correct_event_time) [day],
        count(distinct(user_id))  [user count per day]
from ecommerce
group by DATEPART(day , correct_event_time),
         DATEPART(month , correct_event_time)
order by  DATEPART(month , correct_event_time),
          DATEPART(day , correct_event_time)

--AVG
;with CountOfEventType as (
    select Count(event_type) as CountTypeCount,
           event_type, user_id  from ecommerce
    group by event_type,user_id
)

SELECT event_type, avg(CountTypeCount) as [Avg count per event type]
FROM CountOfEventType
group by event_type

--Məhsullar
select product_id,
       event_type,
       count(event_type) as EventTypeCount from ecommerce
group by product_id,event_type
order by count(event_type) desc

--Markalar(Brenlər)
select brand,  event_type,
       count(event_type) as EventTypeCount from ecommerce
                                           where brand != 'NULL'
group by brand,event_type
order by count(event_type) desc


--Mövsümi tendensiyaları və zamanla istehlakçı seçimlərindəki dəyişiklikləri qiymətləndirin.

SELECT MONTH(correct_event_time) AS month, event_type, COUNT(product_id) AS СountOfProduct
FROM ecommerce
where event_type = 'purchase'
GROUP BY MONTH(correct_event_time),event_type
ORDER BY COUNT(product_id) desc

---Həftənin günü, günün vaxtı və digər amillər əsasında alış-veriş tendensiyalarını araşdırın.
--Həftənin günləri

SELECT DATEPART(month , correct_event_time) as month,
    CASE
        WHEN DATEPART(day , correct_event_time) <8 THEN 'Week 1'
        WHEN DATEPART(day , correct_event_time) <15 THEN 'Week 2'
        WHEN DATEPART(day , correct_event_time) <22 THEN 'Week 3'
        ELSE 'Week 4' end as WeekOfMonth,
    DATEPART(weekday , correct_event_time) weekday, event_type, COUNT(product_id) AS СountOfProduct
FROM ecommerce
WHERE event_type = 'purchase'
GROUP BY DATEPART(month, correct_event_time),
        DATEPART(day , correct_event_time),
        DATEPART(weekday, correct_event_time),
        event_type
ORDER BY DATEPART(month, correct_event_time),
        DATEPART(day , correct_event_time),
        DATEPART(weekday, correct_event_time)


--Günün Vaxtı
SELECT
    DATEPART(hour, TRY_CONVERT(datetime2, event_time, 126)) AS hour,
    COUNT(product_id) AS CountOfProduct
FROM
    ecommerce
WHERE
    event_type = 'purchase'
GROUP BY
    DATEPART(hour, TRY_CONVERT(datetime2, event_time, 126))
ORDER BY
    DATEPART(hour, TRY_CONVERT(datetime2, event_time, 126)) asc
