/*
Created By: Diego Deviez
Create Date: 06/16/2024
Description: Brazilian E-Commerce Data Analysis
*/

-- Remove duplicates in orders table
DELETE FROM 
	orders
WHERE 
	order_id NOT IN (
    SELECT 
		MIN(order_id)
    FROM 
		orders
    GROUP BY
		order_id
);

-- Remove duplicates in customers table
DELETE FROM 
	customers
WHERE 
	customer_id NOT IN (
    SELECT 
		MIN(customer_id)
    FROM 
		customers
    GROUP BY 
		customer_id
);

-- Identify missing values
SELECT 
	* 
FROM 
	orders 
WHERE 
	order_purchase_timestamp IS NULL;
	
SELECT 
	* 
FROM 
	customers 
WHERE 
	customer_unique_id IS NULL;
-- Repeat for other columns and tables

-- Handle missing values (example: filling with a default value or removing rows)
UPDATE 
	orders
SET 
	order_purchase_timestamp = '1970-01-01 00:00:00'
WHERE 
	order_purchase_timestamp IS NULL;

DELETE FROM 
	customers
WHERE 
	customer_unique_id IS NULL;

-- Example: Calculate the delivery time in days
ALTER TABLE 
	orders 
ADD COLUMN
	delivery_time_days INTEGER;

UPDATE 
	orders
SET 
	delivery_time_days = JULIANDAY(order_delivered_customer_date) - JULIANDAY(order_purchase_timestamp);

	
--Payment methods
SELECT
	payment_type as [Type],
	count(payment_type) as [Count]
FROM
	order_payments
GROUP BY 
	payment_type
ORDER BY
	count(payment_type) desc;

--Payment values and installments
SELECT 
	min(payment_value) as Min,
	round(avg(payment_value),2) as Mean,
	round(max(payment_value),2) as Max
FROM 
	order_payments;
	
SELECT 
	min(payment_installments) as Min,
	round(avg(payment_installments),2) as Mean,
	round(max(payment_installments),2) as Max
FROM 
	order_payments;
	
--Payment installments by payment types
  SELECT 
	payment_type as Payment, 
	count(payment_installments) as Count, 
	min(payment_installments) as Min, 
	avg(payment_installments) as Mean, 
	max(payment_installments) as Max, 
	sum(payment_installments) as Sum 
FROM 
	order_payments
GROUP BY 
	Payment
ORDER BY 
	Count DESC;
	
--Number of order status

SELECT
	upper(substr(order_status, 1, 1)) || lower(substr(order_status, 2)) as Status, 
	count(order_status) as Count
FROM
	orders
GROUP BY
	order_status
ORDER BY
	Count desc;

--Number of orders by month
SELECT 
	strftime('%m', order_purchase_timestamp) as Month,
	count(*) as Count
FROM
	orders
GROUP BY
	Month;

--Number of orders by day, 0-6 = Sunday - Saturday
SELECT 
	strftime('%w', order_purchase_timestamp) as Weekday, 
	count(*) as Count
FROM 
	orders
GROUP BY 
	Weekday;

--Orders by city
SELECT
	c.customer_city as CIty,
	count(o.order_id) as Count
FROM
	customers as c
INNER JOIN
	orders as o
ON
	c.customer_id = o.customer_id
GROUP BY
	c.customer_city
ORDER BY
	Count desc
LIMIT 10;

--Average price values by category
SELECT DISTINCT 
	pc.product_category_name_english as Product,  
	round(AVG(price), 2) as Price_avg
FROM 
	products as p
INNER JOIN 
	order_items as oi
ON 
	p.product_id = oi.product_id
INNER JOIN 
	product_category_name_translation  as pc
ON 
	pc.product_category_name = p.product_category_name
GROUP BY 
	Product
ORDER BY 
	Price_avg desc
LIMIT 10;


-- Joining tables with important order information into one for vizualization
CREATE TABLE ecommerceviz as
SELECT 
	o.order_id as [Order ID],
	o.customer_id as [Customer ID],
	o.order_status as [Order Status],
	strftime('%Y-%m-%d', o.order_purchase_timestamp) as [Order Purchase Date],
	op.payment_installments as [Payment Installments],
	op.payment_type as [Payment Type],
	op.payment_value as [Payment Sales],
	c.customer_city as [Customer City],
	c.customer_state as [Customer State],
	pt.product_category_name_english as [Product Category]
FROM 
	orders as o
INNER JOIN
	order_payments as op
ON 
	o.order_id = op.order_id
INNER JOIN
	customers as c
ON
	o.customer_id = c.customer_id
INNER JOIN
	order_items as oi
ON
	o.order_id = oi.order_id
INNER JOIN
	products as p
ON 
	oi.product_id = p.product_id
INNER JOIN
	product_category_name_translation as pt
ON
	p.product_category_name = pt.product_category_name
ORDER BY
	op.payment_value desc;
	

	
	