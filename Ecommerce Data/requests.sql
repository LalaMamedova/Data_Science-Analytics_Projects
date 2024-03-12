use EcommerceProject

--Columns  in table
--event_type = type of event(purchase,view or cart) that do user
--event_time = time when event was
--product_id = product id
--category_id = category id
--category_code = category of product
--brand = product brand
--price = price of product
--user_id = user id
--user_session = user session


--Update some columns in table
--Remove from event_time 'UTC' for convert to datetime2
UPDATE ecommerce
SET event_time = REPLACE(event_time, ' UTC', '')

--Remove all ',' from price to convert to float
UPDATE ecommerce
SET price = LEFT(price, CHARINDEX(',', price + ',') - 1)

-- --Add new columns
-- alter table ecommerce
-- add purchases_count int
-- UPDATE ecommerce
-- SET purchases_count = (
--     SELECT COUNT(*)
--     FROM ecommerce AS subquery
--     WHERE subquery.brand = ecommerce.brand
--     AND subquery.event_type = 'purchase'
--     GROUP BY subquery.brand
-- )
-- WHERE event_type = 'purchase';
-- alter table ecommerce
-- add correct_event_time date
-- UPDATE ecommerce
-- SET correct_event_time = TRY_CONVERT(datetime2, event_time, 126)
-- WHERE correct_event_time IS NULL



---Analyze purchase event data to identify the most popular products, product categories, and brands.

--Categories
select category_code,
       event_type,
       count(event_type) as EventTypeCount from ecommerce
                                           where category_code is not null
group by category_code,event_type
order by  count(event_type) desc

--Products
select top 500 product_id,
       event_type,
       count(event_type) as EventTypeCount from ecommerce
group by product_id,event_type
order by count(event_type) desc


--Brands
select brand,  event_type,
       count(event_type) as EventTypeCount from ecommerce
                                           where brand != 'NULL'
group by brand,event_type
order by count(event_type) desc


--Count of users, who add at least one product to cart
SELECT  count(distinct(user_id)) [Number of users who add at least one product to cart]
FROM ecommerce
WHERE event_type = 'cart'


--Number of unique users who made a purchase
DECLARE @buyersCount INT;
SET @buyersCount =  (
    SELECT COUNT(DISTINCT user_id) as [Number of users who made a purchase]
    FROM ecommerce
    WHERE event_type = 'purchase'
);
select @buyersCount as [Number of users who made a purchase]

--UA
DECLARE @usersCount INT;
SET @usersCount = (SELECT COUNT(DISTINCT user_id) AS CountOfUniqueUser FROM ecommerce);
select @usersCount AS CountOfUniqueUser

--Conversion
SELECT (@buyersCount * 100.0) / @usersCount AS conversion;

--Count of users purchases
SELECT user_id,count(event_type) as [Count of user purchases]
FROM ecommerce
where event_type = 'purchase'
group by user_id

--DAU
select  DATEPART(month , event_time) [month],
        DATEPART(day , event_time) [day],
        count(distinct(user_id))  [user count per day]
from ecommerce
group by DATEPART(day , event_time),
         DATEPART(month , event_time)
order by  DATEPART(month , event_time),
          DATEPART(day , event_time)

--AVG
;with CountOfEventType as (
    select Count(event_type) as CountTypeCount,
           event_type, user_id  from ecommerce
    group by event_type,user_id
)

SELECT event_type, avg(CountTypeCount) as [Average number per event type]
FROM CountOfEventType
group by event_type


--ARPU
declare @totalRevenue float;
set @totalRevenue = (select sum(price) as TotalRevenue from ecommerce)
select @totalRevenue;

DECLARE @usersCount2 INT;
SET @usersCount2 = (SELECT COUNT(DISTINCT user_id) AS CountOfUniqueUser FROM ecommerce);
select @totalRevenue/@usersCount2 as ARPPU;

--ARPPU
declare @totalRevenue2 float;
set @totalRevenue2 = (select sum(price) as TotalRevenue from ecommerce)
select @totalRevenue2;

DECLARE @buyersCount2 INT;
SET @buyersCount2 =  (
    SELECT COUNT(DISTINCT user_id) as [Number of users who made a purchase]
    FROM ecommerce
    WHERE event_type = 'purchase'
);

select @totalRevenue2/@buyersCount2 as ARPPU;

--Assess seasonal trends and changes in consumer preferences over time
SELECT MONTH(event_time) AS month, event_type, COUNT(product_id) AS СountOfProduct
FROM ecommerce
where event_type = 'purchase'
GROUP BY MONTH(event_time),event_type
ORDER BY COUNT(product_id) desc



---Explore shopping trends based on day of the week, time of day, and other factors.
--Weekday

SELECT
    DATEADD(dd, DATEDIFF(dd, 0, event_time), 0) AS event_day,
    COUNT(product_id) AS [Count Of Purchased Products]
FROM
    ecommerce
WHERE
    event_type = 'purchase'
GROUP BY
    DATEADD(dd, DATEDIFF(dd, 0, event_time), 0)
ORDER BY
    DATEADD(dd, DATEDIFF(dd, 0, event_time), 0)



--Time of day
SELECT
    DATEPART(hour, event_time) AS hour,
    COUNT(product_id) AS CountOfProduct
FROM
    ecommerce
WHERE
    event_type = 'purchase'
GROUP BY
    DATEPART(hour, event_time)
ORDER BY
    DATEPART(hour, event_time) asc


--Brand and count of purchases
SELECT brand, COUNT(*) AS brand_purchases_count
FROM ecommerce
WHERE event_type = 'purchase'
GROUP BY brand
ORDER BY brand_purchases_count DESC;

