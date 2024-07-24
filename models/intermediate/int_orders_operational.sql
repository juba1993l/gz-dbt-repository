select
m.orders_id,
m.date_date,
ROUND(SUM(cast(m.margin as decimal) + cast(ship.shipping_fee as decimal) - cast(ship.logcost as decimal) - cast(ship.ship_cost as decimal) ),2) as Operational_margin
from {{ref("int_orders_margin")}} as m
left join {{ref("raw_gz_ship")}} as ship
using (orders_id)
group by m.orders_id, m.date_date
order by m.orders_id desc
