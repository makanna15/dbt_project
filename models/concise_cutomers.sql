--{% set result = get_database_name() %}
{{ config(

   materialization = 'table'
   )
}}
     
   select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers