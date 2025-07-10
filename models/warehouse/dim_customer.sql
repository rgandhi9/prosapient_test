SELECT
    customer_id,
    first_name,
    last_name,
    email,
    gender,
    age,
    country_code,
    signup_date
FROM
    {{ ref('std_customers') }}