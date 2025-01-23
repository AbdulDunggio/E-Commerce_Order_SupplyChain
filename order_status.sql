-- canceled order analysis --
select
count(*)
from orders
where order_status = 'canceled'

-- Analysis of the relationship between approval time and order status --
WITH day_diff AS (
    SELECT
        order_id,
        DATEDIFF(order_approved_at, order_purchase_timestamp) AS diff_day
    FROM orders
    WHERE order_approved_at IS NOT NULL 
      AND order_purchase_timestamp IS NOT NULL 
      AND DATEDIFF(order_approved_at, order_purchase_timestamp) != 0
),
sort_day AS (
    SELECT
        diff_day,
        ROW_NUMBER() OVER (ORDER BY diff_day) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM day_diff
),
day_ctg AS (
    SELECT
        MAX(CASE WHEN row_num <= total_rows * 0.33 THEN diff_day END) AS d_fast,
        MAX(CASE WHEN row_num <= total_rows * 0.66 THEN diff_day END) AS d_mid
    FROM sort_day
),
day_class AS (
    SELECT
        dd.order_id,
        dd.diff_day,
        CASE 
            WHEN dd.diff_day <= dc.d_fast THEN 'Fast'
            WHEN dd.diff_day <= dc.d_mid THEN 'Normal'
            ELSE 'Slow'
        END AS d_class
    FROM day_diff dd
    CROSS JOIN day_ctg dc
)
SELECT
    dc.d_class,
    COUNT(dc.order_id) AS canceled_orders
FROM day_class dc
JOIN orders o ON o.order_id = dc.order_id
WHERE o.order_status = 'canceled'
GROUP BY dc.d_class
ORDER BY canceled_orders DESC;

-- Trend analysis of order status in a certain period --
select
order_status,
year(order_purchase_timestamp) as year_period,
count(*) as cnt_status
from orders
group by order_status, year_period
having year_period = 2016
