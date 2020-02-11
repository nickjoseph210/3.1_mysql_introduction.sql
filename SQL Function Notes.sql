SELECT
	concat("Employee #", emp_no, " is " , first_name, " ", last_name) # " " is the literal value of space
FROM employees
LIMIT 10;

SELECT 
	concat(first_name, ' ', last_name)
FROM employees
LIMIT 10;

SELECT
	concat(first_name, ' ', last_name) AS full_name
FROM employees
LIMIT 10;

# this returns boolean checking to see whether or not the first 10 names begin with the letters a - f.  If they do, true
SELECT
	first_name,
	first_name REGEXP "^[a-f].*" # first name starts with a - f.  Qualifying statement; the '^' means 'starts with'
FROM employees
LIMIT 10;

# this shows ten people whose check to see if a-f first name is true
SELECT
	first_name,
	first_name REGEXP "^[a-f].*" # first name starts with a - f.  Qualifying statement; the '^' means 'starts with'
FROM employees
WHERE first_name REGEXP "^[a-f].*"
LIMIT 10;

# Pulls the first letter from the first name
SELECT
	first_name,
	substr(first_name, 1, 1)
FROM employees
LIMIT 10;

SELECT
	first_name,
	substr(first_name, 1, 1)
FROM employees
LIMIT 10;

SELECT
	first_name,
	substr(first_name, 1, 1)
FROM employees
WHERE substr(first_name, 1, 1) IN ('A', 'B', 'C', 'D', 'E', 'F')
LIMIT 10;

SELECT 
	first_name,
	substr(first_name, 3, 3), # first number is the letter place in the name we want, second num is how many we want after
	substr(first_name, 3, 1)
FROM employees
LIMIT 10;

# first several characters from the left and from the right side of the string
SELECT
	first_name,
	LEFT(first_name, 3), 
	RIGHT(first_name, 3)
FROM employees
LIMIT 10;

# takes the first three letters from the first name, the last three from the right of the first name, 
# and the last three letters from the last name - look at the funtion names
SELECT
	first_name,
	LEFT(first_name, 3), 
	RIGHT(first_name, 3),
	LEFT(RIGHT(concat(first_name, ' ', last_name), 3), 4)
FROM employees
LIMIT 10;


