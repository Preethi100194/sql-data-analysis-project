#E-Commerce Analytics SQL Project

Created by: Preethi Thirumoorthy
Email: preethi.thirumoorthy@gmail.com
LinkedIn: https://www.linkedin.com/in/preethi-t-059b3913a/

## 📊 Project Overview

This is an e-commerce analytics project with a normalized 5-table schema. I created 15+ analytical queries that answer real business questions like customer lifetime value, product profitability, and sales trends. The project demonstrates SQL fundamentals and advanced techniques.
The schema includes customers, products, orders, order_items, and returns tables. I used foreign keys to maintain referential integrity and created strategic indexes for performance. The queries range from simple aggregations to complex window functions that calculate running totals and rankings.

## 🎯 What This Project Demonstrates

### Technical Skills:
✅ **Database Design** - Normalized schema with relationships and constraints  
✅ **Complex SQL Queries** - JOINs, subqueries, CTEs, window functions  
✅ **Data Analysis** - Customer segmentation, profitability analysis, trends  
✅ **Performance Optimization** - Strategic index creation  
✅ **Documentation** - Professional code organization and comments  

### Business Intelligence Skills:
✅ **Customer Lifetime Value (CLV)** - Revenue analytics  
✅ **Customer Segmentation** - VIP, Premium, Standard classification  
✅ **Sales Trends** - Month-over-month growth analysis  
✅ **Product Performance** - Profitability and return rate analysis  
✅ **Data-Driven Insights** - Actionable business recommendations  

---

## 📈 Database Schema

### 5 Core Tables:

 1. customers
Stores customer master data
```sql
customer_id (PK) | first_name | last_name | email | country | city | join_date | customer_segment | created_at
```
- **10 sample records** from USA and Canada
- Segments: VIP, Premium, Standard
- Use case: Customer tracking and segmentation

2. products
Product catalog with pricing
```sql
product_id (PK) | product_name | category | price | cost | stock_quantity | created_date | status
```
- **10 sample products** across 4 categories
- Categories: Electronics, Accessories, Storage
- Tracks: Price, cost, and stock levels

3. Orders
Transaction-level order data
```sql
order_id (PK) | customer_id (FK) | order_date | total_amount | order_status | payment_method | created_at
```
- **15 sample orders** from Jan-Mar 2024
- Payment methods: credit_card, debit_card, paypal
- Status: completed, pending, cancelled

4. order_items
Order line item details
```sql
order_item_id (PK) | order_id (FK) | product_id (FK) | quantity | unit_price | line_total | discount_percent
```
- **28 sample records** showing multi-item orders
- Tracks: Pricing, quantities, and discounts
- Enables product-level analysis

5. returns
Return and refund tracking
```sql
return_id (PK) | order_id (FK) | product_id (FK) | return_date | reason | refund_amount | status
```
- **4 sample returns** with reasons and refund amounts
- Tracks: Return quality metrics
- Use case: Product quality analysis

### Visual Diagram:
┌─────────────────────────────────────────────────────────────────┐
│                    START HERE: SSMS Setup                       │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
            ┌─────────────────────────────────┐
            │  Open SQL Server Management     │
            │  Studio (SSMS)                  │
            └─────────────────────────────────┘
                              │
                              ▼
        ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
        ┃  FILE 1️⃣ (RUN THIS FIRST)       ┃
        ┃  SSMS_01_database_setup.sql       ┃
        ┃                                   ┃
        ┃  Creates:                         ┃
        ┃  ✓ Database: ecommerce_db         ┃
        ┃  ✓ Table: customers               ┃
        ┃  ✓ Table: products                ┃
        ┃  ✓ Table: orders                  ┃
        ┃  ✓ Table: order_items             ┃
        ┃  ✓ Table: returns                 ┃
        ┃  ✓ Indexes (7 indexes)            ┃
        ┃                                   ┃
        ┃  Status: "All tables created      ┃
        ┃          successfully!"           ┃
        ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
                    (Click Execute/F5)
                              │
                              ▼
              ✓ SUCCESS? See success message
                              │
                    NO ──────►│◄────── YES
                    │         │        │
                    │         ▼        │
                    │      Continue   │
                    │                 │
                    ▼                 ▼
            Check Errors        ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                                ┃  FILE 2️⃣ (RUN SECOND)     ┃
                                ┃  SSMS_02_sample_data.sql   ┃
                                ┃                            ┃
                                ┃  Inserts:                  ┃
                                ┃  ✓ 10 customers            ┃
                                ┃  ✓ 10 products             ┃
                                ┃  ✓ 15 orders               ┃
                                ┃  ✓ 28 order_items          ┃
                                ┃  ✓ 4 returns               ┃
                                ┃                            ┃
                                ┃  Verification Table:       ┃
                                ┃  Customers: 10             ┃
                                ┃  Products: 10              ┃
                                ┃  Orders: 15                ┃
                                ┃  Order Items: 28           ┃
                                ┃  Returns: 4                ┃
                                ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
                        (Click Execute/F5)
                                  │
                                  ▼
                  ✓ SUCCESS? See verification table
                                  │
                        NO ──────►│◄────── YES
                        │         │        │
                        │         ▼        │
                        │    Check Errors  │
                        │                  │
                        ▼                  ▼
                  Troubleshoot      ┌──────────────────┐
                                   │  DATABASE READY  │
                                   │  FOR ANALYSIS    │
                                   └──────────────────┘
                                           │
                                           ▼
                      ┌────────────────────────────────────┐
                      │  OPTIONAL: Run Analysis Queries    │
                      │                                    │
                      │  • 03_customer_analysis.sql        │
                      │  • 04_sales_analysis.sql           │
                      │  • 05_product_performance.sql      │
                      └────────────────────────────────────┘
                            

**Indexes Created (7 total):**
- idx_customers_join_date - Date range queries
- idx_customers_segment - Segment filtering
- idx_orders_customer_id - Customer order lookup
- idx_orders_order_date - Date range analysis
- idx_order_items_order_id - Order detail retrieval
- idx_order_items_product_id - Product performance
- idx_products_category - Category analysis
  
```

## 🚀 Quick Start

### Prerequisites:
- **MySQL or SQL Server** (version 5.7+)
- **SQL Client** (MySQL Workbench, SSMS, DBeaver, VS Code, etc.)
- **Git** (for version control)

### Setup Instructions:

#### Option 1: MySQL/MariaDB
```bash
# 1. Run database and table creation
mysql -u your_user -p < sql_queries/01_database_setup.sql

# 2. Insert sample data
mysql -u your_user -p ecommerce_db < sql_queries/02_sample_data.sql

# 3. Verify setup
mysql -u your_user -p ecommerce_db -e "SELECT COUNT(*) FROM customers;"
```

#### Option 2: SQL Server Management Studio (SSMS)
```
1. Open SSMS
2. File → New Query
3. Open: ssms_version/SSMS_01_database_setup.sql
4. Press F5 (Execute)
5. File → New Query
6. Open: ssms_version/SSMS_02_sample_data.sql
7. Press F5 (Execute)
```

#### Option 3: Cloud SQL (Google Cloud SQL / AWS RDS)
```sql
-- Connect to your cloud SQL instance
-- Paste contents of 01_database_setup.sql
-- Paste contents of 02_sample_data.sql
-- Execute both
```

### Verify Installation:
```sql
-- Check database exists
SHOW DATABASES LIKE 'ecommerce_db';

-- Check tables exist
SHOW TABLES IN ecommerce_db;

-- Check row counts
SELECT 'customers' AS Table_Name, COUNT(*) AS Row_Count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'returns', COUNT(*) FROM returns;
```

**Expected Results:**
```
Table_Name    | Row_Count
customers     | 10
products      | 10
orders        | 15
order_items   | 28
returns       | 4
```

---

## 📊 SQL Queries Included

### 1️⃣ Customer Analysis (03_customer_analysis.sql)
**5 analytical queries** focusing on customer behavior and value.

#### Query 1.1: Customer Lifetime Value (CLV)
**Business Question:** How much has each customer spent? How many orders?
```sql
-- Shows for each customer:
-- - Total spending and average order value
-- - First and last purchase dates
-- - Number of days they've been active
```
**Key Metrics:** Total revenue, AOV (Average Order Value), customer tenure

#### Query 1.2: Customer Segmentation
**Business Question:** Which customer segment generates the most revenue?
```sql
-- Segments customers by: VIP, Premium, Standard
-- Shows revenue contribution per segment
-- Identifies high-value segments
```
**Use Case:** Targeted marketing campaigns, retention strategies

#### Query 1.3: Retention Analysis
**Business Question:** What percentage are repeat vs one-time customers?
```sql
-- Calculates repeat purchase rate
-- Identifies customer retention health
```
**KPI:** Retention rate = repeat customers / total customers

#### Query 1.4: Top Customers by Revenue
**Business Question:** Which 10 customers generate the most revenue?
```sql
-- Ranks customers by revenue
-- Shows order count and average order value
-- Identifies VIP customers for special treatment
```

#### Query 1.5: New Customer Acquisition
**Business Question:** How many new customers join each month?
**Use Case:** Tracking growth, marketing effectiveness

---

### 2️⃣ Sales Analysis (04_sales_analysis.sql)
**6 analytical queries** analyzing sales performance and trends.

#### Query 2.1: Monthly Sales Trend with Growth
**Business Question:** How is revenue trending month-over-month?
```sql
-- Monthly metrics:
-- - Total orders, unique customers, revenue
-- - Month-over-month growth percentage
-- - Average order value trends
```
**Insight Type:** Time series analysis for forecasting

#### Query 2.2: Sales by Payment Method
**Business Question:** Which payment method is most popular?
```sql
-- Shows revenue by: credit_card, debit_card, paypal
-- Order count distribution
-- Average transaction size per method
```
**Operational Use:** Payment processor optimization

#### Query 2.3: Running Revenue (Window Functions)
**Business Question:** What is cumulative revenue over time?
```sql
-- Uses WINDOW FUNCTIONS: SUM() OVER(), ROW_NUMBER() OVER()
-- Shows order-by-order cumulative totals
-- Advanced SQL technique demonstration
```
**Advanced SQL:** Demonstrates window function proficiency

#### Query 2.4: Daily Sales Summary
**Business Question:** What are daily sales metrics?
```sql
-- Daily aggregations:
-- - Order count, unique customers, revenue
-- - Min/max order values
```

#### Query 2.5: Revenue by Customer Segment
**Business Question:** Which customer segment has highest average value?
```sql
-- Compares: VIP vs Premium vs Standard
-- Shows segment contribution to total revenue
```

#### Query 2.6: Order Value Distribution
**Business Question:** What percentage of orders are in each price range?
```sql
-- Segments orders: <$100, $100-500, $500-1000, $1000-1500, >$1500
-- Shows both order count and revenue distribution
```
**Business Use:** Pricing strategy optimization

---

### 3️⃣ Product Performance (05_product_performance.sql)
**6 analytical queries** analyzing product metrics and profitability.

#### Query 3.1: Product Profitability Dashboard
**Business Question:** Which products are most profitable?
```sql
-- For each product shows:
-- - Units sold, total revenue, total cost
-- - Total profit and profit margin percentage
-- - Current inventory stock
```
**KPI:** Profit margin = (Revenue - Cost) / Revenue × 100%

#### Query 3.2: Category Performance
**Business Question:** Which product category performs best?
```sql
-- Aggregates by category: Electronics, Accessories, Storage
-- Shows: Units sold, revenue, order count
-- Average price and average quantity per order
```
**Use Case:** Inventory allocation, marketing focus

#### Query 3.3: Best & Worst Products
**Business Question:** Top 5 vs Bottom 5 products by sales?
```sql
-- Identifies: Star products (high sales)
-- Identifies: Problem products (low sales)
-- Informs: Keep/discontinue decisions
```

#### Query 3.4: Product Return Rate
**Business Question:** Which products have quality issues?
```sql
-- Return rate % = (Returns / Units Sold) × 100
-- Shows impact on net revenue
-- Identifies quality concerns
```
**Quality Metric:** Higher returns = potential quality issues

#### Query 3.5: Inventory Optimization
**Business Question:** Are we overstocked or understocked?
```sql
-- Compares current stock vs sales volume
-- Status: Overstocked, Low Stock, Balanced
-- Identifies inventory optimization opportunities
```

#### Query 3.6: Profitability Ranking
**Business Question:** Which products generate most profit?
```sql
-- Ranks by: Total Profit = (Price - Cost) × Units Sold
-- Shows: Profit rank and profit contribution
```
**Strategic Use:** Product portfolio optimization

---

## 📈 Sample Query Results

### Example 1: Top Customers by Revenue
```
Rank | Customer Name      | Orders | Total Revenue | Avg Order Value
────────────────────────────────────────────────────────────────
1    | John Smith        | 2      | $1,949.97     | $974.99
2    | Michael Brown     | 2      | $2,089.95     | $1,044.98
3    | Robert Wilson     | 2      | $2,599.93     | $1,299.97
4    | Patricia Jackson  | 1      | $2,099.96     | $2,099.96
5    | James Thomas      | 1      | $1,549.97     | $1,549.97
```

### Example 2: Monthly Sales Trend
```
Month      | Orders | Customers | Revenue   | Growth %
──────────────────────────────────────────────────
2024-03    | 5      | 5         | $5,999.67 | -35.48%
2024-02    | 5      | 4         | $9,315.93 | 154.81%
2024-01    | 5      | 5         | $3,652.87 | NULL
```

### Example 3: Product Performance
```
Product Name          | Units Sold | Revenue   | Profit Margin
────────────────────────────────────────────────────────────
Laptop Pro            | 4          | $5,199.96 | 38.45%
Monitor 4K            | 2          | $1,199.98 | 41.67%
External SSD          | 2          | $379.98   | 47.50%
Keyboard Mechanical   | 2          | $299.98   | 60.00%
Phone Stand           | 2          | $49.98    | 60.01%
```


1. Database Design:
   - "Normalized schema following 3NF principles"
   - "5 interconnected tables with foreign keys"
   - "Strategic indexes for query optimization"

2. Query Complexity:
   - "Range from simple aggregations to complex window functions"
   - "Used CTEs, subqueries, and self-joins"
   - "Demonstrated understanding of JOIN types"

3. Business Value:
   - "Queries answer real business questions"
   - "Customer lifetime value analysis for retention"
   - "Product profitability for portfolio optimization"
   - "Sales trends for forecasting"

4. Technical Skills:
   - "SQL fundamentals: SELECT, WHERE, GROUP BY, ORDER BY"
   - "Advanced: JOINs, window functions, CTEs, subqueries"
   - "Performance: Index creation and query optimization"


## 🛠️ Tools & Technologies

| Tool | Purpose | Version |
| SQL Database | Data storage & querying | MySQL 5.7+ / SQL Server 2016+ |
| GitHub | Repository hosting | Cloud |
| SQL Client | Query execution | SSMS / MySQL Workbench / DBeaver |

### Compatible Platforms:
✅ MySQL / MariaDB  
✅ SQL Server / SSMS  
✅ PostgreSQL  
✅ AWS RDS  
✅ Google Cloud SQL  
✅ Azure SQL Database  

---

## 📚 Documentation Files

### DATA_DICTIONARY.md
Complete reference for all tables and columns:
- Table names and purposes
- Column names, data types, constraints
- Sample values and ranges
- Key relationships

### QUERY_EXPLANATIONS.md
Detailed explanations for each query:
- Business question being answered
- SQL techniques used
- When and why to use each query
- Expected output examples
- Real-world applications

### BUSINESS_INSIGHTS.md
Key findings from the data:
- Top performing customers
- Best-selling products
- Growth trends
- Recommendations for business
- Data-driven insights

---

## 📊 Key Metrics & KPIs

### Customer Metrics:
- **CLV** (Customer Lifetime Value) - Total revenue per customer
- **AOV** (Average Order Value) - Average transaction size
- **Retention Rate** - % of repeat customers
- **Customer Acquisition Cost** - Marketing efficiency
- **Churn Rate** - Customer loss percentage

### Sales Metrics:
- **Monthly Revenue** - Total sales per month
- **MoM Growth** - Month-over-month percentage change
- **Order Count** - Number of transactions
- **Average Order Value** - Revenue / Orders
- **Payment Method Distribution** - Customer payment preferences

### Product Metrics:
- **Profit Margin** - (Revenue - Cost) / Revenue
- **Units Sold** - Sales volume
- **Return Rate** - Returns / Units Sold
- **Inventory Turnover** - Sales / Inventory
- **Product Revenue Contribution** - % of total revenue



## 📈 Project Stats

| Metric | Count |
|--------|-------|
| Database Tables | 5 |
| Total Columns | 35+ |
| Sample Records | 67 |
| SQL Queries | 15+ |
| Indexes | 7 |
| Foreign Key Relationships | 4 |
| Documentation Files | 3 |


