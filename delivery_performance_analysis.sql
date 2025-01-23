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
