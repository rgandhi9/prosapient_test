-- See std_customers for data cleaning 

SELECT
    id AS product_id,
    name AS product_name,
    category AS product_category,
    price_gbp
FROM
    {{ source('public', 'products') }}