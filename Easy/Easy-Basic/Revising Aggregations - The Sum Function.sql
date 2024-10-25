-- Problem: Revising Aggregations - The Sum Function
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
-- The CITY table contains information about various cities, including their populations and districts.

-- Problem Statement
-- Query the total population of all cities in the CITY table where the district is California.

-- Solution
SELECT SUM(POPULATION) AS total_population 
FROM CITY 
WHERE DISTRICT = 'California';

-- Intuition:
-- I aim to calculate the total population of cities located in California. 
-- The SUM function will aggregate the population values for all matching cities.

-- Explanation:
-- 1. I use `SELECT SUM(POPULATION)` to compute the total population of the specified cities.
-- 2. The `WHERE` clause restricts the selection to cities within the district of California.
-- 3. The result is returned with the alias `total_population`, representing the total population of all cities in California.
