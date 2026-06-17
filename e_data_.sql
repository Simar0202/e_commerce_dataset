create database e_data;
use e_data;

select count(*) 
from e_data;

--  Revenue Contribution by Country
-- cte version
with t_revenue as (
        select sum(unit_price * quantity) as total_revenue 
        from e_data 
) 
select country, round(sum(unit_price * quantity)* 100.0 /total_revenue,2) as revenue_contribution
from e_data as e1 
cross join t_revenue as t1 
group by country, total_revenue
order by revenue_contribution desc;

-- windows fucntion 

select country, sum(unit_price * quantity) as revenue,
sum(unit_price * quantity) * 100.0/ sum(sum(unit_price * quantity)) over () as revenue_contribution 
from e_data 
group by country;

-- Top 3 customers in each country 
select * from 
(
select customer_id, country, sum(unit_price * quantity) as revenue,
row_number() over (partition by country order by sum(unit_price * quantity) desc) as number
from e_data 
group by customer_id, country
) as x 
where number <= 3;

-- Customer Spending Rank

select customer_id, sum(unit_price * quantity) as total_spending,
dense_rank() over (order by sum(unit_price * quantity) desc) as rnk
from e_data 
group by customer_id;

-- Category Performance Analysis

select category, count(*) as count_of_orders, sum(unit_price * quantity) as category_revenue, round(avg(rating),2) as avg_rating
from e_data 
group by category
order by category_revenue desc;

-- Highest Rated Category 

with category_rating as (
    select category, avg(rating) as avg_rating
    from e_data 
    group by category
)
select category 
from category_rating
where avg_rating = (
          select max(avg_rating)
          from category_rating
);

-- Revenue by Payment Method

select payment_method, sum(unit_price * quantity) as payment_revenue, count(*) as total_orders
from e_data 
group by payment_method;

-- Running Revenue over time 

select order_date, sum(unit_price * quantity) as daily_revenue,
sum(sum(unit_price * quantity)) over (order by order_date) as running_revenue 
from e_data 
group by order_date 
order by order_date;

-- Revenue compared to overall average

with customer_sales as (
          select customer_id, sum(unit_price * quantity) as revenue 
          from e_data 
          group by customer_id
)

select * 
from customer_sales 
where revenue > (
     select avg(revenue)
     from customer_sales
) ;
-- Country Wise best category
select * from (
select country, category, sum(unit_price * quantity) as revenue,
dense_rank() over(partition by country order by sum(unit_price * quantity) desc) as rnk
from e_data 
group by country, category
) as x 
where rnk = 1;

-- first product purchased by every customer
select customer_id, product_name
from (
select customer_id, product_name, order_date,
row_number() over (partition by customer_id order by order_date) as number
from e_data 
) as x 
where number = 1;

-- Product with low rated and have significant sales 

select product_name, sum(unit_price * quantity) as revenue,
avg(rating) as avg_rating
from e_data 
group by product_name
having avg(rating) < 3 
order by revenue desc;

-- How many products fall in Ecellent, Average and Poor Categories
select
case 
when rating >=4 then "Excellent"
when rating >=3 then "Average"
else "Poor"
end as rating_category, count(*) as total_products 
from e_data
group by rating_category