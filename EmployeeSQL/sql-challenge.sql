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

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
CREATE TABLE "table_5" AS
SELECT employees.first_name, employees.last_name, employees.sex
FROM "employees"
WHERE "first_name" = 'Hercules'
AND "last_name" LIKE 'B%';

SELECT * FROM "table_5"

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE TABLE "table_6" AS
SELECT table_4.emp_no, table_4.last_name, table_4.first_name, table_4.dept_name
FROM "table_4"
WHERE "dept_name" = 'Sales';

SELECT * FROM "table_6"

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
CREATE TABLE "table_7" AS
SELECT table_4.emp_no, table_4.last_name, table_4.first_name, table_4.dept_name
FROM "table_4"
WHERE "dept_name" = 'Sales'
OR "dept_name" = 'Development';

SELECT * FROM "table_7"

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
CREATE TABLE "table_8" AS
SELECT "last_name", COUNT(*) AS "frequency"
FROM   "employees"
GROUP BY "last_name"
ORDER BY "frequency" DESC;

SELECT * FROM "table_8"

