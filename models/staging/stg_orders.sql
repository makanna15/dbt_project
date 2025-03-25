with raw_orders as (
    select
        ID,
        USER_ID,
        order_date,
        status
    from {{ source('JAFFLE_SHOP', 'ORDERS') }}
)

select * from raw_orders