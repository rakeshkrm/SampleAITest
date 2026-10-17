-- Advanced joins, CTEs, and window function examples

-- 1. CTE to compute per-customer totals
WITH totals AS (
  SELECT customer_id, SUM(amount) AS total FROM orders GROUP BY customer_id
)
SELECT c.id, c.name, COALESCE(t.total,0) AS total
FROM customers c LEFT JOIN totals t ON c.id = t.customer_id;

-- 2. Window function: running total per customer (requires SQLite 3.25+/Postgres/MySQL8+)
WITH customer_orders AS (
  SELECT o.*, c.name FROM orders o JOIN customers c ON o.customer_id = c.id
)
SELECT *, SUM(amount) OVER (PARTITION BY customer_id ORDER BY created_at) AS running_total
FROM customer_orders;

-- 3. Anti-join: customers with no orders
SELECT c.* FROM customers c LEFT JOIN orders o ON c.id = o.customer_id WHERE o.id IS NULL;

-- 4. Cross apply / lateral example (Postgres uses LATERAL)
-- Postgres example to find top order per customer using lateral:
-- SELECT c.id, c.name, o.* FROM customers c
-- LEFT JOIN LATERAL (
--   SELECT * FROM orders o2 WHERE o2.customer_id = c.id ORDER BY created_at DESC LIMIT 1
-- ) o ON true;
