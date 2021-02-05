-----------------+-----------------
--     HIGHER THAN 75 MARKS      --
-----------------+-----------------
-- https://www.hackerrank.com/challenges/more-than-75-marks --

/* The STUDENTS table is described as follows:

The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
+-------------+-------------+
|          STUDENTS         |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| ID          | Integer     |
| Name        | String      |
| Marks       | Integer     |
+-------------+-------------+


Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

SELECT Name 
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;



--------------+--------------
--     EMPLOYEE NAMES      --
--------------+--------------
-- https://www.hackerrank.com/challenges/name-of-employees --

/* The EMPLOYEE table is described as follows:

Employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.
+-------------+-------------+
|          EMPLOYEE         |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| employee_id | Integer     |
| name        | String      |
| months      | Integer     |
| salary      | Integer     |
+-------------+-------------+


Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/

SELECT name 
FROM employee
ORDER BY name;

--------------+--------------
--    EMPLOYEE SALARIES    --
--------------+--------------
-- https://www.hackerrank.com/challenges/salary-of-employees --

/* Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months.
Sort your result by ascending employee_id.
*/

SELECT name 
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;