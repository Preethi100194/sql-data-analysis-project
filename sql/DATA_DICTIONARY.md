# Data Dictionary

Complete reference of all tables, columns, data types, and descriptions for the e-commerce analytics database.

---

## customers Table

Customer master data storing information about each customer.

| Column Name | Data Type | Constraints | Description | Example |
|-------------|-----------|-------------|-------------|---------|
| customer_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each customer | 1, 2, 3, 4, 5 |
| first_name | VARCHAR(50) | NOT NULL | Customer's first name | John, Sarah, Michael |
| last_name | VARCHAR(50) | NOT NULL | Customer's last name | Smith, Johnson, Brown |
| email | VARCHAR(100) | UNIQUE, NOT NULL | Customer's email address (unique per customer) | john.smith@email.com |
| country | VARCHAR(50) | NULLABLE | Country where customer resides | USA, Canada, UK |
| city | VARCHAR(50) | NULLABLE | City where customer lives | New York, Toronto, London |
| join_date | DATE | NOT NULL | Date when customer registered | 2023-01-15, 2023-02-20 |
| customer_segment | VARCHAR(20) | NULLABLE | Customer tier classification | VIP, Premium, Standard |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP | Automatic timestamp when record created | 2023-01-15 10:30:45 |

**Total Columns:** 9  
**Sample Records:** 10

---

## products Table

Product catalog containing all items available for sale.

| Column Name | Data Type | Constraints | Description | Example |
|-------------|-----------|-------------|-------------|---------|
| product_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each product | 1, 2, 3, 4, 5 |
| product_name | VARCHAR(100) | NOT NULL | Name of the product | Laptop Pro, Wireless Mouse, USB-C Cable |
| category | VARCHAR(50) | NULLABLE | Product classification | Electronics, Accessories, Storage |
| price | DECIMAL(10, 2) | NOT NULL | Selling price to customers | 1299.99, 49.99, 12.99 |
| cost | DECIMAL(10, 2) | NULLABLE | Production/acquisition cost | 800.00, 20.00, 3.00 |
| stock_quantity | INT | DEFAULT 0 | Current inventory count | 45, 150, 500 |
| created_date | DATE | NULLABLE | Date product was added to catalog | 2023-01-01, 2023-02-15 |
| status | VARCHAR(20) | DEFAULT 'active' | Product availability status | active, inactive, discontinued |

**Total Columns:** 8  
**Sample Records:** 10

**Formulas:**
- Profit per unit = price - cost
- Profit margin % = (price - cost) / price × 100

---

## orders Table

Transaction-level data for all customer orders placed.

| Column Name | Data Type | Constraints | Description | Example |
|-------------|-----------|-------------|-------------|---------|
| order_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each order | 1, 2, 3, 4, 5 |
| customer_id | INT | FOREIGN KEY (customers) | Reference to customer who placed order | 1, 2, 3 |
| order_date | DATE | NOT NULL | Date when order was placed | 2024-01-10, 2024-01-15 |
| total_amount | DECIMAL(12, 2) | NOT NULL | Total value of the order (before tax, after discounts) | 1349.98, 62.98, 1899.97 |
| order_status | VARCHAR(20) | DEFAULT 'completed' | Current status of the order | completed, pending, cancelled |
| payment_method | VARCHAR(30) | NULLABLE | How customer paid for order | credit_card, debit_card, paypal |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP | Automatic timestamp when record created | 2024-01-10 14:30:00 |

**Total Columns:** 7  
**Sample Records:** 15  
**Relationship:** One customer can have multiple orders

---

## order_items Table

Individual line items (products) within each order.

| Column Name | Data Type | Constraints | Description | Example |
|-------------|-----------|-------------|-------------|---------|
| order_item_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each line item | 1, 2, 3, 4, 5 |
| order_id | INT | FOREIGN KEY (orders) | Reference to the order this item belongs to | 1, 1, 2 |
| product_id | INT | FOREIGN KEY (products) | Reference to the product purchased | 1, 2, 3 |
| quantity | INT | NOT NULL | Number of units purchased | 1, 2, 5 |
| unit_price | DECIMAL(10, 2) | NOT NULL | Price per unit at time of purchase | 1299.99, 49.99, 12.99 |
| line_total | DECIMAL(12, 2) | NULLABLE | Total for this line (quantity × unit_price) | 1299.99, 99.98, 64.95 |
| discount_percent | DECIMAL(5, 2) | DEFAULT 0 | Discount percentage applied to this item | 0, 5, 10 |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP | Automatic timestamp when record created | 2024-01-10 14:30:00 |

**Total Columns:** 8  
**Sample Records:** 28

**Formulas:**
- Line total = quantity × unit_price × (1 - discount_percent/100)

**Relationship:** One order can have multiple items

---

## returns Table

Tracking of returned products and refund information.

| Column Name | Data Type | Constraints | Description | Example |
|-------------|-----------|-------------|-------------|---------|
| return_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each return | 1, 2, 3, 4 |
| order_id | INT | FOREIGN KEY (orders) | Reference to original order | 2, 5, 7 |
| product_id | INT | FOREIGN KEY (products) | Reference to product being returned | 3, 9, 5 |
| return_date | DATE | NOT NULL | Date when return was initiated | 2024-02-10, 2024-02-01 |
| reason | VARCHAR(100) | NULLABLE | Reason customer returned product | Wrong color, Defective, Not as described |
| refund_amount | DECIMAL(10, 2) | NULLABLE | Amount refunded to customer | 12.99, 189.99, 149.99 |
| status | VARCHAR(20) | DEFAULT 'pending' | Current status of return | pending, completed, rejected |
| created_at | DATETIME | DEFAULT CURRENT_TIMESTAMP | Automatic timestamp when record created | 2024-02-10 09:15:30 |

**Total Columns:** 8  
**Sample Records:** 4

**Relationship:** A return refers to a specific product from a specific order

---

## Data Type Reference

| Type | Description | Example |
|------|-------------|---------|
| INT | Whole numbers | 1, 100, -5 |
| VARCHAR(n) | Text up to n characters | 'John', 'Email@example.com' |
| DECIMAL(p,s) | Numbers with p total digits, s decimal places | 1299.99, 0.50 |
| DATE | Date (YYYY-MM-DD) | 2024-01-15 |
| DATETIME | Date and time | 2024-01-15 14:30:00 |

---

## Sample Data Counts

| Table | Row Count | Purpose |
|-------|-----------|---------|
| customers | 10 | Customer master data |
| products | 10 | Product catalog |
| orders | 15 | Order transactions |
| order_items | 28 | Line items in orders |
| returns | 4 | Returned items |

**Total Records:** 67

---

## Relationships

```
customers (1) ──────────── (Many) orders
                              │
                              ├─→ (Many) order_items
                              │              │
                              │              └─→ products (1)
                              │
                              └─→ (Many) returns
                                         │
                                         └─→ products (1)
```

---

## Common Queries

### Find all orders for a customer:
```sql
SELECT * FROM orders WHERE customer_id = 1;
```

### Find all items in an order:
```sql
SELECT * FROM order_items WHERE order_id = 1;
```

### Find product details:
```sql
SELECT * FROM products WHERE product_id = 1;
```

### Find all returns for a product:
```sql
SELECT * FROM returns WHERE product_id = 1;
```

---

## Database Normalization

This database follows **Third Normal Form (3NF)**:

- ✅ No duplicate data
- ✅ Each table has a primary key
- ✅ Foreign keys maintain relationships
- ✅ No repeating groups
- ✅ Minimal data redundancy

---

## Indexes for Performance

The following indexes are created for query optimization:

```sql
CREATE INDEX idx_customers_join_date ON customers(join_date);
CREATE INDEX idx_customers_segment ON customers(customer_segment);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_products_category ON products(category);
```

---


