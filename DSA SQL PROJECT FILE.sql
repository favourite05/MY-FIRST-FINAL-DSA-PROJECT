create database kulgar_db

select * from [dbo].[KMS Sql Case Study]


-----1 which product category had the highest sales
select top 1 product_category, sum(sales) as [total sales]
from [dbo].[KMS Sql Case Study]
group by product_category
order by [total sales] desc

------2 what are the top 3 and bottom three in terms of sales 
select top 3 region, sum(sales) as [total sales]
from [dbo].[KMS Sql Case Study]
group by region
order by [total sales] DESC

------2b
select top 3 region, sum(sales) as [total sales]
from [dbo].[KMS Sql Case Study]
group by region
order by [total sales] asc

------3 what is the total sales of appliances in ontario
select product_sub_category,sum(sales) as [total sales]
from [dbo].[KMS Sql Case Study]
where region = 'ontario' and product_sub_category = 'appliances'
group by product_sub_category

-----4 advise the management of kms on what to do to increase the the revenue from the bottom 10 customer
select top 10 customer_name,sales
from [dbo].[KMS Sql Case Study]
order by  sales asc

-----  recommendations to boost revenue
--set a minimum value order
--offer bulk purchase incentives
--optimize shipping mode for small orders
--review and network discount polices
--introduce product bundles or combos
--educate customers via campaigns
--target repaet low_spending customers

------suggested polices to implement
--orders below #10: no air shipping or discount
--orders above #30: eligible for 10% discount
--offer bundle packs to increase order quantity
--use cheaper shipping for orders < #5
--loyalty points for higher monthly spending

-----5 kms incured the most shipping cost using which shipping method
select top 1 ship_mode,sum(shipping_cost) as [total shipping_cost]
from [dbo].[KMS Sql Case Study]
group by ship_mode
order by [total shipping_cost] desc

-----6 who are the most valuable customers
select top 10 customer_name,sales,product_category,sum(sales) as [total sales]
from [dbo].[KMS Sql Case Study]
group by customer_name,sales,product_category
order by [total sales] desc

-----7 which small business customer had the highest sales
select top 1*
from [dbo].[KMS Sql Case Study]
where customer_segment = 'small business'
order by sales desc

-----8 which corporate customer placed the most number of orders in 2009-2012
select top 1 *
from [dbo].[KMS Sql Case Study]
where customer_segment = 'corporate'
order by order_quantity desc

------9 which consumer customer was the most profitable one 
select top 1 *
from [dbo].[KMS Sql Case Study]
where customer_segment = 'consumer'
order by profit desc

------10 which customers returned items and what segment do they belong
select customer_name,customer_segment
from [dbo].[KMS Sql Case Study]
join [dbo].[Order_Status]
on [dbo].[KMS Sql Case Study].order_id = [dbo].[Order_Status].order_id

----11
select order_priority,sales,order_quantity,ship_mode,shipping_cost,
     count(*) as [total order]
from [dbo].[KMS Sql Case Study]
group by order_priority,sales,order_quantity,ship_mode,shipping_cost
order by order_priority, [total order] desc






