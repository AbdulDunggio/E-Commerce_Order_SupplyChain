-- most payment type --

select payment_type,
count(*) as payment_count
from payments
group by payment_type
order by payment_count desc

-- analyze the relationship of payment methods to on-time delivery --
select payment_type,
count(*)
from payments p
join orders o
on o.order_id = p.order_id
where order_delivered_timestamp <=
order_estimated_delivery_date
group by payment_type

