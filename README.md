# Northwind Database - MySQL version

## Description
I created this sample Northwind Database for beginners who want learn about MySQL from [W3Schools](https://www.w3schools.com/mysql/default.asp). Since I work with MySQL, so I modify the syntax accordingly. I work with MySQL version 8.0.27.

There are several differences:
- in W3Schools, **CustomerID** column in **Customers** table uses `SMALLINT` as datatype, but here I use `CHAR(5)` following the original database.
- there are 2 tables I don't include, **customer_customer_demo** and **customer_demographics**, because both tables are empty and contain no data, so I think there is no need to add into the database.

## ER Diagram
<img src=northwind-mysql-erd.png>

## Examples of Query
#### <li>Top 5 employees (first_name, last_name) based on amount of orders they managed.</li>
`SELECT e.first_name, e.last_name, COUNT(o.order_id) AS total_orders`<br />
`FROM employees e`<br />
`INNER JOIN orders o ON e.employee_id = o.employee_id`<br />
`GROUP BY o.employee_id`<br />
`ORDER BY total_orders DESC`<br />
`LIMIT 5;`<br /><br />
<img src="https://github.com/salmiah-ls/northwind-mysql/blob/main/images/query-1.png">
