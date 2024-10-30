-- Problem: Weather Observation Station 17
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
-- Query the value of LONG_W where the smallest LAT_N greater than 38.7780 exists.
-- The result should be rounded to 4 decimal places.

-- Solution
SELECT 
    ROUND(LONG_W, 4) AS rounded_long_w 
FROM 
    STATION 
WHERE 
    LAT_N > 38.7780 
ORDER BY 
    LAT_N 
LIMIT 1;

-- Intuition:
-- I want to retrieve the western longitude (LONG_W) corresponding to the smallest LAT_N greater than 38.7780.
-- Sorting LAT_N in ascending order and using `LIMIT 1` ensures the correct latitude is selected.
-- The `ROUND()` function rounds LONG_W to 4 decimal places, as specified.

-- Explanation:
-- 1. The `WHERE` clause filters LAT_N values greater than 38.7780.
-- 2. The `ORDER BY LAT_N` sorts the results in ascending order to select the smallest LAT_N.
-- 3. The `LIMIT 1` ensures only the row with the smallest LAT_N is returned.
-- 4. The `ROUND()` function rounds the LONG_W value to 4 decimal places for formatting.
-- 5. An alias `rounded_long_w` makes the output more readable.
