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

-- Problem Statement
-- Generate a report containing three columns: Name, Grade, and Mark.
-- Exclude the names of students who received a grade lower than 8.
-- If a student has a grade of 8 or higher, order them by grade descending and by name alphabetically.
-- For students with a grade lower than 8, show "NULL" as their name and order by grade descending, then by marks ascending.
-- Sort the final report by grade and apply the respective ordering rules for each case.

-- Solution: Using Common Table Expressions (CTEs)

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

-- Selecting and sorting the final result
SELECT 
    CASE 
        WHEN grade >= 8 THEN name 
        ELSE NULL 
    END AS name, 
    grade, 
    marks 
FROM CTE
ORDER BY 
    grade DESC, 
    CASE 
        WHEN grade >= 8 THEN name  -- Order alphabetically by name if grade >= 8
        WHEN grade < 8 THEN marks  -- Order by marks ascending if grade < 8
        ELSE NULL 
    END;
    
-- Intuition for Solution:
-- I use a Common Table Expression (CTE) to first assign grades to students based on their marks.
-- The grades are calculated using a `CASE` statement, where each range of marks is assigned a grade between 1 to 10.
-- After that, in the main query, I conditionally select the student's name for grades 8 or higher and use "NULL" for those with a grade lower than 8.
-- The results are ordered by the grade in descending order, with students with grades 8 or higher being ordered alphabetically by name.
-- For students with a grade lower than 8, they are ordered by marks in ascending order.

-- Explanation:
-- 1. The CTE first calculates the grade for each student based on their marks.
-- 2. The final result is retrieved, showing the student’s name if their grade is 8 or higher, and "NULL" if the grade is lower than 8.
-- 3. The report is sorted first by grade in descending order, then by name (alphabetically for grades 8-10) or by marks (ascending for grades 1-7).
