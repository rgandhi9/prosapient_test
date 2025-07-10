-- Materialised as view defined in project file

/*
To-dos:
    -- Create a macro like normalise_string to be used for all letter fields for consistency
    -- Possibly creating macro for validating currency_code
    -- While the PK is unique, it's possible to have duplicates - worth creating a Surrogate key to identify these so they can be removed downstream
*/


SELECT
    CAST(id AS bigint) AS customer_id,
    CAST(first_name AS varchar(100)) AS first_name,
    CAST(last_name AS varchar(100)) AS last_name,
    CAST(email AS varchar) AS email,
    CAST(gender AS varchar) AS gender,
    CAST(age AS int) AS age,
    UPPER(CAST(country AS varchar(2))) AS country_code,
    CAST(signup_date AS date) AS signup_date
FROM
    {{ source('public', 'customers') }}