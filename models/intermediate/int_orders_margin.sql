select

cast (date_date as timestamp) as date_date,
sum(revenue) as revenue,
sum(quantity) as quantity,
sum(purchase_cost) as purchase_cost,
sum(margin) as margin
from {{ref("int_sales_margin")}} as margin
group by orders_id
order by orders_id desc