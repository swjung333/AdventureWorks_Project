---- Create the territory table ----

Create table raw_territory (
	territory_key int primary key,
	region text,
	country text,
	"group" text
)

---- Create the budget table ----
Create table raw_budget (
	category text,
	target numeric,
	period int
)

---- Create the customers table ----
Create table raw_customers (
	customerkey int primary key,
	occupation text,
	name text,
	birthdate text,
	maritalstatus text,
	gender text,
	yearlyincome numeric,
	numberchildren int,
	region text
)

---- Creat the products table ----
Create table raw_products (
	productkey int primary key,
	productname text,
	subcategory text,
	category text,
	productline text,
	class text,
	listprice numeric,
	dealerprice numeric,
	standardcost numeric,
	color text,
	size text,
	sizerange text,
	weight text,
	modelname text,
	status text,
	startdate text,
	enddate text,
	description text
)

---- Create the sales table ----
create table raw_sales (
	salesordernumber text,
    orderdate date,
    productkey int,
    customerkey int,
    salesterritorykey int,
    orderquantity int,
    unitprice numeric,
    productcost numeric,
    salesamount numeric,
    taxamt numeric,
    freight numeric
)


---- Create the cleaning view ----
Create view clean_customers as 
select
	customerkey,
	occupation,
	name,
	cast(to_date(birthdate, 'YYYY"년" FMMM"월" FMDD"일"') AS DATE) as birth_date,
	maritalstatus,
	gender,
	yearlyincome,
	numberchildren,
	region
from raw_customers

---- Check the cleaned table ----
select *
from clean_customers

---- Create the master view ----
create view master_sales AS
SELECT 
    s.orderdate,
    p.productname,
    p.color,
	p.category,
	p.subcategory,
    c.name AS customer_name,
    c.gender,
    t.region,
    t.country,
    s.orderquantity,
    s.salesamount,
    (s.salesamount - (s.productcost * s.orderquantity)) AS profit
FROM raw_sales s
JOIN raw_products p ON s.productkey = p.productkey
JOIN clean_customers c ON s.customerkey = c.customerkey
JOIN raw_territory t ON s.salesterritorykey = t.territory_key

---- Check the master table ----
select *
from master_sales
