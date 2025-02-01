-- Problem: Print Prime Numbers
-- Difficulty: Medium
-- Skills: SQL (Advanced)

-- SQL Schema: There are no specific tables for this problem. We're generating numbers using a recursive CTE.

-- Problem Statement:
-- Write a query to print all prime numbers less than or equal to 1000.
-- Print the result on a single line, using the ampersand (&) character as the separator instead of a space.

-- For example, the output for all prime numbers ≤ 10 would be: 
-- 2&3&5&7

-- Solution 1: Basic prime checking (no optimization)
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM numbers WHERE num < 1000
),
prime AS (
    SELECT num
    FROM numbers n
    WHERE NOT EXISTS (
        SELECT 1 
        FROM numbers n1
        WHERE n.num % n1.num = 0 AND n.num != n1.num
    )
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS pnums 
FROM prime;

-- Intuition for Solution 1:
-- In this solution, I generate all numbers starting from 2 up to 1000 using a recursive CTE.
-- Then, I identify primes by ensuring that no other number divides it (other than 1 and itself).
-- The prime numbers are selected and concatenated into a single string using the `GROUP_CONCAT` function, with '&' as the separator.

-- Explanation:
-- 1. The `WITH RECURSIVE numbers` CTE generates all integers from 2 to 1000.
-- 2. The `prime` CTE filters out non-prime numbers by checking each number against the others using the condition:
--    "NOT EXISTS" ensures the number is only divisible by 1 and itself.
-- 3. The prime numbers are concatenated into a single string, separated by the '&' character using `GROUP_CONCAT`.
-- 4. The result is printed in a single line as required.

-- Solution 2: Optimized prime checking with square root limit
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM numbers WHERE num < 1000
),
prime AS (
    SELECT num
    FROM numbers n
    WHERE NOT EXISTS (
        SELECT 1
        FROM numbers n1
        WHERE n1.num <= FLOOR(SQRT(n.num))  
        AND n.num % n1.num = 0
        AND n.num != n1.num
    )
)
SELECT GROUP_CONCAT(num SEPARATOR '&') AS pnums 
FROM prime;

-- Intuition for Solution 2:
-- This solution optimizes the prime checking by limiting the range of numbers to check for divisibility up to the square root of the number.
-- Numbers that have divisors larger than their square root are already handled by smaller divisors.
-- The rest of the approach remains the same as in Solution 1.

-- Explanation:
-- 1. The `WITH RECURSIVE numbers` CTE generates all integers from 2 to 1000.
-- 2. The `prime` CTE now optimizes the prime checking by limiting divisibility checks to numbers less than or equal to the square root of each number (`FLOOR(SQRT(n.num))`).
-- 3. The rest of the logic is identical to Solution 1, where the prime numbers are concatenated into a single string with '&' as the separator.