-- Problem: Weather Observation Station 18
-- Difficulty: Medium
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
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Calculate the Manhattan Distance between two points P₁ and P₂ defined by the minimum and maximum values 
-- of Northern Latitude (LAT_N) and Western Longitude (LONG_W) in the STATION table, 
-- and round the result to four decimal places.

SELECT 
    ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4) AS distance
FROM 
    STATION;

-- Intuition:
-- I need to calculate the Manhattan Distance, which is the sum of the absolute differences 
-- between the corresponding coordinates of two points. In this case, the points are determined by 
-- the minimum and maximum values of LAT_N and LONG_W in the STATION table.

-- Explanation:
-- 1. `MAX(LAT_N)` retrieves the maximum value of Northern Latitude, which represents the coordinate c.
-- 2. `MIN(LAT_N)` retrieves the minimum value of Northern Latitude, which represents the coordinate a.
-- 3. `MAX(LONG_W)` retrieves the maximum value of Western Longitude, representing the coordinate d.
-- 4. `MIN(LONG_W)` retrieves the minimum value of Western Longitude, representing the coordinate b.
-- 5. `ABS(MAX(LAT_N) - MIN(LAT_N))` computes the absolute difference in the Northern Latitude between the two points.
-- 6. `ABS(MAX(LONG_W) - MIN(LONG_W))` computes the absolute difference in the Western Longitude between the two points.
-- 7. The sum of these two absolute differences gives the Manhattan Distance between the points P₁ and P₂.
-- 8. Finally, `ROUND(..., 4)` rounds the result to four decimal places for precision.
