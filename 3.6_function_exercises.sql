USE employees; 
#5
# all employees with an e in their name, order by emplyee numer
SELECT
	upper(concat(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

SELECT
*, 
	datediff(now(), hire_date) AS days_employed
FROM employees 
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;

SELECT
	MIN(salary),
	MAX(salary)
FROM salaries;

SELECT
	lower(concat(substr(first_name, 1, 1), substr(last_name, 1, 4), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2)))
FROM employees
LIMIT 10;

