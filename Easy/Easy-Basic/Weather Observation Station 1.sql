-- Problem: Weather Observation Station 1
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
-- The STATION table stores information about different weather stations, including their city, state, latitude, and longitude.
-- LAT_N is the northern latitude and LONG_W is the western longitude.

-- Problem Statement
-- Query a list of CITY and STATE from the STATION table.

-- Solution
SELECT CITY, STATE 
FROM STATION;

-- Intuition:
-- I want to retrieve the city and state for each weather station. Since the focus is only on these two attributes, I select them specifically from the table.

-- Explanation:
-- 1. I use the `SELECT` statement to query the `CITY` and `STATE` columns from the STATION table.
-- 2. This query returns a list of all cities and their corresponding states from the weather station records.
