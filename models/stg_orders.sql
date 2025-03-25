with raw_orders as (
    select
        order_id,
        customer_id,
        order_date,
        status
    from {{ source('JAFFLE_SHOP', 'orders') }}
)

select * from raw_orders