/*

1. Spend analitika

Mekkora volt az összes kiadás évente, szállítónként?
Hol koncentrálódik a spend (Pareto: általában a szállítók 20%-a adja a kiadások 80%-át)?
Milyen a kategóriánkénti kiadás trendje – növekszik vagy csökken?

*/

--Évente kiadás
SELECT
    sum(euro_total) as total,
    EXTRACT(YEAR FROM purchase_order_date) as year
FROM orders
GROUP BY year
ORDER BY year DESC

--Szállítónkénti kiadás
SELECT
    vendor_name,
    sum(euro_total) as total
FROM orders
GROUP BY vendor_name
ORDER BY total DESC

--Purchasing csoportonkénti POszám
Select
    Count(distinct(purchase_order)) as POs,
    purchasing_group
from orders
group by purchasing_group

--Material csoportonkénti megoszlás
SELECT
    secondary_category,
    sum(euro_total) as total
FROM orders
Left join categories ON material_code = l2_code
GROUP BY secondary_category
ORDER BY total DESC

--asd
With total as(
select
    sum(euro_total) as total
From orders
), percentage_orders as (
    secondary_category,
    sum(euro_total) as total
FROM orders
Left join categories ON material_code = l2_code
GROUP BY secondary_category
ORDER BY total DESC
)
