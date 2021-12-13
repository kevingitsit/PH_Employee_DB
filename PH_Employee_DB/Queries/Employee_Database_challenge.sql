

-- 1. Retrieve the emp_no, first_name, 
-- and last_name columns from the Employees table.

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date, e.birth_date 
INTO retirement_table
FROM employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN ('1951-01-01') AND ('1955-01-01')
ORDER BY e.emp_no;


--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_table AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- retiring titles table
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;


-- End of deliverable 1 



-- Start Deliverable 2
SELECT DISTINCT ON(e.emp_no) 
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS E
INNER JOIN dept_employees AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS ti 
ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01' 
AND e.birth_date BETWEEN ('1965-01-01') AND('1965-12-31')
ORDER BY e.emp_no;

