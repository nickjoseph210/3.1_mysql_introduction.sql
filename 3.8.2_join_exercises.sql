#Join Example Database
#1:
SELECT *
FROM users; 
SELECT *
FROM roles;

SELECT *
FROM users u
JOIN roles r ON r.id = u.role_id;

#2a: Inner Join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

#2b - Left Join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM roles r
JOIN users u ON u.role_id = r.id;

#take the above info and aggregate it
SELECT r.name, COUNT(*)
FROM roles r
JOIN users u ON u.role_id = r.id
GROUP BY r.name;

# OR, to show there are no commenters

SELECT
	r.name AS role_name,
	count(*) AS count_all,
	count(u.id) AS count_users
FROM roles r
LEFT JOIN users u ON u.role_id = r.id
GROUP BY r.name;


#2c - Right Join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#3
SELECT 
	NAME,
	count(*)
FROM users
GROUP BY NAME;

#Employees Database
#1 & 2
USE employees

SELECT dept_name, concat(first_name, " ", last_name) AS "Current Manager"
FROM departments d
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > NOW();

#3
SELECT dept_name AS `Department Name`,
CONCAT(first_name, " " , last_name) AS `Manager Name`
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate()
AND gender = 'F'
ORDER BY `Department Name`; # backticks allow for spaces.  quotes require an underscore

#4
SELECT title AS "Title",
	count(*) AS "Count" # MUST Group By or else no results will show
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE titles.to_date > curdate() # means title is current
AND dept_emp.to_date > CURDATE() # means their employment is current
AND dept_name = "Customer Service"
GROUP BY title;

#5
#We'll need the departments table to get departments
#employees table to get employee names
#salaries table to get salaries
#dept_manager table to link manager emp_no to their dept_no
SELECT dept_name AS `Department Name`, 
	CONCAT(first_name, ' ', last_name) AS `Manager Name`,
	salary AS `Salary`
FROM salaries 
JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no 
WHERE salaries.to_date > CURDATE() # says salary is current
AND dept_manager.to_date > CURDATE() # says currently a manager
ORDER BY `Department Name`;
#6
# We need:
#	departments table to get dept_name
#	dept_emp to get employees that work in each dept
SELECT dept_no, dept_name, count(*) AS `num_employees`
FROM departments
JOIN dept_emp USING(dept_no)
WHERE to_date > CURDATE()
GROUP BY dept_no;
#7 
# We'll need to use the tables
#	salaries table to get the salaries
# 	departments table to get dept_name
# 	dept_emp table to get all employees that work for each dept 
SELECT dept_name, AVG(salary) AS `Highest Average Salary`
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > NOW() # current employee
AND salaries.to_date > NOW() # currently getting paid
GROUP BY dept_name
ORDER BY AVG(salary) DESC
LIMIT 1;
#8
# We need employees table to get names
# dept_emp, salaries
SELECT *
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE salaries.to_date > now()
AND dept_emp.to_date > now()
AND dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;
#9
SELECT first_name, last_name, salary, dept_name # reduces colmns frm *
FROM dept_manager
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > now()
ORDER BY salary DESC
LIMIT 1;