{{ config(database=get_database_name(),schema=get_schema_name()) }}
select id as customer_id, first_name, last_name

from raw.jaffle_shop.customers
