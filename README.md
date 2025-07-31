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
<img width="813" height="468" alt="image" src="https://github.com/user-attachments/assets/a2681bc1-6d91-40ba-b021-c302fda8bae2" />
<img width="994" height="739" alt="image" src="https://github.com/user-attachments/assets/e4a767af-510e-4f4d-b751-4a5729d8f527" />
<img width="702" height="576" alt="image" src="https://github.com/user-attachments/assets/7db18ca2-9670-4800-aee9-df9b407ef133" />
<img width="628" height="382" alt="image" src="https://github.com/user-attachments/assets/14047c75-37d0-49ba-ae91-060b5948f966" />



# SQL Analysis Overview

Once data is available in the SQL Server table `df_orders`, several SQL queries are used to derive insights:

* Top 10 revenue-generating products
  <img width="231" height="231" alt="image" src="https://github.com/user-attachments/assets/8b77b4db-33b4-4951-8056-14e3d60cbdc3" />

* Top 5 highest selling products per region
  <img width="310" height="426" alt="image" src="https://github.com/user-attachments/assets/d8af06d7-b965-4ea3-bf7a-3f208fe82bef" />

* Month-over-month sales comparison for 2022 and 2023
  <img width="280" height="267" alt="image" src="https://github.com/user-attachments/assets/120ad09d-cc57-4e3e-a2d2-f279837d277e" />

* Highest sales month for each product category
  <img width="368" height="90" alt="image" src="https://github.com/user-attachments/assets/8a9b0920-11b5-40b2-9f2c-32aacabe61bc" />

* Sub-category with the highest sales growth from 2022 to 2023
  <img width="380" height="56" alt="image" src="https://github.com/user-attachments/assets/706ec390-ce16-4b3d-8406-d0ca609e62a1" />


# Tools Used

* Python
* Pandas
* SQLAlchemy
* PyODBC
* SQL Server
* Kaggle API

