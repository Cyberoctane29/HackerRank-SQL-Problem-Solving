-- Problem: Weather Observation Station 7
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
-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '[aeiou]$';

-- Intuition:
-- I aim to retrieve unique city names from the STATION table that end with a vowel.
-- Regular expressions provide a concise way to check the last character of each city name.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement is used to ensure that the results include only unique city names.
-- 2. The `WHERE` clause employs the `REGEXP` function to match city names that end with any of the vowels (a, e, i, o, u).
-- 3. The dollar sign (`$`) indicates the end of the string, ensuring that only names ending with these vowels are included.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE '%a'
   OR CITY LIKE '%e'
   OR CITY LIKE '%i'
   OR CITY LIKE '%o'
   OR CITY LIKE '%u';

-- Intuition:
-- I want to obtain a list of unique city names that conclude with vowels, and using the `LIKE` operator allows me to specify patterns directly.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement ensures that the result set does not contain any duplicate city names.
-- 2. The `WHERE` clause consists of multiple conditions, each using the `LIKE` operator to match city names that end with a specific vowel.
-- 3. The `%` wildcard signifies any sequence of characters that precedes the vowel, enabling flexibility in matching the full city name.
