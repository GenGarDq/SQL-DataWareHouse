# Макрос для преобразования даты из int в date с проверкой на длину

{% macro int_to_date(column) %}
  
CASE
    WHEN LENGTH({{ column }}::varchar) != 8 THEN Null
    ELSE TO_DATE(CAST({{ column }} AS VARCHAR), 'YYYYMMDD')
END

{% endmacro %}