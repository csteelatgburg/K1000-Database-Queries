-- Tickets opened in the past month in a specific queue that were not moved to another queue
-- Submitted as answer to https://www.itninja.com/question/report-for-tickets-closed-within-same-queue-first-level-resolution

SELECT HD_TICKET.ID, TITLE, CREATED, TIME_CLOSED
FROM HD_TICKET
WHERE CREATED < date_sub(NOW(), INTERVAL 1 MONTH)
AND HD_QUEUE_ID = 2
AND (SELECT COUNT(ID) FROM HD_TICKET_CHANGE 
WHERE DESCRIPTION like "%Changed ticket Queue%"
AND HD_TICKET_ID = HD_TICKET.ID
GROUP BY HD_TICKET_ID) is null
GROUP BY HD_TICKET.ID
