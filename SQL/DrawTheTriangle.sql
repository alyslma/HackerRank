------------+------------
-- DRAW THE TRIANGLE 1 --
------------+------------
-- https://www.hackerrank.com/challenges/draw-the-triangle-1 --
/* P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

        * * * * * 
        * * * * 
        * * * 
        * * 
        *

Write a query to print the pattern P(20). 
*/

-- MS SQL Server --
DECLARE @cnt INT = 20;

WHILE @cnt > 0
BEGIN
    PRINT REPLICATE('* ', @cnt);
    SET @cnt = @cnt - 1;
END;

-- MySQL --
/* I first tried to use DUAL as a dummy table to satisfy the MySQL condition that every SELECT must
have a FROM, but it doesn't have the sufficient number of rows. Learned from user @Malkard in the
discussions I could use information_schema.tables instead for at least 20 rows to draw the triangle.
*/

SET @cnt := 21;
SELECT REPEAT('* ', @cnt := @cnt - 1) 
FROM information_schema.tables
WHERE @cnt > 0;

/* Learned an alternative method in MySQL without using information_schema.tables from user @applejohnny
in the discussions by generating n tables with n rows and joining them to get n^n rows.
*/

SET @cnt := 21;
SELECT repeat('* ', @cnt := @cnt - 1) FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) a, 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) b,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) c
WHERE @cnt > 1;

------------+------------
-- DRAW THE TRIANGLE 2 --
------------+------------
-- https://www.hackerrank.com/challenges/draw-the-triangle-2 --
/* P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

        * 
        * * 
        * * * 
        * * * * 
        * * * * *

Write a query to print the pattern P(20).*/

-- MS SQL Server --
DECLARE @cnt INT = 1;

WHILE @cnt < 21
BEGIN
    PRINT REPLICATE('* ', @cnt);
    SET @cnt = @cnt + 1;
END;

-- MySQL --
-- Method 1 --
SET @cnt := 0;
SELECT REPEAT('* ', @cnt := @cnt + 1)
FROM information_schema.tables
WHERE @cnt < 20;

-- Method 2 --
SET @cnt := 0;
SELECT repeat('* ', @cnt := @cnt + 1) FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) a, 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) b,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3) c
WHERE @cnt < 20;