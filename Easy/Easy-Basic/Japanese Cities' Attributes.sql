-- Problem: Japanese Cities' Attributes
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
-- The CITY table contains data about various cities, including their IDs, names, country codes, districts, and populations.

-- Problem Statement
-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is 'JPN'.

-- Solution
SELECT * 
FROM CITY 
WHERE COUNTRYCODE = 'JPN';

-- Intuition:
-- I want to retrieve all details for cities located in Japan, so I filter for the rows where the `COUNTRYCODE` is 'JPN'. 
-- Using `SELECT *` ensures that I get every attribute for each matching city.

-- Explanation:
-- 1. I use `SELECT *` to fetch all columns from the CITY table, returning complete details for the relevant cities.
-- 2. The `WHERE` clause ensures only cities with the `COUNTRYCODE` set to 'JPN' are included in the result.
-- 3. This query will return one or more rows containing all attributes for Japanese cities.
