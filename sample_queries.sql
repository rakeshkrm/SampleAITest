-- Sample queries for the demo schema: customers(id,name,country,signup_date), orders(id,customer_id,amount,created_at)

-- 1. Select all customers
SELECT * FROM customers;

-- 2. Select specific columns
SELECT name, country FROM customers;

-- 3. Filter rows
SELECT * FROM orders WHERE amount > 100;

-- 4. Insert example
-- INSERT INTO customers (name, country, signup_date) VALUES ('Dana','USA','2024-01-01');

-- 5. Update example
-- UPDATE customers SET country = 'United States' WHERE name = 'Alice';

-- 6. Delete example
-- DELETE FROM orders WHERE id = 3;

-- 7. Aggregation: total per customer
SELECT customer_id, SUM(amount) AS total FROM orders GROUP BY customer_id;

-- 8. Aggregation with HAVING
SELECT customer_id, SUM(amount) AS total FROM orders GROUP BY customer_id HAVING total > 100;

-- 9. Join: orders with customer name
SELECT o.id, o.amount, o.created_at, c.name AS customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.id;

-- 10. Left join: customers and their orders (including customers with no orders)
SELECT c.id, c.name, o.id AS order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- 11. Order and limit: top 5 orders by amount
SELECT * FROM orders ORDER BY amount DESC LIMIT 5;

-- 12. Pagination example: 10 rows per page, page 2
SELECT * FROM customers ORDER BY id LIMIT 10 OFFSET 10;

-- 13. Subquery: customers with at least one order
SELECT * FROM customers WHERE id IN (SELECT DISTINCT customer_id FROM orders);

-- 14. Correlated subquery: most recent order per customer
SELECT o.* FROM orders o WHERE o.created_at = (
  SELECT MAX(created_at) FROM orders o2 WHERE o2.customer_id = o.customer_id
);

-- 15. Create index example
-- CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- 16. Transaction example (SQLite):
-- BEGIN;
-- INSERT INTO customers (name,country,signup_date) VALUES ('Eve','UK','2024-05-01');
-- INSERT INTO orders (customer_id,amount,created_at) VALUES (last_insert_rowid(),100.0,'2024-05-02');
-- COMMIT;

-- 17. Defensive example: parameterized SELECT (example in client code)
-- This is not executable SQL by itself; use parameter binding in your client library:
-- SELECT * FROM customers WHERE name = ?;
