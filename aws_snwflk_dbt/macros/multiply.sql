{% macro multiply(x, y, precision) %}
    ROUND({{ x }} * {{ y }}, {{ precision }})
{% endmacro %}

{% macro divide(x, y, precision) %}
    ROUND({{ x }} / {{ y }}, {{ precision }})
{% endmacro %}

{% macro trimmer(col_name, node) %}
    {{ col_name | trim | upper }} 
{% endmacro %}

{%- macro tag(col) -%}
    CASE
        WHEN {{ col }} < 100 THEN 'LOW'
        WHEN {{ col }} < 200 THEN 'MEDIUM'
        ELSE 'HIGH'
    END
{% endmacro %}