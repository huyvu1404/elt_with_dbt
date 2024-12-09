{{config(
    materialized='table'
)}}


SELECT 
    dp.product_category_name_english,
    ROUND(SUM(fs.payment_value)::NUMERIC, 2) AS total_sales,
    COUNT(*) as total_bills,
    ROUND(SUM( fs.payment_value)::NUMERIC/COUNT(*), 2) as values_per_bills
FROM 
    {{ref('fact_sales')}} fs
JOIN 
    {{ref('dim_products')}} dp  ON fs.product_id = dp.product_id
GROUP BY 
    dp.product_category_name_english
ORDER BY 
    total_sales DESC, total_bills DESC