-- Custom ticket rule - identify tickets with a status of new that have not been updated in the past four hours by the owner
-- Includes manager email address to notify the manager
-- Submitted as answer for https://www.itninja.com/question/send-email-if-a-ticket-is-not-opened

SELECT T.ID, T.TITLE, T.CREATED, LAST_CHANGE.TIMESTAMP, 
T.OWNER_ID,
OWNER.EMAIL,
MANAGER.EMAIL as MANAGER_EMAIL,
LAST_CHANGE.DESCRIPTION, 
T.TIME_CLOSED,
OWNER.*
FROM ORG1.HD_TICKET T
JOIN HD_TICKET_CHANGE LAST_CHANGE ON LAST_CHANGE.HD_TICKET_ID = T.ID
 and LAST_CHANGE.ID=(select MAX(ID) from HD_TICKET_CHANGE where HD_TICKET_CHANGE.HD_TICKET_ID = T.ID
						and HD_TICKET_CHANGE.USER_ID = T.OWNER_ID)
left join HD_STATUS on HD_STATUS_ID = HD_STATUS.ID
left join USER OWNER on OWNER.ID = T.OWNER_ID
left join USER MANAGER on MANAGER.ID = OWNER.MANAGER_ID
WHERE 
OWNER.ID != 0
and HD_STATUS.NAME = 'New' 
and LAST_CHANGE.TIMESTAMP < NOW() - INTERVAL 4 HOUR