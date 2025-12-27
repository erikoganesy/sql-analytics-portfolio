-- Task 1. Complex Transaction Segmentation (CASE + WHERE)
/* Description
Create a query that classifies each transaction into a business segment using a CASE statement.
I must define: High-value Electronics transactions with low discount
*/

SELECT
	transaction_id,
	city,
	category,
	total_sales,
	AVG(total_sales) OVER () AS avg_total_sales,
	AVG(discount) OVER () AS avg_discount,
	CASE
		WHEN total_sales > AVG(total_sales) OVER ()
			AND discount < AVG(total_sales) OVER ()
			THEN 'High-value Electronics transactions with low discount'
		ELSE 'other'
	END AS segment
	
FROM sales_analysis
WHERE year = 2023 AND category = 'Electronics'
LIMIT 10;
