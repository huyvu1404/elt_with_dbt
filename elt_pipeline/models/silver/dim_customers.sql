SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM {{ref('bronze_customers')}}