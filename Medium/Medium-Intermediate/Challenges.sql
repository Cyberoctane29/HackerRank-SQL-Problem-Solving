-- Problem: Challenges
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Hackers
-- +-------------+---------+
-- | Column      | Type    |
-- +-------------+---------+
-- | hacker_id   | Integer |
-- | name        | String  |
-- +-------------+---------+
-- Table: Challenges
-- +-------------+---------+
-- | Column      | Type    |
-- +-------------+---------+
-- | challenge_id| Integer |
-- | hacker_id   | Integer |
-- +-------------+---------+

-- Problem Statement
-- Write a query to return the hacker_id, name, and the total number of challenges created by each student.
-- Sort the results by the total number of challenges in descending order. If there are ties, sort by hacker_id.
-- Exclude students with the same count of challenges unless their count is the maximum.

-- Solution
WITH CTE AS (
    -- Step 1: Count the total number of challenges created by each hacker.
    SELECT 
        h.hacker_id, 
        h.name, 
        COUNT(c.challenge_id) AS cnt 
    FROM hackers AS h
    JOIN challenges AS c 
        ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
CTE1 AS (
    -- Step 2: Identify the counts (cnt) that occur more than once, but only for counts below the maximum count.
    SELECT 
        cnt, 
        COUNT(cnt) AS cnt1 
    FROM CTE 
    WHERE cnt < (SELECT MAX(cnt) FROM CTE) 
    GROUP BY cnt
)
-- Step 3: Filter out hackers with counts that occur more than once (except for the maximum count).
SELECT 
    hacker_id, 
    name, 
    cnt 
FROM CTE 
WHERE cnt NOT IN (
    SELECT cnt 
    FROM CTE1 
    WHERE cnt1 > 1
)
ORDER BY cnt DESC, hacker_id;

-- Intuition
-- 1. In the first CTE (CTE), I calculate the total number of challenges created by each hacker using a `COUNT` aggregate function and grouping by hacker_id and name.
-- 2. In the second CTE (CTE1), I identify the counts of challenges (`cnt`) that occur more than once, but only for counts less than the maximum count of challenges.
-- 3. The main query filters out hackers with duplicate counts (except for the maximum count) and sorts the result in descending order of total challenges and ascending order of hacker_id for ties.

-- Explanation
-- 1. The `COUNT` function in CTE calculates the total challenges for each hacker.
-- 2. The second CTE filters counts below the maximum (`MAX(cnt)`) and checks for duplicates (`COUNT(cnt) > 1`).
-- 3. The `NOT IN` clause ensures hackers with duplicate counts below the maximum are excluded from the results.
-- 4. The `ORDER BY` clause ensures the results are sorted by challenge count in descending order and hacker_id in ascending order for ties.
