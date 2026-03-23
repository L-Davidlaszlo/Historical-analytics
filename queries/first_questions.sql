/*

1. Spend analitika

Mekkora volt az összes kiadás évente, szállítónként?
Hol koncentrálódik a spend (Pareto: általában a szállítók 20%-a adja a kiadások 80%-át)?
Milyen a kategóriánkénti kiadás trendje – növekszik vagy csökken?

*/

--Évente kiadás
SELECT
    sum(eur_amount) as total,
    EXTRACT(YEAR FROM purchase_order_date) as year
FROM orders
GROUP BY year
ORDER BY year DESC

--Szállítónkénti kiadás
SELECT
    vendor_name,
    sum(eur_amount) as total
FROM orders
GROUP BY vendor_name
ORDER BY total DESC

--Purchasing csoportonkénti POszám
Select
    Count(distinct(purchase_order)) as POs,
    purchasing_group
from orders
group by purchasing_group