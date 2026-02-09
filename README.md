# Data Analytics Project: Sales Performance Dashboard (pgAdmin 4 + PowerBI)

## Project Overview
This project is to analyze sales data and provide actionable insights, using SQL and PowerBI. The objective is to transform raw data into a dynamic, two-page Power BI dashboard that visualizes overall sales performance and dive deep into product and customer behaviors.

## Dataset and Structure
The project utilizes data sourced from PostgreSQL (queried via pgAdmin 4).
* **Raw Dataset**: `Sales_AdventureWorks_OnionBI.xlsx`
* **Master Dataset**: Structured and cleaned data derived from SQL views (`CREATE VIEW`) created in pgAdmin 4 for analysis and imported into Power BI.

## Project Workflow

### 1️⃣ Data Preparation in PostgreSQL (pgAdmin 4)
The raw dataset was provided as a single Excel file (`Sales_AdventureWorks_OnionBI.xlsx`). Since this file contained five different tabs, the first step was to export them into five individual CSV files to allow for proper database importing:
* `Sales.csv`
* `Products.csv`
* `Customers.csv`
* `Territory.csv`
* `Budget.csv`

Once imported into PostgreSQL:
* **Data Integration**: Multiple `JOIN` operations were used to combine these tables based on relational keys into a master view (`master_sales`).
* **Data Cleaning**: Errors were fixed, and date formats were standardized.
* **Data Manipulation**: The view includes calculated fields like **Profit** calculated directly in SQL (Sales Amount - (Product Cost * Order Quantity)).

### 2️⃣ Data Import and Modeling (Power BI)
The `master_sales` view was imported into Power BI to create the data model.
* **Structured Data**: The view provides a clean, consolidated table ready for analysis.
* **Efficient Processing**: This allows Power BI to focus on visualization and interactive DAX calculations.

### 3️⃣ Power BI Dashboard Creation
An interactive sales dashboard was built to analyze key performance indicators:
* **DAX Measures**: `SUM` was used to to develop key performance metrics for **Total Sales**, **Total Quantity**, and **Total Profit**.
* **Visualization**: Charts and graphs were created to visualize sales trends, profitability, and customer demographics based on the processed data.

## Dashboard Features

### Page 1: Sales Performance Overview
This page provides a high-level view of company health and geographic performance.
* **Key Visuals**: Sales and Profit Trends, Sales by Country, and Regional breakdowns.
* **Objective**: Quick assessment of revenue targets and geographic trends.
<img width="1286" height="723" alt="Sales Performance Overview" src="https://github.com/user-attachments/assets/7b54a518-c4d9-41b7-a0cd-7d3899a4e190" />

### Page 2: Product & Customer Insights
This page dives into the operational details to identify drivers of sales and areas for improvement.
* **Key Visuals**: Sales by Product Subcategory, Top/Bottom 10 Products, and a demographic Matrix (Color/Gender).
* **Objective**: Inventory management, marketing demographic targeting, and customer relationship management.
