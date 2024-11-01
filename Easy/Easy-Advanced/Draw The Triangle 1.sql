-- Problem: Draw The Triangle 1
-- Difficulty: Easy
-- Skills: SQL (Advanced)

-- Problem Statement
-- Write a query to print a pattern that represents P(R) with R rows, where R = 20.

-- Solution
DELIMITER //

CREATE PROCEDURE print_stars(IN R INT)
BEGIN
    DECLARE counter INT DEFAULT R;

    WHILE counter > 0 DO
        SELECT REPEAT("* ", counter);
        SET counter = counter - 1;
    END WHILE;
END //

DELIMITER ;

CALL print_stars(20);

-- Intuition:
-- I need to create a stored procedure that prints a pattern of stars, decreasing by one star on each new line.
-- The REPEAT function is useful for generating the necessary number of stars.

-- Explanation:
-- 1. The procedure `print_stars` takes an integer `R` as input, representing the number of rows to print.
-- 2. The `DECLARE` statement initializes a counter to `R`.
-- 3. The `WHILE` loop continues as long as the counter is greater than zero.
-- 4. Inside the loop, `SELECT REPEAT("* ", counter);` prints the current row with the specified number of stars.
-- 5. The counter is decremented by one with `SET counter = counter - 1;` to reduce the number of stars for the next row.
-- 6. Finally, `CALL print_stars(20);` executes the procedure with 20 rows, producing the desired pattern.
