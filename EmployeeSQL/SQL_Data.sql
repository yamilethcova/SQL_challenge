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

SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM "Employees" as emp
    LEFT JOIN "Salaries" as sal
    ON (emp.emp_no = sal.emp_no);
	
SELECT last_name, first_name, hire_date 
from "Employees" as emp
WHERE hire_date >= '1986-01-01' AND hire_date < '1986-12-31'
order by last_name;


SELECT  dept_mgr.emp_no
		, dept_mgr.dept_no
		, d.dept_name		
		, emp.last_name
        , emp.first_name        
from "Department_Manager" as dept_mgr
inner join "Departments" as d
on dept_mgr.dept_no  = d.dept_no
inner join "Employees" as emp
on dept_mgr.emp_no = emp.emp_no


SELECT  de.dept_no,
        d.dept_name,
        de.emp_no,
        emp.last_name,
        emp.first_name
FROM "Department_Employee" AS de
    INNER JOIN "Departments" AS d
        ON (de.dept_no = d.dept_no)
    INNER JOIN "Employees" AS emp
        ON (de.emp_no = emp.emp_no);
		
select first_name, last_name, sex 
from "Employees"
where first_name = 'Hercules' and last_name like 'B%';


select  emp.emp_no
	   , emp.first_name
	   , emp.last_name
	   , d.dept_name
From "Employees" as emp
inner join "Department_Employee" as de
on emp.emp_no = de.emp_no
inner join "Departments" as d
on de.dept_no = d.dept_no
Where d.dept_name = 'Sales';


select  emp.emp_no
	   , emp.first_name
	   , emp.last_name
	   , d.dept_name
From "Employees" as emp
inner join "Department_Employee" as de
on emp.emp_no = de.emp_no
inner join "Departments" as d
on de.dept_no = d.dept_no
Where d.dept_name in ('Sales', 'Development')
order by dept_name;


SELECT last_name, COUNT(*) as frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;




		

 



	
	
