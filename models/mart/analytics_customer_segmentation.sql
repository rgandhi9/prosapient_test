WITH analytics_base AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        SUM(spend_gbp) AS total_spend,
        COUNT(transaction_id) AS transaction_frequency,
        COUNT(DISTINCT product_category) AS product_diversity
    FROM
        {{ ref('mart_transactions') }}
    GROUP BY
        1,2,3
),

thresholds AS (
    SELECT
        -- Spend thresholds
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_spend) AS spend_p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_spend) AS spend_p75,

        -- Frequency thresholds
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY transaction_frequency) AS freq_p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY transaction_frequency) AS freq_p75
    FROM analytics_base
)

SELECT
    cm.customer_id,
    cm.first_name,
    cm.last_name,
    cm.total_spend,
    cm.transaction_frequency,
    cm.product_diversity,

    -- Spending segment
    CASE
        WHEN cm.total_spend >= t.spend_p75 THEN 'High'
        WHEN cm.total_spend >= t.spend_p25 THEN 'Medium'
        ELSE 'Low'
    END AS spending_segment,

    -- Frequency segment
    CASE
        WHEN cm.transaction_frequency >= t.freq_p75 THEN 'Frequent'
        WHEN cm.transaction_frequency >= t.freq_p25 THEN 'Occasional'
        ELSE 'Rare'
    END AS frequency_segment,

    -- Diversity segment
    CASE
        WHEN transaction_frequency = 1 AND product_diversity = 1 THEN 'Moderate' -- We lack the data to define a proper category
        WHEN 1.5*product_diversity <= transaction_frequency THEN 'Focused'
        WHEN 1.25*product_diversity <= transaction_frequency THEN 'Moderate'
        ELSE 'Diverse'
    END AS diversity_segment
FROM analytics_base cm
CROSS JOIN thresholds t

