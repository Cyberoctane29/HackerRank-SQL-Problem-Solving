-- Problem: Interviews
-- Difficulty: Hard
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Contests
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | contest_id   | Integer    |
-- | hacker_id    | Integer    |
-- | name         | String     |
-- +--------------+------------+

-- Table: Colleges
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | college_id   | Integer    |
-- | contest_id   | Integer    |
-- +--------------+------------+

-- Table: Challenges
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | challenge_id | Integer    |
-- | college_id   | Integer    |
-- +--------------+------------+

-- Table: View_Stats
-- +---------------------+------------+
-- | Column              | Type       |
-- +---------------------+------------+
-- | challenge_id        | Integer    |
-- | total_views         | Integer    |
-- | total_unique_views  | Integer    |
-- +---------------------+------------+

-- Table: Submission_Stats
-- +---------------------+--------------------------+
-- | Column              | Type                     |
-- +---------------------+--------------------------+
-- | challenge_id        | Integer                  |
-- | total_submissions   | Integer                  |
-- | total_accepted_submissions | Integer             |
-- +---------------------+--------------------------+

-- Problem Statement:
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
-- Exclude the contest from the result if all four sums are 0.

-- Solution:

SELECT 
    cont.contest_id,
    cont.hacker_id,
    cont.name,
    ts.sumts,
    ts.sumtas,
    tv.sumtv,
    tv.sumtuv
FROM contests AS cont
-- Joining with submission statistics
INNER JOIN (
    SELECT 
        col.contest_id, 
        SUM(ss.total_submissions) AS sumts,
        SUM(ss.total_accepted_submissions) AS sumtas
    FROM colleges AS col
    INNER JOIN challenges AS ch ON col.college_id = ch.college_id
    INNER JOIN Submission_stats AS ss ON ch.challenge_id = ss.challenge_id
    GROUP BY col.contest_id
) AS ts ON cont.contest_id = ts.contest_id
-- Joining with view statistics
INNER JOIN (
    SELECT 
        col.contest_id,
        SUM(vs.total_views) AS sumtv,
        SUM(vs.total_unique_views) AS sumtuv
    FROM colleges AS col
    INNER JOIN challenges AS ch ON col.college_id = ch.college_id
    INNER JOIN view_stats AS vs ON ch.challenge_id = vs.challenge_id
    GROUP BY col.contest_id
) AS tv ON cont.contest_id = tv.contest_id
-- Exclude contests with all four sums as 0
WHERE ts.sumts > 0
   OR ts.sumtas > 0
   OR tv.sumtv > 0
   OR tv.sumtuv > 0
ORDER BY cont.contest_id;

-- Intuition:
-- 1. We join the Contests table with the Colleges table to get the contest_id for each college.
-- 2. We then join this result with the Submission_Stats and View_Stats tables to calculate the total number of submissions, accepted submissions, total views, and unique views for each contest.
-- 3. We sum the respective columns (total_submissions, total_accepted_submissions, total_views, and total_unique_views) grouped by contest_id.
-- 4. The `WHERE` clause filters out contests where all the sums are 0 (i.e., no submissions, accepted submissions, views, or unique views).
-- 5. Finally, the results are ordered by contest_id.

-- Explanation:
-- 1. First, the query aggregates the submission statistics and view statistics for each contest using `SUM()`, and groups them by `contest_id`.
-- 2. The `WHERE` clause ensures that only contests with non-zero values for at least one of the four metrics are included in the final result.
-- 3. The results are ordered by `contest_id` as specified.
