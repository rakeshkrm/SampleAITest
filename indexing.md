-- Indexing notes and examples

-- Basic single-column index
-- CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Composite index useful when queries filter by customer_id and order date
-- CREATE INDEX idx_orders_customer_date ON orders(customer_id, created_at);

-- Partial/filtered index (Postgres example)
-- CREATE INDEX idx_orders_high_value ON orders(customer_id) WHERE amount > 100;

-- Use EXPLAIN or EXPLAIN QUERY PLAN to inspect how indexes are used by your queries.
