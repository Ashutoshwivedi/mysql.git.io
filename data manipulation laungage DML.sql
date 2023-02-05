create table employees(
emp_id int not null,
first_name varchar(20),
last_name varchar(20),
salary int,
primary key(emp_id)
);

select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (1,'jennifer','aniston',100000);
select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (2,'charlie','sheen',200000);
select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (3,'ashu','dube',300000);
select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (4,'akku','subed',400000);
select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (5,'maya','shukla',500000);
select * from employees;

insert into employees(emp_id,first_name,last_name,salary) values (6,'mejar','ranjeet',600000);
select * from employees;

update employees set last_name='hathway' where emp_id=1;
select * from employees;

delete from employees where emp_id in (1, 4);
select * from employees;


