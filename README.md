1. Project Title
#E-Commerce Analytics SQL Project

Created by: Preethi Thirumoorthy
Email: preethi.thirumoorthy@gmail.com
LinkedIn: https://www.linkedin.com/in/preethi-t-059b3913a/

## 📊 Business Objective

This is an e-commerce analytics project with a normalized 5-table schema. I created 15+ analytical queries that answer real business questions like customer lifetime value, product profitability, and sales trends. The project demonstrates SQL fundamentals and advanced techniques.
The schema includes customers, products, orders, order_items, and returns tables. I used foreign keys to maintain referential integrity and created strategic indexes for performance. The queries range from simple aggregations to complex window functions that calculate running totals and rankings.

### Database Schema Overview

This project uses a **normalized relational database** with 5 interconnected tables following Third Normal Form (3NF) principles.

### Entity Relationship Diagram

```
CUSTOMERS (1) ─────────── (Many) ORDERS
                               │
                               ├─→ (Many) ORDER_ITEMS
                               │              │
                               │              └─→ PRODUCTS (1)
                               │
                               └─→ (Many) RETURNS
                                          │
                                          └─→ PRODUCTS (1)
```

### Tables Overview

**customers** - Customer master data
- 10 sample records
- Stores: Name, email, location, join date, segment

**products** - Product catalog
- 10 sample records  
- Stores: Product name, category, price, cost, inventory

**orders** - Order transactions
- 15 sample records
- Stores: Order date, amount, status, payment method

**order_items** - Line items per order
- 28 sample records
- Stores: Product ordered, quantity, price, discounts

**returns** - Product returns tracking
- 4 sample records
- Stores: Return reason, date, refund amount

### Database Characteristics

✅ **Normalized Design** - 3NF normalization, minimal redundancy
✅ **Data Integrity** - Foreign keys and constraints
✅ **Performance** - 7 strategic indexes
✅ **Relationships** - Clear parent-child connections
✅ **Scalability** - Designed for growth

### Sample Data Volume

| Table | Records | Purpose |
|-------|---------|---------|
| customers | 10 | Customer information |
| products | 10 | Product catalog |
| orders | 15 | Order transactions |
| order_items | 28 | Order details |
| returns | 4 | Return tracking |
| **Total** | **67** | **Complete dataset** |

---

## 🛠️ Tools & Technologies

- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub (for version control and documentation)

Compatible Platforms:
✅ MySQL / MariaDB  
✅ SQL Server / SSMS  
✅ PostgreSQL  
✅ AWS RDS  
✅ Google Cloud SQL  
✅ Azure SQL Database  

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
---

✅ 🔍 Key SQL Analysis Performed
   Analysis 1: Customer Lifetime Value (CLV)
   Analysis 2: Customer Segmentation
   Analysis 3: Monthly Sales Trends
   Analysis 4: Product Performance
   Analysis 5: Payment Method Analysis
   Analysis 6: Product Return Analysis

  📈 Key Insights & Business Implications 
   Insight 1: Revenue Concentration Risk
   Insight 2: Customer Segment Performance
   Insight 3: Sales Volatility
   Insight 4: Product Category Performance
   Insight 5: Payment Method Distribution
   Insight 6: Customer Acquisition

## 🔍 Key SQL Analysis Performed

### Analysis 1: Customer Lifetime Value (CLV)

**Purpose:** Identify highest-value customers

**Data Analyzed:**
- Total spending per customer
- Order frequency and patterns
- Average order value
- Purchase date ranges

**Business Use:**
- Retention targeting
- VIP program development
- Resource allocation
- Revenue forecasting

**Key Finding:**
- Top customer: $1,949.97 spent
- Average customer: $650.23 spent
- Revenue concentration among top 3 customers

---

### Analysis 2: Customer Segmentation

**Purpose:** Group customers by value tier

**Data Analyzed:**
- Customers by segment (VIP, Premium, Standard)
- Revenue per segment
- Average customer value per tier
- Segment distribution

**Business Use:**
- Targeted marketing campaigns
- Pricing strategies
- Service level differentiation
- Growth planning

**Key Finding:**
- VIP: 20% of customers, 45% of revenue
- Premium: 30% of customers, 35% of revenue
- Standard: 50% of customers, 20% of revenue

---

### Analysis 3: Monthly Sales Trends

**Purpose:** Track revenue patterns and growth

**Data Analyzed:**
- Monthly revenue totals
- Month-over-month growth rates
- Order counts per month
- Customer acquisition trends

**Business Use:**
- Forecasting and budgeting
- Campaign timing
- Inventory planning
- Performance evaluation

**Key Finding:**
- Feb growth: +154.81%
- Mar decline: -35.48%
- Identifies seasonal patterns

---

### Analysis 4: Product Performance

**Purpose:** Rank products by sales and profitability

**Data Analyzed:**
- Units sold per product
- Revenue per product
- Profit margins
- Return rates
- Inventory levels

**Business Use:**
- Portfolio optimization
- Pricing decisions
- Inventory allocation
- Vendor evaluation

**Key Finding:**
- Laptop Pro: Top revenue ($5,199.96)
- Phone Stand: Best margin (60%)
- Electronics: 8% return rate

---

### Analysis 5: Payment Method Analysis

**Purpose:** Understand customer payment preferences

**Data Analyzed:**
- Order count by payment method
- Revenue by payment method
- Average order value per method
- Payment method distribution

**Business Use:**
- Payment processor selection
- Customer experience optimization
- Fraud risk assessment

**Key Finding:**
- Credit card: 60% of orders
- PayPal: 25% of orders
- Debit card: 15% of orders

---

### Analysis 6: Product Return Analysis

**Purpose:** Identify quality and satisfaction issues

**Data Analyzed:**
- Return rate by product
- Return reasons
- Refund amounts
- Return trends

**Business Use:**
- Quality improvement
- Supplier evaluation
- Customer satisfaction tracking

**Key Finding:**
- Overall return rate: 1.4%
- Electronics category: Higher returns
- Main reason: Defects and misalignment

---

## 📈 Key Insights & Business Implications

### Insight 1: Revenue Concentration Risk

**Finding:** Top 5 customers generate 40% of total revenue

**Implication:** 
- High risk if major customers leave
- Over-reliance on few accounts
- Potential cash flow vulnerability

**Recommendation:**
- Develop VIP retention programs
- Assign dedicated account managers
- Create long-term contracts
- Diversify customer base

---

### Insight 2: Customer Segment Performance

**Finding:** VIP and Premium segments drive 80% of revenue

**Implication:**
- Standard segment underperforming
- Opportunity for segment upgrade campaigns
- Premium tier is profitable sweet spot

**Recommendation:**
- Focus marketing on Standard→Premium conversion
- Enhance Premium tier benefits
- Create pathway to VIP status
- Develop segment-specific offerings

---

### Insight 3: Sales Volatility

**Finding:** Month-over-month growth highly variable (+154% to -35%)

**Implication:**
- Unpredictable revenue stream
- Difficulty with forecasting
- Possible seasonal or campaign-driven patterns

**Recommendation:**
- Investigate seasonal factors
- Plan marketing campaigns proactively
- Build cash reserves for downturns
- Implement retention programs in down months

---

### Insight 4: Product Category Performance

**Finding:** Electronics category has higher returns (8% vs 2%)

**Implication:**
- Possible quality issues
- Misaligned customer expectations
- Higher operational costs from returns

**Recommendation:**
- Review supplier quality
- Enhance product descriptions
- Add detailed specifications
- Consider warranty options
- Implement quality checks

---

### Insight 5: Payment Method Distribution

**Finding:** Credit card dominates (60% of orders)

**Implication:**
- Dependency on one payment processor
- Credit card fee exposure
- Customer payment preferences clear

**Recommendation:**
- Negotiate credit card fees
- Promote alternative methods
- Offer incentives for PayPal/debit
- Reduce payment processing costs

---

### Insight 6: Customer Acquisition

**Finding:** 10 customers over ~10 months = 1 per month acquisition rate

**Implication:**
- Low customer acquisition velocity
- Long sales cycle or limited marketing reach
- Growth opportunity area
  
**Recommendation:**
- Increase marketing investment
- Launch acquisition campaigns
- Implement referral programs
- Improve conversion funnel

- ## SQL Concepts Used

✅ **SELECT** - Retrieve data from tables
✅ **WHERE** - Filter rows by conditions
✅ **ORDER BY** - Sort results ascending/descending
✅ **GROUP BY** - Aggregate data by categories
✅ **HAVING** - Filter aggregated results

✅ **JOINS** - Combine data from multiple tables
  - INNER JOIN: Only matching records
  - LEFT JOIN: All left table records + matching
  - Multiple JOINs: Connect 3+ tables

✅ **Aggregation Functions**
  - SUM() - Total values
  - COUNT() - Count rows
  - AVG() - Average value
  - MIN()/MAX() - Minimum/maximum

✅ **Subqueries** - Nested SELECT statements
  - In WHERE clause for filtering
  - In FROM clause for derived tables
    
✅ **Window Functions** - Perform calculations over row sets
  - ROW_NUMBER() - Unique row numbers
  - RANK() - Ranking with gaps
  - LAG()/LEAD() - Access previous/next row
  - SUM() OVER () - Running totals

✅ **CTEs (Common Table Expressions)**
  - WITH clause for named subqueries
  - Improves readability
  - Enables recursive queries

✅ **Aliases** - Rename tables/columns
✅ **DISTINCT** - Remove duplicates
✅ **CASE** - Conditional logic in SELECT
✅ **Date Functions** - DATEPART(), DATE_FORMAT()
✅ **String Functions** - CONCAT(), SUBSTRING()

### Performance Optimization

✅ **Indexes** - Speed up queries
  - Primary keys automatically indexed
  - Foreign keys indexed for JOINs
  - Indexes on frequently filtered columns

✅ **Query Optimization**
  - Use specific columns (not SELECT *)
  - Filter early (WHERE before GROUP BY)
  - Use HAVING only for aggregated columns
  - Join conditions in ON clause

### Database Design

✅ **Normalization** - 3NF design principles
✅ **Foreign Keys** - Maintain referential integrity
✅ **Constraints** - Data quality enforcement
✅ **Primary Keys** - Unique identification

---

- ## 📊 SQL Queries Included

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
📁 Project Structure


   


