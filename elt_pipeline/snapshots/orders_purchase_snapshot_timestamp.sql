{% snapshot orders_purchase_snapshot_timestamp %}

    {{
        config(
            target_schema='snapshot',
            strategy='timestamp',
            unique_key='order_id',
            updated_at='order_purchase_timestamp'
        )
    }}
    select order_id, customer_id, order_purchase_timestamp from {{source('raw', 'olist_orders_dataset')}}

    {% endsnapshot %}