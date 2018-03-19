-- Count of tickets closed per category per month. Includes average days to close each ticket.

SELECT concat(month(TIME_CLOSED), "/", year(TIME_CLOSED)) as "Month/Year", HD_CATEGORY.NAME as "Category",
count(HD_TICKET.ID) as "Tickets Closed",
AVG(TIMESTAMPDIFF(DAY,
                          CREATED,
                          TIME_CLOSED)
           ) AS Average
FROM ORG1.HD_TICKET
JOIN HD_CATEGORY on HD_CATEGORY.ID = HD_TICKET.HD_CATEGORY_ID
WHERE HD_TICKET.HD_QUEUE_ID = 2
and TIME_CLOSED != '0000-00-00 00:00:00'
GROUP BY HD_CATEGORY_ID, YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
ORDER BY YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
;
