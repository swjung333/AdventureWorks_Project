Create table raw_territory (
	territory_key int primary key,
	region text,
	country text,
	"group" text
)

Create table raw_budget (
	category text,
	target numeric,
	period int
)

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

create table raw_sales (
	salesordernumber text,
    orderdate text,
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

select *
from clean_customers
