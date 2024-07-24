SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64) as purchase_price, 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
FROM {{ref("raw_gz_sales")}} s
LEFT JOIN {{ref("raw_gz_product")}} p 
    USING (products_id)