SELECT bo.customer_id,
       bo.order_id,
       boi.product_id,
       bo.order_purchase_timestamp,
       bo.order_status,
       boi.price,
       bop.payment_value
FROM {{ref('bronze_order_items')}} boi 
    JOIN {{ref('bronze_orders')}} bo 
        ON boi.order_id = bo.order_id
    JOIN {{ref('bronze_order_payments')}} bop
        ON boi.order_id = bop.order_id
