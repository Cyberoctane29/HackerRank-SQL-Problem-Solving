-- Problem: The PADS
-- Difficulty: Medium
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: OCCUPATIONS
-- +---------+--------------+
-- | Column  | Type         |
-- +---------+--------------+
-- | Name    | String       |
-- | Occupation| String     |
-- +---------+--------------+

-- Problem Statement
-- Generate two result sets:
-- 1. An alphabetically ordered list of all names in OCCUPATIONS, 
--    followed by the first letter of each profession in parentheses.
-- 2. The number of occurrences of each occupation, formatted and sorted.

-- First Query
SELECT 
    CONCAT(name, '(', LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY name;

-- Intuition for the First Query:
-- I want to display each person's name immediately followed by the first letter 
-- of their occupation enclosed in parentheses. This can be achieved by combining 
-- simple string concatenation with the LEFT function.

-- Explanation for the First Query:
-- 1. `LEFT(Occupation, 1)` extracts the first character of the occupation (e.g., 'D' for Doctor).
-- 2. `'('` and `')'` are added around the extracted letter to form the desired format.
-- 3. `CONCAT(name, '(', LEFT(Occupation, 1), ')')` merges the name with the formatted occupation initial.
-- 4. The `ORDER BY name` clause arranges the output alphabetically by name.

-- Second Query
SELECT 
    CONCAT('There are a total of ', COUNT(Occupation), ' ', 
           CONCAT(LOWER(LEFT(Occupation, 1)), SUBSTRING(Occupation, 2)), 's.')
FROM 
    OCCUPATIONS 
GROUP BY 
    Occupation 
ORDER BY 
    COUNT(Occupation), 
    Occupation;

-- Intuition for the Second Query:
-- I need to count how many times each occupation appears in the OCCUPATIONS table 
-- and present the results in a specific sentence format while sorting them appropriately.

-- Explanation for the Second Query:
-- 1. `COUNT(Occupation)` calculates the number of occurrences of each occupation.
-- 2. `LOWER(LEFT(Occupation, 1))` retrieves the first letter of the occupation and converts it to lowercase.
-- 3. `SUBSTRING(Occupation, 2)` gets the rest of the occupation name starting from the second character.
-- 4. `CONCAT('There are a total of ', ...)` constructs the final output string for each occupation.
-- 5. The `GROUP BY Occupation` clause groups the results by each occupation to calculate the count.
-- 6. The `ORDER BY COUNT(Occupation), Occupation` clause sorts the results first by the count of occurrences in ascending order and then alphabetically by occupation name.
