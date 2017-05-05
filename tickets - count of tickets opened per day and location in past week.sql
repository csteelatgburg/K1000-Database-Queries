SELECT DAYNAME(HD_TICKET.CREATED) AS `DAY`, date(HD_TICKET.created), SUBSTRING_INDEX(S.LOCATION, ",", 1) as "Building",
COUNT(HD_TICKET.ID) as 'Tickets Opened'
FROM HD_TICKET

LEFT JOIN USER S ON (S.ID = HD_TICKET.SUBMITTER_ID)
WHERE (HD_TICKET.HD_QUEUE_ID = 2)
AND MONTH(HD_TICKET.CREATED) = MONTH(DATE_SUB(NOW(),INTERVAL 1 Week))
AND YEAR(HD_TICKET.CREATED) = YEAR(DATE_SUB(NOW(),INTERVAL 1 Week))
GROUP BY DATE(HD_TICKET.CREATED), SUBSTRING_INDEX(S.LOCATION, ",", 1)