-- check data import
SELECT *
FROM "employees"

SELECT *
FROM "salaries"

-- perform inner join with employees and salaries table
CREATE TABLE "table_one" AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM "salaries"
INNER JOIN "employees" ON
employees.emp_no = salaries.emp_no;

SELECT *
FROM "table_one"

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT YEAR(hire_date)
FROM "employees"

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT * FROM "dept_manager"
SELECT * FROM "departments"

CREATE TABLE "table_3_1" AS
SELECT dept_manager.dept_no, employees.emp_no, employees.last_name, employees.first_name 
FROM "dept_manager"
INNER JOIN "employees" ON employees.emp_no = dept_manager.emp_no;


SELECT * FROM "table_3_1"

CREATE TABLE "table_3" AS
SELECT table_3_1.dept_no, departments.dept_name, table_3_1.emp_no, table_3_1.last_name, table_3_1.first_name
FROM "departments"
INNER JOIN "table_3_1" ON table_3_1.dept_no = departments.dept_no;

SELECT * FROM "table_3"

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE TABLE "table_4_1" AS
SELECT dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
FROM "departments"
INNER JOIN "dept_emp" ON dept_emp.dept_no = departments.dept_no;

CREATE TABLE "table_4" AS
SELECT employees.emp_no, employees.last_name, employees.first_name, table_4_1.dept_name
FROM "table_4_1"
INNER JOIN "employees" ON employees.emp_no = table_4_1.emp_no;

SELECT * FROM "table_4"

-- 



