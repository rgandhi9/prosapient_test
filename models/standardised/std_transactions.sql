-- See std_customers for data cleaning

SELECT
    id AS transaction_id,
    customer_id,
    product_id,
    quantity,
    transaction_date
FROM
    {{ source('public', 'transactions') }}