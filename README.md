# Northwind Database - MySQL version

## Description
I created this sample Northwind Database for beginners who want learn about MySQL from [W3Schools](https://www.w3schools.com/mysql/default.asp). Since I work with MySQL, so I modify the syntax accordingly. I work with MySQL version 8.0.27.

There are several differences:
- in W3Schools, **CustomerID** column in **Customers** table uses `SMALLINT` as datatype, but here I use `CHAR(5)` following the original database.
- there are 2 tables I didn't include, **customer_customer_demo** and **customer_demographics**, because both tables are empty and contain no data, so in my opinion, there is no need to add them into the database.

## ER Diagram
<img src=northwind-mysql-erd.png width="800">

## Examples of Query
#### <li>Top 5 employees (first_name, last_name) with highest amount of orders they managed.</li>
```
SELECT e.first_name, e.last_name, COUNT(o.order_id) AS total_orders
FROM employees e
INNER JOIN orders o ON e.employee_id = o.employee_id
GROUP BY o.employee_id
ORDER BY total_orders DESC
LIMIT 5;`
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-1.png"></img><br /><br />

#### <li>Same with query above, but divide employees based on their performance. 'Great' if total orders >= 100; 'Average' if total orders between 50 to 99; 'Poor' if total orders < 50.</li>
```
SELECT first_name, last_name, total_orders,
CASE
    WHEN total_orders >= 100 THEN 'Great'
    WHEN total_orders < 100 AND total_orders >= 50 THEN 'Average'
    WHEN total_orders < 50 THEN 'Poor'
END AS performance
FROM (
	SELECT e.first_name, e.last_name, COUNT(o.order_id) AS total_orders
	FROM employees e
	INNER JOIN orders o ON e.employee_id = o.employee_id
	GROUP BY o.employee_id) AS new_table
ORDER BY total_orders desc;  
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-1a.png"></img><br /><br />
                          
#### <li>Customers' details (id, name, contact, address, city, country) managed by employee Laura Callahan, sort by id alphabetically.</li>
```
SELECT DISTINCT c.customer_id, c.customer_name, c.contact_name, c.address, c.city, c.country
FROM ((customers c
INNER JOIN orders o ON c.customer_id = o.customer_id)
INNER JOIN employees e ON o.employee_id = e.employee_id and e.last_name='Callahan' AND e.first_name='Laura')
ORDER BY c.customer_id;
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-2.png"></img><br /><br />

#### <li>Details of products (id, name, quantity per unit, unit price) ordered on August 1996 sort by unit price descending.</li>
```
SELECT DISTINCT p.product_id, p.product_name, p.quantity_per_unit, p.unit_price
FROM ((products p
INNER JOIN order_details od on p.product_id = od.product_id)
INNER JOIN orders o ON od.order_id = o.order_id AND o.order_date BETWEEN '1996-08-01' AND '1996-08-30')
ORDER BY p.unit_price DESC;
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-3.png"></img><br /><br />

#### <li>Sales and Net-Sales of product Ipoh Coffee sold from September 1996 to December 1996</li>
```
SELECT o.order_id, o.order_date, ROUND((od.unit_price * od.quantity), 2) as sales, ROUND(((od.unit_price * od.quantity) - (od.discount * od.unit_price * od.quantity)), 2) as net_sales
FROM ((order_details od
INNER JOIN products p ON od.product_id = p.product_id AND p.product_name = 'Ipoh Coffee')
INNER JOIN orders o ON od.order_id = o.order_id AND o.order_date BETWEEN '1996-09-01' AND '1996-12-31');
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-4.png"></img><br /><br />

#### <li>Total Net-Sales of query above</li>
```
SELECT p.product_name, ROUND(SUM((od.unit_price * od.quantity) - (od.discount * od.unit_price * od.quantity)), 2) as total_sales
FROM ((order_details od
INNER JOIN products p ON od.product_id = p.product_id AND p.product_name = 'Ipoh Coffee')
INNER JOIN orders o ON od.order_id = o.order_id AND o.order_date BETWEEN '1996-09-01' AND '1996-12-31');
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-5.png"></img>
