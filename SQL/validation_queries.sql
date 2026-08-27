USE WarehouseRetail;
GO

/*
    Warehouse & Retail Sales - Validation Queries

    Run after importing the cleaned workbook into:
    [WarehouseRetail].[dbo].[Warehouse_and_Retail_Sales$]

    These checks document the validation steps used by the project.
    They do not update or delete any records.
*/

-- 1. Final row count
SELECT COUNT_BIG(*) AS total_rows
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 2. Observed date range
SELECT
    MIN([DATE]) AS minimum_date,
    MAX([DATE]) AS maximum_date
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 3. Number of distinct reporting periods
SELECT COUNT(*) AS reporting_periods
FROM (
    SELECT [YEAR], [MONTH]
    FROM [dbo].[Warehouse_and_Retail_Sales$]
    GROUP BY [YEAR], [MONTH]
) AS periods;

-- 4. Dataset cardinality
SELECT
    COUNT(DISTINCT [ITEM CODE]) AS unique_products,
    COUNT(DISTINCT [SUPPLIER]) AS unique_suppliers,
    COUNT(DISTINCT [ITEM TYPE]) AS unique_item_types
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 5. Channel totals and combined movement
SELECT
    ROUND(SUM([RETAIL SALES]), 2) AS total_retail_sales,
    ROUND(SUM([RETAIL TRANSFERS]), 2) AS total_retail_transfers,
    ROUND(SUM([WAREHOUSE SALES]), 2) AS total_warehouse_sales,
    ROUND(
        SUM([RETAIL SALES])
        + SUM([RETAIL TRANSFERS])
        + SUM([WAREHOUSE SALES]),
        2
    ) AS total_movement
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 6. Negative-value checks retained for operational review
SELECT
    SUM(CASE WHEN [RETAIL SALES] < 0 THEN 1 ELSE 0 END) AS negative_retail_sales,
    SUM(CASE WHEN [RETAIL TRANSFERS] < 0 THEN 1 ELSE 0 END) AS negative_retail_transfers,
    SUM(CASE WHEN [WAREHOUSE SALES] < 0 THEN 1 ELSE 0 END) AS negative_warehouse_sales
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 7. Missing-value checks after cleaning
SELECT
    SUM(CASE WHEN [SUPPLIER] IS NULL THEN 1 ELSE 0 END) AS missing_suppliers,
    SUM(CASE WHEN [ITEM TYPE] IS NULL THEN 1 ELSE 0 END) AS missing_item_types,
    SUM(CASE WHEN [RETAIL SALES] IS NULL THEN 1 ELSE 0 END) AS missing_retail_sales,
    SUM(CASE WHEN [DATE] IS NULL THEN 1 ELSE 0 END) AS missing_dates
FROM [dbo].[Warehouse_and_Retail_Sales$];

-- 8. Movement by item type, including categories with negative totals
SELECT
    [ITEM TYPE],
    ROUND(SUM([RETAIL SALES]), 2) AS total_retail_sales,
    ROUND(SUM([RETAIL TRANSFERS]), 2) AS total_retail_transfers,
    ROUND(SUM([WAREHOUSE SALES]), 2) AS total_warehouse_sales
FROM [dbo].[Warehouse_and_Retail_Sales$]
GROUP BY [ITEM TYPE]
ORDER BY total_warehouse_sales DESC;
