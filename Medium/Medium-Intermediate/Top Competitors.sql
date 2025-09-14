-- Problem: Top Competitors
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Hackers
-- +-----------+--------+
-- | Column    | Type   |
-- +-----------+--------+
-- | hacker_id | Integer|
-- | name      | String |
-- +-----------+--------+

-- Table: Difficulty
-- +----------------+--------+
-- | Column         | Type   |
-- +----------------+--------+
-- | difficulty_level | Integer |
-- | score          | Integer |
-- +----------------+--------+

-- Table: Challenges
-- +-------------+-----------+-------------------+
-- | Column      | Type      |
-- +-------------+-----------+
-- | challenge_id| Integer   |
-- | hacker_id   | Integer   |
-- | difficulty_level | Integer |
-- +-------------+-----------+-------------------+

-- Table: Submissions
-- +-------------+-----------+-------------+---------+
-- | Column      | Type      |
-- +-------------+-----------+
-- | submission_id| Integer  |
-- | hacker_id   | Integer   |
-- | challenge_id| Integer   |
-- | score       | Integer   |
-- +-------------+-----------+---------------------+

-- Problem Statement
-- Identify hackers who achieved full scores on more than one challenge.
-- Sort by total full-scored challenges in descending order, and by hacker_id in ascending order when counts are tied.

-- Solution
SELECT 
    s.hacker_id,
    h.name,
    COUNT(DISTINCT s.challenge_id) AS challenge_count
FROM 
    Submissions AS s
JOIN Challenges AS c 
    ON s.challenge_id = c.challenge_id
JOIN Difficulty AS d 
    ON c.difficulty_level = d.difficulty_level
JOIN Hackers AS h 
    ON s.hacker_id = h.hacker_id
WHERE 
    s.score = d.score  
GROUP BY 
    s.hacker_id, h.name
HAVING 
    COUNT(DISTINCT s.challenge_id) > 1   
ORDER BY 
    challenge_count DESC, 
    s.hacker_id ASC;


-- Intuition:
-- The task is to find hackers who achieved full scores in more than one challenge.
-- A full score means the submission score matches the maximum score allowed for that challenge’s difficulty level.
-- By joining Submissions with Challenges, Difficulty, and Hackers, we can map each submission to the hacker and the challenge’s required score.
-- Counting distinct challenge_ids per hacker lets us filter those with more than one full-scored challenge.
-- Sorting by challenge count (descending) and hacker_id (ascending) ensures the correct ranking.

-- Explanation:
-- 1. The WHERE clause `s.score = d.score` filters submissions to only those where the hacker achieved the maximum possible score for that challenge.
-- 2. Joins:
--    - Submissions → Challenges: links submissions to the challenge attempted.
--    - Challenges → Difficulty: ensures access to the difficulty’s maximum score.
--    - Submissions → Hackers: brings in hacker details (name, ID).
-- 3. In the GROUP BY, each hacker’s distinct full-scored challenges are counted using `COUNT(DISTINCT s.challenge_id)`.
-- 4. The HAVING clause ensures we only keep hackers with more than one such challenge.
-- 5. The ORDER BY sorts first by the number of full-scored challenges (descending), then by hacker_id (ascending) for tie-breaking.
