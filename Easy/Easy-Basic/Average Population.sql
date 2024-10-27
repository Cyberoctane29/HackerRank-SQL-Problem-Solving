-- Problem: Average Population
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
-- The CITY table stores data about cities, including their population counts.

-- Problem Statement
-- Query the average population of all cities, rounded down to the nearest integer.

-- Solution
SELECT FLOOR(AVG(POPULATION)) AS average_population 
FROM CITY;

-- Intuition:
-- I want to calculate the mean population for all cities and ensure the result is rounded down to the nearest integer.

-- Explanation:
-- 1. I use `AVG(POPULATION)` to compute the average population of all cities.
-- 2. The `FLOOR` function ensures that the average value is rounded down to the nearest integer, as required.
-- 3. The result is labeled as `average_population` to indicate the rounded average population across all cities.
