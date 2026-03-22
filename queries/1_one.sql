
--HUF to EUR conversion
with conversion as (
SELECT
    total_value,
    currency,
    ROUND(
        CASE
            WHEN currency = 'HUF' THEN total_value / 400
            WHEN currency = 'EUR' THEN total_value
            ELSE total_value
        END, 2
    ) AS conversion
FROM orders
)

select
    sum(conversion) as total
FROM conversion

Select*
from orders 
