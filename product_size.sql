-- analyzing the relationship between product dimensions and shipping charge --
with volume_product as (select product_id,
product_length_cm * product_height_cm * product_width_cm
as product_dimension
from products
),

sorted_volume as (select
product_dimension,
ROW_NUMBER() over(order by product_dimension) as row_num,
count(*) over() as total_rows
from volume_product
),

volume_percent as (select
max(case when row_num <= total_rows * 0.33 
then product_dimension END) as v_small,
max(case when row_num <= total_rows * 0.66
then product_dimension END) as v_mid
from sorted_volume
),

volume_class as (select
product_id,
product_dimension,
case
when product_dimension <= v_small then 'small'
when product_dimension <= v_mid then 'medium'
else 'big' end as v_class
from volume_product, volume_percent
)

select
v_class,
avg(shipping_charges) as avg_shipment
from volume_class vc
join order_items oi
on oi.product_id = vc.product_id
group by v_class
order by avg_shipment desc

-- average dimensions of the most ordered products --

with volume_product as (select product_id,
product_length_cm * product_height_cm * product_width_cm
as product_dimension
from products
),

sorted_volume as (select
product_dimension,
ROW_NUMBER() over(order by product_dimension) as row_num,
count(*) over() as total_rows
from volume_product
),

volume_percent as (select
max(case when row_num <= total_rows * 0.33 
then product_dimension END) as v_small,
max(case when row_num <= total_rows * 0.66
then product_dimension END) as v_mid
from sorted_volume
),

volume_class as (select
product_id,
product_dimension,
case
when product_dimension <= v_small then 'small'
when product_dimension <= v_mid then 'medium'
else 'big' end as v_class
from volume_product, volume_percent
)

select
v_class,
count(distinct order_id) as ordr
from volume_class vc
join order_items oi
on oi.product_id = vc.product_id
group by v_class
order by ordr desc
