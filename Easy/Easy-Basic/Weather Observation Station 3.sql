-- Problem: Weather Observation Station 3
-- Difficulty: Easy

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
-- The STATION table stores information about weather stations, including their city, state, latitude, and longitude.
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query a list of CITY names from the STATION table for cities that have an even ID number.
-- Print the results in any order, but exclude duplicates from the answer.

-- Solution
SELECT DISTINCT CITY 
FROM STATION 
WHERE MOD(ID, 2) = 0;

-- Intuition:
-- I want to retrieve a list of unique city names where the ID is an even number. The focus is on filtering out duplicates.

-- Explanation:
-- 1. I use the `SELECT DISTINCT` statement to ensure that the result contains only unique city names, even if there are duplicates in the table.
-- 2. The `WHERE` clause checks if the station's ID is even using the `MOD` function, which returns the remainder of the division of ID by 2.
-- 3. If the remainder is 0, the ID is even, and the city is included in the result.
-- 4. The query doesn't require sorting, so the results can appear in any order.
