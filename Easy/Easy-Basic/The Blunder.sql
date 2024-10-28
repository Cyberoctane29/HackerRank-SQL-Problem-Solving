-- Problem: The Blunder
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: EMPLOYEES
-- +------+--------------+
-- | Column | Type        |
-- +------+--------------+
-- | ID   | INTEGER     |
-- | Name | VARCHAR(255) |
-- | Salary | INTEGER    |
-- +------+--------------+
-- The EMPLOYEES table stores information about employees, including their monthly salaries.

-- Problem Statement
-- Calculate the difference between the actual average salary and the average salary after removing zeros from each salary.
-- Round the result up to the next integer.

-- Constraints
-- 1000 < Salary < 10^5

-- Solution
SELECT 
    CEIL(AVG(Salary) - AVG(CAST(REPLACE(CAST(Salary AS CHAR), '0', '') AS SIGNED))) AS result 
FROM 
    EMPLOYEES;

-- Intuition:
-- I want to find out how much Samantha's miscalculation differs from the actual average salary due to her mistake of removing zeros.

-- Explanation:
-- 1. I use `AVG(Salary)` to calculate the actual average salary of all employees.
-- 2. To find Samantha's miscalculation, I remove zeros from each salary using `REPLACE`, cast the result back to an integer using `CAST`, and then calculate the average of these adjusted salaries with `AVG`.
-- 3. The difference between the two averages is calculated, and I apply `CEIL` to round the result up to the next integer.
-- 4. The final result is labeled as `result` for clarity.
