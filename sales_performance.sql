-- calculate the highest selling rate by seller --
select
seller_id,
sum(price) as selling_rate
from order_items oi
join orders o
on oi.order_id = o.order_id
where order_status = 'delivered'
group by seller_id
order by selling_rate desc

--price class --

WITH sorted_prices AS (
    SELECT 
        price,
        ROW_NUMBER() OVER (ORDER BY price) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM order_items
),
percentile AS (
    SELECT
        MAX(CASE WHEN row_num <= total_rows * 0.33 THEN price END) AS b_affordable,
        MAX(CASE WHEN row_num <= total_rows * 0.66 THEN price END) AS b_midrange
    FROM sorted_prices
),
price_class as (SELECT 
    oi.price,
    CASE
        WHEN oi.price <= p.b_affordable THEN 'Affordable'
        WHEN oi.price <= p.b_midrange THEN 'Mid-range'
        ELSE 'Pricey'
    END AS price_category
FROM order_items oi, percentile p)

select
count(oi.price),
pc.price_category
from order_items oi
join price_class pc
on oi.price = pc.price
join orders o
on oi.order_id = o.order_id
where order_delivered_timestamp >= order_estimated_delivery_date

