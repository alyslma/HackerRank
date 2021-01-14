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

-- WEATHER OBSERVATION STATION 3 --
/* Query a list of CITY names from STATION for cities that have an even ID number.
Print the results in any order, but exclude duplicates from the answer.*/

SELECT DISTINCT CITY FROM STATION WHERE ID%2 = 0;

-- WEATHER OBSERVATION STATION 4 --
/* Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

-- WEATHER OBSERVATION STATION 5 --
/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/

SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY ASC LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY ASC LIMIT 1;

-- WEATHER OBSERVATION STATION 8 --
/* Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) IN ('a','e','i','o','u') AND LEFT(CITY, 1) IN ('a','e','i','o','u');

-- WEATHER OBSERVATION STATION 11 --
/* Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.*/

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) NOT IN ('a','e','i','o','u') OR LEFT(CITY, 1) NOT IN ('a','e','i','o','u');
