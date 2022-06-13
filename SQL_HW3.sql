CREATE DATABASE HOMEWORK3

USE HOMEWORK3

CREATE TABLE Brands(
Id int PRIMARY KEY Identity,
Name nvarchar(50)
)
CREATE TABLE Notebooks(
Id int PRIMARY KEY Identity,
Name nvarchar(50),
Price decimal,
BrandId int FOREIGN KEY REFERENCES Brands(Id)
)
CREATE TABLE Phones(
Id int PRIMARY KEY Identity,
Name nvarchar(50),
Price decimal,
BrandId int FOREIGN KEY REFERENCES Brands(Id)
)

SELECT p.Name,p.Price,b.Name FROM Phones p INNER JOIN Brands b ON p.BrandId=b.Id

SELECT n.Name,n.Price,b.Name FROM Notebooks n INNER JOIN Brands b ON n.BrandId=b.Id

SELECT * FROM Notebooks WHERE Price BETWEEN 2000 and 5000 OR  Price > 5000

SELECT * FROM Phones WHERE Price BETWEEN 1000 and 1500 OR  Price > 1500
--
--Normal
SELECT b.Name,(SELECT Count(*) FROM Notebooks n WHERE b.Id=n.BrandId) as  Count FROM Brands b 
--Group by
SELECT b.Name,COUNT(*) FROM Notebooks n JOIN Brands b ON n.BrandId=b.Id Group By b.Name
--Normal
SELECT b.Name,(SELECT Count(*) FROM Phones p WHERE b.Id=p.BrandId) as  Count FROM Brands b 
--Group by
SELECT b.Name,COUNT(*) FROM Phones p JOIN Brands b ON p.BrandId=b.Id Group By b.Name

SELECT * FROM Notebooks
Union 
SELECT * FROM Phones

SELECT p.Name,p.Price,b.Name FROM Phones p INNER JOIN Brands b ON p.BrandId=b.Id
Union
SELECT n.Name,n.Price,b.Name FROM Notebooks n INNER JOIN Brands b ON n.BrandId=b.Id

SELECT p.Name,p.Price,b.Name FROM Phones p INNER JOIN Brands b ON p.BrandId=b.Id WHERE p.Price>1000
Union
SELECT n.Name,n.Price,b.Name FROM Notebooks n INNER JOIN Brands b ON n.BrandId=b.Id WHERE n.Price>1000

SELECT b.Name as 'Name' ,SUM(p.Price) as 'Total',COUNT(*)'Count' FROM Phones p JOIN Brands b ON p.BrandId=b.Id Group By b.Name

SELECT b.Name as 'Name' ,SUM(n.Price) as 'Total',COUNT(*)'Count' FROM Notebooks n JOIN Brands b ON n.BrandId=b.Id Group By b.Name Having Count(*)>3
