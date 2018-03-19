-- Adobe Flash Player versions are a pain
-- Report finds the maximum version for a specific major version

SELECT MAX(concat(SUBSTRING_INDEX(DISPLAY_VERSION, ".", 3), ".", LPAD(SUBSTRING_INDEX(DISPLAY_VERSION, ".", -1), 3, "0"))) FROM SOFTWARE WHERE DISPLAY_NAME = "Adobe Flash Player Install Manager" and DISPLAY_VERSION like "11%"
