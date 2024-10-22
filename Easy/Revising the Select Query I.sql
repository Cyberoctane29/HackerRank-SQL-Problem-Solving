-- Problem: Revising the Select Query I
-- Difficulty: Easy

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
-- The CITY table contains information about cities, including their ID, name, country code, district, and population.

-- Problem Statement
-- Query all columns for all American cities in the CITY table with populations larger than 100000.
-- The CountryCode for America is USA.

-- Solution
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

-- Intuition:
-- I want to retrieve all details for American cities that have a population greater than 100,000. 
-- By filtering for the country code "USA," I can focus specifically on cities located in the United States.

-- Explanation:
-- 1. I use the `SELECT *` statement to select all columns from the CITY table.
-- 2. In the `WHERE` clause, I specify the condition that the `COUNTRYCODE` must be "USA" to ensure I only include American cities.
-- 3. I also include a condition that the `POPULATION` must exceed 100,000 to filter the results according to the specified criteria.
