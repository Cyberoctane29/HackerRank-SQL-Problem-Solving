-- Problem: Weather Observation Station 5
-- Difficulty: Intermediate

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

-- Query for the city with the shortest name
SELECT CITY, LENGTH(CITY) AS Length 
FROM STATION 
ORDER BY LENGTH(CITY) ASC, CITY 
LIMIT 1;

-- Query for the city with the longest name
SELECT CITY, LENGTH(CITY) AS Length 
FROM STATION 
ORDER BY LENGTH(CITY) DESC, CITY 
LIMIT 1;

-- Intuition:
-- I want to identify both the shortest and longest city names from the STATION table.
-- By ordering the results by name length and then alphabetically, I can ensure that I select the appropriate cities.

-- Explanation:
-- 1. In the first query, I select the `CITY` and the length of the `CITY` name using `LENGTH(CITY)`.
-- 2. I order the results in ascending order based on the length of the city name, followed by alphabetical order.
-- 3. The `LIMIT 1` clause restricts the output to just the shortest city name.
-- 4. The second query follows the same logic but orders the results in descending order to find the longest city name.
