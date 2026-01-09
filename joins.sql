-- ==========================================
-- SQL Joins for Data Engineering
-- Author: Ajay
-- Use case: Combining relational datasets
-- ==========================================

-- 1. INNER JOIN: Customers who placed orders
SELECT
    o.order_id,
    c.customer_name,
    o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 2. LEFT JOIN: All customers including those with no orders
SELECT
    c.customer_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 3. RIGHT JOIN: All orders including unmatched customers
SELECT
    o.order_id,
    c.customer_name
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customer_id;
