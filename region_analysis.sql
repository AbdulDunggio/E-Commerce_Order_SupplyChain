-- most higher buyer by city --
select customer_city,
count(*) as subscriber
from customers c
join orders o
on c.customer_id = o.customer_id
where order_status like "delivered"
group by customer_city
order by subscriber desc
limit 1

-- average total purchases per region --
select customer_city,
avg(p.payment_value) as avg_pay
from customers c
join orders o
on c.customer_id = o.customer_id
join payments p
on p.order_id = o.order_id
group by customer_city
order by avg_pay desc

-- region with the highest cancellation rate --
select customer_city,
count(order_status) as rate_cancel
from customers c
join orders o
on c.customer_id = o.customer_id
where order_status = 'canceled'
group by customer_city
order by rate_cancel desc
