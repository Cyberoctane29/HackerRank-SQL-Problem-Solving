-- Problem: Japanese Cities' Names
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
-- The CITY table contains data about various cities, including their names, country codes, districts, and populations.

-- Problem Statement
-- Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is 'JPN'.

-- Solution
SELECT NAME 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- Intuition:
-- I want to retrieve only the names of cities located in Japan, so I filter for rows where the `COUNTRYCODE` is 'JPN'.
-- Since the task focuses on city names, I select only the `NAME` column.

-- Explanation:
-- 1. I use the `SELECT` statement to query the `NAME` column from the CITY table.
-- 2. The `WHERE` clause filters out rows where the `COUNTRYCODE` is not 'JPN', ensuring only Japanese cities are included.
-- 3. This query will return a list of city names corresponding to all Japanese cities in the database.
