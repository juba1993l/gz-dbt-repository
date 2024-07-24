/*select
    o.orders_id,
    o.date_date,
    round(
        sum(
            cast(o.margin as decimal)
            + cast(ship.shipping_fee as decimal)
            - cast(ship.logcost as decimal)
            - cast(ship.ship_cost as decimal)
        ),
        2
    ) as operational_margin

  ,o.quantity
  ,o.revenue
  ,o.purchase_cost
  ,o.margin
  ,ship.shipping_fee
  ,ship.logcost
  ,ship.ship_cost
from {{ ref("int_orders_margin") }} as o
left join {{ ref("raw_gz_ship") }} as ship using (orders_id)
order by m.orders_id desc
*/


select
    o.orders_id,
    o.date_date,
    round(
        sum(
            cast(o.margin as decimal)
            + cast(ship.shipping_fee as decimal)
            - cast(ship.logcost as decimal)
            - cast(ship.ship_cost as decimal)
        ),
        2
    ) as operational_margin,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost
from {{ ref("int_orders_margin") }} as o
left join {{ ref("raw_gz_ship") }} as ship using (orders_id)

group by 
    o.orders_id,
    o.date_date,
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost
order by o.orders_id desc
