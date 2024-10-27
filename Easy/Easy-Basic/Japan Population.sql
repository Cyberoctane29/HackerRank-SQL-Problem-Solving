-- Problem: Japan Population
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
-- The CITY table stores data about cities, including their population and country codes.

-- Problem Statement
-- Query the total population of all Japanese cities. The `COUNTRYCODE` for Japan is 'JPN'.

-- Solution
SELECT SUM(POPULATION) AS total_population 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- Intuition:
-- I need to sum the populations of all cities that belong to Japan, identified by the country code 'JPN'.

-- Explanation:
-- 1. I use `SUM(POPULATION)` to calculate the total population for Japanese cities.
-- 2. The `WHERE` clause filters the rows to include only those with `COUNTRYCODE = 'JPN'`.
-- 3. The result is labeled as `total_population` to clearly indicate the output value.
