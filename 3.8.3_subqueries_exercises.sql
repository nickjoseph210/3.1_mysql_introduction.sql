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
SELECT count(*)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	GROUP BY emp_no
	HAVING Max(to_date) < now()
	);
# MY ORIGINAL CODE:
#SELECT count(emp_no) AS `No longer with company`
#FROM employees
#WHERE emp_no IN (
	#SELECT emp_no
	#FROM dept_emp
	#WHERE to_date < now()
	#); # correct answer is 59900; I got 85108
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
	SELECT emp_no 
	FROM salaries 
	WHERE salary > (
		SELECT AVG(salary)
		FROM salaries)
	AND to_date > now())
;
#6 CURRENT
SELECT count(salary)
FROM salaries
WHERE 
;
	
#7 BONUS_1
SELECT *
FROM departments
WHERE dept_no IN(
	SELECT dept_no
	FROM dept_manager
	WHERE to_date > now()
	AND emp_no IN (
		SELECT emp_no 
		FROM employees
		WHERE gender = 'F'
		))
;
#8 Bonus_2
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary IN (
		SELECT MAX(salary)
		FROM salaries));

#9 Bonus_3
SELECT dept_name 
FROM departments
WHERE dept_no IN (
	SELECT dept_no 
	FROM dept_emp
	WHERE emp_no IN (
		SELECT emp_no 
		FROM salaries
		WHERE salary IN (
			SELECT MAX(salary)
			FROM salaries)));
