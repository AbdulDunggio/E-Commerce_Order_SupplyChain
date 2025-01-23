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

-- analysis of the relationship between price level and late delivery of products --

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
    oi.order_id,
    oi.price,
    CASE
        WHEN oi.price <= p.b_affordable THEN 'Low'
        WHEN oi.price <= p.b_midrange THEN 'Medium'
        ELSE 'High'
    END AS price_category
FROM order_items oi, percentile p),

rank_delay as (select
count(oi.order_id) as banyak_delay,
pc.price_category,
rank() over(order by count(oi.order_id) desc) as rank_delay
from order_items oi
join price_class pc
on oi.order_id = pc.order_id
join orders o
on oi.order_id = o.order_id
where order_delivered_timestamp >= order_estimated_delivery_date
group by pc.price_category
)

select price_category,
banyak_delay
from rank_delay

-- calculate the highest average shipping charges based on seller --
select seller_id,
avg(shipping_charges) as avg_shipment
from order_items
group by seller_id
order by avg_shipment desc
