-- ==========================================
-- SQL Window Functions
-- Author: Ajay
-- Use case: Analytical queries on large datasets
-- ==========================================

-- 1. Rank employees by salary
SELECT
    employee_id,
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 2. Dense rank employees by salary
SELECT
    employee_id,
    name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

-- 3. Running total of sales by date
SELECT
    order_date,
    SUM(order_amount) AS daily_sales,
    SUM(SUM(order_amount)) OVER (ORDER BY order_date) AS running_total
FROM sales
GROUP BY order_date;

-- 4. Partitioned ranking by department
SELECT
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dept_salary_rank
FROM employees;
