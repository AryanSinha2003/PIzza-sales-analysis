select * from pizza_sales;

Select sum(total_price)as total_revenue from pizza_sales;


Select Count(distinct(order_id))as total_orders from pizza_sales;

SELECT (SUM(total_price)/COUNT(distinct(order_id))) from pizza_sales;

SELECT CAST(SUM(quantity) AS DECIMAL (10,2))/ CAST(COUNT(DISTINCT order_id) as decimal(10,2))from pizza_sales;

SELECT DATENAME(WEEKDAY,order_date)as order_day, 
COUNT(DISTINCT order_id) AS Total_sales from pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)

SELECT DATENAME(MONTH,order_date)as order_day, 
COUNT(DISTINCT order_id) AS Total_orders from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders DESC

SELECT pizza_category,sum(total_price)*100/(SELECT sum(total_price) from pizza_sales) as PCT
from pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


SELECT  top 5 pizza_name, cast (SUM(total_price) as decimal(10,2))AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Comments here

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC


SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC

select pizza_category, count (pizza_category)as total_sum from pizza_sales 
group by pizza_category