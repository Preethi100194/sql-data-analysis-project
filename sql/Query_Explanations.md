# SQL Query Explanations

Detailed documentation of all SQL queries included in this project with explanations of what they do and when to use them.

## Customer Analysis Queries

Query 1: Customer Lifetime Value (CLV)

Purpose:
Calculate total revenue and spending patterns for each customer

Business Question:
How much has each customer spent? Who are our top spenders?

**SQL Techniques Used:**
- LEFT JOIN (customers to orders to order_items)
- GROUP BY (group by customer)
- SUM(), COUNT(), AVG() - aggregation functions
- DATEDIFF() - calculate days between dates
- NULLIF() - avoid division by zero
- ROUND() - format decimal numbers

**When to Use It:**
- Identify high-value customers for VIP programs
- Segment customers by spending
- Calculate customer value for retention programs
- Analyze purchase frequency
- Understand customer behavior patterns

**Expected Output:**
```
customer_id | customer_name | total_orders | total_spent | avg_order_value
1           | John Smith    | 2            | $1949.97    | $974.99
2           | Sarah Johnson | 1            | $62.98      | $62.98
```

**Real-world Use:**
Marketing team uses this to identify top 10% customers spending $1000+ to offer them VIP benefits

---
### Query 2: Customer Segmentation Analysis

Purpose 
Compare revenue and customer distribution across segments (VIP, Premium, Standard)

Business Question
Which segment generates the most revenue? Are we balanced?

**SQL Techniques Used:**
- GROUP BY - segment customers by tier
- SUM(), COUNT(), AVG() - aggregation
- Subqueries - calculate percentages
- Multiple aggregations - revenue, order count, customer count

**When to Use It:**
- Compare segment performance
- Identify underperforming segments
- Plan marketing budgets by segment
- Develop segment-specific pricing
- Allocate resources efficiently

**Expected Output:**
```
segment  | customer_count | pct_of_total_customers | total_revenue | pct_of_total_revenue
VIP      | 2              | 20%                    | $3799.94      | 45%
Premium  | 3              | 30%                    | $2950.10      | 35%
Standard | 5              | 50%                    | $1700.02      | 20%
```

**Real-world Use:**
Business team sees VIP segment drives 45% revenue with only 20% customers, decides to increase VIP acquisition

---

### Query 3: New Customer Acquisition

Purpose
Track monthly customer acquisition and conversion trends

Business Question 
How many new customers joined this month? Are they buying?

**SQL Techniques Used:**
- DATE_FORMAT() - group by month
- GROUP BY - monthly aggregation
- CASE statements - conditional counting
- COUNT(DISTINCT) - unique counting
- Conversion rate calculation

**When to Use It:**
- Track customer growth month-over-month
- Monitor marketing campaign effectiveness
- Forecast future revenue
- Identify seasonal patterns
- Measure onboarding success

**Expected Output:**
```
join_month | new_customers | customers_who_ordered | conversion_pct | revenue_from_new_customers
2024-03    | 3             | 2                     | 66.67%        | $1950.00
2024-02    | 4             | 3                     | 75.00%        | $1820.00
2024-01    | 3             | 2                     | 66.67%        | $900.00
```

**Real-world Use:**
January had 3 new customers but only 1 ordered (33%). Marketing team investigates why conversion is low.

---

### Query 4: Customer Repeat Purchase Analysis

Purpose
Categorize customers by purchase frequency (one-time, regular, loyal)

Business Question
How many customers are loyal vs one-time buyers?

**SQL Techniques Used:**
- Subqueries - calculate order counts first
- CASE statements - create customer categories
- GROUP BY - group by customer type
- Aggregation - calculate statistics per type

**When to Use It:**
- Identify one-time buyers for re-engagement
- Measure loyalty program effectiveness
- Design retention campaigns
- Calculate lifetime value by type
- Plan acquisition vs retention budget

**Expected Output:**
```
customer_type     | customer_count | avg_customer_value | min_value | max_value
Loyal Customer    | 3              | $1200.00           | $800.00   | $1949.97
Regular Customer  | 2              | $620.00            | $350.00   | $890.00
One-Time Buyer    | 5              | $150.00            | $50.00    | $300.00
```

**Real-world Use:**
5 customers are one-time buyers with avg $150 value. Marketing decides to reach out with 20% discount

---

### Query 5: Geographic Customer Distribution

Purpose:
Analyze customer base and revenue by country and city

Business Question:
Where are our customers? Which regions drive the most revenue?

**SQL Techniques Used:**
- GROUP BY - geographic grouping
- SUM(), AVG(), COUNT(DISTINCT)
- Revenue per customer calculation
- ORDER BY - rank by revenue

**When to Use It:**
- Plan geographic expansion
- Identify underserved markets
- Allocate logistics resources
- Plan region-specific marketing
- Manage inventory by location

**Expected Output:**
```
country | city     | customer_count | total_orders | total_revenue | avg_order_value
USA     | New York | 4              | 6            | $3500.00      | $583.33
Canada  | Toronto  | 3              | 5            | $2100.00      | $420.00
USA     | Boston   | 2              | 3            | $1200.00      | $400.00
```

**Real-world Use:**
Operations team sees Toronto customers generate $700 per customer vs New York $875, investigates why

---

### Query 6: Top 5 Customers by Revenue

Purpose:
Identify VIP customers for special attention

Business Question
Who are our top 5 spenders? When did they last order?

**SQL Techniques Used:**
- Window function RANK() OVER
- DATEDIFF() - days since last order
- LIMIT - top 5 only
- GROUP BY - customer aggregation

**When to Use It:**
- VIP program management
- Customer retention focus
- Sales team target list
- Account manager assignment
- Churn prevention alerts

**Expected Output:**
```
rank | customer_id | customer_name | total_revenue | days_since_last_order
1    | 5           | Alice Brown   | $3200.00      | 15
2    | 3           | Carol Davis   | $2400.00      | 8
3    | 1           | John Smith    | $1949.97      | 45
4    | 4           | David Wilson  | $1800.00      | 22
5    | 2           | Bob Jones     | $1500.00      | 60
```

**Real-world Use:**
Top customer (Alice) hasn't ordered in 15 days - account manager proactively reaches out

---

### Query 7: Customer Acquisition Cost (CAC) Analysis

Purpose:
Calculate metrics for understanding marketing efficiency

Business Question:
What's our CAC? How much revenue per customer?

**SQL Techniques Used:**
- COUNT(DISTINCT MONTH()) - date extraction
- SUM() aggregation
- Division for ratios
- Date calculations

**When to Use It:**
- Marketing ROI analysis
- Budget allocation decisions
- Performance benchmarking
- Cost optimization
- Campaign effectiveness

**Expected Output:**
```
total_customers | total_revenue | avg_revenue_per_customer | avg_customers_per_month | monthly_revenue_avg
10              | $8450.00      | $845.00                  | 1.0                     | $2816.67
```

**Real-world Use:**
If CAC is $500 and customer lifetime value is $845, ROI is positive at 69%

---

## SQL Concepts Demonstrated

### Joins
- **LEFT JOIN**: Connect customers with orders, even if no orders yet
- **Multiple JOINs**: Connect 3+ tables (customers → orders → order_items)

### Aggregation
- **SUM()**: Total revenue
- **COUNT()**: Number of orders/customers
- **AVG()**: Average spending
- **MIN/MAX()**: Min/max values

### Grouping
- **GROUP BY**: Organize data by customer, segment, month
- **HAVING**: Filter grouped results

### Functions
- **DATE_FORMAT()**: Format dates for grouping
- **DATEDIFF()**: Calculate days between dates
- **CONCAT()**: Combine first/last names
- **ROUND()**: Format decimals
- **CASE**: Create categories (VIP, Premium, Standard)

### Window Functions
- **RANK()**: Rank customers by revenue
- **ROW_NUMBER()**: Sequential numbering

---

## Performance Tips

✅ Use DISTINCT when counting unique values
✅ Filter early (WHERE before GROUP BY)
✅ Use indexes on frequently joined columns
✅ Avoid SELECT * - select specific columns
✅ Use NULLIF to prevent division by zero
✅ Use LIMIT when you only need top N

---

