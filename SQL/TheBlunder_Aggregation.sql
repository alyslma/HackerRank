----------+----------
--   THE BLUNDER   --
----------+----------
-- https://www.hackerrank.com/challenges/the-blunder --

/* The EMPLOYEES table is described as follows:

Salary is measured in dollars per month and its value is <10^5.
+--------------+-------------+
|         EMPLOYEES          |
+--------------+-------------+
|  Column      |    Type     |
+--------------+-------------+
| ID           | Integer     |
| Name         | String      |
| Salary       | Integer     |
+--------------+-------------+

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.
*/

SELECT CEIL((AVG(salary) - AVG(REPLACE(salary, '0', '')))) 
FROM EMPLOYEES;
