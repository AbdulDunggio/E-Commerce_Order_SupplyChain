-- most selling product category --

select
product_category_name,
count(distinct order_id) as total_sell
from products p
join order_items oi
on p.product_id = oi.product_id
group by product_category_name
order by total_sell desc
limit 1

-- Analyzing the relationship of product weight to shipping cost --
WITH sorted_weight AS (
    SELECT 
        product_weight_g,
        ROW_NUMBER() OVER (ORDER BY product_weight_g) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM products
    WHERE product_weight_g is not null
),
percentile_weight AS (
    SELECT
        MAX(CASE WHEN row_num <= total_rows * 0.33 THEN product_weight_g END) AS w_light,
        MAX(CASE WHEN row_num <= total_rows * 0.66 THEN product_weight_g END) AS w_medium
    FROM sorted_weight
),
weight_class as (SELECT 
    p.product_id,
    p.product_weight_g,
    CASE
        WHEN p.product_weight_g <= pw.w_light THEN 'Light'
        WHEN p.product_weight_g <= pw.w_medium THEN 'Medium'
        ELSE 'Heavy'
    END AS weight_category
FROM products p, percentile_weight pw
)

select weight_category,
avg(oi.shipping_charges) as avg_shipping
from weight_class wc
join order_items oi
on oi.product_id = wc.product_id
GROUP BY weight_category
order by avg_shipping DESC

-- product category demand trends in 2016 --
SELECT
product_category_name,
count(o.order_id)
from products p
join order_items oi
on p.product_id = oi.product_id
join orders o
on oi.order_id = o.order_id
where year(order_purchase_timestamp) = 2016
group by product_category_name
