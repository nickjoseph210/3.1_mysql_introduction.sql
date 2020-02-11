SELECT 
	min(n),
	max(n),
	AVG(n),
	count(n)
FROM numbers_with_groups
GROUP BY category
SELECT * FROM nubmers_with_groups;
# Get the distinct values from the category column and
# then reduce the aggregated data down to a single number
SELECT 
	category, # get the category (column header)
	count(category), # count the number of categories
	Min(n) # min of a is 1, min of b is 2, min of c is 3
FROM numbers_with_groups
GROUP BY category;
	
SELECT
	supergroup,
	COUNT(supergroup), 
	MAX(n),
	n
FROM numbers_with_more_gropus
GROUP BY supergroup;

SELECT
	n
	AVG(n)
FROM numbers_with_more_groups
GROUP BY n;

SELECT
	category,
	supergroup,
	count(*) # count the number of rows
FROM numbers_with_more_group
GROUP BY category, supergroup; ## in each category

USE employees;

#Q: How many people were born in each month?

SELECT
	MONTH(birth_date),
	count(*)
FROM employees
GROUP BY MONTH(birth_date);
	
