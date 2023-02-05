create database industry;
drop database industry;

create database industry;

use industry;

show databases;

create table  employeeinfo(
ID int not null auto_increment primary key,
Emp_name varchar(30) not null,
Address varchar(255) not null,
City varchar(50) not null,
Age int not null,
DOJ date not null,
Designation varchar(50) not null,
Salary decimal(15,2) not null,
Mobile varchar(10) not null);

select * from employeeinfo;

alter table employeeinfo
add email varchar(255);

alter table employeeinfo
drop email;

select * from employeeinfo;

 -- Emter some data in table Persons
 insert into employeeinfo(Emp_name,Address,City,Age,DOJ,Designation, Salary,Mobile) 
 values ('Ashutosh','Navi mumbai','Raigadh', 27,'2020-11-09','Production Chemist',40000, '9793221913'),
  ('Mahesh','mumbai','alamgadh', 37,'2021-11-02','Production Executive',70000, '9790021913'),
   ('Rohan','kalamboli','Raigadh', 25,'2022-10-01','supply chain',25000, '9790000013');
 
select * from employeeinfo;

select Emp_name, Mobile from employeeInfo;

select Emp_name, mobile
from employeeinfo
where Designation = 'Production Chemist';

select Emp_name, mobile
from employeeinfo
where city = 'alamgadh';

select Emp_name, mobile
from employeeinfo
where age>30;

select Emp_name, mobile
from employeeinfo
where salary<30000;

update employeeinfo
Set Emp_name = 'Rajesh'
where ID=6;

select * from employeeinfo;

delete from employeeinfo
where id= 5;

select ID, Emp_name
from employeeinfo
where  designation='supply chain' and age>18;

select ID, Emp_name
from employeeinfo
 where  designation='production executive' and city='alamgadh';
 
 select ID, Emp_name
from employeeinfo
 where  designation='production executive' or city='raigadh';
 
 select ID, Emp_name,city
from employeeinfo
 where not city='Raigadh';
 
 select * from employeeinfo
 where city like 'a%';
 
  select * from employeeinfo
 where Emp_name like 'r%';
 
 select * from employeeinfo
 where Emp_name like '%h';
 
 select * from employeeinfo
 where mobile like '_7%';
 
 select * from employeeinfo
 where Emp_name not like 'm%';
 
 select * from employeeinfo
 where Emp_name not like 'a%';
 
 select * from employeeinfo
 where city in ('alambagh','raigadh');
 
  select * from employeeinfo
 where city not in ('alambagh','raigadh');
 
  select * from employeeinfo
 where salary between 25000 and 30000;
 
   select * from employeeinfo
 where id between 3 and 5;
 
  select * from employeeinfo
  limit 3;
  
   select * from employeeinfo
   order by emp_name desc;
   
   select * from employeeinfo
   order by emp_name,salary asc;
   
   select count(Emp_name)
   from employeeinfo;
   
   select sum(salary)
   from employeeinfo;
   
   select avg(salary)
   from employeeinfo;
   
   select min(salary)
   from employeeinfo;
   
   create database industrydb;
   
   use industrydb;
   
   create table Customer
   (
   CustomerID int primary key,
   CustomerName varchar(20),
   City varchar(20)
   );
   
   select * from customer;
   
   insert into Customer values(101,'Maya','Jaipur');
   insert into Customer values(102,'Jaya','Udaipur');
   insert into Customer values(103,'Riya','Raipur');
   insert into Customer values(104,'Chhaya','Rampur');
   insert into Customer values(105,'Kavya','Bhagalpur');
   insert into Customer values(106,'Navya','Sitapur');
   insert into Customer values(107,'Maya','Kanpur');
   insert into Customer values(108,'Jiya','Jaipur');
   insert into Customer values(109,'Muskan','Rajpur');
   insert into Customer values(110,'Diya','Nagpur');
   insert into Customer values(111,'Ramya','gorakhpur');
   insert into Customer values(112,'Ashu','Badlapur');
   insert into Customer values(113,'Rohan','Pune');
   insert into Customer values(114,'Jiten','Kalyan');	
   
    select * from customer;
    
     create table Orders
   (
   OrderID int,
   CustomerID int primary key,
   OrderDate date
   );
   
   select * from Orders;
   
   insert into Orders values (1,101,'2022-01-02');
   insert into Orders values (2,102,'2022-02-03');
   insert into Orders values (3,103,'2022-01-04');
   insert into Orders values (4,104,'2022-03-05');
   insert into Orders values (5,105,'2022-07-07');
   insert into Orders values (6,106,'2022-05-04');
   insert into Orders values (7,107,'2022-04-03');
   insert into Orders values (8,108,'2022-06-03');
   insert into Orders values (9,109,'2022-05-04');
   insert into Orders values (10,110,'2022-07-05');
   insert into Orders values (11,111,'2022-03-06');
   insert into Orders values (12,112,'2022-08-02');
   insert into Orders values (13,113,'2022-09-02');
   select * from Orders;
   
   select orders.orderID, Customer.CustomerName, Orders.OrderDate
   from Orders
   inner join Customer on Orders.CustomerID=Customer.CustomerID;
   
   select Orders.OrderDate, Customer.City 
   from Orders
   inner join Customer on Orders.CustomerID=Customer.CustomerID;
   
   use industry;
   
   select count(Designation), sum(Salary), Designation
   from employeeinfo
   group by Designation;
   
   insert into employeeInfoBackup
   select * from employeeInfo;
   
   
   create table  employeeinfobackup(
ID int not null auto_increment primary key,
Emp_name varchar(30) not null,
Address varchar(255) not null,
City varchar(50) not null,
Age int not null,
DOJ date not null,
Designation varchar(50) not null,
Salary decimal(15,2) not null,
Mobile varchar(10) not null);

   select * from employeeinfobackup;
   
 insert into employeeinfobackup
 select * from employeeinfo;
   
   select * from employeeinfobackup;
   
   create database constraintsexample;
   use constraintsexample;
   
   create table notnullexample
   (Empname varchar(30),
   age int 
   );
   
   select * from notnullexample;
   insert into notnullexample (Empname, age) values ('Raju', 26);
   
  insert into notnullexample (age) values (26);
  
  drop table notnullexample;
  
   create table notnullexample
   (Empname varchar(30) not null ,
   age int 
   );
   
    insert into notnullexample (Empname, age) values ('Raju', 26);
    
	insert into notnullexample (age) values (26);
    
       select * from notnullexample;
       
create table defaultexample
(
Empname varchar(30) not null,
age int,
Mobile varchar(50) default 'Mobile no. is not available'
);
  select * from defaultexample;
  
  insert into defaultexample (Empname, age, mobile)
  values ('Raju', 26, '001235466');
  insert into defaultexample (Empname, age)
  values ('Ram', 27);
  
  select * from defaultexample;
  
create table checkexample
(
Empname varchar(255),
age int,
check (age>=18)
);
 select * from checkexample;
 
 insert into checkexample (Empname, age) values ('Raju', 26);
insert into checkexample (Empname, age) values ('Rahul', 17);

create table uniqueexample
(
Empname varchar(255) not null,
mobile varchar(10) not null unique
);

select * from uniqueexample;
 
  insert into uniqueexample (Empname, mobile) values ('Raju', '2656265');
  insert into uniqueexample (Empname, mobile) values ('manoj', '2656265');
  
  create table department
(
dept_ID int primary key,dept_name varchar(50)
);

select * from department;
 
  insert into department values (1, 'account');
  insert into department values (2, 'HR');
  insert into department values (3, 'IT');
  select * from department;
  
   create table employee_details
(
Emp_ID int primary key,
Emp_name varchar(50) not null,
dept_ID int,
foreign key (dept_ID) references department(dept_ID)
);

select * from employee_details;
 
  insert into employee_details values (1, 'Raju',1);
  insert into employee_details values (2, 'Ram',2);
  insert into employee_details values (3, 'Rahul',3);
 
  select * from employee_details;
    insert into employee_details values (4, 'Rahul',4);
	
  insert into employee_details values (4, 'Rahul',1);	
  
  
 
  
   

   
   
  
   
   
   
   
