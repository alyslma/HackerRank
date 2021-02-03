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


