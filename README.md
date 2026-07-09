# Warehouse & Retail Sales Analysis

Operational sales analysis project using Power Query, SQL Server, and Power BI.

## Project Overview

This project analyzes warehouse and retail product movement across categories, suppliers, products, and reporting periods.

The goal was to clean, validate, analyze, and visualize sales movement data to identify key operational patterns and business insights.

The analysis treats `Retail Sales`, `Retail Transfers`, and `Warehouse Sales` as volume metrics, not revenue, because the dataset does not include price, cost, or profit information.

## Tools Used

- Excel / Power Query
- SQL Server
- SQL Server Management Studio
- Power BI

## Dataset Summary

- 307,645 rows
- 34,056 unique products
- 397 suppliers
- 9 item types
- 24 reporting periods
- Date range: June 2017 to September 2020

## Key KPIs

- Total Warehouse Sales: 7.78M
- Total Retail Sales: 2.16M
- Total Retail Transfers: 2.13M
- Unique Products: 34K
- Unique Suppliers: 397
- Unique Item Types: 9

## Dashboard Preview

![Dashboard Preview](images/dashboard_screenshot.png)

## Key Insights

- Warehouse activity represents the largest operational volume in the dataset.
- Beer is the dominant category by warehouse movement.
- Retail sales are more balanced across Liquor, Wine, and Beer.
- The top-moving products are mainly Beer SKUs such as Corona, Heineken, Miller Lite, Modelo, and Bud Light.
- Negative values in categories such as REF and DUNNAGE may represent returns, credits, corrections, or logistics adjustments.

## Project Workflow

1. Cleaned and prepared the dataset using Power Query.
2. Imported the cleaned data into SQL Server.
3. Validated row count, dates, categories, suppliers, and products using SQL.
4. Explored trends, product performance, supplier contribution, and category movement.
5. Built an interactive Power BI dashboard.

## Limitations

- The dataset does not include price, cost, revenue, or profit.
- Sales fields were treated as operational volume, not money.
- Some months are missing, so trends are based only on available reporting periods.
- Negative values require additional business context.

## Conclusion

This project demonstrates an end-to-end data analysis workflow using Power Query, SQL Server, and Power BI.

The final dashboard helps identify operational volume patterns by category, supplier, product, and time period.
