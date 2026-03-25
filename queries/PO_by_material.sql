--
Select
    count(DISTINCT (purchase_order)) as PO,
    vendor_name,
    material_code,
    categories.secondary_category
from orders
Left join categories ON L2_code = material_code
GROUP BY secondary_category,material_code,vendor_name
ORDER BY PO desc
