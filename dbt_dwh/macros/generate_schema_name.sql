# Этот макрос (функция) исправляет генерацию схем в БД на нужную мне

{% macro generate_schema_name(custom_schema_name, node) %}

    {% if custom_schema_name is none %}
        {{ target.schema }}
    {% else %}
        {{ custom_schema_name }}
    {% endif %}

{% endmacro %}