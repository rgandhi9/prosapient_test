/*
To-do:
    -- Row count should remain the same between std and mart models - add a test for this
*/

SELECT
    t.transaction_id,
    t.customer_id,
    c.first_name,
    c.last_name,
    t.product_id,
    p.product_name,
    p.product_category,
    p.price_gbp,
    t.quantity,
    p.price_gbp * t.quantity AS spend_gbp,
    t.transaction_date
FROM
    {{ ref('fct_transaction') }} AS t
LEFT JOIN
    {{ ref('dim_customer') }} AS c
ON 
    t.customer_id = c.customer_id
LEFT JOIN
    {{ ref('dim_product') }} AS p
ON
    t.product_id = p.product_id
