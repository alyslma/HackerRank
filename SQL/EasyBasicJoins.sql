/* 
The tables CITY and COUNTRY are described as follows:

+-------------+-------------+
|           CITY            |
+-------------+-------------+
|  Field      |    Type     |
+-------------+-------------+
| ID          | NUMERIC     |
| NAME        | VARCHAR2(17)|
| COUNTRYCODE | VARCHAR2(3) |
| DISTRICT    | VARCHAR2(20)|
| POPULATION  | NUMERIC     |
+-------------+-------------+


+----------------+---------------+
|             COUNTRY            |
+----------------+---------------+
|      Field     |      Type     |
+----------------+---------------+
| CODE           |  INTEGER      |
| NAME           |  VARCHAR2(17) |
| CONTINENT      |  VARCHAR2(3)  |
| REGION         |  VARCHAR2(20) |
| SURFACEAREA    |  NUMERIC      |
| INDEPYEAR      |  VARCHAR2(5)  |
| POPULATION     |  NUMERIC      |
| LIFEEXPECTANCY |  VARCHAR2(4)  |
| GNP            |  NUMERIC      |
| GNPOLD         |  VARCHAR2(9)  |
| LOCALNAME      |  VARCHAR2(44) |
| GOVERNMENTFORM |  VARCHAR2(44) |
| HEADOFSTATE    |  VARCHAR2(32) |
| CAPITAL        |  VARCHAR2(4)  |
| CODE2          |  VARCHAR2(2)  |
+----------------+---------------+

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

*/

-- ASIAN POPULATION --
-- https://www.hackerrank.com/challenges/asian-population --
/* Query the sum of the populations of all cities where the CONTINENT is 'Asia'.*/

SELECT SUM(CITY.POPULATION) 
FROM CITY 
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = "Asia";

-- AFRICAN CITIES --
-- https://www.hackerrank.com/challenges/african-cities --
/* Query the names of all cities where the CONTINENT is 'Africa'.*/

SELECT CITY.NAME 
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';

-- AVERAGE POPULATION OF EACH CONTINENT --
-- https://www.hackerrank.com/challenges/average-population-of-each-continent --
/* Query the names of all the continents (COUNTRY.Continent) and their respective average 
city populations (CITY.Population) rounded down to the nearest integer.*/

SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM COUNTRY
JOIN CITY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;