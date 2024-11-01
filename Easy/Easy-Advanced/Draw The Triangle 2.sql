-- Problem: Draw The Triangle 2
-- Difficulty: Easy
-- Skills: SQL (Advanced)

-- Problem Statement
-- Write a query to print a pattern that represents P(R) with R rows, where R = 20.

-- Solution
DELIMITER //

CREATE PROCEDURE print_stars(IN R INT)
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= R DO
        SELECT REPEAT("* ", counter);
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL print_stars(20);

-- Intuition:
-- I need to create a stored procedure that prints a triangle of stars, increasing by one star on each new line.
-- The REPEAT function is effective for generating the necessary number of stars.

-- Explanation:
-- 1. The procedure `print_stars` accepts an integer `R` as input, which denotes the number of rows.
-- 2. The `DECLARE` statement initializes a counter to 1, representing the first row.
-- 3. The `WHILE` loop continues as long as the counter is less than or equal to `R`.
-- 4. Inside the loop, `SELECT REPEAT("* ", counter);` prints the current row with the specified number of stars.
-- 5. The counter is incremented by one with `SET counter = counter + 1;` to increase the number of stars for the next row.
-- 6. Finally, `CALL print_stars(20);` executes the procedure with 20 rows, producing the desired pattern.
