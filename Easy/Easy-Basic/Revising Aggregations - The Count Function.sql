-- Problem: Revising Aggregations - The Count Function
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
-- The CITY table contains information about different cities, including their population.

-- Problem Statement
-- Query a count of the number of cities in the CITY table having a population larger than 100,000.

-- Solution
SELECT COUNT(ID) AS cnt 
FROM CITY 
WHERE POPULATION > 100000;

-- Intuition:
-- I want to find out how many cities have a population exceeding 100,000. 
-- The COUNT function will help me tally the total number of such cities efficiently.

-- Explanation:
-- 1. I use the `SELECT COUNT(ID)` statement to count the number of rows where the condition is met.
-- 2. The `WHERE` clause filters the rows to include only those with a `POPULATION` greater than 100,000.
-- 3. The result is returned with the alias `cnt`, which represents the count of cities that satisfy the specified condition.
