SELECT
    transaction_id,
    customer_id,
    product_id,
    quantity,
    transaction_date
FROM
    {{ ref('std_transactions') }}