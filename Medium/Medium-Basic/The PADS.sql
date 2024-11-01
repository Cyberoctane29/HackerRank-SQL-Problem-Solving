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
    CONCAT(name, 
           RPAD(LPAD(LEFT(Occupation, 1), 2, '('), 3, ')')
          ) 
FROM 
    OCCUPATIONS 
ORDER BY 
    name;

-- Intuition for the First Query:
-- I want to create a formatted string for each name that includes the first letter of their occupation in parentheses. 
-- This involves string manipulation functions to achieve the desired format.

-- Explanation for the First Query:
-- 1. `LEFT(Occupation, 1)` retrieves the first letter of the occupation.
-- 2. `LPAD(..., 2, '(')` pads the letter with an opening parenthesis to align it with the rest of the name.
-- 3. `RPAD(..., 3, ')')` adds a closing parenthesis after the letter.
-- 4. `CONCAT(name, ...)` combines the name with the formatted occupation letter.
-- 5. The `ORDER BY name` clause sorts the results alphabetically by name.

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
