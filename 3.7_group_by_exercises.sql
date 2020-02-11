USE employees;
#1
SELECT
	title
FROM titles;

#2
SELECT DISTINCT 
	title
FROM titles;

#3
SELECT
	last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

#4
SELECT CONCAT(first_name, ' ', last_name) AS "full_name"
FROM employees
WHERE last_name LIKE'e%e'
GROUP BY full_name;

#5
SELECT
	last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#6
SELECT 
	last_name,
	count(*) AS "count"
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu'
GROUP BY last_name;

#7
SELECT 
	gender,
	count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

#8
SELECT 
	lower(concat(substr(first_name, 1, 1), substr(last_name, 1,4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2))) AS username,
	count(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;

#Bonus # 13,251 duplicate user names
SELECT distinct
	lower(concat(substr(first_name, 1, 1), substr(last_name, 1,4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2))) AS username,
	count(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;
