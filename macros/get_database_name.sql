{% macro get_database_name() %}
    {% - call statement ('tgt_database', fetch_result=True) -%}
        select TARGET_DATABASE_NAME from ANALYTICS.DBT_MKANNA.INGESTION_METADATA_RELATIONAL where lower(TARGET_TABLE_NAME) = '{{this.table}}'
    {%- endcall -%}
    {%- set target_database = load_result('tgt_database')['data'][0][0] -%}
    {{ return(target_database)}}
{% endmacro %}
