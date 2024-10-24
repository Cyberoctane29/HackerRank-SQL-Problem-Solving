-- Problem: Higher Than 75 Marks
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: STUDENTS
-- +--------+---------+
-- | Column | Type    |
-- +--------+---------+
-- | ID     | Integer |
-- | NAME   | String  |
-- | MARKS  | Integer |
-- +--------+---------+
-- The `Name` column only contains uppercase (A-Z) and lowercase (a-z) letters.

-- Problem Statement
-- Query the `NAME` of any student in STUDENTS who scored higher than 75 marks.
-- Order your output by the last three characters of each name.
-- If two or more students share the same last three characters, sort them by ascending `ID` as a secondary criterion.

-- Solution
SELECT NAME 
FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY SUBSTRING(NAME, LENGTH(NAME) - 2, 3), ID;

-- Intuition:
-- I want to retrieve the names of students who scored above 75 marks and sort them based on specific criteria.
-- The main sorting is by the last three characters of each name, and the secondary sorting ensures that ties are broken by `ID` in ascending order.

-- Explanation:
-- 1. I use the `SELECT` statement to retrieve the `NAME` of students who have marks greater than 75.
-- 2. The `ORDER BY` clause uses `SUBSTRING(NAME, LENGTH(NAME) - 2, 3)`:
--    - `LENGTH(NAME) - 2` identifies the starting position for the last three characters.
--    - `SUBSTRING` extracts exactly three characters starting from this position.
-- 3. As a secondary sorting condition, I sort by `ID` to ensure consistent ordering when two or more names end with the same last three characters.
