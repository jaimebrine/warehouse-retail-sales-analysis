SELECT TOP 10
    [ITEM CODE],
    [ITEM DESCRIPTION],
    [ITEM TYPE],
    ROUND(SUM([RETAIL SALES]), 2) AS total_retail_sales,
    ROUND(SUM([RETAIL TRANSFERS]), 2) AS total_retail_transfers,
    ROUND(SUM([WAREHOUSE SALES]), 2) AS total_warehouse_sales,
    ROUND(
        SUM([RETAIL SALES]) + SUM([RETAIL TRANSFERS]) + SUM([WAREHOUSE SALES]),
        2
    ) AS total_movement
FROM [WarehouseRetail].[dbo].[Warehouse_and_Retail_Sales$]
GROUP BY
    [ITEM CODE],
    [ITEM DESCRIPTION],
    [ITEM TYPE]
ORDER BY total_movement DESC;
