-- Problem: Employee Names
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
-- The `employee_id` is an employee's ID number, `name` is their name, `months` is the number of months they have worked for the company, and `salary` is their monthly salary.

-- Problem Statement
-- Write a query to print a list of employee names in alphabetical order.

-- Solution
SELECT name 
FROM Employee 
ORDER BY name;

-- Intuition:
-- I need to retrieve all employee names and display them in alphabetical order. Sorting by the `name` column ensures that the output is in the correct sequence.

-- Explanation:
-- 1. I use the `SELECT` statement to retrieve the `name` column from the Employee table.
-- 2. The `ORDER BY` clause sorts the employee names in ascending alphabetical order by default.
-- 3. No filtering is required, so all names from the table are included in the result.
