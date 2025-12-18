-- =====================================================
-- E-COMMERCE ANALYTICS DATABASE FOR SQL SERVER
-- SQL Server Management Studio (SSMS)
-- =====================================================
-- Create database
CREATE DATABASE ecommerce_db;
GO

USE ecommerce_db;
GO

-- Table 1: Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50),
    city VARCHAR(50),
    join_date DATE NOT NULL,
    customer_segment VARCHAR(20),
    created_at DATETIME DEFAULT GETDATE()
);

-- Table 2: Products
CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    cost DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0,
    created_date DATE,
    status VARCHAR(20) DEFAULT 'active'
);

-- Table 3: Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL,
    order_status VARCHAR(20) DEFAULT 'completed',
    payment_method VARCHAR(30),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table 4: Order Items (Order Details)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    line_total DECIMAL(12, 2),
    discount_percent DECIMAL(5, 2) DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table 5: Returns
CREATE TABLE returns (
    return_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    return_date DATE NOT NULL,
    reason VARCHAR(100),
    refund_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'pending',
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create indexes for performance optimization
CREATE INDEX idx_customers_join_date ON customers(join_date);
CREATE INDEX idx_customers_segment ON customers(customer_segment);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_products_category ON products(category);

-- Verify tables were created
PRINT 'All tables created successfully!';
GO

