-- Problem: Occupations
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: OCCUPATIONS
-- +-------------+------------+
-- | Column      | Type       |
-- +-------------+------------+
-- | Name        | STRING     |
-- | Occupation  | STRING     |
-- +-------------+------------+

-- Problem Statement:
-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation.
-- The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.
-- Note: Print NULL when there are no more names corresponding to an occupation.

WITH CTE AS (
    -- Creating a Common Table Expression (CTE) to assign a row number to each Name, partitioned by Occupation and ordered alphabetically
    SELECT 
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS row_num
    FROM occupations
)
SELECT
    -- For each occupation, using conditional aggregation (IF) to display the names under the corresponding column
    MIN(IF(occupation = 'DOCTOR', name, NULL)) AS DOCTOR,
    MIN(IF(occupation = 'PROFESSOR', name, NULL)) AS PROFESSOR,
    MIN(IF(occupation = 'SINGER', name, NULL)) AS SINGER,
    MIN(IF(occupation = 'ACTOR', name, NULL)) AS ACTOR
FROM CTE
GROUP BY row_num;

-- Intuition for the Solution:
-- The query uses a CTE to assign a `ROW_NUMBER()` to each Name, partitioned by `occupation` and ordered alphabetically. 
-- This allows for identifying the respective row numbers for each occupation (Doctor, Professor, Singer, and Actor).
-- Then, I use `MIN(IF(...))` in the main query to pivot the data: for each occupation, I return the name at that `row_num`, displaying the corresponding names for each occupation column. 
-- If a Name doesn't exist for an occupation at that row, NULL will be displayed due to the conditional `IF` clause.

-- Explanation:
-- 1. The `ROW_NUMBER()` function generates a row number for each name within the same occupation, sorted alphabetically.
-- 2. The `MIN(IF(...))` syntax is used to conditionally select the Name for each occupation. If the condition matches the occupation, the Name is shown; otherwise, NULL is returned.
-- 3. The `GROUP BY row_num` groups the rows by row number to pivot the data into the desired format, where each row contains one name for each occupation in a separate column.
