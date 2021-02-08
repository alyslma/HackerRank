------------+------------
--     THE REPORT      --
------------+------------
-- https://www.hackerrank.com/challenges/the-report --

/* The tables STUDENTS and GRADES are described as follows:

+-------------+-------------+
|          STUDENTS         |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| ID          | Integer     |
| Name        | String      |
| Marks       | Integer     |
+-------------+-------------+

+---------------+---------------+---------------+
|                    GRADES                     |
+---------------+---------------+---------------+
|    Grade      |   Min_Mark    |   Max_Mark    |
+---------------+---------------+---------------+
| 1             |       0       |       9       |
| 2             |      10       |      19       |
| 3             |      20       |      29       |
| 4             |      30       |      39       |
| 5             |      40       |      49       |
| 6             |      50       |      59       |
| 7             |      60       |      69       |
| 8             |      70       |      79       |
| 9             |      80       |      89       |
| 10            |      90       |     100       |
+---------------+---------------+---------------+

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.*/

-- First submission --
SELECT CASE WHEN GRADE < 8 THEN "NULL" ELSE NAME END, GRADE, MARKS 
FROM STUDENTS 
JOIN GRADES ON MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME ASC, MARKS ASC;

-- Second submission using IF --
SELECT IF(GRADE < 8, "NULL", NAME), GRADE, MARKS 
FROM STUDENTS 
JOIN GRADES ON MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME, MARKS;



------------+------------
--   TOP COMPETITORS   --
------------+------------
-- https://www.hackerrank.com/challenges/full-score --

/* The tables HACKERS, DIFFICULTY, CHALLENGES, and SUBMISSIONS are described as follows:

The hacker_id is the id of the hacker, and name is the name of the hacker.
+-------------+-------------+
|          HACKERS          |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| hacker_id   | Integer     |
| name        | String      |
+-------------+-------------+

The difficulty_level is the level of difficulty of the challenge, 
and score is the score of the challenge for the difficulty level. 
+-------------------+------------------+
|               DIFFICULTY             |
+-------------------+------------------+
|       Column      |       Type       |
+-------------------+------------------+
| difficulty_level  |      Integer     |
| score             |      Integer     |
+-------------------+------------------+

The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, 
and difficulty_level is the level of difficulty of the challenge. 
+-------------------+------------------+
|               CHALLENGES             |
+-------------------+------------------+
|       Column      |       Type       |
+-------------------+------------------+
|  challenge_id     |      Integer     |
|  hacker_id        |      Integer     |
|  difficulty_level |      Integer     |
+-------------------+------------------+

The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.
+-------------------+------------------+
|              SUBMISSIONS             |
+-------------------+------------------+
|       Column      |       Type       |
+-------------------+------------------+
|  submission_id    |      Integer     |
|  hacker_id        |      Integer     |
|  challenge_id     |      Integer     |
|  score            |      Integer     |
+-------------------+------------------+

Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
*/

-- Notes to self:
    -- Notice that hacker_id from CHALLENGES is the id of the hacker who created the challenge. 
    -- Added all non-aggregated columns to GROUP BY clause to work around error "sql_mode=only_full_group_by".
    -- Workaround idea taken from: https://stackoverflow.com/questions/13999817/reason-for-column-is-invalid-in-the-select-list-because-it-is-not-contained-in-e/13999903#13999903

SELECT h.hacker_id, h.name
FROM HACKERS h
JOIN SUBMISSIONS s ON h.hacker_id = s.hacker_id
JOIN CHALLENGES c ON s.challenge_id = c.challenge_id
JOIN DIFFICULTY d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) DESC, h.hacker_id;



----------------+---------------
--    CONTEST LEADERBOARD     --
----------------+---------------
-- https://www.hackerrank.com/challenges/contest-leaderboard --

/* The tables HACKERS and SUBMISSIONS are described as follows:

The hacker_id is the id of the hacker, and name is the name of the hacker.
+-------------+-------------+
|          HACKERS          |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| hacker_id   | Integer     |
| name        | String      |
+-------------+-------------+

The submission_id is the id of the submission, 
hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge for which the submission belongs to, 
and score is the score of the submission.
+-------------------+------------------+
|              SUBMISSIONS             |
+-------------------+------------------+
|       Column      |       Type       |
+-------------------+------------------+
|  submission_id    |      Integer     |
|  hacker_id        |      Integer     |
|  challenge_id     |      Integer     |
|  score            |      Integer     |
+-------------------+------------------+

You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.
*/

-- Using aliases/subqueries and max() as some hackers can submit multiple submissions of the same challenge.
SELECT h.hacker_id, h.name, sum(score)
FROM HACKERS h
JOIN (SELECT hacker_id, max(score) AS score FROM SUBMISSIONS GROUP BY challenge_id, hacker_id) max_score -- temp table
ON h.hacker_id = max_score.hacker_id
GROUP BY h.hacker_id, h.name
HAVING sum(score) > 0
ORDER BY sum(score) DESC, h.hacker_id;


------------+------------
--      CHALLENGES     --
------------+------------
-- https://www.hackerrank.com/challenges/challenges --

/* The tables HACKERS and CHALLENGES are described as follows:

The hacker_id is the id of the hacker, and name is the name of the hacker.
+-------------+-------------+
|          HACKERS          |
+-------------+-------------+
|  Column     |    Type     |
+-------------+-------------+
| hacker_id   | Integer     |
| name        | String      |
+-------------+-------------+

The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.
+-------------------+------------------+
|               CHALLENGES             |
+-------------------+------------------+
|       Column      |       Type       |
+-------------------+------------------+
|  challenge_id     |      Integer     |
|  hacker_id        |      Integer     |
+-------------------+------------------+

Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

-- (1) Join the two tables and group by hacker_id and name to get total number of challenges created by each student.
-- (2) Exclude students with the same number of challenges that aren't the max number of challenges made in total.
-- So challenge_created count is the maximum number or only appears once among all students.

SELECT h.hacker_id, h.name, COUNT(c.hacker_id) AS challenge_cnt
FROM hackers h 
JOIN challenges c 
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenge_cnt = -- where challenge_cnt is the max number of challenges created
        (SELECT MAX(t1.hacker_cnt)
        FROM (
            SELECT COUNT(hacker_id) AS hacker_cnt
            FROM challenges
            GROUP BY hacker_id
            ORDER BY hacker_id) t1)
    OR challenge_cnt IN  -- or challenge_cnt only appears once
        (SELECT t2.hacker_cnt
        FROM (
            SELECT COUNT(*) AS hacker_cnt 
            FROM challenges
            GROUP BY hacker_id) t2
        GROUP BY t2.hacker_cnt
        HAVING COUNT(t2.hacker_cnt) = 1)
ORDER BY challenge_cnt DESC, c.hacker_id;



----------------+---------------
--   OLLIVANDER'S INVENTORY   --
----------------+---------------
-- https://www.hackerrank.com/challenges/harry-potter-and-wands --

/* The tables WANDS and WANDS_PROPERTY are described as follows:

The id is the id of the wand, code is the code of the wand, 
coins_needed is the total number of gold galleons needed to buy the wand, 
and power denotes the quality of the wand (the higher the power, the better the wand is).
+--------------+-------------+
|            WANDS           |
+--------------+-------------+
|  Column      |    Type     |
+--------------+-------------+
| id           | Integer     |
| code         | Integer     |
| coins_needed | Integer     |
| power        | Integer     |
+--------------+-------------+

The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. 
If the value of is_evil is 0, it means that the wand is not evil. 
The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), then code1 =/= code2 and age1 =/= age2.
+---------------+-------------+
|       WANDS_PROPERTY        |
+---------------+-------------+
|    Column     |    Type     |
+---------------+-------------+
| code          |   Integer   |
| age           |   Integer   |
| is_evil       |   Integer   |
+---------------+-------------+


Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.
*/

-- In other words, I'm looking for the cheapest wand for a given combination of age and power.

-- Resubmission using WHERE to filter for only the least expensive wand for each age/power combo
SELECT w.id, p.age, w.coins_needed, w.power
FROM WANDS w
JOIN WANDS_PROPERTY p
ON w.code = p.code
WHERE p.is_evil = 0 AND coins_needed = ( -- Queries other wands with same power/age for the least expensive one
    SELECT MIN(coins_needed) 
    FROM WANDS w1 
    JOIN WANDS_PROPERTY p1 
    ON w1.code = p1.code 
    WHERE w1.power = w.power AND p1.age = p.age) -- Takes the power/age of the "current"/given wand from the outer query
ORDER BY w.power DESC, p.age DESC;

-- First submission: left joined a queried table of all the least expensive wands for each power/age combo with the wands_data table to obtain the required info
SELECT wands_data.id, min_coin_needed.age, min_coin_needed.min_coins, min_coin_needed.power
FROM (SELECT w1.power, p1.age, MIN(coins_needed) AS min_coins
FROM WANDS w1
JOIN WANDS_PROPERTY p1
ON w1.code = p1.code
WHERE p1.is_evil = 0
GROUP BY w1.power, p1.age) AS min_coin_needed
LEFT JOIN (SELECT w.id, p.age, w.coins_needed, w.power
FROM WANDS w
JOIN WANDS_PROPERTY p
ON w.code = p.code) AS wands_data
ON wands_data.power = min_coin_needed.power AND wands_data.age = min_coin_needed.age AND wands_data.coins_needed = min_coin_needed.min_coins
ORDER BY min_coin_needed.power DESC, min_coin_needed.age DESC;




