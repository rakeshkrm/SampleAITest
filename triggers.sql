-- Trigger examples (SQLite-compatible)

-- 1. Audit trigger: record updates to orders
CREATE TABLE IF NOT EXISTS orders_audit (
  audit_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  action TEXT,
  action_ts TEXT,
  old_amount REAL,
  new_amount REAL
);

CREATE TRIGGER IF NOT EXISTS trg_orders_update AFTER UPDATE ON orders
BEGIN
  INSERT INTO orders_audit (order_id, action, action_ts, old_amount, new_amount)
  VALUES (OLD.id, 'UPDATE', DATETIME('now'), OLD.amount, NEW.amount);
END;

-- 2. On insert trigger example: ensure created_at is set (if not provided)
CREATE TRIGGER IF NOT EXISTS trg_orders_insert AFTER INSERT ON orders
BEGIN
  UPDATE orders SET created_at = COALESCE(NEW.created_at, DATETIME('now')) WHERE id = NEW.id;
END;
