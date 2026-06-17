# e_commerce_dataset

📌 Project Overview

This project focuses on analyzing e-commerce sales data using Python, Pandas, Matplotlib, and SQL. The objective was to clean the data, perform exploratory data analysis (EDA), and generate business insights through advanced SQL queries.

🎯 Project Objectives

Clean and preprocess raw e-commerce data
Perform exploratory data analysis (EDA)
Identify sales and customer behavior patterns
Analyze revenue trends and product performance
Practice advanced SQL concepts using real-world business questions


🛠️ Tools & Technologies

Python
Pandas
NumPy
Matplotlib
MySQL
Google Colab
GitHub


🧹 Data Cleaning Performed

The following data quality checks were performed:

Checked missing values
Removed duplicate records
Converted date columns into datetime format
Identified invalid order and review dates
Validated customer ID formats
Created revenue column
Revenue = Quantity * Unit_Price
Investigated negative customer tenure values
Performed data type corrections
⚙️ Feature Engineering

Created additional features for analysis:

Revenue
Revenue = Quantity * Unit_Price
Monthly Order Period
df['order_month'] = df['order_date'].dt.strftime('%Y-%m')
📊 Exploratory Data Analysis (EDA)

The following visualizations were created:

1. Revenue by Category

Analyzed revenue contribution of different product categories.

2. Revenue by Country

Compared revenue generated across countries.

3. Revenue by Payment Method

Identified preferred payment methods and associated revenue.

4. Monthly Revenue Trend

Studied revenue fluctuations over time.

5. Rating Distribution

Analyzed customer rating patterns.

6. Top 10 Products by Revenue

Identified the highest revenue-generating products.

7. Revenue vs Rating Analysis

Explored the relationship between customer ratings and product revenue.

🗄️ SQL Analysis

The following business-oriented SQL queries were implemented:

Revenue Analysis
Revenue Contribution by Country
Revenue by Payment Method
Running Revenue Over Time
Customer Analysis
Top 3 Customers in Each Country
Customer Spending Rank
Customers Spending Above Average
First Product Purchased by Every Customer
Product & Category Analysis
Category Performance Analysis
Highest Rated Category
Country-wise Best Category
Low Rated Products with Significant Revenue


🔍 Key Business Insights
Revenue remained relatively stable across the observed period.
Certain countries contributed significantly more revenue than others.
A small number of customers generated a large portion of total revenue.


🚀 Skills Demonstrated
-- Python
Data Cleaning
Data Manipulation
Feature Engineering
Exploratory Data Analysis
Data Visualization
--- SQL
CTEs
Window Functions
ROW_NUMBER()
DENSE_RANK()
Subqueries
Aggregations
Business KPI Analysis
Product categories showed varying revenue and rating performance.
Some products generated high revenue despite having lower customer ratings.
Customer purchasing behavior varied across countries and categories.
