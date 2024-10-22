-- Problem: Revising the Select Query II
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
-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
-- The CountryCode for America is 'USA'.

-- Solution
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'USA' 
  AND POPULATION > 120000;

-- Intuition:
-- I want to retrieve the names of American cities that have a population greater than 120,000. 
-- By focusing on the NAME field and filtering for the country code 'USA,' I ensure the results only include relevant cities from the United States.

-- Explanation:
-- 1. I use the `SELECT` statement to retrieve only the NAME field from the CITY table.
-- 2. In the `WHERE` clause, I specify that the `COUNTRYCODE` must be 'USA' to limit the query to American cities.
-- 3. I also add a condition that the `POPULATION` must exceed 120,000 to meet the problem's requirements.
