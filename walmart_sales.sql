-- WALMART SALES ANALYTICS – STRATEGIC BUSINESS ANALYSIS

USE walmart_db;

-- Total Records
SELECT COUNT(*) AS total_records
FROM walmart;

SELECT 
	MIN(date) AS dataset_start,
    MAX(date) AS dataset_end
FROM walmart;

-- Transactions Every Year
SELECT 
    year,
    COUNT(*) AS transactions
FROM walmart
GROUP BY year
ORDER BY year;

-- Total Revenue
SELECT 
    ROUND(SUM(total), 2) AS total_revenue
FROM walmart;

-- Revenue by Category
SELECT 
    category,
    ROUND(SUM(total), 2) AS category_revenue
FROM walmart
GROUP BY category
ORDER BY category_revenue DESC;


-- Total Profit by Category
SELECT 
    category,
    ROUND(SUM(unit_price * quantity * profit_margin), 2) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;

-- Profit Margin Performance by Branch
SELECT 
    branch,
    ROUND(AVG(profit_margin) * 100, 2) AS avg_profit_margin_percent
FROM walmart
GROUP BY branch
ORDER BY avg_profit_margin_percent DESC;


-- Total Transactions made through different payment method 
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_items_sold
FROM walmart
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- Highest-Rated Category per Branch

SELECT branch, category, avg_rating
FROM (
    SELECT 
        branch,
        category,
        ROUND(AVG(rating), 2) AS avg_rating,
        RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS rank_position
    FROM walmart
    GROUP BY branch, category
) ranked
WHERE rank_position = 1;


-- Busiest Day per Branch
SELECT branch, day_name, total_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(date) AS day_name,
        COUNT(*) AS total_transactions,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank_position
    FROM walmart
    GROUP BY branch, day_name
) ranked
WHERE rank_position = 1;

-- Sales Distribution by Time of Day
SELECT
    branch,
    CASE 
        WHEN HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS sales_shift,
    COUNT(*) AS transactions
FROM walmart
GROUP BY branch, sales_shift
ORDER BY branch, transactions DESC;


-- Annual Revenue Trend
SELECT 
    year,
    ROUND(SUM(total), 2) AS annual_revenue
FROM walmart
GROUP BY year
ORDER BY year;

-- Year-over-Year Revenue Growth 
WITH yearly_revenue AS 
(
    SELECT 
        year,
        SUM(total) AS revenue
    FROM walmart
    GROUP BY year
    )

SELECT
    year,
    ROUND(revenue,2) AS revenue,
    LAG(revenue) OVER (ORDER BY year) AS previous_year_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY year)) 
        / LAG(revenue) OVER (ORDER BY year) * 100,
        2
    ) AS yoy_growth_percentage
FROM yearly_revenue;
