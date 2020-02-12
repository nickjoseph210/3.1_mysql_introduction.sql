USE employees;
#1
SELECT first_name, last_name
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010);
#2
SELECT title
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = "Aamod");
#3
SELECT count(emp_no) AS `No longer with company`
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date < now()
	);
#4
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > now()
	AND gender = 'F');
#5
SELECT first_name, last_name 
FROM employees 
WHERE emp_no IN (
	SELECT emp_no, AVG(salary) 
	FROM salaries
	WHERE salary > AVG(salary)
	GROUP BY emp_no);

	
	