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
        hacker_id,
        name,
        COUNT(DISTINCT challenge_id) AS cnt 
    FROM (
        SELECT 
            su.hacker_id,
            ha.name,
            su.challenge_id,
            ch.difficulty_level,
            su.score AS su_score,
            di.score AS di_score
        FROM 
            submissions AS su
        LEFT JOIN 
            hackers AS ha ON su.hacker_id = ha.hacker_id
        LEFT JOIN 
            challenges AS ch ON su.challenge_id = ch.challenge_id
        LEFT JOIN 
            difficulty AS di ON ch.difficulty_level = di.difficulty_level
        WHERE 
            su.score = di.score  -- Only select submissions with full scores
    ) AS CTE
    GROUP BY 
        hacker_id, name
    HAVING 
        COUNT(DISTINCT challenge_id) > 1  -- Only hackers with more than one full score
) AS Result
ORDER BY 
    cnt DESC, 
    hacker_id ASC;

-- Intuition:
-- I first select full-score submissions by matching each submission score with the maximum possible score for its challenge difficulty level.
-- In the outer query, I count unique full-scored challenges for each hacker to filter hackers with more than one full-scored challenge.
-- The final result sorts by the count of full scores in descending order and by hacker_id in ascending order for ties.

-- Explanation:
-- I first filter submissions by comparing the score with the maximum score available for the corresponding difficulty level (`su.score = di.score`).
-- Then, in the inner query (CTE), I gather all submissions that resulted in full scores for each hacker, linking them to challenge details.
-- In the outer query, I group the results by `hacker_id` and `name`, counting the distinct challenges in which each hacker achieved a full score.
-- Using `HAVING COUNT(DISTINCT challenge_id) > 1`, I ensure only hackers who earned full scores in more than one challenge are selected.
-- Finally, I sort the results by the count of challenges in descending order and by `hacker_id` in ascending order for those with the same count.
-- The use of `LEFT JOIN` ensures that all submissions are matched with corresponding challenge and difficulty data, even if some challenges are not submitted. This guarantees an accurate full-score comparison.

