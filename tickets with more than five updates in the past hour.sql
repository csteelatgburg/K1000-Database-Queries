--This report is scheduled to run every 15 minutes
--Used to detect email loops
SELECT HD_TICKET_ID, COUNT(ID) NumberUpdates FROM ORG1.HD_TICKET_CHANGE
WHERE
TIMESTAMP > DATE_SUB(NOW(), INTERVAL 1 HOUR)
GROUP BY HD_TICKET_ID
HAVING NumberUpdates > 5
ORDER BY COUNT(ID) DESC
