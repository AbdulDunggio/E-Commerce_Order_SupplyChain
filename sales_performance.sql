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
