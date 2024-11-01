-- Problem: Weather Observation Station 19
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
-- Calculate the Euclidean Distance between two points P₁ (a, c) and P₂ (b, d), where:
-- - (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N).
-- - (c, d) are the respective minimum and maximum values of Western Longitude (LONG_W).
-- Round the result to four decimal digits.


SELECT 
    ROUND(SQRT(POW((MAX(LAT_N) - MIN(LAT_N)), 2) + POW((MAX(LONG_W) - MIN(LONG_W)), 2)), 4) AS distance
FROM 
    STATION;

-- Intuition:
-- I need to calculate the Euclidean Distance between two points in a 2D plane, 
-- which is determined by the Pythagorean theorem. The distance is the square root 
-- of the sum of the squares of the differences between the corresponding coordinates.

-- Explanation:
-- 1. `MAX(LAT_N)` retrieves the maximum Northern Latitude, representing the coordinate b.
-- 2. `MIN(LAT_N)` retrieves the minimum Northern Latitude, representing the coordinate a.
-- 3. `MAX(LONG_W)` retrieves the maximum Western Longitude, representing the coordinate d.
-- 4. `MIN(LONG_W)` retrieves the minimum Western Longitude, representing the coordinate c.
-- 5. `POW((MAX(LAT_N) - MIN(LAT_N)), 2)` calculates the square of the difference in Northern Latitude.
-- 6. `POW((MAX(LONG_W) - MIN(LONG_W)), 2)` calculates the square of the difference in Western Longitude.
-- 7. The sum of these two squared differences gives the squared distance between the points.
-- 8. `SQRT(...)` computes the square root of the sum, yielding the Euclidean Distance.
-- 9. Finally, `ROUND(..., 4)` rounds the result to four decimal places for precision.
