{% macro get_database_name() %}
    {%- set database_query -%}
		select TARGET_DATABASE_NAME from ANALYTICS.DBT_MKANNA.INGESTION_METADATA_RELATIONAL 
    {%- endset -%}
    {% set result = run_query(database_query) %}
    {% if result.columns[0].values()[0] %}
        {% set tgt_database = result.columns[0].values()[0] %}
    {% else %} {% set tgt_database = "ANALYTICS" %}
    {% endif %}
    {{ return(tgt_database) }}
{% endmacro %}
