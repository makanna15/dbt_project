{% macro read_column_values_from_snowflake(table_name, column_name) %}
    {%- set query %}
        SELECT {{ column_name }} FROM {{ table_name }}
    {%- endset %}
    
    {%- set results = run_query(query) %}
        {{log(results, info=True)}}
{% endmacro %}