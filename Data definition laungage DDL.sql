create table employees(
emp_id int not null,
first_name varchar(20),
last_name varchar(20),
salary int,
primary key(emp_id)
);

select * from employees;

describe employees;

alter table employees add column contact int;

describe employees;

select * from employees;

alter table employees rename column contact to job_code;

describe employees;

select * from employees;

truncate table employees;

describe employees;

select * from employees;

drop table employees;

select * from employees;