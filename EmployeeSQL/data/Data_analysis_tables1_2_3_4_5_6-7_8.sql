-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


SELECT * FROM DEPT_EMP 

SELECT * FROM DEPARTMENTS

SELECT * FROM employees

SELECT * FROM titles

SELECT * FROM salaries

SELECT * FROM dept_manager

-- Create Table 1
SELECT e.emp_no,last_name,first_name,sex,salary
FROM employees e, salaries s
WHERE  e.emp_no = s.emp_no

-- Create Table 2
SELECT
    e.first_name,
    e.last_name,
    e.hire_date
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'


--Create Table 3

SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
FROM  dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN Employees ON
dept_manager.emp_no = employees.emp_no;



--Create Table 4

SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no

--Create Table 5
Select
    e.first_name,
    e.last_name
from employees e
WHERE
e.first_name = 'Hercules' and e.last_name like 'B%'


--Create Table 6

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no
Where
	d.dept_name = 'Sales'
	

--Create Table 7

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
from employees e
    JOIN dept_emp de on de.emp_no = e.emp_no
    JOIN departments d on d.dept_no = de.dept_no
Where
	d.dept_name IN ('Sales', 'Development')


--Create Table 8

SELECT
    e.last_name, count(e.last_name) as Last_Name_Count
from employees e
GROUP BY 
e.last_name
ORDER BY 
Last_Name_Count desc 


