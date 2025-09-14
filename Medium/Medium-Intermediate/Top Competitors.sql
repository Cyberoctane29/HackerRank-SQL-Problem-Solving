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
    hacker_id,
    name
FROM (
    SELECT 
        s.hacker_id,
        h.name,
        COUNT(s.challenge_id) AS challenge_count
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
        COUNT(s.challenge_id) > 1 
) AS ChallengeCount
ORDER BY 
    challenge_count DESC, 
    hacker_id ASC;

-- Intuition:
-- To identify top competitors, I need to check which hackers achieved full marks in multiple challenges.
-- A submission is considered full score when the submission score equals the maximum score defined for the challenge’s difficulty level.
-- After filtering such submissions, I count how many challenges each hacker fully solved.
-- Finally, I keep only those hackers with more than one full score and sort them by their count (descending) and hacker_id (ascending).

-- Explanation:
-- 1. The JOINs connect Submissions with Challenges, Difficulty, and Hackers to gather all relevant details for each submission.
-- 2. The WHERE clause ensures that only submissions with full scores (`s.score = d.score`) are included.
-- 3. In the grouped query, I aggregate by hacker_id and name, and count how many challenges each hacker fully solved.
-- 4. The HAVING clause filters hackers who have more than one full-scored challenge.
-- 5. The outer SELECT retrieves the hacker_id and name for those qualified hackers.
-- 6. The final ORDER BY sorts primarily by the number of full-scored challenges in descending order, and uses hacker_id ascending to break ties.
