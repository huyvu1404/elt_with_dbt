{% snapshot orders_estimated_delivery_snapshot_timestamp %}

    {{
        config(
            target_schema='snapshot',
            strategy='timestamp',
            unique_key='order_id',
            updated_at='order_estimated_delivery_date'
        )
    }}
    select order_id, customer_id, order_estimated_delivery_date from {{source('raw', 'olist_orders_dataset')}}

    {% endsnapshot %}