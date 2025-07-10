SELECT
    product_id,
    product_name,
    product_category,
    price_gbp
FROM
    {{ ref('std_products') }}