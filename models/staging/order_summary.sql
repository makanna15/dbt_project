with orders as (
    select * from {{ ref('stg_orders') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
)

select
    o.id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.status
from orders o
join customers c on o.user_id = c.id