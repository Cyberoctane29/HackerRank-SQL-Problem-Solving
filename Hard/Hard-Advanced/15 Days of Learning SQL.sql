-- Problem: 15 Days of Learning SQL
-- Difficulty: Hard
-- Skills: SQL (Advanced)

-- SQL Schema
-- Table: Hackers
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | hacker_id    | Integer    |
-- | name         | String     |
-- +--------------+------------+
-- Table: Submissions
-- +-------------------+------------+
-- | Column            | Type       |
-- +-------------------+------------+
-- | submission_date   | Date       |
-- | submission_id     | Integer    |
-- | hacker_id         | Integer    |
-- | score             | Integer    |
-- +-------------------+------------+

-- Problem Statement
-- Write a query to print the total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest),
-- and find the hacker_id and name of the hacker who made the maximum number of submissions each day. 
-- If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. 
-- The query should print this information for each day of the contest, sorted by the date.

-- Solution 1: Using Common Table Expressions (CTEs) and Recursive Query
WITH RECURSIVE CTE AS (
    SELECT submission_date, hacker_id 
    FROM submissions 
    WHERE submission_date = (SELECT MIN(submission_date) FROM submissions)
    
    UNION ALL
    
    SELECT s.submission_date, s.hacker_id 
    FROM submissions s
    JOIN CTE ct ON ct.hacker_id = s.hacker_id 
    WHERE s.submission_date = (
        SELECT MIN(submission_date)
        FROM submissions 
        WHERE submission_date > ct.submission_date
    )
),
continious_submit AS (
    SELECT submission_date, COUNT(hacker_id) AS conti_submits 
    FROM CTE 
    GROUP BY submission_date
),
count_submissions AS (
    SELECT submission_date, hacker_id, COUNT(hacker_id) AS submission_cnt 
    FROM submissions 
    GROUP BY submission_date, hacker_id
),
max_submissions AS (
    SELECT submission_date, MAX(submission_cnt) AS max_submission_cnt 
    FROM count_submissions 
    GROUP BY submission_date
),
final_submissions AS (
    SELECT c.submission_date, MIN(c.hacker_id) AS hacker_id
    FROM count_submissions c 
    JOIN max_submissions m 
        ON m.submission_date = c.submission_date 
        AND m.max_submission_cnt = c.submission_cnt
    GROUP BY c.submission_date
)
SELECT ct.submission_date, ct.conti_submits as submissions, f.hacker_id, h.name 
FROM continious_submit ct
JOIN final_submissions f ON ct.submission_date = f.submission_date
JOIN hackers h ON f.hacker_id = h.hacker_id
ORDER BY ct.submission_date;

-- Intuition for Solution 1:
-- The query makes use of several CTEs (Common Table Expressions) to process and organize the data:
-- 1. CTE recursively builds the list of hackers who made submissions on each day, starting from the first submission day.
-- 2. Continious_submit counts the number of unique hackers who submitted each day.
-- 3. Count_submissions counts how many submissions each hacker made on each day.
-- 4. Max_submissions finds the maximum number of submissions made by any hacker on each day.
-- 5. Final_submissions identifies the hacker(s) who made the most submissions on each day, ensuring that the lowest `hacker_id` is selected if there are ties.
-- The final result joins the necessary tables and produces the total number of unique hackers and the hacker with the maximum submissions for each day.

-- Explanation for Solution 1:
-- 1. The recursive CTE helps to iterate through each submission day and track hackers who submitted on each day.
-- 2. The `continious_submit` CTE calculates the total number of unique hackers for each submission day.
-- 3. `count_submissions` CTE counts submissions per hacker per day.
-- 4. The `max_submissions` CTE computes the highest submission count per day.
-- 5. The final step identifies the hacker with the maximum submissions on each day, ensuring ties are resolved by choosing the hacker with the lowest `hacker_id`.
-- 6. The results are ordered by `submission_date` for the required output format.

-- Solution 2: Using Nested Queries and Aggregation
SELECT 
    S.submission_date, 
    MAX(S6.Dhc) AS max_hacker_count, 
    S.hacker_id, 
    H.name 
FROM 
    Submissions AS S 
INNER JOIN 
    Hackers AS H ON S.hacker_id = H.hacker_id 
INNER JOIN (
    SELECT 
        S3.submission_date AS S_d, 
        COUNT(DISTINCT S3.hacker_id) AS Dhc 
    FROM 
        Submissions AS S3 
    WHERE 
        (SELECT COUNT(DISTINCT S4.submission_date) 
         FROM Submissions AS S4 
         WHERE S4.hacker_id = S3.hacker_id AND S4.submission_date <= S3.submission_date) = 
        (SELECT COUNT(DISTINCT S5.submission_date) 
         FROM Submissions AS S5 
         WHERE S5.submission_date <= S3.submission_date) 
    GROUP BY S3.submission_date
) AS S6 ON S.submission_date = S6.S_d 
GROUP BY 
    S.submission_date, S.hacker_id, H.name 
HAVING 
    COUNT(S.submission_id) = (
        SELECT COUNT(S1.submission_id) 
        FROM Submissions AS S1 
        WHERE S1.submission_date = S.submission_date 
        GROUP BY S1.hacker_id 
        ORDER BY COUNT(S1.submission_id) DESC 
        LIMIT 1
    ) 
    AND S.hacker_id = (
        SELECT S2.hacker_id 
        FROM Submissions AS S2 
        WHERE S2.submission_date = S.submission_date 
        GROUP BY S2.hacker_id 
        ORDER BY COUNT(S2.submission_id) DESC, S2.hacker_id 
        LIMIT 1
    ) 
ORDER BY 
    S.submission_date, S.hacker_id;

-- Intuition for Solution 2:
-- This solution avoids the use of recursive CTEs and instead uses nested queries and aggregation to solve the problem:
-- 1. A nested query (`S6`) finds the total number of distinct hackers who made submissions by each day, with a condition to ensure that only hackers who submitted every day from the start are considered.
-- 2. The `HAVING` clause ensures that only the hacker with the maximum number of submissions on a given day is selected.
-- 3. The outer query joins the `Submissions` and `Hackers` tables to fetch the hacker's details and group the results by submission date and hacker.
-- 4. If there are multiple hackers with the same maximum submissions, the query ensures that the hacker with the lowest `hacker_id` is chosen.

-- Explanation for Solution 2:
-- 1. The nested query calculates the count of distinct hackers who made submissions up to each day.
-- 2. The `HAVING` clause filters for the hacker(s) with the highest number of submissions for each day.
-- 3. The query uses `GROUP BY` to group by `submission_date`, `hacker_id`, and `name` to get the final result.
-- 4. The query ensures that ties are broken by choosing the hacker with the lowest `hacker_id`.
-- 5. The results are ordered by `submission_date` and `hacker_id` to meet the required output format.
