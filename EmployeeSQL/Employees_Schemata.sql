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