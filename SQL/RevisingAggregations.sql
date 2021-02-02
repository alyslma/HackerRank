/* The table CITY with data in fields ID, NAME, COUNTRYCODE, DISTRICT, and POPULATION described as follows:

+-------------+-------------+
|           CITY            |
+-------------+-------------+
| Field       |    Type     |
+-------------+-------------+
| ID          | NUMERIC     |
| NAME        | VARCHAR2(17)|
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT    | VARCHAR2(20)|
| POPULATION  | NUMERIC     |
+-------------+------------+
*/

-- The Sum Function --
-- https://www.hackerrank.com/challenges/revising-aggregations-sum --
/* Query the total population of all cities in CITY where District is California.*/

SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = "California";

-- The Count Function --
-- https://www.hackerrank.com/challenges/revising-aggregations-the-count-function --
/* Query a count of the number of cities in CITY having a Population larger than 100,000. */

SELECT COUNT(POPULATION) FROM CITY WHERE POPULATION > 100000;

-- Averages --
-- https://www.hackerrank.com/challenges/revising-aggregations-the-average-function --
/* Query the average population of all cities in CITY where District is California. */

SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = "California";

-- Average Population --
-- https://www.hackerrank.com/challenges/average-population --
/* Query the average population for all cities in CITY, rounded down to the nearest integer. */

SELECT FLOOR(AVG(POPULATION)) FROM CITY;

-- Japan Population --
-- https://www.hackerrank.com/challenges/japan-population --
/* Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN. */

SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = "JPN";

-- Population Density Difference --
-- https://www.hackerrank.com/challenges/population-density-difference --
/* Query the difference between the maximum and minimum populations in CITY. */

SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;