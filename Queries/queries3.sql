SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no, e.first_name, e.last_name, e.gender, 
s.salary,de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM retirement_info;

SELECT * FROM dept_info;
-- Sales Info
SELECT ri.emp_no, ri.first_name, ri.last_name, di.dept_name
-- INTO sales_info
FROM retirement_info as ri
INNER JOIN dept_info as di
ON (ri.emp_no = di.emp_no)
WHERE (di.dept_name = 'Sales');




--Sales and Development
SELECT ri.emp_no, ri.first_name, ri.last_name, di.dept_name
-- INTO sales_development_info
FROM retirement_info as ri
INNER JOIN dept_info as di
ON (ri.emp_no = di.emp_no)
WHERE di.dept_name IN ('Sales', 'Development');

-- Retirement_Titles
SELECT e.emp_no, e.first_name, e.last_name, t.from_date, t.to_date
--INTO retirement_titles
FROM employees as e 
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;