SELECT
    id,
    customer_id,
    product_id,
    quantity,
    transaction_date
FROM
    {{ source('public', 'transactions') }}