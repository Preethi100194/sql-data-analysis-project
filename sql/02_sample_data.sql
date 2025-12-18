-- =====================================================
-- INSERT SAMPLE DATA - SQL SERVER VERSION
-- For use in SQL Server Management Studio (SSMS)
-- =====================================================

-- Delete existing data (if re-running)
DELETE FROM returns;
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM customers;
DELETE FROM products;
GO

-- Insert Customers
INSERT INTO customers (first_name, last_name, email, country, city, join_date, customer_segment) VALUES
('John', 'Smith', 'john.smith@email.com', 'USA', 'New York', '2023-01-15', 'Premium'),
('Sarah', 'Johnson', 'sarah.j@email.com', 'USA', 'Los Angeles', '2023-02-20', 'Standard'),
('Michael', 'Brown', 'mbrown@email.com', 'Canada', 'Toronto', '2023-03-10', 'Premium'),
('Emily', 'Davis', 'emily.d@email.com', 'USA', 'Chicago', '2023-04-05', 'Standard'),
('Robert', 'Wilson', 'rwilson@email.com', 'USA', 'Houston', '2023-05-12', 'VIP'),
('Jennifer', 'Moore', 'jmoore@email.com', 'USA', 'Phoenix', '2023-06-18', 'Standard'),
('William', 'Taylor', 'wtaylor@email.com', 'USA', 'Philadelphia', '2023-07-22', 'Premium'),
('Lisa', 'Anderson', 'landers@email.com', 'USA', 'San Antonio', '2023-08-30', 'Standard'),
('James', 'Thomas', 'jthomas@email.com', 'Canada', 'Vancouver', '2023-09-14', 'Premium'),
('Patricia', 'Jackson', 'pjackson@email.com', 'USA', 'San Diego', '2023-10-25', 'VIP');

-- Insert Products
INSERT INTO products (product_name, category, price, cost, stock_quantity, created_date, status) VALUES
('Laptop Pro', 'Electronics', 1299.99, 800.00, 45, '2023-01-01', 'active'),
('Wireless Mouse', 'Electronics', 49.99, 20.00, 150, '2023-01-05', 'active'),
('USB-C Cable', 'Accessories', 12.99, 3.00, 500, '2023-01-10', 'active'),
('Monitor 4K', 'Electronics', 599.99, 350.00, 30, '2023-02-01', 'active'),
('Keyboard Mechanical', 'Electronics', 149.99, 60.00, 80, '2023-02-15', 'active'),
('Phone Stand', 'Accessories', 24.99, 8.00, 200, '2023-03-01', 'active'),
('Webcam HD', 'Electronics', 89.99, 40.00, 100, '2023-03-10', 'active'),
('Laptop Bag', 'Accessories', 59.99, 25.00, 120, '2023-04-01', 'active'),
('External SSD', 'Storage', 189.99, 100.00, 70, '2023-04-15', 'active'),
('Screen Protector', 'Accessories', 9.99, 2.00, 300, '2023-05-01', 'active');

-- Insert Orders
INSERT INTO orders (customer_id, order_date, total_amount, order_status, payment_method) VALUES
(1, '2024-01-10', 1349.98, 'completed', 'credit_card'),
(2, '2024-01-12', 62.98, 'completed', 'debit_card'),
(3, '2024-01-15', 1899.97, 'completed', 'credit_card'),
(4, '2024-01-18', 149.99, 'completed', 'paypal'),
(5, '2024-01-20', 2299.95, 'completed', 'credit_card'),
(1, '2024-02-05', 599.99, 'completed', 'credit_card'),
(6, '2024-02-10', 89.99, 'completed', 'debit_card'),
(7, '2024-02-12', 1499.98, 'completed', 'credit_card'),
(2, '2024-02-15', 24.99, 'completed', 'paypal'),
(3, '2024-02-20', 189.99, 'completed', 'credit_card'),
(8, '2024-03-05', 109.98, 'completed', 'debit_card'),
(9, '2024-03-10', 1549.97, 'completed', 'credit_card'),
(5, '2024-03-15', 299.98, 'completed', 'credit_card'),
(10, '2024-03-20', 2099.96, 'completed', 'paypal'),
(4, '2024-03-25', 59.99, 'completed', 'debit_card');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, line_total, discount_percent) VALUES
(1, 1, 1, 1299.99, 1299.99, 0),
(1, 2, 1, 49.99, 49.99, 0),
(2, 2, 1, 49.99, 49.99, 0),
(2, 3, 1, 12.99, 12.99, 0),
(3, 1, 1, 1299.99, 1299.99, 0),
(3, 4, 1, 599.99, 599.99, 0),
(4, 5, 1, 149.99, 149.99, 0),
(5, 1, 1, 1299.99, 1299.99, 5),
(5, 4, 1, 599.99, 599.99, 5),
(5, 9, 1, 189.99, 189.99, 0),
(6, 4, 1, 599.99, 599.99, 0),
(7, 1, 1, 1299.99, 1299.99, 0),
(7, 5, 1, 149.99, 149.99, 0),
(8, 7, 1, 89.99, 89.99, 0),
(8, 6, 1, 24.99, 24.99, 0),
(9, 6, 1, 24.99, 24.99, 0),
(10, 9, 1, 189.99, 189.99, 0),
(11, 2, 1, 49.99, 49.99, 0),
(11, 3, 2, 12.99, 25.98, 0),
(12, 1, 1, 1299.99, 1299.99, 5),
(12, 7, 1, 89.99, 89.99, 0),
(12, 5, 1, 149.99, 149.99, 0),
(13, 4, 1, 599.99, 599.99, 10),
(13, 6, 1, 24.99, 24.99, 0),
(14, 1, 1, 1299.99, 1299.99, 0),
(14, 4, 1, 599.99, 599.99, 0),
(14, 9, 1, 189.99, 189.99, 0),
(15, 8, 1, 59.99, 59.99, 0);

-- Insert Returns
INSERT INTO returns (order_id, product_id, return_date, reason, refund_amount, status) VALUES
(2, 3, '2024-02-10', 'Wrong color', 12.99, 'completed'),
(5, 9, '2024-02-01', 'Defective', 189.99, 'completed'),
(7, 5, '2024-03-05', 'Not as described', 149.99, 'pending'),
(13, 4, '2024-04-01', 'Changed mind', 539.99, 'completed');

-- Verify data was inserted
PRINT '=== DATA VERIFICATION ===';
GO

SELECT 'Customers' AS Table_Name, COUNT(*) AS Row_Count FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Order Items', COUNT(*) FROM order_items
UNION ALL
SELECT 'Returns', COUNT(*) FROM returns;
SELECT TOP 5 
    CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
