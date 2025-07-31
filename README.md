# Retail Orders Analytics Project

# Description

This project builds an end-to-end data pipeline using Python and Pandas to process a retail orders dataset. The cleaned data is loaded into SQL Server, where SQL queries are used to analyze top-performing products, regional sales, monthly trends, and year-over-year growth.

# Dataset

The dataset is sourced from Kaggle and contains retail order records including product details, pricing, discounts, order dates, regions, and categories.

# Python ETL Process

The data is downloaded and extracted using the Kaggle API. It is loaded into a Pandas DataFrame for preprocessing. The following transformations are applied:

* Missing values are handled.
* New columns are derived: discount, sale price, and profit.
* The `order_date` column is converted to datetime format.
* Unnecessary columns such as `list_price`, `cost_price`, and `discount_percent` are removed.

After preprocessing, the data is loaded into SQL Server using SQLAlchemy with an ODBC connection.

# SQL Server Connection

The connection to SQL Server is established using SQLAlchemy and PyODBC, using ODBC Driver 17 for SQL Server. After a successful connection test, the processed data is written to a table named `df_orders`.

# SQL Analysis Overview

Once data is available in the SQL Server table `df_orders`, several SQL queries are used to derive insights:

* Top 10 revenue-generating products
* Top 5 highest selling products per region
* Month-over-month sales comparison for 2022 and 2023
* Highest sales month for each product category
* Sub-category with the highest sales growth from 2022 to 2023

# Tools Used

* Python
* Pandas
* SQLAlchemy
* PyODBC
* SQL Server
* Kaggle API

