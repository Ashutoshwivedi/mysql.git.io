create database topmentor;
use topmentor;
show tables;

create table Persons (PersonID int,
					 LastName varchar(255),
					 FirstName varchar(255),
					 Address varchar(255),
					 City varchar(255));
drop table Persons;
select * from Persons;

 -- Emter some data in table Persons
 insert into Persons(PersonID,LastName,FirstName,Address,City) 
 values (10120,"Gilchrist","Adam","New South Wales", "Australia"),
		(10121,"Gilchrist1","Adam","New South Wales", "Australia"),
        (10122,"Gilchris2","Adam","New South Wales", "Australia"),
        (10123,"Gilchrist3","Adam","New South Wales", "Australia"),
        (1,"Business","68.4","90.2","No");
        (,"Business","68.4","90.2","No");


ALTER TABLE Persons
ADD Email varchar(255);

 insert into Persons(Email)
 values("abc@xyz.com"),("abc@xyz.com"),
		("abc@xyz.com"),("abc@xyz.com");

ALTER TABLE Persons
DROP COLUMN Email;
select * from Persons;

select LastName,FirstName from Persons;

ALTER TABLE Persons
MODIFY COLUMN PersonID varchar(255);

SELECT *
FROM Persons
WHERE LastName = "Gilchrist1";

SELECT *
FROM Persons
WHERE PersonID ="10121" OR PersonID ="10122";

select * from Persons;

SELECT *
FROM Persons
WHERE NOT PersonID ="10121" AND  PersonID ="10122";


SELECT *
FROM Persons
WHERE NOT PersonID ="10121" AND NOT PersonID ="10122";

SELECT *
FROM Persons
WHERE NOT PersonID ="10121" OR NOT PersonID ="10122";

show databases

use topmentor

show tables;3

select * from persons;

SELECT *
FROM persons
ORDER BY PersonID DESC;

SELECT *
FROM persons
ORDER BY PersonID ASC;

insert into Persons(PersonID,LastName,FirstName,Address,City) 
 values (NULL,"Gilchrist","Adam","New South Wales", "Australia");
 
insert into Persons(PersonID,LastName,FirstName,Address,City) 
 values ("120",NULL,"Adam","New South Wales", "Australia");

use topmentor;
SELECT *
FROM persons
WHERE LastName IS NULL
ORDER BY LastName ASC;

SELECT *
FROM persons
WHERE LastName IS NULL
ORDER BY LastName DESC;

UPDATE persons
SET PersonsID = "7894562633", FirstName = "Topmentor"
WHERE PersonID = 10120;

SELECT *
FROM persons;

UPDATE persons
SET PersonsID = "7894562633", FirstName = "Topmentor_1"
WHERE PersonID = 10122;

SELECT *
FROM persons where PersonID = "7894562633";

DELETE FROM persons where PersonID = "7894562633";

SELECT *
FROM persons where PersonID = "7894562633";

SELECT *
FROM persons where LastName = "Gilchrist" LIMIT 3;

SELECT MIN(PersonID) from persons;

SELECT MAX(PersonID)
FROM persons;


SELECT *
FROM persons;

 
SELECT COUNT(PersonID)
FROM persons
WHERE PersonID=7894562633;

SELECT SUM(PersonID)
FROM persons
WHERE PersonID=7894562633;

SELECT AVG(PersonID)
FROM persons;

select * from persons;

SELECT PersonID
FROM persons
WHERE PersonID IN (10123,7894562633);

insert into Persons(PersonID,LastName,FirstName,Address,City) 
 values (1,"Business","68.4","90.2","No"),
		(2,"Business","68.4","90.2","No"),
        (3,"Business","68.4","90.2","No"),
        (4,"Business","68.4","90.2","No"),
        (5,"Business","68.4","90.2","No");

SELECT *
FROM persons
WHERE PersonID BETWEEN 1 AND 5;

SELECT PersonID AS pid
FROM persons;

create table orders1(OrderID int,
					 CustomerID int,
					 OrderDate varchar(255));
					 
insert into orders1
values 
(10308, 2,  1996-09-19),
(10309, 37, 1996-09-20),
(10310, 77, 1996-09-21 );

create table Customers2(CustomerID int,
					CustomerName   varchar(255),
                    ContactName varchar(255),
                    Country     varchar(255));
					 
insert into Customers2
values 
(1,	"Alfreds Futterkiste",	"Maria Anders",	"Germany"),
(2,	"Ana Trujillo Emparedados y helados",	"Ana Trujillo",	"Mexico"),
(3, "Antonio Moreno Taquería",	"Antonio Moreno",	"Mexico");

select * from orders1;
select * from Customers2;

SELECT orders1.OrderID, Customers2.CustomerName, orders1.OrderDate
FROM orders1
INNER JOIN Customers2 ON orders1.CustomerID=Customers2.CustomerID;

SELECT orders1.OrderID, Customers2.CustomerName, orders1.OrderDate
FROM orders1
LEFT JOIN Customers2 ON orders1.CustomerID=Customers2.CustomerID;

SELECT orders1.OrderID, Customers2.CustomerName, orders1.OrderDate
FROM orders1
RIGHT JOIN Customers2 ON orders1.CustomerID=Customers2.CustomerID;

select * from orders1
select * from Customers2

SELECT *
FROM orders1
CROSS JOIN Customers2 ON orders1.CustomerID=Customers2.CustomerID;

SELECT *
FROM orders1
CROSS JOIN Customers2 ON orders1.CustomerID=Customers2.CustomerID;

SELECT CustomerID,OrderID FROM orders1
UNION
SELECT CustomerID,CustomerName FROM Customer2;

SELECT CustomerID,OrderID FROM orders1
UNION ALL
SELECT CustomerID,CustomerName FROM Customer2;

show databases ;
use topmentor;
show tables;

select * from orders1;

SELECT CustomerID, OrderDate INTO persons
FROM orders1;








