-- Problem: Weather Observation Station 2
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
-- 1. Query the sum of all values in the `LAT_N` column, rounded to 2 decimal places.
-- 2. Query the sum of all values in the `LONG_W` column, also rounded to 2 decimal places.

-- Solution
SELECT 
    ROUND(SUM(LAT_N), 2) AS lat_sum, 
    ROUND(SUM(LONG_W), 2) AS long_sum 
FROM 
    STATION;

-- Intuition:
-- I need to calculate the total sum of the `LAT_N` and `LONG_W` columns and ensure the results are rounded to 2 decimal places for precision.

-- Explanation:
-- 1. I use the `SUM()` function to compute the total of all `LAT_N` and `LONG_W` values.
-- 2. The `ROUND()` function ensures that the results are displayed to exactly 2 decimal places.
-- 3. The two sums are returned with aliases `lat_sum` and `long_sum` for clarity.
