-- sales from 2020
select sales.transactions.*, sales.date.*
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where date.year = 2020;

-- total revenue generated in 2020
select sum(sales.transactions.sales_amount) as Total_revenue
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where date.year = 2020;

-- total revenue generated from Chennai in the year 2020
select sum(sales.transactions.sales_amount) as Total_revenue
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where date.year = 2020 and transactions.market_code = 'Mark001';

-- total revenue generated in 2019
select sum(sales.transactions.sales_amount) as Total_revenue
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where date.year = 2019;

-- unique products sold in Chennai
select distinct sales.transactions.product_code as distinct_products
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where transactions.market_code = 'Mark001';

-- sales where the amount was paid in US dollars
select sales.transactions.*, sales.date.*
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date where transactions.currency = 'USD';

-- total sales in 2020 January in Chennai
select sum(sales.transactions.sales_amount) as total_revenue
from sales.transactions inner join sales.date
on sales.transactions.order_date = sales.date.date
where date.month_name = 'January' and transactions.market_code = "Mark001";