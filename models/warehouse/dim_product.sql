SELECT
    product_id,
    name,
    category,
    price_gbp
FROM
    {{ ref('std_products') }}