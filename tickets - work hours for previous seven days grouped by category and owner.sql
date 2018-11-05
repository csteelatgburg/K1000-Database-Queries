-- Submitted as answer for ITNinja question
-- https://www.itninja.com/question/report-query-for-category-and-time-worked
select 
HD_QUEUE.NAME,
HD_CATEGORY.NAME as CATEGORY, 
ifnull(OWNER.FULL_NAME, 'Unassigned') as 'Owner',
COUNT(HD_TICKET.ID) as 'Tickets',
IFnull(SUM(TIMESTAMPDIFF(HOUR, W.START, W.STOP)), 0) as 'Work Hours'
from HD_TICKET
left join HD_CATEGORY on HD_CATEGORY_ID = HD_CATEGORY.ID
left join HD_STATUS on HD_STATUS_ID = HD_STATUS.ID
left join USER OWNER on OWNER.ID = HD_TICKET.OWNER_ID
left join HD_WORK W on W.HD_TICKET_ID = HD_TICKET.ID and W.USER_ID = OWNER.ID
JOIN HD_QUEUE on HD_QUEUE.ID = HD_TICKET.HD_QUEUE_ID
where HD_STATUS.STATE = 'closed' 
and HD_TICKET.TIME_CLOSED > DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY CATEGORY, OWNER.FULL_NAME
order by HD_QUEUE.NAME, CATEGORY, OWNER.FULL_NAME


