SELECT 
    cast (products_id as integer) as products_id, 
    cast (date_date as date) as date_date, 
    cast (orders_id as integer) as orders_id,
    cast (revenue as decimal) as revenue, 
    cast (quantity as integer) as quantity, 
    CAST(purchase_price AS FLOAT64) as purchase_price, 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    round (s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2),2) AS margin
FROM {{ref("raw_gz_sales")}} s
LEFT JOIN {{ref("raw_gz_product")}} p 
    USING (products_id)