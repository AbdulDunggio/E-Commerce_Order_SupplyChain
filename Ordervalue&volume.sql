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

-- analyze the relationship between purchase value and payment type --
WITH sort_value AS (
    SELECT
        payment_value,
        order_id,
        ROW_NUMBER() OVER (ORDER BY payment_value) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM payments
),
value_ctg AS (
    SELECT
        MAX(CASE WHEN row_num <= total_rows * 0.33 THEN payment_value END) AS v_low,
        MAX(CASE WHEN row_num > total_rows * 0.33 AND row_num <= total_rows * 0.66 THEN payment_value END) AS v_mid
    FROM sort_value
),
value_class AS (
    SELECT
        sv.payment_value,
        sv.order_id,
        CASE 
            WHEN sv.payment_value <= vc.v_low THEN 'Low'
            WHEN sv.payment_value <= vc.v_mid THEN 'Normal'
            ELSE 'High'
        END AS v_class
    FROM sort_value sv
    CROSS JOIN value_ctg vc
)
SELECT
    vcl.v_class,
    payment_type,
    COUNT(p.payment_type) AS total_pay
FROM value_class vcl
JOIN payments p ON p.order_id = vcl.order_id
GROUP BY vcl.v_class, payment_type
ORDER BY total_pay DESC;
