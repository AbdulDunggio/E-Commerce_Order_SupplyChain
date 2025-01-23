--calculate the percentage of on time delivery --

with on_time_cte as (select
count(*) as on_time
from customers c
join orders o
on c.customer_id = o.customer_id
where order_status = "delivered"
and order_delivered_timestamp <= order_estimated_delivery_date),

all_data_cte as (select
count(*) as all_data
from customers c
join orders o
on c.customer_id = o.customer_id)

select
on_time * 100 / all_data as delivered_percentage
from on_time_cte, all_data_cte

--calculate the city that have the highest level of delay --

select
customer_city,
count(*) as late_count
from customers c
join orders o
on c.customer_id = o.customer_id
where order_delivered_timestamp >= order_estimated_delivery_date
group by customer_city
order by late_count desc

-- calculate average delivery duration per product category --
select product_category_name,
avg(datediff(order_delivered_timestamp, order_approved_at)) as rataan_product
from products p
join order_items oi
on p.product_id = oi.product_id
join orders o
on o.order_id = oi.order_id
group by product_category_name
order by rataan_product desc
