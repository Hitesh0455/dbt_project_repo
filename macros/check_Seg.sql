{% macro chk_seg(seg) %}
    {% set segments=["AUTOMOBILE","MACHINERY","BUILDING","HOUSEHOLD","FURNITURE"] %} 
    {% if seg in segments %}
        'Y'
    {% else %}
        'N'
    {% endif %}
{% endmacro %}
