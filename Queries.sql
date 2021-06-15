--queries
SELECT * FROM titles;

-- 1)LIST the following details of esch employee:
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- 2) list first name last name and hire date hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3) list the manager of each department with the following info:

SELECT dept_man.dept_no, departments.dept_name,
	   dept_man.emp_no, employees.last_name, employees.first_name
FROM dept_man
INNER JOIN departments ON (dept_man.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_man.emp_no = employees.emp_no);

-- 4) List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON (dept_emp.emp_no = employees.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no);

-- 5) List first name, last name, and sex 
--for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name = 'Sales';

-- 7)List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name IN ('Sales', 'Development');

--8) In descending order,
--list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY "count" DESC;

































