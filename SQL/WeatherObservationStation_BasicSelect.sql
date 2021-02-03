/* The table STATION with data in fields ID, CITY, STATE, LAT_N (northern latitude) and LONG_W (western longitude) described as follows:

+------------+-------------+
|         STATION          |
+------------+-------------+
| Field      |    Type     |
+------------+-------------+
| ID         | INTEGER     |
| CITY       | VARCHAR2(21)|
| STATE      | VARCHAR2(2) |
| LAT_N      | NUMERIC     |
| LONG_W     | NUMERIC     |
+-------------+------------+
*/

-- WEATHER OBSERVATION STATION 2 --
-- https://www.hackerrank.com/challenges/weather-observation-station-2 --
/* Query the following two values from the STATION table:
    The sum of all values in LAT_N rounded to a scale of 2 decimal places.
    The sum of all values in LONG_W rounded to a scale of 2 decimal places.*/

SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

-- WEATHER OBSERVATION STATION 3 --
-- https://www.hackerrank.com/challenges/weather-observation-station-3 --
/* Query a list of CITY names from STATION for cities that have an even ID number.
Print the results in any order, but exclude duplicates from the answer.*/

SELECT DISTINCT CITY FROM STATION WHERE ID%2 = 0;

-- WEATHER OBSERVATION STATION 4 --
-- https://www.hackerrank.com/challenges/weather-observation-station-4 --
/* Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

-- WEATHER OBSERVATION STATION 5 --
-- https://www.hackerrank.com/challenges/weather-observation-station-5 --
/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/

SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY ASC LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY ASC LIMIT 1;

-- WEATHER OBSERVATION STATION 8 --
-- https://www.hackerrank.com/challenges/weather-observation-station-8 --
/* Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) IN ('a','e','i','o','u') AND LEFT(CITY, 1) IN ('a','e','i','o','u');

-- WEATHER OBSERVATION STATION 11 --
-- https://www.hackerrank.com/challenges/weather-observation-station-11 --
/* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.*/

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) NOT IN ('a','e','i','o','u') OR LEFT(CITY, 1) NOT IN ('a','e','i','o','u');

-- WEATHER OBSERVATION STATION 13 --
-- https://www.hackerrank.com/challenges/weather-observation-station-13 --
/* Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
Truncate your answer to 4 decimal places.*/

SELECT ROUND(SUM(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

-- WEATHER OBSERVATION STATION 14 --
-- https://www.hackerrank.com/challenges/weather-observation-station-14 --
/* Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.*/

SELECT ROUND(MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345;

-- WEATHER OBSERVATION STATION 15 --
-- https://www.hackerrank.com/challenges/weather-observation-station-15 --
/* Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
Round your answer to 4 decimal places.*/

SELECT ROUND(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- WEATHER OBSERVATION STATION 18 --
-- https://www.hackerrank.com/challenges/weather-observation-station-18 --
/* Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.
    a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
    b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
    c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
    d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.*/

SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;

-- WEATHER OBSERVATION STATION 19 --
-- https://www.hackerrank.com/challenges/weather-observation-station-19 --
/* Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values 
of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.*/

SELECT ROUND(SQRT(POWER(MIN(LAT_N)-MAX(LAT_N), 2) + POWER(MIN(LONG_W)-MAX(LONG_W), 2)), 4) FROM STATION;

-- WEATHER OBSERVATION STATION 20 --
-- https://www.hackerrank.com/challenges/weather-observation-station-20 --
-- Reference: https://stackoverflow.com/questions/52291508/getting-the-median-value-from-the-database --
/* A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.*/

SET @rowIndex := -1; -- Set variable as -1 --
SELECT ROUND(AVG(m.LAT_N), 4) FROM -- Take the average of the value(s) that fall under the IN conditions --
(SELECT @rowIndex := @rowIndex+1 AS rowIndex, LAT_N FROM STATION ORDER BY LAT_N) AS m -- Create table 'm' with LAT_N values and column 'rowIndex' with row index values starting from 0 --
WHERE m.rowIndex IN (FLOOR(@rowIndex/2), CEILING(@rowIndex/2)); -- Find the corresponding rowIndex number(s) at the center using FLOOR() and CEILING() --