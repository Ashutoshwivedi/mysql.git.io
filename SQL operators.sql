select * from employees where emp_id=3;
select * from employees where salary=100000;
select * from employees where  frist_name='jennifer' and salary=400000;
select * from employees where  frist_name='matt' and last_name='daman';

select * from employees where  frist_name='matt' or last_name='lopez';

select * from employees where salary>300000;
select * from employees where salary>=300000;
select * from employees where salary<300000;

select * from employees where first_name!='charlie';

select * from employees where salary between 300000 and 500000;

select * from employees where last_name like '1%';


select * from employees where salary in (100000,300000,500000);
select distinct(first_name) from employees;

select max(salary)from employees;
select min(salary)from employees;
select avg(salary)from employees;
select count(*)from employees;


