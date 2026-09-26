-- Create Database
  CREATE DATABASE BooksStore;

-- Switch to Database
  USE BooksStore;

-- Create Tables
   CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(100),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT
    );
    
    CREATE TABLE Customers(
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(60),
    Country VARCHAR(150)
    );
    
    CREATE TABLE Orders(
    Order_ID INT PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2)
    );
    
    Select * From Books;
    Select * From Customers;
    Select * From Orders;
    
    
 -- 1) Retrieve all Books in the "Fiction" genre:
    SELECT *
    FROM Books
    WHERE Genre="Fiction";
    
-- 2)Find Books Published after the year 1950:
    SELECT *
    FROM Books 
    WHERE Published_Year > 1950;
    
-- 3)List all Customers from the Canada:
    SELECT * 
    FROM Customers
    WHERE Country="Canada";
    
-- 4)Show Orders placed in November 2023:
    SELECT * 
   FROM Orders
   WHERE Order_Date BETWEEN "2023-11-01" AND "2023-11-30";
   
-- 5)Retrieve the Total Stock of Books Available:
   SELECT SUM(Stock) as Total_Stock 
   FROM Books;
   
-- 6)Find the Details of the Most Expensive Books:
  SELECT * 
  FROM Books 
  ORDER BY Price DESC
  LIMIT 1;
  
-- 7)Show all Customers name  Who Ordered more than 1 Quantity of a Book
  SELECT c.Name
  FROM Customers c 
  LEFT JOIN Orders o
  on c.Customer_ID=o.Customer_ID
  WHERE o.Quantity > 1;
  
-- 8)Retrieve all Orders where the Total_Amount exceeds $20:
  SELECT *
  FROM Orders 
  WHERE Total_Amount > 20;
  
-- 9)List all Genres available in the Books Table:
   SELECT DISTINCT(Genre)
   FROM Books;
  
-- 10)Find the Book With the Lowest Stock:
  SELECT *
  FROM Books 
  ORDER BY  Stock 
  LIMIT 1;
  
-- 11) Calaculate the Total Revenue generated from all orders:
  SELECT SUM(Total_Amount) as Total_Revenue
  FROM Orders;
  
  
-- ADVANCED QUESTIONS:
  
-- 1)Retrieve the total number of Books sold for each genre:
  SELECT b.Genre ,SUM(o.Quantity) AS Total_Books_Sold
  FROM Books b 
  JOIN Orders o
  on b.Book_ID=o.Book_ID
  GROUP BY b.Genre;
  
-- 2)Find the Average Price of Books in the "Fantasy" Genre:
  SELECT AVG(Price) as Average_Price
  FROM Books 
  WHERE Genre="Fantasy";
  
-- 3)List Customers who  have Placed atleast 2 Orders:
  SELECT Customer_ID, Count(Order_ID) as Total_Orders
  FROM Orders 
  GROUP BY Customer_ID
  HAVING Total_Orders >= 2;
  
-- 4)Find the Name of most Frequently Ordered Book:
  SELECT title as Name 
  from (SELECT  b.title ,o.Book_ID ,
  COUNT(o.Order_ID) as Frequently_Ordered_Book
  FROM Orders o 
  JOIN  Books b 
  on o.Book_ID=b.Book_ID
  GROUP BY o.Book_ID
  ORDER BY  Frequently_Ordered_Book DESC
  LIMIT 1 ) d;
  
-- 5) Show the Top 3 Most Expensive Books of "Fantasy"  Genre:
  SELECT * 
  FROM Books 
  WHERE Genre="Fantasy"
  ORDER BY Price DESC
  LIMIT 3;
  
-- 6)Retrieve the Total Quantity of Books Sold by Each Author:
  SELECT b.Author, SUM(o.Quantity) as Total_Books_Sold
  FROM Books b 
  JOIN Orders o
  on b.Book_ID=o.Book_ID
  GROUP BY  b.Author;
  
-- 7)List the Cities Where Customers Who Spent over $30 are located:
  SELECT DISTINCT(c.City)
  FROM Orders o
  JOIN Customers c
  on o.Customer_ID=c.Customer_ID
  WHERE o.Total_Amount >30;
  
-- 8)Find the  Customer  who Spent the Most on Orders:
  SELECT  c.Name ,
  SUM(o.Total_Amount) As Total_Amount_Spent
  FROM Customers c
  JOIN Orders o
  on c.Customer_ID=o.Customer_ID
  GROUP BY c.Name
  ORDER BY Total_Amount_Spent DESC
  LIMIT 1;
  
-- 9)Calculate The Stock Remaining After FullFilling All Orders:
  SELECT b.Book_ID , b.Title , b.Stock ,
  COALESCE(SUM(o.Quantity),0) AS Order_Quantity ,
   b.Stock - COALESCE(SUM(o.Quantity),0) as Remaining_Quantity
  FROM Books b
  LEFT JOIN Orders o
  on b.Book_ID=o.Book_ID
  GROUP BY b.Book_ID
  
 
  
