-- Problem: Weather Observation Station 14
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
-- Query the greatest value of LAT_N from the STATION table that is:
-- 1. Less than 137.2345.
-- 2. The result should be truncated to 4 decimal places.

-- Solution
SELECT 
    TRUNCATE(LAT_N, 4) AS greatest_lat 
FROM 
    STATION 
WHERE 
    LAT_N < 137.2345 
ORDER BY 
    LAT_N DESC 
LIMIT 1;

-- Intuition:
-- I want to find the maximum LAT_N value that is below 137.2345. Sorting the results in descending order ensures the largest value appears first, and `LIMIT 1` retrieves only that value. Finally, I truncate the result to 4 decimal places to meet the problem's requirement.

-- Explanation:
-- 1. The `WHERE` clause filters the rows to include only those with LAT_N less than 137.2345.
-- 2. The `ORDER BY LAT_N DESC` sorts the filtered rows in descending order by LAT_N.
-- 3. The `LIMIT 1` ensures that only the greatest value is selected.
-- 4. The `TRUNCATE()` function trims the result to 4 decimal places without rounding.
-- 5. The alias `greatest_lat` makes the output clearer.