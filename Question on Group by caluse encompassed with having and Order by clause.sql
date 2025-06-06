
-- QUESTIONS ON SUB QUERIES WITH GROUP BY, HAVING AND ORDER BY:
create database ganesh;
use ganesh;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employees (emp_id, name, department, salary, city) VALUES
(1, 'Alice', 'Engineering', 70000, 'Chennai'),
(2, 'Bob', 'Marketing', 60000, 'Bangalore'),
(3, 'Charlie', 'Finance', 65000, 'Mumbai'),
(4, 'Diana', 'Engineering', 72000, 'Chennai'),
(5, 'Ethan', 'HR', 58000, 'Delhi');

SELECT * FROM EMPLOYEES;

-- 1. Which department has the highest average salary

SELECT DEPARTMENT, AVG(SALARY) as Dept_HIgh_avg_saL
from employees
group by DEPARTMENT
order by Dept_HIgh_avg_saL desc limit 1; -- limit 1 usually shows the 1 highest concern we requires

-- 2. departments with total salaries > HR's total salary
SELECT DEPARTMENT, SUM(SALARY) AS Total_Salary
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > (
SELECT SUM(SALARY) FROM EMPLOYEES WHERE DEPARTMENT = 'HR');

-- 3. DEPARTMENTS Where Avg salary > overall average;
SELECT Department, avg(salary) as Avg_Sal 
from Employees
group by department
having Avg_Sal > (
select avg(salary) from employees); 

-- 4. Department with more employees than average employees per department
-- SELECT DEPARTMENT, COUNT(*) as Emp_Count
-- FROM Employees
-- GROUP BY DEPARTMENT
-- having Emp_Count > (select avg( 

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > (
    SELECT AVG(dept_count)
    FROM (
        SELECT department, COUNT(*) AS dept_count
        FROM employees
        GROUP BY department
    ) AS dept_counts
);


-- 4 Departments where average salary > overall average salary
SELECT Department, avg(salary) as Dept_Avg_Sal
from employees 
group by department
having Dept_Avg_Sal > (
SELECT AVG(salary) AS average_salary
FROM employees);

select * from employees;
-- cities where total salary > total salary in Delhi

Select city, sum(salary) as Total_Salary 
FROM Employees
group by city
having Total_Salary > (
SELECT sum(salary) as Delhi_City_Sal
FROM employees
WHERE city = 'Delhi');

-- departments average salary < average salary in IT Department
SELECT Department, avg(salary) as Avg_Sal
from employees
group by Department
Having  Avg_Sal < (
Select avg(salary) from employees where department = 'Engineering');

-- employees whose salary > average salary odrer by DESCENDING ORDER
SELECT * from employees 
Where Salary > (
select  avg(salary) from employees)
order by salary desc;

-- employees earning more than minimum it salary ordered by age
SELECT * from employees 
Where Salary > (
select min(salary) from employees where department = 'Engineering');

-- departments with the same average salary in finance
SELECT DEPARTMENT, AVG(SALARY) AS AVG_SAL
FROM EMPLOYEES
GROUP BY DEPARTMENT
Having AVG_SAL =(
SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT = 'FINANCE'
);
