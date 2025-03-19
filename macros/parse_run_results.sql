{% macro parse_dbt_results(results) %}
    -- Create a list of parsed results
    {%- set parsed_results = [] %}
    -- Flatten results and add to list
    {{ print(results) }}

    {% for run_result in results %}
        -- Convert the run result object to a simple dictionary
        {% set run_result_dict = run_result.to_dict() %}
        -- Get the underlying dbt graph node that was executed
        {% set node = run_result_dict.get('node') %}

        {% set rows_affected = run_result_dict.get('adapter_response', {}).get('rows_affected', 0) %}
        {%- if not rows_affected -%}
            {% set rows_affected = 0 %}
        {%- endif -%}

        /*{% if run_result_dict.get('status') == 'success' or run_result_dict.get('status') == 'pass'%}
            {% set execution_started_at = run_result_dict["timing"][1].get('started_at') %}
            {% set execution_completed_at = run_result_dict["timing"][1].get('completed_at') %}
        {% else %}
            {% set execution_started_at = '' %}
            {% set execution_completed_at = '' %}
        {%- endif -%}*/

        {% set parsed_result_dict = {
                'result_id': invocation_id ~ '.' ~ node.get('unique_id'),
                'invocation_id': invocation_id,
                'unique_id': node.get('unique_id'),
                'database_name': node.get('database'),
                'schema_name': node.get('schema'),
                'name': node.get('name'),
                'resource_type': node.get('resource_type'),
                'status': run_result_dict.get('status'),
                'started_at': execution_started_at,
                'completed_at': execution_completed_at,
                'execution_time': run_result_dict.get('execution_time'),
                'rows_affected': rows_affected,
                'message': run_result_dict.get('message')|replace("\n", " -")|replace("'", '"')
                }%}
        {% do parsed_results.append(parsed_result_dict) %}
    {% endfor %}
    {{ print(parsed_results) }}
    {{ return(parsed_results) }}
{% endmacro %}