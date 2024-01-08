CREATE DATABASE if NOt exists company;
USE company;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE employees DROP foreign key employees_ibfk_1;
TRUNCATE TABLE employees;
TRUNCATE TABLE department;

CREATE TABLE if not exists department(
	department_id int auto_increment ,
    department_name varchar(50) NOT NULL,
    location varchar(50),
    primary key (department_id)
);
-- Populate department table
INSERT INTO department (department_name, location) values ("sales", "Center Campus"), ("hr", "Center Campus"), ("finance", "North Campus");

DROP table employees;
CREATE TABLE IF NOT EXISTS employees(
	employee_id int auto_increment primary key,
    employee_name varchar(50) NOT NULL,
    department_id int,
    foreign key (department_id)
		references department (department_id)
);

-- Populate employees table
INSERT INTO employees (employee_name, department_id) values ("john", 1), ("sarah", 2), ("sally", 3);

-- TASK 1
INSERT INTO department (department_name, location) values("IT", "Center Campus");
INSERT INTO employees (employee_name, department_id) values ("David Wilson", 4);

-- TASK 2
UPDATE IGNORE department SET location = "North Campus" WHERE department_name = "IT";

-- TASK 3
DELETE FROM employees WHERE employee_name = "john";
