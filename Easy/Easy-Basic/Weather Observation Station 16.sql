-- Problem: Weather Observation Station 16
-- Difficulty: Easy
-- Skills: SQL (Basic)

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
-- LAT_N is the northern latitude, and LONG_W is the western longitude.

-- Problem Statement
-- Query the smallest LAT_N from the STATION table that is greater than 38.7780.
-- The result should be rounded to 4 decimal places.

-- Solution
SELECT 
    ROUND(LAT_N, 4) AS rounded_lat_n 
FROM 
    STATION 
WHERE 
    LAT_N > 38.7780 
ORDER BY 
    LAT_N 
LIMIT 1;

-- Intuition:
-- I want to retrieve the smallest LAT_N value greater than 38.7780. 
-- Sorting LAT_N in ascending order and using `LIMIT 1` ensures we get the smallest value that meets the condition. 
-- The `ROUND()` function formats the result to 4 decimal places, as required.

-- Explanation:
-- 1. The `WHERE` clause filters for LAT_N values greater than 38.7780.
-- 2. The `ORDER BY LAT_N` sorts the results in ascending order.
-- 3. The `LIMIT 1` ensures we select the smallest LAT_N greater than 38.7780.
-- 4. The `ROUND()` function rounds the result to 4 decimal places.
-- 5. An alias `rounded_lat_n` makes the output more understandable.
