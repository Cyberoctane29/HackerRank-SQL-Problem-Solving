-- Problem: Employee Salaries
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: Employee
-- +--------------+---------+
-- | Column       | Type    |
-- +--------------+---------+
-- | employee_id  | Integer |
-- | name         | String  |
-- | months       | Integer |
-- | salary       | Integer |
-- +--------------+---------+
-- The `employee_id` is an employee's ID number, `name` is their name, `months` represents the number of months they have worked for the company, and `salary` is their monthly salary.

-- Problem Statement
-- Write a query to print the names of employees with a salary greater than $2000 per month and who have worked for less than 10 months. 
-- The result should be sorted by ascending `employee_id`.

-- Solution
SELECT name 
FROM Employee 
WHERE salary > 2000 
  AND months < 10 
ORDER BY employee_id;

-- Intuition:
-- I want to retrieve the names of employees who meet two conditions: earning a salary greater than $2000 and working for fewer than 10 months. Sorting by `employee_id` ensures the output is ordered by the employee's unique ID.

-- Explanation:
-- 1. I use the `SELECT` statement to retrieve the `name` column from the Employee table.
-- 2. The `WHERE` clause filters employees whose `salary` is greater than 2000 and who have been employed for fewer than 10 months.
-- 3. I sort the result using `ORDER BY employee_id` to display the names in ascending order of their IDs.
