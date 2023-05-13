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
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-1.png"><br />

#### <li>Customers' details (id, name, contact, address, city, country) managed by employee Laura Callahan, sort by id alphabetically.</li>
```
SELECT DISTINCT c.customer_id, c.customer_name, c.contact_name, c.address, c.city, c.country
FROM ((customers c
INNER JOIN orders o ON c.customer_id = o.customer_id)
INNER JOIN employees e ON o.employee_id = e.employee_id and e.last_name='Callahan' AND e.first_name='Laura')
ORDER BY c.customer_id;
```
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-2.png">
