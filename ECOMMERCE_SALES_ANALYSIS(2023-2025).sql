#                   E-Commerce Sales Analysis using SQL

#Objective:
#Analyze e-commerce sales data to identify sales trends, customer behavior, product performance, regional performance, and 
#business insights using SQL.

create database E_COMMERCE_SALSE;
USE E_COMMERCE_SALSE;
CREATE TABLE ecom_sales(
Order_ID INT PRIMARY KEY,
	Order_Date varchar(50), 
	Customer_Name varchar(100),
	Region varchar(50),
	City  varchar(50),
	Category varchar(100),
	Sub_Category  varchar(100),
	Product_Name varchar(100),
	Quantity int,
	Unit_Price decimal(10,2),
	Discount decimal(5,2),
	Sales decimal(12,2),
	Profit 	decimal(12,2),
	Payment_Mode varchar(50)
);

SELECT order_date FROM ECOMM limit 10;

ALTER TABLE ECOMM
MODIFY order_date DATE;

rename table ECOMM to ecom_sales;

select*from ecom_sales;

describe ecom_sales;

select* from ecom_sales limit 10;

select count(*) from ecom_sales;

#checking null values customer_id 

select* from ecom_sales
where sales is null;

select* from ecom_sales
where product_name  is null;

select* from ecom_sales
where profit  is null;

select* from ecom_sales
where order_date is null;

# checking duplicate 
select order_id,count(*) from ecom_sales group by order_id having count(*) >1;

#checking unique values. 
# city
select distinct City from ecom_sales;
# region 
select distinct region from ecom_sales;
# category
select distinct category from ecom_sales; 
# Payment_Mode
select distinct payment_mode from ecom_sales;

select year(order_date) as years, count(order_id)  from ecom_sales
group by year(order_date) order by count(order_id)  asc;
# this tells that number of orders made in each year. In 2023 number of order placed  is 601
# and in 2025 number of order place is 1867 finally maximum number of order is in 2024 and number of order is2532

#exploratory data analysis[EDA]
# number of customer.
select count(distinct customer_name) from ecom_sales; 
#insights - total number of customer in this dataset is 4844

# total number of order. 
select count(order_id) from ecom_sales;
#insights- total number of oeders is 5000

#total profit. 
select sum(profit) from ecom_sales;
#insights- the total profit in ecommerce sales 2023-2025 is ₹79708734.91 

# total sales. 
select sum(sales) from ecom_sales;
#insights- the total sales in ecommerce sales 2024-2025 is ₹533666024.35 

#avg order value. 
select avg(sales) from ecom_sales;
#insights- the average order value is ₹106733.204870 

#top 5 best-selling products by sales?
select product_name,sum(sales) as total_sales from ecom_sales 
group by product_name order by sum(sales) desc limit 5;
#insights- the top 5 best selling product is 
#1.Headphones Accusantium - ₹ 857184.20
#2.Spices Quibusdam	- ₹ 687651.25
#3.Accessories Repellendus - ₹ 687083.30
#4.Bed Tenetur - ₹ 670994.80
#5.Laptop Similique	- ₹ 666640.60

#total revenue by category?
select category,sum(sales) as total_sales from ecom_sales group by category order by sum(sales) desc;
# insights- the total revenus by each category listed here 
#1.Home Decor -₹ 57233222.35
#2.Furniture -₹ 56647187.90
#3.Clothing	- ₹ 55053908.30
#4.Books - ₹ 54932643.00
#5.Kitchen	- ₹ 54227902.30
#6.Electronics - ₹ 52587883.95
#7.Toys	- ₹52227366.45
#8.Sports - ₹ 52069397.25
#9.Beauty - ₹ 50803409.70
#10.Groceries - ₹ 47883103.15,  the hights selling by category is Home Decor and lowest is Beauty 

#type of category the customer mostly prefered all over the india. 
select category,count(*) from ecom_sales group by category order by count(*) desc; 
# maximum count of category is  Book -528 and  Kitchen	528 it shows that books and kitchen category are have maximum orders and mimimum is 
# Beauty products - 460

#.type of category the customer diffrent region prefered mostly. 
select region, category, order_count
from (select region, category, count(*) as order_count,row_number() over (partition by region order by count(*) desc) as rn from ecom_sales
group by region, category) as ranked
where rn = 1;
# by region in East  side most people focused on Home Decor total 
# in North side most people focused on Home Decor category
#South side most people focused on Clothing
#West side most people focused on Kitchen

# monthly sales trend over time
select date_format(order_date,"%y-%m") as yr_month,sum(sales) as total_sales from ecom_sales
group by date_format(order_date,"%y-%m") order by yr_month;
#insight- this above query explains about which all months and years of total_sales in which 
#2023-10(october) have high total_sales ₹21307522.20
#the lowest total sales of month and year is 2025-10(october) total sales ₹1391328.40. 

# total sales, total profit, and overall profit margin %.
select sum(profit),sum(sales),round((sum(profit)/sum(sales))*100,2) as margin_perc from ecom_sales;
#insight-The overall profit margin is 14.94%, which means the company earns approximately ₹14.94 in profit for every ₹100 of sales. 
#This indicates that the business is generating a healthy level of profit relative to its revenue.

 # total sales,profit, number of order in region 
 select region,count(order_id) as total_order,sum(sales) as totel_sales,sum(profit) as total_profit from ecom_sales
 group by region order by total_order desc;
 #insights- the maximum order are in north side the minimum order are in south side of india so total_profit is high in north_india ₹21343004.33 
 #and low in south_india the total_profit is ₹18253049.32. 
 
#average margin % grouped by Category.
select category,sum(profit),sum(sales),round(avg(profit/sales)*100,2) as avg_margin_perc from ecom_sales 
group by category order by  avg_margin_perc desc;
#insights _ 
#Electronics has the highest average_profit margin is 15.39%, this shows it is most profitable category .
#The company should continue investing in and promoting Electronics products.
#Even if its sales are not the highest, it have hight profitability among all category. 

#top 10 Sub-Categories by total sales.
select sub_category, sum(sales) as total_sales from ecom_sales group by sub_category order by total_sales desc limit 10;

# number of orders, total sales, and average order value grouped by Payment Mode.
select  payment_mode,count(order_id) as total_order,sum(sales) as total_sales,avg(sales) as avg_sales_amt from ecom_sales 
group by payment_mode order by total_sales desc;
# insight - most of the people prefferd Net Banking mode rather than others #1.Net Banking-1010
#2.COD(cash on delivery)-1005
#3.Credit Card-994
#4.Debit Card-1003
#5.UPI-988 

# Customer & Product Analysis
# top 10 customers by total sales and from which city.
select customer_name,city,sum(sales) as total_sales from ecom_sales 
group by customer_name,city order by total_sales desc limit 10;
#insight- Rohan Khare from Surat purchased for ₹398485.00. so company can focued more on discoust percentage and high offers for 
#Rohan Khare to continuing his purchase more 

# top 10 products by total profit.
select product_name,sum(profit) as total_profit from ecom_sales 
group by product_name order by total_profit desc limit 10;
#insight- this show which top 10 product have more profit by this analysis we can inprove  discount of product and offers for so 
#that the product is purchased by more people.

#top 10 cities by total sales and profit.
select city,sum(sales) as total_sales,sum(profit) as total_profit from ecom_sales 
group by city order by total_sales desc limit 10;
# Bangalore is top in total sales(₹29989840.85) and profit(₹4416914.72).should companys should give more importans on city Bangalore
#for marketing their products to stay customers in high sales and profit.in city in which the sales and product is low that the company should focus more on discount
#and improve the offers for the customes. 

#the average discount given per Category, ordered highest to lowest.
select category, round(avg(discount),2) as avg_discount from ecom_sales 
group by category order by avg_discount desc;
# Toys have discount of 10.64% and least is Electronics have 9.53%   

# Time-Based / Trend Analysis
# total sales and profit by month across 2023-2025.
select monthname(order_date)as  month,sum(sales) as total_sales,sum(profit) as total_profit from ecom_sales
group by month order by total_sales desc;
#insight - this show month may have hight sales and hight profit,and low sales and low profit in February.
#so more discount and offers can improve the sales and profit in February month

# total sales grouped by year and compare year-over-year.
select year(order_date) as year,sum(sales) as total_sales from ecom_sales 
group by  year order by  total_sales desc;
#insight-2024 has max total_sales ₹271480204.45
#2025 has total_sales ₹198213788.25
#2023 has min total_sales ₹63972031.65

#which day of the week gets the most orders.
select dayname(order_date),count(order_id) from ecom_sales 
group by dayname(order_date) order by count(order_id) desc;
#insight- Monday have the max order of 754,minimum in Tuesday only 671. 

#total sales grouped by year and quarter.
select year(order_date) as year,quarter(order_date) as quarter,sum(sales) as total_sales from ecom_sales 
group by year(order_date),quarter(order_date) order by total_sales desc;
#insight - in year 2024 quarter	4 have the maximum total_sales of ₹70450660.60 and
#  in year 2025 and quarter 4 has the minumun total_sales of ₹1391328.40

#Analyze product rankings, sales trends, and customer segmentation using Window Functions
#top-selling product in each category based on total sales.
with e_sales as 
(select product_name,category,sum(sales) as total_sales from ecom_sales group by product_name,category) ,
new_ranked_product as (select category,product_name,total_sales,
 dense_rank() over(partition by category order by total_sales desc) as new_rank from e_sales)
 select * from new_ranked_product
 where new_rank =1 ;
 #insights - all total sales of product_name from each category 
#Beauty  -	Shampoo Commodi(product_name)
#Books	- Textbook Omnis(product_name)	
#Clothing - 	Accessories Repellendus(product_name)
#Electronics - 	Headphones Accusantium(product_name)	
#Furniture	- Bed Tenetur(product_name)	
#Groceries	- Spices Quibusdam(product_name) 
#Home Decor	- Lamp Enim(product_name)	
#Kitchen	- Refrigerator Maiores(product_name) 
#Sports	- Football Harum(product_name)	
#Toys	- Puzzle Illo(product_name)	

#Calculate a running total of monthly sales over time.
with e_sales as(
select year(order_date) as year,month(order_date) as month, sum(sales) as total_sales from ecom_sales group by year(order_date),month(order_date))
select *,sum(total_sales) over(order by year,month) as running_total from e_sales;

#top 3 selling products within each Region.
with e_sale as(
select product_name,region,sales,dense_rank() over(partition by region order by sales desc) as dens_rk_product from ecom_sales)
select*from e_sale
where dens_rk_product<=3 and dens_rk_product>=1 ; 
#insight- this shows that top 3 selling product in each region
#East -  1.Shampoo Fugit,2.Football Expedita,3.Kids Wear Sit	East
#North - 1.Rice A, 2.Camera Repellendus 3.Sugar Suscipit
#South - 1.Lamp Libero,2.Mixer Grinder Voluptatum,3.Fiction Sapiente
#West - 1.Dumbbells Fuga,2.Rice Nobis,3.Comics Voluptatibus

# month-over-month sales growth percentage.
with e_comm as 
(select year(order_date) as year,month(order_date) as month, sum(sales) as total_sales from ecom_sales
 group by year,month)
 select *, lag(total_sales) over(order by year,month) as previous_month_sales,
 round(((total_sales -lag(total_sales) over(order by year,month))/lag(total_sales) over(order by year,month))*100,2) 
 as month_of_month_sales_growth_percentage
 from e_comm;
# insight- Month-over-month growth helps measure whether the business is growing or declining.
#It provides a quick view of sales trends.
 
#customers into 4 spending tiers (quartiles) based on total sales.
with e_comm as(
select customer_name,sum(sales) as total_sales from ecom_sales group by customer_name)
select*, ntile(4) over(order by total_sales desc) as quartiles from  e_comm ;
#insight-Different quartiles can receive different offers.
#High-value like Aaryahi Madan(customer_name) have totaly purchased for ₹650151.90(total_sales) customers may receive exclusive rewards,
# while lower-spending like Gatik Chaudhary(customer_name) have totaly purchased for ₹264.10(total_sales) so 
#customers can be encouraged with discounts or promotions.





















































































































































































































