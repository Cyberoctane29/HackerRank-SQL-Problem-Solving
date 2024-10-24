-- Problem: Weather Observation Station 6
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
-- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[aeiou]';

-- Intuition:
-- I want to retrieve unique city names from the STATION table that begin with a vowel.
-- Using a regular expression allows me to check the starting character of each city name efficiently.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement is used to ensure that the results do not include duplicate city names.
-- 2. The `WHERE` clause utilizes the `REGEXP` function to match city names that start with any of the vowels (a, e, i, o, u).
-- 3. The caret (`^`) indicates the beginning of the string, ensuring that only names starting with these vowels are considered.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE 'a%'
   OR CITY LIKE 'e%'
   OR CITY LIKE 'i%'
   OR CITY LIKE 'o%'
   OR CITY LIKE 'u%';

-- Intuition:
-- I want to obtain a list of unique city names that start with vowels, and using the `LIKE` operator allows me to specify patterns directly.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement again ensures that there are no duplicate entries in the result.
-- 2. The `WHERE` clause includes multiple conditions, each using the `LIKE` operator to match city names that start with a specific vowel.
-- 3. The `%` wildcard represents any sequence of characters that follows the vowel, allowing for flexibility in matching the entire city name.
