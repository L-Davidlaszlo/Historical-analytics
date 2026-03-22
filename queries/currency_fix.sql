
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

ALTER TABLE orders
ADD COLUMN EUR_Amount NUMERIC(18, 2);

--
UPDATE orders
SET EUR_Amount = ROUND(
    CASE
        WHEN currency = 'HUF' THEN total_value / 400
        WHEN currency = 'EUR' THEN total_value
        ELSE total_value
    END, 2
);


--
Select
    total_value,
    currency,
    eur_amount,
    purchase_order_date
from orders
ORDER BY purchase_order_date ASC
