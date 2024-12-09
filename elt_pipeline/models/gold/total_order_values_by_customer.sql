{{config(
    materialized='table'
)}}

SELECT 
    dc.customer_unique_id,
    ROUND(SUM(fs.payment_value)::NUMERIC, 2) AS total_sales,
    COUNT(*) as total_bills,
    ROUND(SUM( fs.payment_value)::NUMERIC/COUNT(*), 2) as values_per_bills
FROM 
    {{ref('fact_sales')}} fs
JOIN 
    {{ref('dim_customers')}} dc  ON fs.customer_id = dc.customer_id
GROUP BY 
    dc.customer_unique_id
ORDER BY 
    total_sales DESC