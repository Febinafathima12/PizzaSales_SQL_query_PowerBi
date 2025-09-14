CREATE database pizza_totalsales;
use pizza_totalsales;

create table pizza_sales (
pizza_id int,
order_id int,
pizza_name_id int,
quantity int,
order_date date,
order_time	time,
unit_price	float,
total_price	float,
pizza_size char(10),
pizza_category	varchar(50),
pizza_ingredients varchar(100),
pizza_name varchar(100)
);

1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales1;

2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales1

3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales1;

4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales1;

5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales1;

6. % of Sales by Pizza Category
SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales1
GROUP BY pizza_category;


7. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales1) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales1
GROUP BY pizza_size
ORDER BY pizza_size;

8. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales1
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

9. Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

10. Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;


11. Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

12. Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
Limit 5;


13. Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Orders DESC
Limit 5;

14. Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY Total_Orders ASC
Limit 5;





















