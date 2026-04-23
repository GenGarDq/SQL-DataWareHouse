# Макрос (функция) для проверки на лишние пробелы и нарушения регистра,
# который делает отображение значений в колонках более понятным для пользователя

{% macro map_case_upper_trim(column, mapping_dict, default_value='N/A', output_type='varchar(10)') %}

CASE UPPER(TRIM({{ column }}))

{% for key, value in mapping_dict.items() %}
    WHEN '{{ key }}' THEN '{{ value }}'
{% endfor %}

ELSE '{{ default_value }}'
END::{{ output_type }}

{% endmacro %}