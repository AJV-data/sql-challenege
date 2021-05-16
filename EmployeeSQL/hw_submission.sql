
create table departments(
	dept_no varchar(10),
	dept_name varchar(50)
);

create table dept_managers(
	dept_no varchar(10),
	emp_np int,
	from_date date,
	to_date date
);

create table dept_emp(
	emp_no int,
	dept_no varchar(10),
	from_date date,
	to_date date
);

create table employees(
	emp_no int,
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	gender varchar(1),
	hire_date date
);

create table salaries(
	emp_no int,
	salary int,
	from_date date,
	to_date date
);

create table titles(
	emp_no int,
	title varchar(50),
	from_date date,
	to_date date
);
--1
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salary 
from employees
join salaries
on (employees.emp_no=salaries.emp_no);

--2
select first_name, last_name, hire_date
from employees
where hire_date > '12-31-1985' and hire_date < '1-1-1987';

--3
select dept_managers.dept_no, dept_name, dept_managers.emp_np, last_name, first_name
from dept_managers
join departments
on(departments.dept_no=dept_managers.dept_no)
join employees
on(dept_managers.emp_np = employees.emp_no);
--4
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, dept_name 
from employees
join dept_emp
on (employees.emp_no=dept_emp.emp_no)
join departments
on (dept_emp.dept_no = departments.dept_no);
--5
select first_name, last_name, gender
from employees
where first_name like '%Hercules' and last_name like 'B%';

--6
select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp
join employees
on(employees.emp_no=dept_emp.emp_no)
join departments
on(dept_emp.dept_no=departments.dept_no)
where dept_name = 'Sales';
--7
select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp
join employees
on(employees.emp_no=dept_emp.emp_no)
join departments
on(dept_emp.dept_no=departments.dept_no)
where dept_name = 'Sales' or dept_name = 'Development';
--8
select last_name, count(last_name)
from employees
group by last_name
order by
count(last_name) desc