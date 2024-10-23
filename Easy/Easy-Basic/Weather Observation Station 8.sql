-- Problem: Weather Observation Station 8
-- Difficulty: Basic

-- SQL Schema
-- Table: STATION
-- +--------+--------------+
-- | Column | Type         |
-- +--------+--------------+
-- | ID     | NUMBER       |
-- | CITY   | VARCHAR2(21) |
-- | STATE  | VARCHAR2(2)  |
-- | LAT_N  | NUMBER       |
-- | LONG_W | NUMBER       |
-- +--------+--------------+
-- The STATION table stores information about different weather stations, including their city, state, latitude, and longitude.
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

-- Solution
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou].*[aeiou]$';

-- Intuition:
-- I want to retrieve unique city names from the STATION table that start and end with vowels. 
-- Using regular expressions allows for a flexible match of patterns in the city names.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement is employed to ensure that the output includes only unique city names, avoiding duplicates.
-- 2. The `WHERE` clause utilizes the `REGEXP` function to define a pattern: 
--    - `^[aeiou]` checks that the first character is a vowel (a, e, i, o, or u).
--    - `.*` allows for any characters in between, ensuring that the entire name is considered.
--    - `[aeiou]$` checks that the last character is also a vowel.
-- 3. This query effectively filters city names based on the specified vowel criteria.