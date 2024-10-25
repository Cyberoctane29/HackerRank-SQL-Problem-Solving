-- Problem: Revising Aggregations - Averages
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
-- Query the average population of all cities in the CITY table where the district is California.

-- Solution
SELECT AVG(POPULATION) AS average_population 
FROM CITY 
WHERE DISTRICT = 'California';

-- Intuition:
-- I want to calculate the average population of cities located in California. 
-- The AVG function will provide the mean population for the specified cities.

-- Explanation:
-- 1. I use `SELECT AVG(POPULATION)` to compute the average population of the cities that meet the criteria.
-- 2. The `WHERE` clause filters the records to only include cities in the district of California.
-- 3. The result is labeled as `average_population`, which represents the mean population of all cities in California.
