-- Problem: The Report
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Students
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | ID           | Integer    |
-- | Name         | String     |
-- | Marks        | Integer    |
-- +--------------+------------+

-- Table: Grades
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | Grade        | Integer    |
-- | Min_Mark     | Integer    |
-- | Max_Mark     | Integer    |
-- +--------------+------------+

-- Problem Statement:
-- Generate a report with the following columns: Name, Grade, and Marks.
-- 1. Exclude students who received a grade lower than 8.
-- 2. Order by grade in descending order.
-- 3. For students with the same grade (8-10), order them by their name alphabetically.
-- 4. For students with grades 1-7, order them by marks in ascending order.
-- 5. For students with grades lower than 8, use "NULL" as their name.

-- Solution using Common Table Expression (CTE)

WITH CTE AS (
    SELECT 
        name, 
        CASE 
            WHEN marks >= 0 AND marks <= 9 THEN 1
            WHEN marks >= 10 AND marks <= 19 THEN 2
            WHEN marks >= 20 AND marks <= 29 THEN 3
            WHEN marks >= 30 AND marks <= 39 THEN 4
            WHEN marks >= 40 AND marks <= 49 THEN 5
            WHEN marks >= 50 AND marks <= 59 THEN 6
            WHEN marks >= 60 AND marks <= 69 THEN 7
            WHEN marks >= 70 AND marks <= 79 THEN 8
            WHEN marks >= 80 AND marks <= 89 THEN 9
            WHEN marks >= 90 AND marks <= 100 THEN 10
            ELSE NULL 
        END AS grade, 
        marks 
    FROM Students
)
SELECT 
    CASE WHEN grade >= 8 THEN name ELSE NULL END AS name, 
    grade, 
    marks 
FROM CTE
ORDER BY 
    grade DESC, 
    CASE 
        WHEN grade >= 8 THEN name
        WHEN grade < 8 THEN marks
    END;

-- Intuition:
-- 1. The CTE calculates the grade for each student based on their marks, mapping ranges to grades (1-10).
-- 2. The main query:
--    - Excludes students with grades lower than 8 by using a `CASE` statement.
--    - Orders by grade in descending order.
--    - For students with the same grade (8-10), orders them by name alphabetically.
--    - For students with grades 1-7, orders them by marks in ascending order.
-- 3. The `CASE` statements ensure that "NULL" is used for the name where the grade is lower than 8, while names are included for higher grades.

-- Explanation:
-- 1. In the CTE, I determine the grade for each student based on their marks using a `CASE` statement. This maps ranges of marks to the corresponding grades.
-- 2. The outer query selects the name, grade, and marks:
--    - If the grade is 8 or higher, the student's name is shown. Otherwise, it is set to `NULL`.
--    - The results are ordered by grade (descending).
--    - If grades are the same (for grades 8-10), I order by the student's name alphabetically.
--    - For grades 1-7, I order by the student's marks in ascending order.
