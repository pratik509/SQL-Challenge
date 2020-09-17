--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN to_date('1996-01-01','YYYY-MM-DD') AND to_date('1996-12-31','YYYY-MM-DD')

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT D.dept_no, D.dept_name, DM.emp_no, E.first_name, E.last_name
FROM departments D
INNER JOIN department_manager DM ON D.dept_no = DM.dept_no
INNER JOIN employees E ON E.emp_no = DM.emp_no


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department_employees.dept_no
FROM employees
INNER JOIN department_employees on employees.emp_no = department_employees.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


SELECT E.last_name, E.first_name, E.emp_no, D.dept_name
FROM departments D
INNER JOIN department_employees DE ON D.dept_no = DE.dept_no
INNER JOIN employees E ON E.emp_no = DE.emp_no
WHERE D.dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN department_employees ON employees.emp_no = department_employees.emp_no
INNER JOIN 	departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) AS "count_of_last_name"
FROM employees
GROUP BY last_name
ORDER BY count_of_last_name DESC