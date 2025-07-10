-- A simple test to check an email has the "@" symbol.
-- Can be made more comprehensive with regex.

{% test is_valid_email(model, column_name) %}

SELECT {{ column_name }}
FROM {{ model }}
WHERE {{ column_name }} NOT LIKE '%@%'
  OR {{ column_name }} IS NULL

{% endtest %}