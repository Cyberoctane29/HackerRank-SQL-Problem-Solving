-- Problem: Select By ID
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
-- The CITY table contains information about cities, such as their ID, name, country code, district, and population.

-- Problem Statement
-- Query all columns for a city in the CITY table with the ID 1661.

-- Solution
SELECT * 
FROM CITY 
WHERE ID = 1661;

-- Intuition:
-- I want to retrieve complete information about the city that has the specific ID of 1661. 
-- Using the `WHERE` clause helps me filter the results to return only the row where the `ID` matches 1661.

-- Explanation:
-- 1. I use `SELECT *` to fetch all columns from the CITY table, ensuring I get every detail about the matching city.
-- 2. The `WHERE ID = 1661` condition limits the result to the city with that specific ID.
-- 3. This query returns one row with the full set of attributes for the city, making it efficient for targeted lookups.
