-- Tickets closed per month this year that were open more than seven days
-- Proposed answer for http://www.itninja.com/question/k1000-service-desk-aging-tickets

SELECT concat(date_format(TIME_CLOSED, "%b"), " - ", year(TIME_CLOSED)) as "Month/Year", 
count(HD_TICKET.ID) as "Tickets Open More than 7 Days"

FROM ORG1.HD_TICKET
JOIN HD_PRIORITY on HD_PRIORITY.ID = HD_TICKET.HD_PRIORITY_ID
WHERE HD_TICKET.HD_QUEUE_ID = 2
and TIME_CLOSED != '0000-00-00 00:00:00'
and TIME_TO_SEC(TIMEDIFF(HD_TICKET.TIME_CLOSED, HD_TICKET.CREATED)) > 604800
and YEAR(CREATED) = YEAR(NOW())
GROUP BY YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
ORDER BY YEAR(TIME_CLOSED),MONTH(TIME_CLOSED)
;