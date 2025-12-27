SELECT
	customer_name,
	SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY customer_name
ORDER BY total_revenue DESC 
LIMIT 10;

SELECT
	customer_name,
	CASE 
		WHEN customer_name in ('Laura Brown', 'Michael Smith','Kurt Hayes',
								'Justin Clark', 'David Lopez', 'Cathy Mckenzie',
								'Paul Smith', 'James Moore', 'Danielle Carter',
								'Julie Clark') THEN 'top_client'
		ELSE 'other'
END as top10_clients		 
FROM sales_analysis
LIMIT 50;