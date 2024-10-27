-- Problem: Population Density Difference
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: CITY
-- +-----------+--------------+
-- | Column    | Type         |
-- +-----------+--------------+
-- | ID        | NUMBER       |
-- | NAME      | VARCHAR2(17) |
-- | COUNTRYCODE| VARCHAR2(3) |
-- | DISTRICT  | VARCHAR2(20) |
-- | POPULATION| NUMBER       |
-- +-----------+--------------+
-- The CITY table contains information about cities, including their population sizes.

-- Problem Statement
-- Query the difference between the maximum and minimum populations in the CITY table.

-- Solution
SELECT MAX(POPULATION) - MIN(POPULATION) AS population_difference 
FROM CITY;

-- Intuition:
-- I need to calculate the difference between the largest and smallest population values across all cities.

-- Explanation:
-- 1. I use `MAX(POPULATION)` to find the largest population value.
-- 2. Similarly, I use `MIN(POPULATION)` to find the smallest population value.
-- 3. Subtracting the minimum from the maximum gives the population difference.
-- 4. The result is labeled as `population_difference` for clarity.
