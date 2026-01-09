--Ex. 1
/*
Description: Calculate total net revenue after discount for each category.
*/


SELECT
	category,
	SUM(without_discount) AS total_without_discount,
	SUM(net_revenue) AS total_net_revenue
FROM(
	SELECT
		category,
		price*quantity AS without_discount,
		price * quantity * (1 - discount) AS net_revenue
	FROM sales_analysis
) 
GROUP BY category
ORDER BY total_net_revenue;


--Ex. 2
/*
Description. Find categories where the average discount is above 10% 
but total revenue is still higher than $50,000.
*/

SELECT
	category,
	AVG(discount) AS avg_discount,
	SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY category
HAVING AVG(discount) > 0.1 AND SUM(total_sales) > 50000;

--Ex. 3
/*
Description. Find cities whose average transaction value is above 
the global average transaction value.
*/


SELECT 
	city,
	AVG(price * quantity * (1 - discount)) AS avg_trans_value
FROM sales_analysis
GROUP BY city
HAVING 
	AVG(price * quantity * (1 - discount)) >
			(
				SELECT 
					AVG(price * quantity * (1 - discount)) AS global_avg_trans_value
				FROM sales_analysis
			)
ORDER BY avg_trans_value;


--Ex. 4
/*
Description. Calculate how much money was lost because of discounts.
*/

SELECT
	SUM((price * quantity)-(price * quantity * (1 - discount))) AS lost_money
FROM sales_analysis;

--Ex. 5
/*
For each customer, calculate:
gross_revenue = SUM(price * quantity)
net_revenue   = SUM(price * quantity * (1 - discount))
discount_cost = gross_revenue - net_revenue
Show only customers with discount_cost > 2000.
*/

SELECT
	customer_name,
	SUM(price * quantity) AS gross_revenue,
	SUM(price * quantity * (1 - discount)) AS net_revenue,
	SUM(price * quantity) - SUM(price * quantity * (1 - discount)) AS discount_cost
FROM sales_analysis
GROUP BY customer_name
HAVING SUM(price * quantity) - SUM(price * quantity * (1 - discount)) > 2000
ORDER BY discount_cost DESC
	