select
op.date_date,
count (op.orders_id) as nb_operations,
round(Sum(op.revenue)) as revenue,
round((sum(op.revenue)/count (op.orders_id) ),1) as average_basket,
round(sum(op.margin)) as margin,
round(sum(op.operational_margin)) as operational_margin

from {{ ref("int_orders_operational")}} as op
group by op.date_date
order by op.date_date desc