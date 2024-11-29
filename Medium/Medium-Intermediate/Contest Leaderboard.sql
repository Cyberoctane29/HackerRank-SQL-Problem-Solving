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
