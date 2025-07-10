-- Materialised as view defined in project file

/*
To-dos:
    --  Create a macro like normalise_string to be used for all letter fields for consistency
*/


SELECT
    CAST(id AS bigint) AS customer_id,
    CAST(first_name AS varchar) AS first_name,
    CAST(last_name AS varchar) AS last_name,
    CAST(email AS varchar) AS email,
    CAST(gender AS varchar) AS gender,
    CAST(age AS int) AS age,
    UPPER(CAST(country AS varchar(2))) AS country_code,
    CAST(signup_date AS date) AS signup_date
FROM
    {{ source('public', 'customers') }}