# ECOMMERCE_SALES_ANALYSIS
SQL  analyzing e-commerce sales data.
# 📊 E-Commerce Sales Analysis Project (SQL)

## 📌 Project Overview
This project focuses on analyzing e-commerce sales data using SQL to extract meaningful business insights. The analysis covers sales performance, customer behavior, product trends, regional performance, and time-based trends. The goal is to support data-driven decision-making for business growth and optimization.

---

## 🗂️ Dataset Overview
The dataset contains 5,000+ e-commerce transaction records with the following attributes:
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

## 🛠️ Tools & Technologies Used
- MySQL
- SQL (Joins, CTEs, Window Functions, Aggregations)
- Data Analysis Techniques
- GitHub (Version Control)

---

## 🧹 Data Cleaning & Preparation
- Converted `Order_Date` from VARCHAR to DATE format
- Checked and handled NULL values
- Identified duplicate records using `GROUP BY HAVING`
- Verified unique values for categorical columns (City, Region, Category, Payment Mode)

---

## 📊 Exploratory Data Analysis (EDA)

- Total number of customers and orders analyzed
- Overall sales and profit calculated
- Average order value computed
- Year-wise order distribution studied
- Category-wise and region-wise performance analyzed

---

## 📈 Business Analysis Performed

### 🔹 Sales Analysis
- Total sales and profit by category
- Monthly and yearly sales trends
- Top-performing product categories

### 🔹 Customer Analysis
- Top 10 customers by total sales
- Customer segmentation using quartiles (NTILE)
- High-value customer identification

### 🔹 Product Analysis
- Top 10 best-selling products
- Top profitable products
- Product ranking within categories using DENSE_RANK

### 🔹 Regional Analysis
- Sales and profit by region and city
- Top-performing cities identified
- Regional customer behavior insights

### 🔹 Payment Mode Analysis
- Distribution of orders across payment methods
- Sales contribution by payment mode

### 🔹 Time-Based Analysis
- Month-over-month sales growth using LAG
- Running total of monthly sales
- Seasonal sales trends
- Year-over-year performance comparison

---

## 🔍 Key Insights

- Certain product categories consistently generate higher revenue and profit.
- A small group of customers contributes a large portion of total sales (VIP customers).
- Sales performance varies significantly across regions and cities.
- Some categories show high sales but relatively lower profit margins, indicating pricing or discount impact.
- Monthly trends highlight seasonal fluctuations in sales performance.
- Customer segmentation helps identify high-value and low-value customers for targeted marketing.

---

## 📌 Key SQL Concepts Used
- Aggregate Functions (SUM, AVG, COUNT)
- GROUP BY & HAVING
- CTEs (Common Table Expressions)
- Window Functions:
  - ROW_NUMBER()
  - DENSE_RANK()
  - LAG()
  - NTILE()
- Date Functions (YEAR, MONTH, DATE_FORMAT)

---

## 📊 Outcome of the Project
This project demonstrates how raw transactional data can be transformed into actionable business insights using SQL. It helps in understanding customer behavior, improving marketing strategies, optimizing product performance, and supporting data-driven business decisions.

---

## 🚀 Future Improvements
- Build an interactive Power BI dashboard
- Add predictive analysis for sales forecasting
- Perform customer lifetime value (CLV) analysis
- Integrate Python for advanced analytics

---

## 👨‍💻 Author
**Vasanth M**

Aspiring Data Analyst | SQL | Power BI | Data Visualization

---

## ⭐ If you like this project
Feel free to ⭐ the repository and explore more data analysis projects.
