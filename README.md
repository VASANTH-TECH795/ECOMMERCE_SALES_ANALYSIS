# ECOMMERCE_SALES_ANALYSIS
SQL  analyzing e-commerce sales data.
# 📊 E-Commerce Sales Analysis Project (SQL)

## 📌 Project Overview
This project analyzes e-commerce sales data using SQL to extract meaningful business insights. The analysis focuses on understanding sales performance, customer behavior, product trends, regional performance, and time-based trends using structured SQL queries.

The objective is to demonstrate how raw transactional data can be transformed into actionable business insights using SQL.

---

## 🗂️ Dataset Overview
The dataset contains e-commerce transaction records with the following attributes:
- Order ID
- Order Date
- Customer Name
- Region & City
- Product Category & Sub-Category
- Product Name
- Quantity
- Unit Price
- Discount
- Sales
- Profit
- Payment Mode

---

## 🛠️ Tools Used
- MySQL
- SQL (Joins, Aggregations, CTEs, Window Functions)
- Data Analysis Techniques
- GitHub for version control

---

## 🧹 Data Preparation & Cleaning
- Converted Order Date from VARCHAR to DATE format
- Checked and handled NULL values
- Identified duplicate records using GROUP BY and HAVING
- Validated unique values in categorical columns (City, Region, Category, Payment Mode)

---

## 📊 Exploratory Data Analysis (EDA)
- Total number of customers and orders analyzed
- Overall sales and profit calculated
- Average order value computed
- Year-wise order trends analyzed
- Category-wise and region-wise performance studied

---

## 📈 SQL Analysis Performed

### 🔹 Sales Analysis
- Total sales and profit by category
- Monthly and yearly sales trends
- Year-over-year performance comparison

### 🔹 Customer Analysis
- Top 10 customers by total sales
- Customer segmentation using NTILE (quartiles)
- High-value customer identification

### 🔹 Product Analysis
- Top-selling products
- Top profitable products
- Product ranking within categories using DENSE_RANK

### 🔹 Regional Analysis
- Sales and profit by city and region
- Top-performing cities identified
- Regional performance comparison

### 🔹 Payment Mode Analysis
- Order distribution by payment methods
- Sales contribution by payment mode

### 🔹 Time-Based Analysis
- Month-over-month sales growth using LAG()
- Running total of monthly sales
- Seasonal sales trends

---

## 🔍 Key Insights

- A small percentage of customers contribute a large portion of total sales (VIP customers).
- Certain product categories generate higher revenue and profit compared to others.
- Sales performance varies significantly across cities and regions.
- Some categories show high sales but lower profit margins, indicating pricing or discount impact.
- Monthly trends show seasonal fluctuations in sales performance.
- Customer segmentation helps identify high-value and low-value customers for targeted strategies.

---

## 📌 SQL Concepts Used
- Aggregate Functions (SUM, AVG, COUNT)
- GROUP BY and HAVING
- Common Table Expressions (CTEs)
- Window Functions:
  - ROW_NUMBER()
  - DENSE_RANK()
  - LAG()
  - NTILE()
- Date Functions (YEAR, MONTH, DATE_FORMAT)

---

## 🚀 Project Outcome
This project demonstrates how SQL can be used to analyze large datasets and extract meaningful business insights. It helps in understanding customer behavior, improving sales strategy, and identifying key business performance drivers.

---

## 👨‍💻 Author
**Vasanth M**

Aspiring Data Analyst | SQL | Power BI (Learning) | Data Analytics

---

