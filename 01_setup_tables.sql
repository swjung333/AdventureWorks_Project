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
create view master_sales as
select 
    s.salesordernumber,
    s.orderdate,
    p.productname,
    p.color,
    p.modelname,
    p.subcategory,
    c.name as customer_name,
    c.birth_date,
    c.gender,
    c.yearlyincome,
    t.region,
    t.country,
    s.orderquantity,
    s.salesamount,
    (s.salesamount - (s.productcost * s.orderquantity)) as profit
from raw_sales s
join raw_products p on s.productkey = p.productkey
join clean_customers c on s.customerkey = c.customerkey
join raw_territory t on s.salesterritorykey = t.territory_key

---- Check the master table ----
select *
from master_sales
