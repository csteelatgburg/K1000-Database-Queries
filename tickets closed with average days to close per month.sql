SELECT concat(month(TIME_CLOSED), "/", year(TIME_CLOSED)) as "Month/Year", 
count(HD_TICKET.ID) as "Tickets Closed",
AVG(TIMESTAMPDIFF(DAY, 
                          TIME_OPENED, 
                          TIME_CLOSED)
           ) AS AverageTimeToClose
FROM ORG1.HD_TICKET

WHERE HD_TICKET.HD_QUEUE_ID = 2
and TIME_CLOSED != '0000-00-00 00:00:00'
and HD_QUEUE_ID = 2
GROUP BY YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
ORDER BY YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
;