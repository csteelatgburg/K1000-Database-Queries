--Used to determine how many tickets were opened during timeframe
SELECT YEAR(CREATED) AS TicketYears, MONTH(CREATED) AS TicketMonths, COUNT(ID) AS "Opened"
FROM ORG1.HD_TICKET
WHERE TIME(CREATED) BETWEEN "16:00:00" and "23:59:59"
GROUP BY YEAR(CREATED), MONTH(CREATED)
