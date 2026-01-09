-- =====================================================
-- SQL Case Studies for Data Engineering
-- Author: Ajay
-- Focus: Business-driven analytics queries
-- =====================================================


-- BUSINESS CONTEXT:
-- The sales team wants to identify high-value customers
-- to target loyalty programs and promotions.

-- Case Study 1: Top 5 customers by total revenue
SELECT
    customer_id,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;

-- Case Study 2: Monthly sales trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Case Study 3: Identify duplicate customer records
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Case Study 4: Find customers with no orders
SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Case Study 5: Average order value per customer
SELECT
    customer_id,
    AVG(order_amount) AS avg_order_value
FROM orders
GROUP BY customer_id;
