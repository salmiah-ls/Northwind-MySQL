# Northwind Database - MySQL version

## Description
I created this sample Northwind Database for beginners who want learn about SQL from [W3Schools](https://www.w3schools.com/sql/default.asp). Since I work with MySQL, so I modify the syntax accordingly. I work with MySQL version 8.0.27.

There are several differences:
- in W3Schools, **CustomerID** column in **Customers** table uses `SMALLINT` as datatype, but here I use `CHAR(5)` following the original database.
- there are 2 tables I don't include, **customer_customer_demo** and **customer_demographics**, because both tables are empty and contain no data, so I think there is no need to add into the database.

## ER Diagram
<img src=northwind-mysql-erd.png>
