-- DATA ENGINEERING
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_Employee CASCADE;
DROP TABLE IF EXISTS Dept_Manager CASCADE;


CREATE TABLE Titles (
	title_id VARCHAR (50) NOT NULL,
	title VARCHAR (100) NOT NULL,
	PRIMARY KEY (title_id));

CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR (50) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex VARCHAR (50) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id));

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no));

CREATE TABLE Departments (
	dept_no VARCHAR (50) NOT NULL,
	dept_name VARCHAR (100) NOT NULL,
	PRIMARY KEY (dept_no));

CREATE TABLE Dept_Employee (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR (50) NOT NULL,
	--PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no));

CREATE TABLE Dept_Manager (
	dept_no VARCHAR (50) NOT NULL,
	emp_no INTEGER NOT NULL,
	--PRIMARY KEY (dept_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no));


SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Departments;
SELECT * FROM Dept_Employee;
SELECT * FROM Dept_Manager;


-- DATA ANALYSIS
-- List the employee number, last name, first name, sex, and salary of each employee
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Salaries.emp_no = Employees.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT Dept_Manager.dept_no, Departments.dept_name, Dept_Manager.emp_no, Employees.last_name, Employees.first_name
FROM Dept_Manager
INNER JOIN Departments ON
Dept_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
Dept_Manager.emp_no = Employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Dept_Employee.dept_no, Departments.dept_name
FROM Employees
INNER JOIN Dept_Employee ON
Employees.emp_no = Dept_Employee.emp_no
INNER JOIN Departments ON
Dept_Employee.dept_no = Departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name
FROM Employees
INNER JOIN Dept_Employee ON
Employees.emp_no = Dept_Employee.emp_no
WHERE Dept_Employee.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
From Employees
INNER JOIN Dept_Employee ON
Employees.emp_no = Dept_Employee.emp_no
INNER JOIN Departments ON
Dept_Employee.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales'
OR Departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT Employees.last_name, COUNT(Employees.last_name)
FROM Employees
GROUP BY Employees.last_name
ORDER BY COUNT(Employees.last_name) DESC;
