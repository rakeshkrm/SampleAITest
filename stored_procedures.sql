-- Stored procedure examples for different databases

-- SQLite: no stored procedure support. Use client-side functions or triggers where appropriate.

-- MySQL example:
-- DELIMITER $$
-- CREATE PROCEDURE GetCustomerOrders(IN p_customer_id INT)
-- BEGIN
--   SELECT * FROM orders WHERE customer_id = p_customer_id;
-- END$$
-- DELIMITER ;

-- PostgreSQL example (plpgsql):
-- CREATE OR REPLACE FUNCTION get_customer_orders(p_customer_id INT)
-- RETURNS TABLE(id INT, customer_id INT, amount NUMERIC, created_at TIMESTAMP) AS $$
-- BEGIN
--   RETURN QUERY SELECT * FROM orders WHERE customer_id = p_customer_id;
-- END; $$ LANGUAGE plpgsql;

-- SQL Server example:
-- CREATE PROCEDURE dbo.GetCustomerOrders @CustomerId INT
-- AS
-- BEGIN
--   SELECT * FROM orders WHERE customer_id = @CustomerId;
-- END
