/*
select
orders_id,
date_date,
round(sum(revenue),2) as revenue,
round(sum(quantity),2) as quantity,
round(sum(purchase_cost),2) as purchase_cost,
round(sum(margin),2) as margin
from {{ref("int_sales_margin")}} as margin
group by orders_id, date_date
order by orders_id desc
*/
SELECT
  orders_id,
  date_date,
  ROUND(SUM(revenue),2) as revenue,
  ROUND(SUM(quantity),2) as quantity,
  ROUND(SUM(purchase_cost),2) as purchase_cost,
  ROUND(SUM(margin),2) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id,date_date
ORDER BY orders_id DESC