-- Problem: Ollivander's Inventory
-- Difficulty: Medium
-- Skills: SQL (Intermediate)

-- SQL Schema
-- Table: Wands
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | id           | Integer    |
-- | code         | Integer    |
-- | coins_needed | Integer    |
-- | power        | Integer    |
-- +--------------+------------+
-- Table: Wands_Property
-- +--------------+------------+
-- | Column       | Type       |
-- +--------------+------------+
-- | code         | Integer    |
-- | age          | Integer    |
-- | is_evil      | Integer    |
-- +--------------+------------+

-- Problem Statement
-- Query the id, age, coins_needed, and power of the wands that are non-evil
-- and have the minimum gold coins needed to buy them for each unique age and power combination.
-- The result should be sorted by power in descending order and, if powers are equal, by age in descending order.

-- Solution 1: Uses explicit grouping
SELECT w.id, wp.age, w.coins_needed, w.`power`
FROM wands AS w
LEFT JOIN wands_property AS wp ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM wands AS w1
    LEFT JOIN wands_property AS wp1 ON w1.code = wp1.code
    WHERE wp1.is_evil = 0
    AND wp.age = wp1.age
    AND w.`power` = w1.`power`
    GROUP BY wp1.age, w1.`power`
)
ORDER BY w.`power` DESC, wp.age DESC;

-- Intuition for Solution 1:
-- In this solution, I first use a subquery to find the minimum `coins_needed` for each unique combination of age and power.
-- The subquery groups by both `age` and `power`, ensuring that for each combination, only the wand with the lowest `coins_needed` is selected.
-- The main query selects the wand that matches the minimum `coins_needed` found in the subquery, ensuring that the wand is not evil (i.e., `wp.is_evil = 0`).
-- The result is then ordered by `power` in descending order, and by `age` in descending order when powers are equal.

-- Explanation for Solution 1:
-- 1. The main query uses a `LEFT JOIN` between `wands` and `wands_property` to get the `age` and `is_evil` status for each wand.
-- 2. The `WHERE` clause filters out evil wands (`wp.is_evil = 0`).
-- 3. The subquery calculates the minimum `coins_needed` for each combination of `age` and `power`, grouping by both `age` and `power`.
-- 4. The `ORDER BY` clause sorts the results by `power` in descending order and by `age` in descending order for wands with the same power.

-- Solution 2: Doesn't use explicit grouping
SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands AS w
LEFT JOIN Wands_Property AS wp ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w1.coins_needed)
    FROM Wands AS w1
    LEFT JOIN Wands_Property AS wp1 ON w1.code = wp1.code
    WHERE wp1.is_evil = 0 AND wp1.age = wp.age AND w1.power = w.power
)
ORDER BY w.power DESC, wp.age DESC;

-- Intuition for Solution 2:
-- This solution eliminates the need for explicit grouping by directly comparing the `coins_needed` of the wands that share the same `age` and `power`.
-- It avoids grouping by using a `WHERE` clause in the subquery to match the `age` and `power` directly with the corresponding values from the main query.
-- The subquery returns the minimum `coins_needed` for each `age` and `power` combination, ensuring that we only select the wand with the lowest cost.
-- The final result is sorted by `power` in descending order, and by `age` in descending order for wands with the same power.

-- Explanation for Solution 2:
-- 1. Similar to Solution 1, the query uses a `LEFT JOIN` to get the `age` and `is_evil` status for each wand.
-- 2. The `WHERE` clause filters out evil wands (`wp.is_evil = 0`).
-- 3. The subquery finds the minimum `coins_needed` for wands with the same `age` and `power`, but without using explicit grouping.
-- 4. The results are ordered by `power` in descending order, and by `age` in descending order for wands with the same power.
