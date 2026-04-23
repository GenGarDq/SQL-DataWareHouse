# Это кастомный макро-тест для проверки, что поле в нужном регистре.

{% test no_whitespace(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} != trim({{ column_name }})

{% endtest %}