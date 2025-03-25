{% macro run_shell_script(scripts/dbt_run_with_retries.sh) %}
{% do run_query("SELECT system('{}')".format(scripts/dbt_run_with_retries.sh)) %}
{% endmacro %}