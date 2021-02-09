use hr;
/*1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments*/
SELECT * from locations;
SELECT location_id,street_address,city,state_province,country_name
from locations
join countries;
/*2. Write a query to find the name (first_name, last name), department ID and name of all the employees*/
SELECT first_name,last_name,department_id,department_name
from employees
join  departments USING (department_id);
/*3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London*/
SELECT e.first_name,e.last_name,e.job_id,d.department_id,l.city
from employees as e
left JOIN `departments` d on e.department_id = d.department_id
left JOIN  `locations` l on l.location_id= d.location_id
where l.city = 'London';
/*4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name)*/
SELECT e.employee_id 'Emp_Id', e.last_name 'Employee', 
m.employee_id 'Mgr_Id', m.last_name 'Manager' 
FROM employees e 
join `employees` m  on e.manager_id = m.employee_id;
/*5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones*/
select first_name,last_name from employees
where(last_name) like '%%Jones';
select * from employees;
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees davies 
ON (davies.last_name = 'Jones') 
WHERE davies.hire_date < e.hire_date;
/*6. Write a query to get the department name and number of employees in the department*/
 SELECT d.department_name,count(*)
 from departments d
 Inner  JOIN `employees` e on d.department_id = e.department_id
 GROUP BY d.department_id, d.department_name ;
 /*7. Write a query to display department name, name (first_name, last_name), hire date, 
 salary of the manager for all managers whose experience is more than 15 years*/
   SELECT first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 as Experience 
FROM departments d JOIN employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;
/*Write a query to find the name (first_name, last_name) and the salary of the employees who have a
 higher salary than the employee whose last_name='Bull'*/
 Select e.first_name,e.last_name ,e.salary
 from employees e
 Where salary > 'Bull';
 /*9. Write a query to find the name (first_name, last_name) of all employees who works in the IT department*/
 Select e.first_name,e.last_name,d.department_name
 FROM employees e
 JOIN `departments` d on e.department_id=d.department_id
 Where d.department_name ='IT';
 /*Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department*/
SELECT first_name, last_name FROM employees 
WHERE manager_id in (select employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (select location_id from locations where country_id='US')));
 /*Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary*/
 Select first_name,last_name,salary 
 from employees 
 Where salary > (Select Avg(salary) from employees);
/* Write a query to find the name (first_name, last_name), and salary of the employees
 whose salary is equal to the minimum salary for their job grade*/
SELECT e. first_name, e.last_name,e. salary ,e.job_id
FROM employees e
WHERE e.salary = (SELECT min_salary
FROM jobs j
WHERE e.job_id = j.job_id);
/*Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the
 average salary and works in any of the IT departments*/
 Select first_name,last_name,salary
 from employees
WHERE department_id IN 
(SELECT department_id FROM departments WHERE department_name LIKE 'IT%') 
AND salary > (SELECT avg(salary) FROM employees);
/*14. Write a query to find the name (first_name, last_name), and salary of the
 employees who earn the same salary as the minimum salary for all*/
 SELECT * FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);
/*15. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary
 of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest*/
 SELECT first_name,last_name, job_id, salary 
FROM employees 
WHERE salary > 
ALL (SELECT salary FROM employees WHERE job_id = 'SH_CLERK') ORDER BY salary;