-- Problem: Weather Observation Station 5
-- Difficulty: Easy
-- Skills: SQL(Intermediate)

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
-- The STATION table stores information about different weather stations, including their city, state, latitude, and longitude.
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths.
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

-- Solution

(
  SELECT city, LENGTH(city) AS len
  FROM STATION
  ORDER BY LENGTH(city) ASC, city
  LIMIT 1
)
UNION ALL
(
  SELECT city, LENGTH(city) AS len
  FROM STATION
  ORDER BY LENGTH(city) DESC, city
  LIMIT 1
);

-- Intuition:
-- We want to display both the shortest and longest city names from the STATION table in a single result set.
-- Using two ordered queries (one ascending for the shortest, one descending for the longest) and combining them with UNION ALL ensures both outputs appear together.

-- Explanation:
-- - The first SELECT retrieves the city with the minimum length, breaking ties alphabetically.
-- - The second SELECT retrieves the city with the maximum length, also breaking ties alphabetically.
-- - UNION ALL combines both queries into a single result set without removing duplicates.
-- - This approach returns exactly two rows: one for the shortest city name and one for the longest.