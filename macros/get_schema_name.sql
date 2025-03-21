{% macro get_schema_name() %}
    {%- set database_query -%}
		select TARGET_SCHEMA_NAME from ANALYTICS.DBT_MKANNA.INGESTION_METADATA_RELATIONAL where lower(TARGET_TABLE_NAME) = '{{this.table}}' 
    {%- endset -%}
    {% set result = run_query(database_query) %}
    {% if execute %}
        {% set tgt_schema = result.columns[0].values()[0] %}
    {% else %} 
        {% set tgt_schema = "DBT_MKANNA" %}
    {% endif %}
    {{ return(tgt_schema) }}
{% endmacro %}
