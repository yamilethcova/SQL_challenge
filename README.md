# SQL_challenge

Data Modeling


Departments
rel Departments
--
dept_name varchar 
dept_no varchar pk

Department_Employee
rel Department_Employee
---
emp_no int pk fk -< Employees.emp_no
#compose key
dept_no varchar fk -< Departments 
 

Department_Manager
rel Department_Manager
---
emp_no int pk fk >-< Employees.emp_no
dept_no varchar fk - Departments.dept_no 
#compse key

Employees
rel Employees 
---
emp_no int pk 
emp_title_id varchar fk -< Titles.title_id
birth_date date
first_name varchar
last_name varchar
sex varchar
hire_date date

Salaries
rel Salaries 
---
emp_no int pk fk >-< Employees.emp_no
salary int

Titles
rel Titles
---
title_id varchar pk
title varchar



-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/0ywyb6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
	"dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employee" (
    "emp_no" int   NOT NULL,
    
    "dept_no" varchar   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Department_Manager" (
    "dept_no" varchar   NOT NULL,
	"emp_no" int   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

select * from "Department_Manager";

