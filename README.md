# Walmart Sales Analytics – Data Analyst Portfolio Project  

## Executive Summary  

This project simulates a real-world retail analytics workflow by transforming raw Walmart transactional data into structured, business-ready insights using Python and SQL.

The dataset was cleaned, standardized, and enriched with engineered features before performing KPI-driven analysis focused on revenue, profitability, branch performance, customer behavior, and year-over-year growth trends (2019–2023).

---

## Project Overview  

The objective of this project was to:

- Clean and standardize raw sales data  
- Engineer analytical features for business reporting  
- Perform exploratory revenue analysis  
- Develop SQL queries aligned with business KPIs  

---

## Dataset Summary  

- **Raw Records:** 10,051  
- **Duplicate Rows Removed:** 51  
- **Rows Removed Due to Missing Values:** 31  
- **Final Cleaned Dataset:** 9,969 rows  
- **Time Period Covered:** 2019 – 2023  

### Original Features

- Invoice ID  
- Branch  
- City  
- Category  
- Unit Price  
- Quantity  
- Date  
- Time  
- Payment Method  
- Rating  
- Profit Margin  

### Engineered Features
- Total (unit_price × quantity)  
- Year (extracted from date)

  
## Data Cleaning & Preparation (Python)

Tools Used: **Pandas, NumPy, Matplotlib, Seaborn**

### ✔ Duplicate Handling
- Identified and removed 51 duplicate records using `drop_duplicates()`.

### ✔ Missing Value Treatment
- Detected 31 null values in `unit_price` and `quantity`.
- Removed rows with missing values to ensure accurate revenue calculations.

### ✔ Data Type Standardization
- Removed `$` symbol from `unit_price` and converted to `float`.
- Converted `date` column to `datetime`.
- Standardized column names to lowercase.

### ✔ Feature Engineering

```python
df["total"] = df["unit_price"] * df["quantity"]
df["year"] = df["date"].dt.year
```

These derived features enabled revenue and year-over-year trend analysis.

### Export

The cleaned dataset was exported as:

```
cleaned_walmart.csv
```

For downstream SQL analysis and dashboard integration.

---

## Exploratory Data Analysis (EDA)

### Revenue by Category
- Compared revenue contribution across product categories.
- Identified revenue concentration patterns.

### Revenue Trend (2019–2023)
- Visualized annual sales performance.
- Enabled long-term revenue monitoring.

---

## SQL Business Analysis  

All business analysis was conducted using MySQL.

### Core KPI Analysis

- Total Records  
- Dataset Time Range  
- Total Revenue  
- Annual Revenue Trend  
- Year-over-Year (YoY) Growth  

---

### Business-Focused Queries

#### Revenue by Category
Identified highest revenue-generating product segments.

#### Total Profit by Category
Profit calculated using:

```sql
unit_price * quantity * profit_margin
```

#### Branch-Level Profitability
Measured average profit margin per branch.

#### Payment Method Analysis
- Transaction volume by payment type  
- Total items sold by payment channel  

#### Customer Satisfaction
Identified highest-rated categories per branch using window functions (`RANK()`).

#### Operational Insights
- Busiest day per branch  
- Sales distribution by time of day (Morning / Afternoon / Evening)

#### Year-over-Year Revenue Growth
Used CTE and `LAG()` window function to calculate revenue growth percentage.

---

## Key Business Insights

### Revenue Distribution by Category
Revenue varies across product categories, with certain categories contributing more to total revenue than others.  
This highlights opportunities for category-level prioritization in marketing and inventory planning.

---

### Multi-Year Revenue Trend (2019–2023)
Annual revenue analysis enables performance comparison across years and structured growth monitoring.  
Year-over-Year (YoY) calculation provides visibility into revenue change patterns over time.

---

### Branch-Level Profitability Differences
Average profit margin varies across branches.  
This may reflect differences in pricing strategy or operational performance and supports branch-level benchmarking.

---

### Customer Behavior Patterns

#### Payment Preferences
Transaction distribution across payment methods provides insight into customer payment behavior, which may inform operational and promotional decisions.

#### Time-of-Day Sales Trends
Sales segmentation into Morning, Afternoon, and Evening highlights peak transaction periods, supporting data-driven staffing and scheduling considerations.

---

### Customer Satisfaction Patterns
Highest-rated categories per branch were identified using ranking functions, enabling comparison of customer satisfaction across locations and product segments.

## Strategic Recommendations

- Focus marketing and inventory efforts on high-revenue categories.  
- Benchmark high-margin branches to replicate successful operational practices.  
- Align staffing with peak transaction hours.  
- Monitor YoY revenue trends quarterly for early performance detection.  
- Combine revenue and satisfaction metrics for high-value product identification.  

---

## Skills Demonstrated  

- Data Cleaning & Preprocessing (Pandas)  
- Exploratory Data Analysis  
- SQL Aggregations (SUM, AVG, GROUP BY)  
- Window Functions (RANK, LAG)  
- Basic CTE Usage (YoY Analysis)  
- Revenue & Profitability Analysis  
- Analytical Insight Communication  

---

## Future Enhancements  

- Build an interactive Power BI dashboard.  
- Perform customer segmentation analysis.  
- Implement time-series forecasting for revenue prediction.    
- Integrate cost and inventory data for deeper margin insights.  

---

## Author  

Jhanvi  
Aspiring Data Analyst | Business Analytics Enthusiast  
