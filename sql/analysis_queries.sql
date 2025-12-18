-- =====================================================================
-- CUSTOMER ANALYSIS QUERIES
-- Purpose: Analyze customer behavior, lifetime value, and segmentation
-- Database: ecommerce_db (MySQL/PostgreSQL compatible)
-- =====================================================================

-- Query 1: Customer Lifetime Value (CLV) Analysis
-- Purpose: Calculate total revenue, orders, and average spending per customer
-- Business Use: Identify high-value customers for retention programs

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.country,
    c.customer_segment,
    c.join_date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT oi.product_id) AS unique_products_purchased,
    SUM(o.total_amount) AS total_spent,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    ROUND(MIN(o.order_date), 0) AS first_purchase_date,
    ROUND(MAX(o.order_date), 0) AS last_purchase_date,
    DATEDIFF(MAX(o.order_date), MIN(o.order_date)) AS days_between_purchases,
    ROUND(SUM(o.total_amount) / NULLIF(COUNT(DISTINCT o.order_id), 0), 2) AS revenue_per_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.country, c.customer_segment, c.join_date
ORDER BY total_spent DESC;

-- =====================================================================

-- Query 2: Customer Segmentation Analysis
-- Purpose: Analyze revenue distribution across customer segments
-- Business Use: Develop segment-specific marketing strategies

SELECT 
    customer_segment,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    ROUND(COUNT(DISTINCT c.customer_id) / (SELECT COUNT(*) FROM customers) * 100, 2) AS pct_of_total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(COUNT(DISTINCT o.order_id) / (SELECT COUNT(*) FROM orders) * 100, 2) AS pct_of_total_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(SUM(o.total_amount) / (SELECT SUM(total_amount) FROM orders) * 100, 2) AS pct_of_total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    ROUND(SUM(o.total_amount) / COUNT(DISTINCT c.customer_id), 2) AS avg_customer_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY customer_segment
ORDER BY total_revenue DESC;

-- =====================================================================

-- Query 3: New Customers This Month
-- Purpose: Track customer acquisition and onboarding trends
-- Business Use: Monitor customer growth rate and acquisition effectiveness

SELECT 
    DATE_FORMAT(c.join_date, '%Y-%m') AS join_month,
    COUNT(*) AS new_customers,
    COUNT(CASE WHEN o.order_id IS NOT NULL THEN 1 END) AS customers_who_ordered,
    ROUND(COUNT(CASE WHEN o.order_id IS NOT NULL THEN 1 END) / COUNT(*) * 100, 2) AS conversion_pct,
    SUM(o.total_amount) AS revenue_from_new_customers,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value_new_customers
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY DATE_FORMAT(c.join_date, '%Y-%m')
ORDER BY join_month DESC;

-- =====================================================================

-- Query 4: Customer Repeat Purchase Analysis
-- Purpose: Identify repeat vs one-time customers
-- Business Use: Develop loyalty programs and retention strategies

SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-Time Buyer'
        WHEN order_count BETWEEN 2 AND 3 THEN 'Regular Customer'
        WHEN order_count > 3 THEN 'Loyal Customer'
    END AS customer_type,
    COUNT(DISTINCT customer_id) AS customer_count,
    ROUND(AVG(total_spent), 2) AS avg_customer_value,
    ROUND(MIN(total_spent), 2) AS min_customer_value,
    ROUND(MAX(total_spent), 2) AS max_customer_value
FROM (
    SELECT 
        c.customer_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) customer_stats
GROUP BY customer_type
ORDER BY avg_customer_value DESC;

-- =====================================================================

-- Query 5: Geographic Customer Distribution
-- Purpose: Analyze customer base by country and city
-- Business Use: Plan regional marketing campaigns and logistics

SELECT 
    c.country,
    c.city,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    ROUND(SUM(o.total_amount) / COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.country IS NOT NULL
GROUP BY c.country, c.city
ORDER BY total_revenue DESC;

-- =====================================================================

-- Query 6: Top 5 Customers by Revenue
-- Purpose: Identify VIP customers for special treatment
-- Business Use: Implement VIP retention programs and prioritized service

SELECT 
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS revenue_rank,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.customer_segment,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(o.total_amount) AS total_revenue,
    ROUND(MAX(o.order_date), 0) AS last_order_date,
    ROUND(DATEDIFF(NOW(), MAX(o.order_date)), 0) AS days_since_last_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.customer_segment
ORDER BY total_revenue DESC
LIMIT 5;

-- =====================================================================

-- Query 7: Customer Acquisition Cost Analysis
-- Purpose: Calculate CAC by estimating marketing efficiency
-- Business Use: Optimize marketing spend and ROI

SELECT 
    COUNT(DISTINCT c.customer_id) AS total_customers,
    SUM(o.total_amount) AS total_revenue,
    ROUND(SUM(o.total_amount) / COUNT(DISTINCT c.customer_id), 2) AS avg_revenue_per_customer,
    ROUND(COUNT(DISTINCT c.customer_id) / DATEDIFF(MAX(c.join_date), MIN(c.join_date)) * 30, 2) AS avg_customers_per_month,
    ROUND(SUM(o.total_amount) / COUNT(DISTINCT MONTH(c.join_date)), 2) AS monthly_revenue_average
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- =====================================================================
-- END OF CUSTOMER ANALYSIS QUERIES
-- =====================================================================

