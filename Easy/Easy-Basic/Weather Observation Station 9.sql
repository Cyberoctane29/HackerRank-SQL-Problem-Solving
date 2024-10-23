-- Problem: Weather Observation Station 9
-- Difficulty: Basic

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
-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

-- Solution 1: Using Regular Expressions
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY REGEXP '^[^aeiou]';

-- Intuition:
-- I want to retrieve unique city names that do not begin with a vowel.
-- Using regular expressions allows for a straightforward way to specify this condition.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement is utilized to ensure that the results are free of duplicate city names.
-- 2. The `WHERE` clause employs the `REGEXP` function with a pattern that matches any city name starting with a character that is not a vowel (`^` denotes the start of the string, and `[^aeiou]` indicates "not a vowel").
-- 3. This effectively filters the city names, returning only those that begin with consonants.

-- Solution 2: Using the LIKE Operator
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT LIKE 'a%' 
  AND CITY NOT LIKE 'e%' 
  AND CITY NOT LIKE 'i%' 
  AND CITY NOT LIKE 'o%' 
  AND CITY NOT LIKE 'u%';

-- Intuition:
-- I want to obtain a list of unique city names that do not start with any vowel.
-- The `LIKE` operator provides a clear way to define patterns for names that should be excluded.

-- Explanation:
-- 1. The `SELECT DISTINCT` statement ensures that only unique city names are returned.
-- 2. The `WHERE` clause contains multiple conditions that check for city names starting with each vowel using the `LIKE` operator.
-- 3. By combining these conditions with `AND`, the query filters out any city names that begin with a vowel, returning only those that start with consonants.
