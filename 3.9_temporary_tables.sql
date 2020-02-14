CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments INSERT full_name VARCHAR(30);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT * FROM employees_with_departments;




#2a
# transform the amount column such that it is stored as an 
# integer representing the number of cents of the payment. For example, # 1.99 should become 199
# = update table 
# = set amount = int(10) unsigned not null




	




