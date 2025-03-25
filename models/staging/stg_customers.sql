with raw_customers as (
    select
        id,
        first_name,
        last_name
        
    from {{ source('JAFFLE_SHOP', 'CUSTOMERS') }}
)

select * from raw_customers