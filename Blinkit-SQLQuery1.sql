--Selecting the Databse to use
use blinkitdb

--selecting table from the Database
select * from blinkit_data

-----KPI's
--1.Total Sales in Millions
select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_sales_in_Millions
from blinkit_data

--2.Average Sales
select cast(avg(Sales) as decimal(10,2)) as Avg_sales
from blinkit_data

--3.Counting the Total number of items ordered
select count(*) as No_of_items from blinkit_data

--4.Finding the average ratings of all the items in the dataset
select cast(avg(Rating) as decimal(10,2)) as Avg_Ratings
from blinkit_data


--Business Requirements
--1.Total Sales by Fat Content
select Item_Fat_Content,
cast(sum(Sales)as decimal(10,2)) as Total_sales,
cast(avg(Sales) as decimal(10,2)) as Avg_sales,
count(*) as No_of_items,
cast(avg(Rating) as decimal(10,2)) as Avg_Ratings from blinkit_data
group by Item_Fat_Content
order by Total_sales desc

--2.Total Sales by Item Type
select Item_Type,
cast(sum(Sales)as decimal(10,2)) as Total_sales,
cast(avg(Sales) as decimal(10,2)) as Avg_sales,
count(*) as No_of_items,
cast(avg(Rating) as decimal(10,2)) as Avg_Ratings from blinkit_data
group by Item_Type
order by Total_sales desc

--3.Fat Content by Outlet for Total Sales
select Outlet_Location_Type,Item_Fat_Content,
cast(sum(Sales) as decimal(10,2)) as Total_sales,
cast(avg(Sales) as decimal(10,2)) as Avg_sales,
count(*) as No_of_items,
cast(avg(Rating) as decimal(10,2)) as Avg_Ratings from blinkit_data
group by Outlet_Location_Type,Item_Fat_Content
order by Total_sales desc

--4.Total sales by Outlet Establishment
select Outlet_Establishment_Year,cast(sum(Sales) as decimal(10,2)) as Total_sales,
cast(avg(Sales) as decimal(10,2)) as Avg_sales,
count(*) as No_of_items,
cast(avg(Rating) as decimal(10,2)) as Avg_Ratings from blinkit_data
group by Outlet_Establishment_Year
order by Total_sales desc

--5.Percentage of sales by outlet size
select Outlet_Size,
cast(sum(Sales) as decimal(10,2)) as Total_sales,
cast((sum(Sales)*100.0/sum(sum(Sales)) over()) as decimal(10,2)) as Sales_percentage 
from blinkit_data
group by Outlet_Size
order by Total_sales desc

--6.Sales by Outlet location
select Outlet_Location_Type,
cast(sum(Sales) as decimal(10,2)) as Total_sales,
cast(avg(Sales) as decimal(10,2)) as Avg_sales,
count(*) as No_of_items,
cast(avg(Rating) as decimal(10,2)) as Avg_Ratings from blinkit_data
group by Outlet_Location_Type
order by Total_sales desc

--7.All metrics by Outlet Type
 select Outlet_Type,
  cast(sum(Sales) as decimal(10,2)) as Total_sales,
  cast(avg(Sales) as decimal(10,2)) as Avg_sales,
  cast((sum(Sales) * 100.0 / sum(sum(Sales)) over()) as decimal(10,2)) as Sales_percentage,
  count(*) as No_of_items,
  cast(avg(Rating) as decimal(10,2)) as Avg_Ratings
from blinkit_data
group by Outlet_Type
order by Total_sales desc




