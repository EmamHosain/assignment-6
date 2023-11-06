-- all querys
-- 1. task one query
SELECT COUNT(o.order_id) AS total_orders, c.customer_id,c.name,c.email,c.location FROM customers c
INNER JOIN orders o ON o.cust_id = c.customer_id
GROUP BY c.name, c.email,c.location 
ORDER BY total_orders DESC

-- 2. task two query

SELECT o.order_id, p.name, o.quantity,p.price, (o.quantity * p.price) AS total_amount FROM products p
INNER JOIN orders_items o 
ON o.product_id = p.product_id
ORDER BY o.order_id ASC

-- 3. task three query 

SELECT c.name as category_name, SUM(p.price * oi.quantity ) as total_revenue FROM categories AS c
JOIN products AS p ON p.cust_id = c.category_id
JOIN orders_items AS oi ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_revenue DESC

-- 4. task four query 
SELECT
    cus.name,
    cus.email,
    SUM(p.price * oi.quantity) AS total_purchase_amount
FROM customers AS cus
    JOIN products AS p ON p.cust_id = cus.customer_id
    JOIN orders_items AS oi ON oi.product_id = p.product_id
    JOIN orders AS o ON o.cust_id = cus.customer_id
GROUP BY cus.name
ORDER BY total_purchase_amount DESC
LIMIT 5
