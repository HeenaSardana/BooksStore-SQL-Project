# BooksStore SQL Project

## About the Project

BooksStore is a MySQL database project designed to manage and analyze information about books, customers, and orders.

The project demonstrates the use of SQL to store data, establish relationships between tables, and perform different types of queries to extract useful information from the database.

## Database Tables

The database contains three main tables:

* **Books** – Stores information about books, including title, author, genre, published year, price, and stock.
* **Customers** – Stores customer information such as name, email, phone number, city, and country.
* **Orders** – Stores order information including customer, book, order date, quantity, and total amount.

## Database Relationships

* `Customer_ID` in the **Orders** table references `Customer_ID` in the **Customers** table.
* `Book_ID` in the **Orders** table references `Book_ID` in the **Books** table.

These relationships connect customers and books with their respective orders.

## SQL Concepts Used

* CREATE DATABASE
* CREATE TABLE
* Primary Key
* Foreign Key
* SELECT
* WHERE
* BETWEEN
* DISTINCT
* ORDER BY
* LIMIT
* Aggregate Functions
* SUM()
* AVG()
* COUNT()
* GROUP BY
* HAVING
* JOIN
* LEFT JOIN
* Subqueries
* COALESCE()

## Project Queries

The project contains basic and advanced queries for analyzing bookstore data, such as:

* Retrieving books by genre
* Finding books published after a specific year
* Finding customers from a particular country
* Analyzing orders by date
* Calculating total stock
* Finding the most and least expensive books
* Finding customers who ordered multiple quantities
* Calculating total revenue
* Finding books sold by genre
* Calculating average book prices
* Identifying customers with multiple orders
* Finding frequently ordered books
* Analyzing books sold by author
* Finding customers who spent the most
* Calculating remaining stock after orders

## Tools Used

* **MySQL**
* **MySQL Workbench**
* **GitHub**

## Project Files

* `BooksStore.sql` – Contains the database creation, table creation, and SQL queries.
* `Books.csv` – Contains book data.
* `Customers.csv` – Contains customer data.
* `Orders.csv` – Contains order data.

## Purpose

This project was created to practice SQL and database concepts using a real-world bookstore scenario. It demonstrates database design, relationships, data analysis, and writing SQL queries to retrieve meaningful information.
