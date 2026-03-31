# -Bright-Coffee-shop-
Summery
Data Preparation
Convert the provided Excel file into a CSV format.
Load the CSV into Databricks using Spark.

Data Cleaning & Transformation
Create a new column transaction_time_bucket to group transactions into fixed intervals (30 minutes or 3 hours).
Standardize and cast unit_price values (fix commas like '3,1' → 3.1).
Compute a new column total_amount = unit_price * transaction_qty.

SQL Analysis
Use SQL queries to:
Group transactions by product type and time bucket.
Calculate total sales and transaction counts.
Identify top-selling products.
Compute average unit price per product type.

Expected Outcome
A clean dataset in Databricks with properly formatted values.
Time-bucketed transactions for trend analysis.
Aggregated insights (sales totals, averages, product performance).

SQL queries that can be extended for deeper business intelligence
