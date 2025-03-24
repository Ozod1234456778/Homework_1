SELECT item_id, item_name, price
FROM Items
WHERE price > (SELECT AVG(price) FROM Items)

ELECT staff_id, staff_name
FROM Staff
WHERE division_id IN (SELECT division_id 
                       FROM Staff 
                       GROUP BY division_id 
                       HAVING COUNT(*) > 10)

SELECT s.staff_id, s.staff_name, s.salary
FROM Staff s
WHERE s.salary > (SELECT AVG(s2.salary) 
                  FROM Staff s2 
                  WHERE s2.division_id = s.division_id)

SELECT client_id, client_name
FROM Clients
WHERE client_id IN (SELECT DISTINCT client_id FROM Purchases)

SELECT p.purchase_id, p.purchase_date
FROM Purchases p
WHERE EXISTS (SELECT 1 FROM PurchaseDetails pd WHERE pd.purchase_id = p.purchase_id)

SELECT item_id, item_name
FROM Items
WHERE item_id IN (SELECT item_id 
                   FROM PurchaseDetails 
                   GROUP BY item_id 
                   HAVING SUM(quantity) > 100)

SELECT staff_id, staff_name, salary
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff)

SELECT vendor_id, vendor_name
FROM Vendors
WHERE vendor_id IN (SELECT DISTINCT vendor_id 
                    FROM Items 
                    WHERE price < 50)

SELECT MAX(price) AS max_price FROM Items

SELECT MAX(total_amount) AS max_purchase_value
FROM Purchases

SELECT client_id, client_name
FROM Clients
WHERE client_id NOT IN (SELECT DISTINCT client_id FROM Purchases)

SELECT item_id, item_name
FROM Items
WHERE category = 'Electronics'

SELECT purchase_id, purchase_date
FROM Purchases
WHERE purchase_date > (SELECT '2025-01-01')

SELECT purchase_id, 
       (SELECT SUM(quantity) FROM PurchaseDetails WHERE purchase_id = p.purchase_id) AS total_items_sold
FROM Purchases p

SELECT staff_id, staff_name
FROM Staff
WHERE DATEDIFF(YEAR, hire_date, GETDATE()) > 5

SELECT s.staff_id, s.staff_name, s.salary
FROM Staff s
WHERE s.salary > (SELECT AVG(s2.salary) 
                  FROM Staff s2 
                  WHERE s2.division_id = s.division_id)

SELECT p.purchase_id, p.purchase_date
FROM Purchases p
WHERE EXISTS (SELECT 1 FROM PurchaseDetails pd WHERE pd.purchase_id = p.purchase_id AND pd.item

SELECT client_id, client_name
FROM Clients
WHERE client_id IN (SELECT DISTINCT client_id 
                     FROM Purchases 
                     WHERE purchase_date >= DATEADD(DAY, -30, GETDATE()))

SELECT item_id, item_name
FROM Items
WHERE creation_date = (SELECT MIN(creation_date) FROM Items)

SELECT staff_id, staff_name
FROM Staff
WHERE division_id IS NULL
