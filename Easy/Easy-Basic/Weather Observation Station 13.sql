-- Problem: Weather Observation Station 13
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
-- Query the sum of Northern Latitudes (LAT_N) from the STATION table where:
-- 1. LAT_N is greater than 38.7880.
-- 2. LAT_N is less than 137.2345.
-- 3. The result should be truncated to 4 decimal places.

-- Solution
SELECT 
    TRUNCATE(SUM(LAT_N), 4) AS lat_sum 
FROM 
    STATION 
WHERE 
    LAT_N > 38.7880 
    AND LAT_N < 137.2345;

-- Intuition:
-- I need to filter rows where the LAT_N values fall within the specified range, calculate the total sum, and then truncate the result to 4 decimal places.

-- Explanation:
-- 1. The `WHERE` clause ensures only rows with LAT_N between 38.7880 and 137.2345 are included.
-- 2. The `SUM()` function computes the total sum of the filtered LAT_N values.
-- 3. The `TRUNCATE()` function ensures the result is truncated to exactly 4 decimal places, avoiding any rounding.
-- 4. The alias `lat_sum` gives clarity to the result.