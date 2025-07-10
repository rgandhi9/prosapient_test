-- See std_customers for data cleaning 

SELECT
    id AS product_id,
    name,
    category,
    price_gbp
FROM
    {{ source('public', 'products') }}