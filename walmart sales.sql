create database walmart;
USE walmart;

-- 1.  Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').

select * from walmartdata
where Branch='A';

-- 2. Find the total sales for each product line.
select Product_line, sum(Total)
from walmartdatawalmartsales
group by Product_line;

-- 3. List all sales transactions where the payment method was 'Cash'.

select * from walmartdata
where Payment='Cash';


-- 4.  Calculate the total gross income generated in each city. 

select City,sum(Total)
from walmartdata
group by City;

-- 5. Find the average rating given by customers in each branch. 
select Branch,avg(Rating) from walmartdata
group by Branch;

-- 6. Determine the total quantity of each product line sold.

select Product_line,sum(Quantity)
from walmartdata
group by Product_line;


-- 7. List the top 5 products by unit price. 

select Product_line, Unit_price 
from walmartdata
order by Unit_price desc
limit 5;

-- 8. Find sales transactions with a gross income greater than 30.

select *
from walmartdata
where gross_income>30;

-- 9.  Retrieve sales transactions that occurred on weekends.

SELECT *
FROM walmart.walmartsales
WHERE dayname(Date)  in ('Saturday','Sunday');


-- 10.  Calculate the total sales and gross income for each month.

select monthname(Date) as Monthname,Total, gross_income 
from walmart.walmartsales;


-- 11.  Find the number of sales transactions that occurred after 6 PM.

select * 
from walmartdata
where Time>'18:00:00'; 


-- 12.  List the sales transactions that have a higher total than the average total of all transactions. 

with cte as (
select avg(Total) as Average from walmartdata
)
select * from walmartdata
where Total> ( select Average from cte);


-- 13. Calculate the cumulative gross income for each branch by date. 

select Branch, sum(gross_income) over(order by Date) as cumulative
from walmartdata
order by Branch, Date ;

