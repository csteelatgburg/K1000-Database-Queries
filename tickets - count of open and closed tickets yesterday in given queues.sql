-- Count of tickets opened and closed for previous day in given queues
-- Submitted as answer for https://www.itninja.com/question/k1000-report-open-and-closed-ticket-for-the-day-on-more-then-one-queue

SELECT Q.NAME,
COUNT(HD_TICKET.ID) as 'Opened',
SUM(CASE 
	WHEN HD_TICKET.TIME_CLOSED != '0000-00-00 00:00:00' THEN 1
    ELSE 0
    END) As 'Closed'
FROM 
ORG1.HD_TICKET
LEFT JOIN HD_QUEUE as Q on Q.ID = HD_TICKET.HD_QUEUE_ID
WHERE DATE(HD_TICKET.CREATED) = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY))
AND Q.ID in (5,13)
GROUP BY Q.ID