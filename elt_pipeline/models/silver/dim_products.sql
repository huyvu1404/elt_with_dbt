SELECT product_id, product_category_name_english
FROM {{ref('bronze_products')}} bp 
    JOIN {{ref('product_category_name_translation')}} pc 
        ON bp.product_category_name = pc.product_category_name