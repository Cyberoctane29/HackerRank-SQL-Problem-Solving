-- Problem: Select All
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
-- Query all columns (attributes) for every row in the CITY table.

-- Solution
SELECT * 
FROM CITY;

-- Intuition:
-- I want to retrieve all information about every city in the CITY table. 
-- Using `SELECT *` ensures that all columns (ID, NAME, COUNTRYCODE, DISTRICT, and POPULATION) are included in the output.

-- Explanation:
-- 1. I use the `SELECT *` statement to fetch every column from the CITY table.
-- 2. This query returns all rows and their complete data, making it useful for viewing the full dataset without any filters or conditions.
