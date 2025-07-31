-- Top 10 highest revenue-generating products
-- Calculates total sales per product and returns top 10 by revenue
select top 10 product_id, sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc



-- Top 5 highest selling products in each region
-- Ranks products by sales within each region and selects top 5
with cte as (
  select region, product_id, sum(sale_price) as sales
  from df_orders
  group by region, product_id
)
select *
from (
  select *, row_number() over(partition by region order by sales desc) as rn
  from cte
) A
where rn <= 5



-- Month-over-month sales comparison for 2022 vs 2023
-- Compares sales for each month across the two years
with cte as (
  select year(order_date) as order_year, month(order_date) as order_month,
         sum(sale_price) as sales
  from df_orders
  group by year(order_date), month(order_date)
)
select order_month,
       sum(case when order_year = 2022 then sales else 0 end) as sales_2022,
       sum(case when order_year = 2023 then sales else 0 end) as sales_2023
from cte
group by order_month
order by order_month



-- Month with highest sales per category
-- Finds the month with the highest sales for each category
with cte as (
  select category, format(order_date, 'yyyyMM') as order_year_month,
         sum(sale_price) as sales
  from df_orders
  group by category, format(order_date, 'yyyyMM')
)
select *
from (
  select *, row_number() over(partition by category order by sales desc) as rn
  from cte
) a
where rn = 1



-- Sub-category with highest sales growth from 2022 to 2023
-- Calculates and ranks sub-categories by increase in sales between the two years
with cte as (
  select sub_category, year(order_date) as order_year,
         sum(sale_price) as sales
  from df_orders
  group by sub_category, year(order_date)
)
, cte2 as (
  select sub_category,
         sum(case when order_year = 2022 then sales else 0 end) as sales_2022,
         sum(case when order_year = 2023 then sales else 0 end) as sales_2023
  from cte
  group by sub_category
)
select top 1 *,
       (sales_2023 - sales_2022) as growth
from cte2
order by growth desc
