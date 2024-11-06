-- Problem: Weather Observation Station 20
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

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
-- Query the median value of LAT_N from STATION, rounded to 4 decimal places.
-- The median separates the higher half from the lower half in an ordered list.

-- Solution
WITH CTE AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn, 
        LAT_N 
    FROM 
        STATION
)
SELECT 
    ROUND(LAT_N, 4) AS median_latitude
FROM 
    CTE
WHERE 
    rn = (SELECT FLOOR((COUNT(*) + 1) / 2) FROM STATION);

-- Intuition:
-- I calculate the row number for each LAT_N value in ascending order using ROW_NUMBER().
-- To find the median, I locate the middle row based on the total count of records.
-- Using `FLOOR((COUNT(*) + 1) / 2)` finds the median position for both odd and even counts.

-- Explanation:
-- 1. The CTE assigns a unique row number (`rn`) to each latitude (LAT_N) in ascending order.
-- 2. The main query selects the LAT_N value with the row number equal to the median position.
-- 3. `ROUND()` rounds the LAT_N value to 4 decimal places as required.
-- 4. Using the `FLOOR((COUNT(*) + 1) / 2)` formula returns the middle row for an odd count or the upper middle for an even count.
