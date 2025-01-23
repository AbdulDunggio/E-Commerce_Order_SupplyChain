-- analyze the average amount of order value per customer --
select
c.customer_id,
avg(payment_value) as c_value
from customers c
join orders o
on c.customer_id = o.customer_id
join payments p
on p.order_id = o.order_id
group by customer_id
order by c_value desc

-- analyze customers who have the highest total purchases --
select
c.customer_id,
sum(payment_value) as c_value
from customers c
join orders o
on c.customer_id = o.customer_id
join payments p
on p.order_id = o.order_id
group by customer_id
order by c_value desc
limit 1
