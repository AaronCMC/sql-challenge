# sql-challenge  
* Research project aobut people employed at Pewlett Hackard during 1980s & 1990s.
* Provided with 6 CSV files from employee database:  
    * departments, 
    * dept_emp, 
    * dept_manager, 
    * employees, 
    * salaries, 
    * titles.

## Data Modeling  
* After inspecting CSV files, sketched an Entity Releationship Diagram of the tables using QuickDBD.  
    ![employees_ERD](EmployeeSQL/ERD/employees_ERD.png)

## Data Engineering  
* Created table schemas for each of the 6 CSV files.  
* Imported each CSV file into its corresponding SQL table.

## Data Analysis  
* Listed the employee number, last name, first name, sex, and salary of each employee.  
    ![1](EmployeeSQL/Images/1.png)
* Listed the first name, last name, and hire date for the employees who were hired in 1986.  
    ![2](EmployeeSQL/Images/2.png)
* Listed the manager of each department along with their department number, department name, employee number, last name, and first name.  
    ![3](EmployeeSQL/Images/3.png)
* Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.  
    ![4](EmployeeSQL/Images/4.png)
* Listed the first name, last name, and sex of each employee whose first name was Hercules and whose last name began with the letter B.  
    ![5](EmployeeSQL/Images/5.png)
* Listed each employee in the Sales department, including their employee number, last name, and first name.  
    ![6](EmployeeSQL/Images/6.png)
* Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.  
    ![7](EmployeeSQL/Images/7.png)
* Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees shared each last name).  
    ![8](EmployeeSQL/Images/8.png)