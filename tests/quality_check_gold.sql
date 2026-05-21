/*
The scripts are used to check data quality:
  - Checking the data quality and uniqueness
  - Uniqueness of sarogate keys
  - Validation of relationship in the data
  - Run the scripts after loading data from silver layer
*/

==================================
-- Check gold.dim_customers
==================================
-- Checking the quality of data in gold table customers
  
SELECT DISTINCT
*
FROM gold.dim_customers
order by customer_key 

SELECT DISTINCT
    customer_key,
    COUNT(*) AS duplicates
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1

-- Ckeck fact table data
SELECT * FROM gold.fact_sales

-- Check foreign Key Integrity (Dimensions)
-- Expectation: No Result

SELECT * FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
WHERE c.customer_key IS NULL

SELECT * FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE c.customer_key IS NULL

