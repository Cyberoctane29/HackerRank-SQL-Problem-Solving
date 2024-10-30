-- Problem: Average Population of Each Continent
-- Difficulty: Easy
-- Skills: SQL (Basic)

-- SQL Schema
-- Table: CITY
-- +-----------+--------------+
-- | Column    | Type         |
-- +-----------+--------------+
-- | ID        | NUMBER       |
-- | NAME      | VARCHAR2(17) |
-- | COUNTRYCODE| VARCHAR2(3) |
-- | DISTRICT  | VARCHAR2(20) |
-- | POPULATION| NUMBER       |
-- +-----------+--------------+

-- Table: COUNTRY
-- +-----------+--------------+
-- | Column    | Type         |
-- +-----------+--------------+
-- | CODE      | VARCHAR2(3)  |
-- | NAME      | VARCHAR2(44) |
-- | CONTINENT | VARCHAR2(13) |
-- | REGION    | VARCHAR2(25) |
-- | SURFACEAREA| NUMBER      |
-- | INDEPYEAR | VARCHAR2(5)  |
-- | POPULATION| NUMBER       |
-- | LIFEEXPECTANCY| VARCHAR2(4) |
-- | GNP       | NUMBER       |
-- | GNPOLD    | VARCHAR2(9)  |
-- | LOCALNAME | VARCHAR2(44) |
-- | GOVERNMENTFORM| VARCHAR2(44) |
-- | HEADOFSTATE| VARCHAR2(32) |
-- | CAPITAL   | VARCHAR2(4)  |
-- | CODE2     | VARCHAR2(2)  |
-- +-----------+--------------+

-- Problem Statement
-- Query the names of all continents and their respective average city populations, rounded down to the nearest integer.

-- Solution
SELECT 
    co.continent, 
    FLOOR(AVG(c.POPULATION)) AS average_population 
FROM 
    CITY AS c 
JOIN 
    COUNTRY AS co 
ON 
    c.COUNTRYCODE = co.CODE 
GROUP BY 
    co.continent;

-- Intuition:
-- I need to calculate the average population of cities for each continent, linking the CITY and COUNTRY tables through the COUNTRYCODE.
-- The FLOOR function ensures that the average is rounded down to the nearest integer.

-- Explanation:
-- 1. The `JOIN` clause combines the CITY and COUNTRY tables using the COUNTRYCODE from CITY and CODE from COUNTRY as the matching keys.
-- 2. The `AVG(c.POPULATION)` function computes the average population of cities for each continent.
-- 3. The `FLOOR()` function is applied to the average to round down to the nearest integer.
-- 4. The `GROUP BY co.continent` clause groups the results by continent to produce separate average calculations for each continent.
