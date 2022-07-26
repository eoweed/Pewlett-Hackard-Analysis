-- Deliverable 1

--Retirement Titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;


--Retiring Titles: number of employees by title who are about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(title) DESC;


-- Deliverable 2

-- Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	titles.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;


-- Deliverable 3

SELECT * FROM retiring_titles;

SELECT COUNT(emp_no) FROM mentorship_eligibilty;

SELECT * FROM retirement_titles;

SELECT COUNT(title), emp_no 
FROM retirement_titles
GROUP BY emp_no;

