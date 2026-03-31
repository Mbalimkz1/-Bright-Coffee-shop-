--This is to check if data is loaded correctly and able to read
SELECT*
FROM workspace.default.bright_coffee_shop_analysis_case_study
LIMIT 10;

--------------------------------------------------
-- 2.Checking the Date Range
---------------------------------------------------
---They started collecting Data 2023-01-01
SELECT MIN(transaction_date) AS min_date
FROM workspace.default.bright_coffee_shop_analysis_case_study;
--The duration of data is 6 months 

------The last collection date 2023-06-30 ------ 
SELECT MAX(transaction_date) AS latest_date
FROM workspace.default.bright_coffee_shop_analysis_case_study;
--------------------------------------------------------------
---3. Checking names of different stores
----------------------------------------------------------
--There are 3 Stores LowerManhantttan, Hells Kitchen and Astoria
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_analysis_case_study;

SELECT COUNT(DISTINCT store_id) AS  number_of_stores
FROM workspace.default.bright_coffee_shop_analysis_case_study;
-------------------------------------------------------------
--4. Checking Products sold at the stores
-----------------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_analysis_case_study

SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_analysis_case_study

SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_analysis_case_study;

SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM workspace.default.bright_coffee_shop_analysis_case_study;
---------------------------------------------------------------
---5. Checking product prices 
---------------------------------------------------------------
SELECT MIN(unit_price) AS Cheapest_price
FROM workspace.default.bright_coffee_shop_analysis_case_study;

SELECT MAX(unit_price) AS expensive_price
FROM workspace.default.bright_coffee_shop_analysis_case_study;

-------------------------------------------------------------
SELECT COUNT(*) AS number_of_rows,
             COUNT(DISTINCT transaction_id) AS number_of_sales,
             COUNT(DISTINCT product_id) AS number_of_products,
             COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis_case_study;
--------------------------------------------------------------
SELECT*
FROM workspace.default.bright_coffee_shop_analysis_case_study
LIMIT 10;


SELECT transaction_date,
       Dayname(transaction_date) AS Day_name
FROM workspace.default.bright_coffee_shop_analysis_case_study;

SELECT transaction_id,
       transaction_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,
       transaction_qty*unit_price AS revenue_per_tnx
FROM workspace.default.bright_coffee_shop_analysis_case_study;
---------------------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.bright_coffee_shop_analysis_case_study;


SELECT 
--Dates
       transaction_date AS purchase_date,
       Dayname(transaction_date) AS Day_name,
       Monthname(transaction_date) AS Month_name,
       Dayofmonth(transaction_date) AS day_of_month,
        
       CASE
           WHEN Dayname(transaction_date) IN ('Sun' , 'Sat') THEN 'Weekend'
           ELSE 'Weekday'
       END AS day_classification,


      -- date_format(transaction_time, 'HH:mm:ss') AS purchase_time,
       CASE
           WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. morning'
           WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
           WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
           END AS time_buckects,

--Count of IDs
       COUNT(DISTINCT transaction_id) AS number_of_sales,
       COUNT(DISTINCT product_id) AS number_of_products,
       COUNT(DISTINCT store_id) AS number_of_stores,
--Revenue
       SUM(transaction_qty*unit_price) AS revenue_per_day,
       CASE
           WHEN revenue_per_day<=50 THEN '01.Low Spend'
           WHEN revenue_per_day BETWEEN 51 AND 100 THEN '02. Med Spend'
           ELSE '03.High Spend'
       END AS spend_bucket,

-- Categorical columns
      Store_location,
      product_category,
      product_detail
FROM workspace.default.bright_coffee_shop_analysis_case_study
GROUP BY transaction_date,
      Dayname(transaction_date),
      Monthname(transaction_date),
      Dayofmonth(transaction_date),

      CASE
          WHEN Dayname(transaction_date) IN ('Sun' , 'Sat') THEN 'Weekend'
          ELSE 'Weekday'
       END,

       CASE
           WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01. morning'
           WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02. Afternoon'
           WHEN date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
           END,

      store_location,
      product_category,
      product_detail;
      
