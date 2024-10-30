-- Problem: Weather Observation Station 15
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
-- Query the western longitude (LONG_W) for the largest LAT_N in STATION that is:
-- 1. Less than 137.2345.
-- 2. The result should be rounded to 4 decimal places.

-- Solution
SELECT 
    ROUND(LONG_W, 4) AS rounded_long_w 
FROM 
    STATION 
WHERE 
    LAT_N < 137.2345 
ORDER BY 
    LAT_N DESC 
LIMIT 1;

-- Intuition:
-- I want to retrieve the LONG_W value corresponding to the largest LAT_N below 137.2345. Sorting LAT_N in descending order and using `LIMIT 1` ensures we get the highest LAT_N in that range. Finally, I round the longitude value to 4 decimal places as required.

-- Explanation:
-- 1. The `WHERE` clause filters the rows to include only those where LAT_N is less than 137.2345.
-- 2. The `ORDER BY LAT_N DESC` sorts the results in descending order, with the largest LAT_N appearing first.
-- 3. The `LIMIT 1` ensures only the record with the highest LAT_N value is selected.
-- 4. The `ROUND()` function rounds the LONG_W value to 4 decimal places.
-- 5. An alias `rounded_long_w` makes the output more readable.
