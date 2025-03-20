{% macro get_database_name() %}
    {%- set database_query -%}
		select TARGET_DB_NAME from INGESTION_METADATA_RELATIONAL
	{%- endset -%}
	{% set result = run_query(database_query) %}
	{% set tgt_database = result.columns[0].values()[0] %}
    {{ return(tgt_database) }}
{% endmacro %}
