-- Tickets opened via email and not assigned to an owner for two hours
-- Submitted answer for https://www.itninja.com/question/helpdesk-custom-report-time-taken-to-change-ticket-owner-from-unassigned-to-anything-else-per-day
-- Author: Chuck Steel
-- Date: 2018-07-19

SELECT T.ID, O.FULL_NAME as "Owner", T.TITLE, T.CREATED, 
C.TIMESTAMP as "Ticket Changed", 
TIMESTAMPDIFF(MINUTE, T.CREATED, C.TIMESTAMP) as "Owner Changed (Minutes)"
FROM HD_TICKET T
JOIN HD_TICKET_CHANGE IC on IC.HD_TICKET_ID = T.ID and IC.ID = (select min(ID) from HD_TICKET_CHANGE where HD_TICKET_ID = T.ID)
LEFT JOIN HD_TICKET_CHANGE C on C.HD_TICKET_ID = T.ID
LEFT JOIN HD_TICKET_CHANGE_FIELD CF on CF.HD_TICKET_CHANGE_ID = C.ID
LEFT JOIN USER O on O.ID = T.OWNER_ID
WHERE 
IC.VIA_EMAIL != ""
and CF.FIELD_CHANGED = "OWNER_ID"
and CF.BEFORE_VALUE = 0
and TIMESTAMPDIFF(MINUTE, T.CREATED, C.TIMESTAMP) > 120
and DATE(T.CREATED) > DATE_SUB(NOW(), INTERVAL 1 DAY)