-- AND OR operators
SELECT
    transaction_id,
    year,
    city,
    total_sales
FROM sales_analysis
WHERE year = 2023
  AND (city = 'Smithside' OR city = 'Lake Thomas');

--BETWEEN, NOT BETWEEN
SELECT
    transaction_id,
    year,
    city,
    total_sales
FROM sales_analysis
WHERE year BETWEEN 2023 AND 2025;

--IN operator
SELECT
    transaction_id,
    city,
    total_sales
FROM sales_analysis
WHERE city IN ('East Amanda', 'Smithside', 'Lake Thomas');

--NOT IN operator
SELECT
    transaction_id,
    product_name,
    category,
    total_sales
FROM sales_analysis
WHERE category NOT IN ('Toys', 'Books');

--LIKE operator
SELECT
    transaction_id,
    city,
    total_sales
FROM sales_analysis
WHERE city LIKE '%manda%';

--NOT LIKE operator
SELECT
    transaction_id,
    city,
    total_sales
FROM sales_analysis
WHERE city NOT LIKE '%manda%';

--NULL
SELECT
    transaction_id,
    city,
    total_sales,
	zip_code
FROM sales_analysis
WHERE city IS NULL
	OR zip_code IS NOT NULL;

--HAVING 
SELECT
    transaction_id,
    COUNT(*) AS occurrence_count
FROM sales_analysis
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT
    total_sales,
    order_date,
    COUNT(*) AS occurrence_count
FROM sales_analysis
GROUP BY total_sales, order_date
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

--CASE
SELECT
    transaction_id,
    total_sales,
    CASE
        WHEN total_sales >= 300 THEN 'High Value'
        WHEN total_sales >= 150 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS sales_segment
FROM sales_analysis
ORDER BY total_sales DESC;
