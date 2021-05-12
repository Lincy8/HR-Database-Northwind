/* Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name*/
USE hr;
SELECT * FROM employees;
SELECT first_name as 'First Name ',last_name as 'Last Name'
FROM employees;
/*Write a query to get unique department ID from employee table*/
SELECT DISTINCT department_ID  
FROM employees;
/*Write a query to get all employee details from the employee table order by first name, descending*/
SELECT * FROM employees
ORDER BY first_name desc;
/*Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)*/
SELECT  first_name,last_name ,salary ,(15/100*salary) as PF
from employees;
/*Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary*/
SELECT employee_id,first_name,last_name,salary 
FROM employees
ORDER BY salary ASC;
/*Write a query to get the total salaries payable to employees*/
SELECT sum(salary) as Total_salary
FROM employees;
/*Write a query to get the maximum and minimum salary from employees table*/
 SELECT Max(salary) as maxi_sal,min(salary) as min_sal
 from employees;
 /*Write a query to get the average salary and number of employees in the employees table*/
 SELECT avg(salary) ,count(employee_id)
 from employees;
 /*Write a query to get the number of employees working with the company*/
 SELECT COUNT(*)
 FROM employees;
 /*Write a query to get the number of jobs available in the employees table*/
 SELECT COUNT( DISTINCT job_id)
 FROM employees;
/*Write a query to get the first 3 characters of first name from employees table*/
SELECT left(first_name,3) as 'First_Name'
from employees;
/*Write a query to get first name from employees table after removing white spaces from both side*/
SELECT TRIM(first_name)
FROM employees;
/*Write a query to check if the first_name fields of the employees table contains numbers*/
SELECT * 
   FROM employees 
   WHERE first_name  REGEXP'[0-9]';
   /*Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000*/
   SELECT first_name,last_name ,salary
   FROM employees
   WhERE salary NOT BETWEEN 100000 AND 15000 ;
   /*Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order*/
   SELECT first_name,last_name ,department_ID
   FROM employees
   WHERE department_ID IN (30,100)
   ORDER BY department_ID asc;
   /*Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100*/
  SELECT first_name,last_name ,salary,department_ID
  FROM employees
   WHERE salary NOT BETWEEN 10000 AND 15000 AND
   department_ID IN (30,100)
   ORDER BY department_ID asc;
   /*Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987*/
   SELECT first_name ,last_name,hire_date
   FROM employees
   WHERE YEAR(hire_date) LIKE '%1987';
   /*Write a query to display the first_name of all employees who have both "b" and "c" in their first name*/
   SELECT first_name,last_name 
   from employees
   Where(first_name) Like '%%b%c%';
   /*Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000*/
   SELECT first_name ,last_name,job_id,salary
   FROM employees
   WHERE job_id = 'IT_prog' OR job_id = 'SH_CLERK'
	 AND salary NOT IN(4500,10000,15000);
     /*Write a query to display the last name of employees whose names have exactly 6 characters*/
     SELECT  last_name
     from employees
     WHERE length(last_name) = 6;
     /*Write a query to display the last name of employees having 'e' as the third character*/
     SELECT last_name 
     FROM employees
     WHERE(last_name) LIKE '__e%';
     /*Write a query to get the job_id and related employee's id Partial output of the query*/
  SELECT job_id, GROUP_CONCAT(employee_id) as EMPLOYEE_ID
    FROM employees GROUP BY job_id;
    /*Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'*/

UPDATE employees 
SET phone_number = REPLACE(phone_number, '124', '999') 
WHERE phone_number LIKE '%124%';
select * from employees
WHERE phone_number LIKE '%999%'; 
/*Write a query to get the details of the employees where the length of the first name greater than or equal to 8*/
SELECT first_name 
FROM employees 
WHERE length(first_name) >= 8;
/*Write a query to append '@example.com' to email field  */
Update employees
SET email = Concat(email,'@exmple.com');
select * from employees;
/*Write a query to extract the last 4 character of phone numbers*/
SELECT right(phone_number,4)
from employees;
/*Write a query to get the last word of the street address*/
SELECT location_id, street_address, 
SUBSTRING_INDEX(street_address," ",-1) AS 'Last--word-of-street_address'
 FROM locations;
 /*Write a query to get the locations that have minimum street length*/
SELECT * FROM locations
WHERE LENGTH(street_address) =  (SELECT  MIN(LENGTH(street_address)) FROM locations);
/*Write a query to display the first word from those job titles which contains more than one words*/
SELECT job_title, SUBSTR(job_title,1, INSTR(job_title, ' ')-1) as job_one
FROM jobs;
/*Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position*/
SELECT first_name,length(first_name),last_name 
FROM employees 
WHERE INSTR(last_name,'C') > 2;
/*Write a query that displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. 
Give each column an appropriate label. Sort the results by the employees' first names*/
SELECT first_name, length(first_name) 
FROM employees
WHERE first_name LIKE 'A%' OR
first_name LIKE 'J%' OR
first_name LIKE 'M%'
ORDER BY first_name;
/*Write a query to display the first name and salary for all employees. 
Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY*/
SELECT first_name AS 'FIRST NAME',
LPAD(salary,11,'$')as SALARY
FROM employees;
/*Write a query to display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. 
Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary*/
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000)) as 'SALARY($)', salary
FROM employees
ORDER BY salary DESC;
/*Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year*/
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION('07'IN DATE_FORMAT(hire_date, '%d '))>0
OR  POSITION('17'IN DATE_FORMAT(hire_date, '%d '))>0;
/*__________________________________________________Northwind____________________________________*/
Use northwind;
 /*Write a query to get Product name and quantity/unit*/
 SELECT * FROM products;
 SELECT ProductName,QuantityPerUnit
 FROM products;
 /*Write a query to get current Product list (Product ID and name)*/
  SELECT  ProductID,ProductName
  FROM products
  WHERE Discontinued = 0;
  /*Write a query to get discontinued Product list (Product ID and name)*/
  SELECT ProductID, ProductName
FROM products
WHERE Discontinued = 1;
/*Write a query to get most expense and least expensive Product list (name and unit price)*/
SELECT UnitPrice
FROM products
Order By UnitPrice DESC ;
SELECT 
    ProductID, ProductName, UnitPrice
FROM
    products
WHERE
    UnitPrice = (
        SELECT 
            MIN(UnitPrice) 
        FROM
            products)
            OR UnitPrice = (
        SELECT 
            MAX(UnitPrice) 
        FROM
            products);
/*Write a query to get Product list (id, name, unit price) where current products cost less than $20*/
SELECT  ProductID,ProductName,UnitPrice
FROM products
WHERE UnitPrice <20
Order by UnitPrice;
/*Write a query to get Product list (id, name, unit price) where products cost between $15 and $25*/ 
SELECT ProductName, UnitPrice
FROM Products
WHERE (((UnitPrice)>=15 And (UnitPrice)<=25) 
AND ((Products.Discontinued)=False))
ORDER BY Products.UnitPrice DESC;
/*Write a query to get Product list (name, unit price) of above average price*/

SELECT DISTINCT ProductName, UnitPrice
FROM products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;
/*Write a query to get Product list (name, unit price) of ten most expensive products*/
SELECT ProductName,UnitPrice
from products
ORDER BY  UnitPrice desc
LIMIT 10;
/*Write a query to count current and discontinued products*/
SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;
/*Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order*/
 SELECT ProductName ,UnitsOnOrder,UnitsInStock
 FROM products
WHERE ((UnitsInStock)<UnitsOnOrder);
