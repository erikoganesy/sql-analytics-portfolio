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


-- Task 2. Category-Level Performance Analysis (CASE + GROUP BY + HAVING)
/* Description
Create an aggregated analysis at the product category level.
*/

SELECT
    category,
    COUNT(transaction_id) AS transaction_count,
    SUM(total_sales) AS total_sales_amount,
    AVG(total_sales) AS avg_total_sales,
    AVG(discount) AS avg_discount,
    CASE
        WHEN AVG(discount) < 0.33 * AVG(AVG(discount)) OVER ()
         AND AVG(total_sales) > 0.67 * AVG(AVG(total_sales)) OVER ()
            THEN 'Strong Performer'
        WHEN AVG(discount) BETWEEN
             0.33 * AVG(AVG(discount)) OVER ()
         AND 0.67 * AVG(AVG(discount)) OVER ()
         AND AVG(total_sales) BETWEEN
             0.33 * AVG(AVG(total_sales)) OVER ()
         AND 0.67 * AVG(AVG(total_sales)) OVER ()
            THEN 'Average Performer'
        WHEN AVG(discount) > 0.67 * AVG(AVG(discount)) OVER ()
         AND AVG(total_sales) < 0.33 * AVG(AVG(total_sales)) OVER ()
            THEN 'Underperformer'
        ELSE 'Anomaly'
    END AS category_performer
FROM sales_analysis
WHERE year = 2023
GROUP BY category
HAVING COUNT(transaction_id) >= 10 
ORDER BY total_sales_amount DESC;

-- Task 3 | City-Level Activity Analysis (COUNT + HAVING + CASE)
/*
Analyze customer activity patterns by city. 
*/

SELECT
	city,
	COUNT(*),
	CASE
		WHEN COUNT(*) < 3
			THEN 'Low Activity'
		WHEN COUNT(*) > 3
			THEN 'High Activity'
		ELSE 'Medium Activity'
	END AS cities_activity
FROM sales_analysis
WHERE year = 2023
GROUP BY city
ORDER BY count DESC;

-- Task 4 | Discount Behavior Analysis (CASE + HAVING)
/*
Analyze how discounts are applied across categories.
*/

SELECT
	category,
	AVG(discount) AS avg_discount,
	SUM(total_sales) AS total_sales_amount,
	CASE
		WHEN AVG(discount) > 0.67 * AVG(AVG(discount)) OVER ()
			THEN 'Discount-Heavy'
		WHEN AVG(discount) < 0.33 * AVG(AVG(discount)) OVER ()
			THEN 'Low or No Discount'
		ELSE 'Moderate Discount'
	END AS level_discount
	FROM sales_analysis
	GROUP BY category
	HAVING SUM(total_sales) IS NOT NULL
	ORDER BY total_sales_amount