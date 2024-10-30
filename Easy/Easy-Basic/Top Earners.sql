-- Problem: Top Earners
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: Employee
-- +--------------+---------+
-- | Column       | Type    |
-- +--------------+---------+
-- | employee_id  | INTEGER |
-- | name         | VARCHAR |
-- | months       | INTEGER |
-- | salary       | INTEGER |
-- +--------------+---------+
-- The Employee table stores employee data including their ID, name, months worked, and monthly salary.

-- Problem Statement
-- 1. Calculate the maximum total earnings, where total earnings are defined as (salary * months worked).
-- 2. Determine the number of employees with these maximum total earnings.
-- 3. Print the result as space-separated integers.

-- Solution
SELECT 
    MAX(months * salary) AS max_earnings,
    COUNT(employee_id) AS employee_count
FROM 
    Employee
WHERE 
    (months * salary) = (
        SELECT MAX(months * salary) FROM Employee
    );

-- Intuition:
-- I need to identify the employees with the highest total earnings and count how many share that value.

-- Explanation:
-- 1. I calculate `months * salary` for each employee to determine their total earnings.
-- 2. The outer query retrieves the maximum total earnings using `MAX`.
-- 3. I use the `WHERE` clause to filter employees whose total earnings match the maximum.
-- 4. The `COUNT(employee_id)` helps me determine how many employees achieved the maximum earnings.
-- 5. The result is displayed as two space-separated integers: maximum earnings and the count of employees with those earnings.
