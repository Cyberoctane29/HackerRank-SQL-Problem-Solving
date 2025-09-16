-- Problem: Contest Leaderboard
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Hackers
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | hacker_id    | Integer    |
-- | name         | String     |
-- +--------------+------------+

-- Table: Submissions
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | submission_id| Integer    |
-- | hacker_id    | Integer    |
-- | challenge_id | Integer    |
-- | score        | Integer    |
-- +--------------+------------+

-- Problem Statement:
-- Query the hacker_id, name, and total score of the hackers, where total score is the sum of their maximum scores across all challenges.
-- Exclude hackers with a total score of 0.
-- The result should be ordered by descending total score. If more than one hacker has the same total score, sort by ascending hacker_id.

-- Solution - 1

SELECT hacker_id, name, SUM(max_score) AS total_score
FROM (
    SELECT h.hacker_id, h.name, s.challenge_id, MAX(s.score) AS max_score
    FROM hackers AS h
    JOIN submissions AS s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name, s.challenge_id
) AS subquery
GROUP BY hacker_id, name
HAVING SUM(max_score) <> 0
ORDER BY total_score DESC, hacker_id;

-- Intuition for the Solution:
-- This query calculates the total score for each hacker by first finding the maximum score for each challenge they participated in, 
-- and then summing up these maximum scores for all challenges.
-- The first subquery uses a `JOIN` between `hackers` and `submissions` tables to pair each hacker with their submissions and challenges. 
-- The `MAX(s.score)` function finds the highest score for each hacker per challenge. This result is grouped by `hacker_id`, `name`, and `challenge_id`.
-- The outer query aggregates the results from the subquery by summing the maximum scores per hacker. 
-- The `HAVING` clause ensures that hackers with a total score of 0 are excluded from the result.
-- Finally, the result is ordered first by `total_score` in descending order, and if two hackers have the same score, they are ordered by `hacker_id` in ascending order.

-- Explanation:
-- 1. The subquery calculates the highest score (`MAX(s.score)`) for each hacker per challenge using a `JOIN` between the `hackers` and `submissions` tables.
-- 2. The result from the subquery is grouped by `hacker_id`, `name`, and `challenge_id` to calculate the maximum score per hacker per challenge.
-- 3. The outer query then sums the maximum scores (`SUM(max_score)`) for each hacker.
-- 4. The `HAVING SUM(max_score) <> 0` clause ensures hackers with zero total score are excluded.
-- 5. The final result is ordered by `total_score` in descending order, and by `hacker_id` in ascending order if scores are tied.

-- Solution - 2

WITH CTE AS (
    SELECT 
        h.hacker_id, 
        h.name,
        s.challenge_id,
        MAX(s.score) AS max_score 
    FROM hackers AS h 
    JOIN submissions AS s ON h.hacker_id = s.hacker_id 
    GROUP BY h.hacker_id, h.name, s.challenge_id
)
SELECT 
    hacker_id, 
    name, 
    SUM(max_score) AS total_score 
FROM CTE 
GROUP BY hacker_id, name 
HAVING SUM(max_score) <> 0 
ORDER BY total_score DESC, hacker_id;

-- Intuition for the Solution:
-- The goal is to compute each hacker’s total score by considering only their best attempt for every challenge.  
-- The CTE first joins hackers with submissions and finds the maximum score per challenge for each hacker.  
-- In the outer query, these maximum scores are summed up across all challenges attempted by the hacker.  
-- Hackers with a total score of 0 are excluded, and the results are ranked by total score in descending order and by hacker_id in ascending order for ties.  

-- Explanation:
-- 1. Inside the CTE:
--    - We join `hackers` with `submissions` to capture all attempts made by each hacker on each challenge.
--    - Using `MAX(s.score)`, we keep only the best score a hacker achieved for a given challenge.
--    - Grouping by `hacker_id`, `name`, and `challenge_id` ensures we calculate this maximum per challenge per hacker.  
-- 2. In the outer query:
--    - We group again by `hacker_id` and `name` to compute the total score as the sum of all maximum scores (`SUM(max_score)`).
--    - The `HAVING SUM(max_score) <> 0` clause filters out hackers who didn’t earn any points across their challenges.
--    - The final ordering sorts hackers by their total score (descending) and resolves ties by hacker_id (ascending).
