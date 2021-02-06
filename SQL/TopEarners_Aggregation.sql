----------+----------
--   TOP EARNERS   --
----------+----------
-- https://www.hackerrank.com/challenges/harry-potter-and-wands --

/* The Employee table is described as follows:

Employee_id is an employee's ID number, 
name is their name, 
months is the total number of months they've been working for the company, 
and salary is the their monthly salary.
+--------------+-------------+
|          EMPLOYEE          |
+--------------+-------------+
|  Column      |    Type     |
+--------------+-------------+
| employee_id  | Integer     |
| name         | String      |
| months       | Integer     |
| salary       | Integer     |
+--------------+-------------+

We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
Then print these values as 2 space-separated integers.
*/

SELECT MAX(salary * months), COUNT(salary * months) 
FROM employee
WHERE salary * months = (SELECT MAX(salary * months) AS max_earnings FROM employee);


-- Alternative solutions practicing limits and aliases
SELECT MAX(salary * months), COUNT(employee_id) 
FROM employee
GROUP BY salary * months
ORDER BY salary * months DESC LIMIT 1;


SELECT salary * months AS earnings, COUNT(*) 
FROM employee 
GROUP BY earnings 
ORDER BY earnings DESC LIMIT 1;