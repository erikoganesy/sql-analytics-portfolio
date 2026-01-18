-- 1. Revenue Overview
/*What is the total revenue of the company?*/

SELECT 
	SUM(total_sales) AS total_revenue
FROM sales_analysis;

/*How is revenue distributed across product categories?*/

SELECT 
	category,
	SUM(total_sales) AS total_revenue,
FROM sales_analysis
GROUP BY category;

/*Which category contributes the largest share of revenue?*/

SELECT 
	category,
	SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;

-- 2. Typical Transaction Value
/* Calculate the average transaction value */

SELECT
	AVG(quantity * price) AS avg_trans_value
FROM sales_analysis;

/* Calculate the median transaction value */

SELECT
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (quantity * price)) AS median_trans_value
FROM sales_analysis

/* average(2612.4) > median(1918.5) → right-skewed, so median is more appropriate */

-- 3. NULL Impact Assessment
/* How many transactions have NULL discounts? */

SELECT
	COUNT(*) AS cnt_null
FROM sales_analysis
WHERE discount is NULL;

/* Calculate average discount using:
default behavior
zero imputation
average imputation
median imputation */


SELECT
	AVG(discount) AS avg_discount
FROM sales_analysis;


SELECT
	AVG(COALESCE(discount,0)) AS avg_discount_with_zero_imput
FROM sales_analysis;
	

SELECT
	AVG(COALESCE(discount,
			(SELECT 
				AVG(discount) 
			FROM sales_analysis
			)
		)
	) AS avg_discount_with_avg_imput
FROM sales_analysis;


SELECT
	AVG(COALESCE(discount,
			(SELECT
		         PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY discount)
			FROM sales_analysis
			)
		)
	) AS avg_discount_with_median_imput
FROM sales_analysis;

/*
In this case, the NULL-handling method doesn’t matter, 
because the discount column has no NULL values.
But usually:
zero imputation is a business decision, not a default
average imputation preserves the mean, also it reduces variance
median imputation preserves robustness to outliers
*/


-- 4. Revenue Distribution Analysis
/*Group transactions into 50-unit revenue ranges*/

SELECT
	CEILING(total_sales/50) * 50 AS revenue_range
FROM sales_analysis

/*For each range, compute:
number of transactions
total revenue
*/


SELECT
	CEILING(total_sales/50) * 50 AS revenue_range,
	COUNT (*) AS number_of_trans,
	SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY CEILING(total_sales/50) * 50;


/* Identify the dominant revenue range */


SELECT
	FLOOR(total_sales/50) * 50 AS revenue_range_floor, --it's for me
	CEILING(total_sales/50) * 50 AS revenue_range_ceil,
	SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY CEILING(total_sales/50) * 50, FLOOR(total_sales/50) * 50
ORDER BY total_revenue DESC
LIMIT 1;


-- 5. Data Quality Check
/* Check for duplicate transaction IDs */


SELECT
	transaction_id,
	COUNT(*)
FROM sales_analysis
GROUP BY transaction_id
HAVING COUNT(*) > 1;


/* Explain the risk of aggregating employee salary directly from this table */

SELECT * FROM sales_analysis;

SELECT
	employee_first_name,
	employee_last_name,
	employee_salary,
	COUNT(*)
FROM sales_analysis
GROUP BY employee_first_name, employee_last_name, employee_salary
HAVING COUNT(*) > 1;

/*I think there is a risk that the salary column contains duplicates, 
so SUM(salary) does not give the correct total salary of employees.
*/