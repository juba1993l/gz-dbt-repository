{{ config(materialized='table') }}
select
    op.date_date,
    count(op.orders_id) as nb_operations,
    round(sum(cast(op.revenue as numeric))) as revenue,
    round((sum(cast(op.revenue as numeric)) / count(op.orders_id)), 1) as average_basket,
    round(sum(cast(op.margin as numeric))) as margin,
    round(sum(cast(op.operational_margin as numeric))) as operational_margin,
    round(sum(cast(op.purchase_cost as numeric))) as purchase_cost,
    round(sum(cast(op.shipping_fee as numeric))) as shipping_fee,
    round(sum(cast(op.logcost as numeric))) as logcost,
    round(sum(cast(op.ship_cost as numeric))) as ship_cost,
    round(sum(cast(op.quantity as numeric))) as quantity
from {{ ref("int_orders_operational") }} as op
group by op.date_date
order by op.date_date desc
