-- =====================================================
-- SQL Performance Optimization Techniques
-- =====================================================

-- Use indexes for faster filtering
-- CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Avoid SELECT *
SELECT order_id, order_date, order_amount
FROM orders
WHERE order_date >= '2024-01-01';

-- Use EXISTS instead of IN for large datasets
SELECT customer_id, customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Pre-aggregation for performance
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_amount) AS total_sales
FROM orders
GROUP BY month;
