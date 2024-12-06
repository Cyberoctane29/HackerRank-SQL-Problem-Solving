-- Problem: SQL Project Planning
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Projects
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | Task_ID      | Integer    |
-- | Start_Date   | Date       |
-- | End_Date     | Date       |
-- +--------------+------------+

-- Problem Statement
-- Identify distinct projects based on consecutive task end dates and their total duration. 
-- Output the start and end dates of each project, sorted first by the number of completion days (in ascending order) and then by the project's start date.

-- Solution
WITH projects_start_date AS (
    SELECT 
        start_date, 
        RANK() OVER (ORDER BY start_date) AS ranked_start_date
    FROM projects
    WHERE start_date NOT IN (SELECT end_date FROM projects)
),
projects_end_date AS (
    SELECT 
        end_date, 
        RANK() OVER (ORDER BY end_date) AS ranked_end_date
    FROM projects
    WHERE end_date NOT IN (SELECT start_date FROM projects)
)
SELECT 
    ps.start_date, 
    pe.end_date
FROM 
    projects_start_date ps
JOIN 
    projects_end_date pe
ON 
    ps.ranked_start_date = pe.ranked_end_date
ORDER BY 
    DATEDIFF(pe.end_date, ps.start_date), 
    ps.start_date;

-- Intuition
-- 1. I identify the unique start and end dates of each project by finding dates that do not overlap with other tasks.
--    - A `start_date` is unique to a project if it does not appear as an `end_date` for another task.
--    - Similarly, an `end_date` is unique to a project if it does not appear as a `start_date` for another task.
-- 2. I use `RANK()` to assign a sequential rank to the unique start and end dates.
-- 3. Projects are paired by matching their `ranked_start_date` and `ranked_end_date`.
-- 4. The output is sorted by project duration (`DATEDIFF` between `end_date` and `start_date`) and then by the `start_date`.

-- Explanation
-- 1. CTEs for Start and End Dates:
--    - `projects_start_date`: Extracts all unique project start dates using the condition `start_date NOT IN (SELECT end_date FROM projects)`. Each start date is ranked using `RANK()` to ensure proper pairing.
--    - `projects_end_date`: Similarly, extracts unique project end dates using the condition `end_date NOT IN (SELECT start_date FROM projects)` and ranks them.
-- 2. Main Query:
--    - Joins the two CTEs on their ranks (`ranked_start_date = ranked_end_date`) to form project pairs.
-- 3. Sorting:
--    - Projects are sorted by their duration in ascending order, calculated using `DATEDIFF(pe.end_date, ps.start_date)`.
--    - Projects with the same duration are then sorted by their `start_date`.