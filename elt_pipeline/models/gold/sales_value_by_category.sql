{{config(
    materialized='table'
)}}


SELECT 
    dp.product_category_name_english,
    EXTRACT(YEAR FROM fs.order_purchase_timestamp::Timestamp) AS order_year,
    EXTRACT(MONTH FROM fs.order_purchase_timestamp::timestamp) AS order_month,
    ROUND(SUM(fs.payment_value)::NUMERIC, 2) AS monthly_sales,
    COUNT(*) as monthly_bills,
    ROUND(SUM( fs.payment_value)::NUMERIC/COUNT(*), 2) as values_per_bills
FROM 
    {{ref('fact_sales')}} fs
JOIN 
    {{ref('dim_products')}} dp  ON fs.product_id = dp.product_id
GROUP BY 
    dp.product_category_name_english, order_year, order_month
ORDER BY 
    order_year, order_month, monthly_sales DESC
    
