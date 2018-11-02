-- count of open tickets grouped by queue and owner
-- submitted as answer to http://www.itninja.com/question/a-service-desk-report-for-all-queues

SELECT HD_QUEUE.NAME, OWNER.FULL_NAME, COUNT(HD_TICKET.ID) AS "Open Tickets"

FROM ORG1.HD_TICKET
JOIN USER OWNER on OWNER.ID = HD_TICKET.OWNER_ID
JOIN HD_QUEUE on HD_QUEUE.ID = HD_TICKET.HD_QUEUE_ID
JOIN HD_STATUS on HD_STATUS.ID = HD_TICKET.HD_STATUS_ID
WHERE HD_STATUS.STATE != "closed"
GROUP BY HD_QUEUE.ID, OWNER.ID
ORDER BY HD_QUEUE.NAME, OWNER.FULL_NAME

