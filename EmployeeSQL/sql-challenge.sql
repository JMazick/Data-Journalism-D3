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