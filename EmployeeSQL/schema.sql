CREATE TABLE Title (  
    title_id VARCHAR(30)  PRIMARY KEY,
    title VARCHAR(50)   NOT NULL);

CREATE TABLE Departments (
    dept_no VARCHAR(30)   PRIMARY KEY,
    dept_name VARCHAR(50)   NOT NULL);

CREATE TABLE Employees (
    emp_no INT  PRIMARY KEY,
    title_id VARCHAR(50)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
	FOREIGN KEY(title_id) REFERENCES Title(title_id));

CREATE TABLE Salaries (
    id SERIAL   PRIMARY KEY,
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
   FOREIGN KEY(emp_no) REFERENCES Employees(emp_no));


CREATE TABLE Department_Manager (
    id  SERIAL PRIMARY KEY ,
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no));


CREATE TABLE Department_Employees (
    id  SERIAL PRIMARY KEY,
    emp_no INT   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY(dept_no)REFERENCES Departments(dept_no));