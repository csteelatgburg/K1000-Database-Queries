--Example of adding a column for the row number 
SELECT ID, TITLE,
@curRow := @curRow + 1 AS row_number
FROM ORG1.HD_TICKET
JOIN    (SELECT @curRow := 0) r
WHERE TIME_CLOSED = "0000-00-00 00:00:00" and HD_QUEUE_ID = 2;
