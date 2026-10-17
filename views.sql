-- View examples (SQLite-compatible)

-- 1. Simple view: customer totals
CREATE VIEW IF NOT EXISTS customer_totals AS
SELECT c.id, c.name, COALESCE(SUM(o.amount),0) AS total
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name;

-- 2. Read-only view using join
CREATE VIEW IF NOT EXISTS order_with_customer AS
SELECT o.id AS order_id, o.amount, o.created_at, c.id AS customer_id, c.name AS customer_name
FROM orders o JOIN customers c ON o.customer_id = c.id;
